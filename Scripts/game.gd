extends Node

@export var balls: Node3D

func _ready() -> void:
	for ball in balls.get_children():
		ball.tree_exited.connect(GetBallCount)

func GetBallCount() -> void:
	if balls.get_child_count() > 0: return
	get_tree().call_deferred("change_scene_to_file","res://Game.tscn")
