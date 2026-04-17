extends Node

@export var balls: Node3D

func _ready() -> void:
	for ball in balls.get_children():
		ball.tree_exited.connect(GetBallCount)

func GetBallCount() -> void:
	print(balls.get_child_count())
