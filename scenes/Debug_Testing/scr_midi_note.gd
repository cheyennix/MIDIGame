extends Node2D

class_name scr_midi_note

#Which note this note is
@export var note_number: int
@export var spr: Sprite2D

@export var initial_color: Color

@export var child_to_activate: Node

#Whether the note can be pressed or not
var can_be_pressed: bool = true

signal activate_child

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	if(child_to_activate != null):
		activate_child.connect(child_to_activate._on_scn_midi_note_activate_child)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _try_activate():
	if(can_be_pressed):
		spr.modulate = Color8(0, 255, 0, 255)
		emit_signal("activate_child")

#DEBUG
func _deactivate():
	spr.modulate = initial_color
