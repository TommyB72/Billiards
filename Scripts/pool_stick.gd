extends RigidBody3D

var speed: float = 0.4
var rotationSpeed: float = 0.5
var hitSpeed = 10
@onready var parent = get_parent()

func _ready() -> void:
	set_collision_layer_value(3,false)
	set_collision_mask_value(3,false)
	gravity_scale = 0

func _physics_process(delta: float) -> void:
	if Input.is_key_pressed(KEY_W):
		parent.position.x += speed * delta * sin(parent.rotation.y)
		parent.position.z += speed * delta * cos(parent.rotation.y)
	if Input.is_key_pressed(KEY_S):
		parent.position.x -= speed * delta * sin(parent.rotation.y)
		parent.position.z -= speed * delta * cos(parent.rotation.y)
	if Input.is_key_pressed(KEY_A):
		parent.position.x += speed * delta * cos(parent.rotation.y)
		parent.position.z -= speed * delta * sin(parent.rotation.y)
	if Input.is_key_pressed(KEY_D):
		parent.position.x -= speed * delta * cos(parent.rotation.y)
		parent.position.z += speed * delta * sin(parent.rotation.y)
	if Input.is_key_pressed(KEY_LEFT): parent.rotation.y += speed * delta
	if Input.is_key_pressed(KEY_RIGHT): parent.rotation.y -= speed * delta
	if Input.is_key_pressed(KEY_UP):
		rotation.x += speed * delta
		if rotation.x > 45*PI/180: rotation.x = 45*PI/180
	if Input.is_key_pressed(KEY_DOWN):
		rotation.x -= speed * delta
		if rotation.x < 15*PI/180: rotation.x = 15*PI/180
	move_and_collide(linear_velocity*delta)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("hit"):
		set_collision_layer_value(3,true)
		set_collision_mask_value(3,true)
		linear_velocity = Vector3(sin(parent.rotation.y)*hitSpeed,0,cos(parent.rotation.y)*hitSpeed)
		#linear_velocity = Vector3(0,0,1)
		
func _on_area_3d_body_entered(body: Node3D) -> void:
	linear_velocity = Vector3.ZERO
	position = Vector3.ZERO
	set_collision_layer_value(3,false)
	set_collision_mask_value(3,false)
	
