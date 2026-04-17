extends Node3D

var speed: float = 1.0
var rotationSpeed: float = 1.0
@export var rigid: RigidBody3D

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_SPACE):
		rigid.set_collision_mask_value(3, false)
		return
	rigid.set_collision_mask_value(3, false)
	if Input.is_key_pressed(KEY_W):
		position.x += speed * delta * sin(rotation.y)
		position.z += speed * delta * cos(rotation.y)
	if Input.is_key_pressed(KEY_S):
		position.x -= speed * delta * sin(rotation.y)
		position.z -= speed * delta * cos(rotation.y)
	if Input.is_key_pressed(KEY_A):
		position.x += speed * delta * cos(rotation.y)
		position.z -= speed * delta * sin(rotation.y)
	if Input.is_key_pressed(KEY_D):
		position.x -= speed * delta * cos(rotation.y)
		position.z += speed * delta * sin(rotation.y)
	if Input.is_key_pressed(KEY_LEFT): rotation.y += speed * delta
	if Input.is_key_pressed(KEY_RIGHT): rotation.y -= speed * delta
	
	#if Input.is_key_pressed(KEY_UP): rotation.x += speed * delta
	#if Input.is_key_pressed(KEY_DOWN): rotation.x -= speed * delta
