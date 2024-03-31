extends Node2D

@export var player_shoot_scene: PackedScene

func _on_scn_midi_note_activate_child():
	print("based")
	_spawn_player_shot()


func _spawn_player_shot():
	var player_shot = player_shoot_scene.instantiate()
	player_shot.position = position
	add_child(player_shot)
