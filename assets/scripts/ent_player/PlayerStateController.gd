extends Node
export(NodePath) var _player_manifest;
export(NodePath) var _animator;
export(String) var idleState;
export(String) var airborneState;
export(String) var runningState;
export(String) var walkingState;
export(NodePath) var _airborneStateNode;
onready var airborneStateNode = get_node(_airborneStateNode)
onready var player_manifest = get_node(_player_manifest);
onready var state_machine = get_node(_animator)["parameters/playback"];

func _process(delta):
	var player = player_manifest.player
	if(player_manifest.player._is_grounded()):
		var sum = Input.get_action_strength(player.actionL) + Input.get_action_strength(player.actionR) + Input.get_action_strength(player.actionF) +Input.get_action_strength(player.actionB)
		if(player.velocity.length_squared() < 0.1 && sum < 0.01):
			state_machine.travel(idleState);
		else:
			if(Input.is_action_pressed("plr_run")):
				state_machine.travel(runningState);
			else:
				state_machine.travel(walkingState);
		if(Input.is_action_pressed(player.actionJump) and not airborneStateNode.alreadyJumped):
			state_machine.travel(airborneState);
	else:
		state_machine.travel(airborneState);
