extends Node

@export var speed: float
@export var object_to_move: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	object_to_move.position += (Vector2.RIGHT * speed).rotated(object_to_move.rotation) * delta
