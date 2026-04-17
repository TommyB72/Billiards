extends RigidBody3D

func _ready() -> void:
	mass = 0.16

func _physics_process(delta: float) -> void:
	linear_velocity.x = 0.1
	return
