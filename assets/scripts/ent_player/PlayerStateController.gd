extends Node
export(NodePath) var _player_manifest;
export(NodePath) var _animator;
export(String) var idleState;
export(String) var airborneState;
export(String) var runningState;
onready var player_manifest = get_node(_player_manifest);
onready var state_machine = get_node(_animator)["parameters/playback"];

func _process(delta):
	if(player_manifest.player._is_grounded()):
		var sum = Input.get_action_strength(player_manifest.player.actionL) + Input.get_action_strength(player_manifest.player.actionR) + Input.get_action_strength(player_manifest.player.actionF) +Input.get_action_strength(player_manifest.player.actionB)
		if(player_manifest.player.velocity.length_squared() < 0.1 && sum < 0.01):
			state_machine.travel(idleState);
		else:
			state_machine.travel(runningState);
	else:
		state_machine.travel(airborneState);
