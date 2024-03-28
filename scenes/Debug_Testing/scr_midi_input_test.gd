extends Node

@export var note_array: Array[Sprite2D]

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.open_midi_inputs()
	print(OS.get_connected_midi_inputs())

func _input(input_event):
	if input_event is InputEventMIDI:
		_print_midi_info(input_event)
		_toggle_note_visibility(input_event)

func _toggle_note_visibility(midi_event: InputEventMIDI):
	var pitch_check = midi_event.pitch % 12
	
	if(midi_event.message == 9):
		if(pitch_check >= 0):
			note_array[pitch_check].modulate = Color8(0, 255, 0, 255)
		
	elif(midi_event.message == 8):
		if(pitch_check >= 0):
			if(pitch_check == 1 || pitch_check == 3 || pitch_check == 6 
			|| pitch_check == 8 || pitch_check == 10):
				note_array[pitch_check].modulate = Color8(0, 0, 0, 255)
			else:
				note_array[pitch_check].modulate = Color8(255, 255, 255, 255)
	

func _print_midi_info(midi_event: InputEventMIDI):
	print(midi_event)
	print("Message " + str(midi_event.message))
	print("Pitch " + str(midi_event.pitch))
	print("Velocity " + str(midi_event.velocity))
