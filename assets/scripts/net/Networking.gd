extends Node
@export(PackedScene)var player = preload("res://assets/scenes/entities/ent_player.tscn")
@export(int)var serverPort = 4554
@export(String)var serverIP = "127.0.0.1"
@export(int)var maxPlayers = 24
@export(String)var playerName = "PlayerTest "
@export(Resource)var gameInfo;
var peer

# Called when the node enters the scene tree for the first time.

func startClient():
	peer.create_client(serverIP, serverPort)
	get_tree().network_peer = peer

func startServer():
	peer.create_server(serverPort, maxPlayers)
	get_tree().network_peer = peer
func _ready():
	peer = ENetMultiplayerPeer.new()
	if "--server" in OS.get_cmdline_args():
		startServer()
		Game.connect("KeyframePassed",Callable(self,"serverFwdAction"))
	get_tree().connect("peer_connected",Callable(self,"onPeerConnected"))
	get_tree().connect("peer_disconnected",Callable(self,"onPeerDisconnected"))
	
func onPeerConnected(id):
	print("Peer is attempting to connect")
	if get_tree().is_server():
		print("Requesting player info")
		rpc_id(id, "requestPlayerInfo")
@rpc("any_peer") func receivePlayerInfo(info):
	print("Player ", info, " connected")
	info["rpc_id"] = str(get_tree().get_remote_sender_id())
	print("sending GI: " , JSON.new().stringify(gameInfo))
	Maps.loadMap(gameInfo.currentMap)
	Game.startTimeline(0);
	var gameJSON = Game.timeline_to_json()
	print("SENDING: ", gameJSON)
	rpc_id(get_tree().get_remote_sender_id(),"receiveServerInfo", gameInfo.JSON.new().stringify(), gameJSON)
	rpc("registerNewPlayer",info)


	
@rpc("any_peer") func registerNewPlayer(info):
	var newPlayer = player.instantiate()
	newPlayer.name = str(info["rpc_id"])
	get_tree().root.add_child(newPlayer)
@rpc("any_peer") func receiveServerInfo(infoJson, gamestate):
	var info = GameInfo.new(infoJson)
	Maps.loadMap(info.currentMap)
	Game.timeline_from_json(gamestate)

func syncAction(gameAction : Game.Action):
	rpc_id(1, "serverReceiveAction", gameAction.JSON.new().stringify())

@rpc("any_peer") func serverReceiveAction(gameActionJSON):
	var newAction = Game.Action.new(gameActionJSON)
	Game.addKeyframe(newAction)

@rpc func receiveAction(gameActionJSON):
	var action = Game.Action.new(gameActionJSON)
	Game.addKeyframe(action)

func serverFwdAction(action):
	rpc("receiveAction", action.JSON.new().stringify())

func onPeerDisconnected(id):
	if not get_tree().is_server():
		get_tree().root.find_child(str(id)).queue_free()
	print("Quitting")
	get_tree().quit()
@rpc("any_peer") func requestPlayerInfo():
	return rpc_id(1,"receivePlayerInfo",{ name = playerName})
