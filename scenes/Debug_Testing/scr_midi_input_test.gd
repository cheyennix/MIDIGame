extends Node

@export var note_array: Array[scr_midi_note]

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.open_midi_inputs()
	print(OS.get_connected_midi_inputs())

func _input(input_event):
	if input_event is InputEventMIDI:
		_print_midi_info(input_event)
		_toggle_note_visibility(input_event)

func _toggle_note_visibility(midi_event: InputEventMIDI):
	#Pitch check variable corresponds to the pitch of the inputed note. 0 is C, 1 is C#, 11 is G, etc.
	if(midi_event.pitch != 0):
		var pitch_check = midi_event.pitch % 12
		
		#If input is being pressed, activate its effect
		if(midi_event.velocity > 0):
			#Check
			note_array[pitch_check]._try_activate()
		
		#Otherwise, if input is being released (velocity is 0) do this
		elif(midi_event.velocity == 0):
			note_array[pitch_check]._deactivate()
		
func _print_midi_info(midi_event: InputEventMIDI):
	print(midi_event)
	print("Message " + str(midi_event.message))
	print("Pitch " + str(midi_event.pitch))
	print("Velocity " + str(midi_event.velocity))
	
