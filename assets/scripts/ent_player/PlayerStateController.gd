extends Node
@export var _player_manifest: NodePath;
@export var _animator: NodePath;
@export var idleState: String;
@export var airborneState: String;
@export var runningState: String;
@export var walkingState: String;
@export var _airborneStateNode: NodePath;
@onready var airborneStateNode = get_node(_airborneStateNode)
@onready var player_manifest = get_node(_player_manifest);
@onready var state_machine = get_node(_animator)["parameters/playback"];

func _process(delta):
	var player = player_manifest.player
	if(player_manifest.player._is_grounded()):
		var sum = Input.get_action_strength(player.actionL) + Input.get_action_strength(player.actionR) + Input.get_action_strength(player.actionF) +Input.get_action_strength(player.actionB)
		print(sum)
		if(player.velocity.length_squared() < 0.1 && sum < 0.01):
			print("idleState")
			state_machine.travel(idleState);
		else:
			if(Input.is_action_pressed("plr_run")):
				print("runningState")
				state_machine.travel(runningState);
			else:
				print("walkingState")
				state_machine.travel(walkingState);
		if(Input.is_action_pressed(player.actionJump) and not airborneStateNode.alreadyJumped):
			print("airborneState")
			state_machine.travel(airborneState);
	else:
		print("airborneState")
		state_machine.travel(airborneState);
