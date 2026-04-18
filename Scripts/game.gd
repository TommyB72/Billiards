extends Node

@export var balls: Node3D

func _ready() -> void:
	for ball in balls.get_children():
		ball.tree_exited.connect(GetBallCount)

func GetBallCount() -> void:
	if balls.get_child_count() > 0: return
	get_tree().call_deferred("change_scene_to_file","res://Game.tscn")

func _on_body_entered(body: Node3D) -> void:
	if body.get_parent().name == "cue_ball":
		ResetBall(body)
		return
	body.get_parent().queue_free()

func BallEnteredResetPlane(body: Node3D) -> void:
	ResetBall(body)

func ResetBall(body: Node3D) -> void:
	(body as RigidBody3D).linear_velocity = Vector3.ZERO
	(body as RigidBody3D).angular_velocity = Vector3.ZERO
	(body as RigidBody3D).position = Vector3.ZERO
