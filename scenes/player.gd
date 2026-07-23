extends CharacterBody3D

@export var maxSpeed: float = 5.0
@export var accel: float = 5.0
@export var jumpVelocity: float = 4.5

@onready var camera: Camera3D = $Camera3D

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jumpVelocity

	var moveIntent := Vector3(
		float(Input.is_action_pressed("moveRight")) - float(Input.is_action_pressed("moveLeft")),
		0.0,
		float(Input.is_action_pressed("moveBack")) - float(Input.is_action_pressed("moveForward"))
	).normalized()

	var moveTarget := moveIntent * maxSpeed

	velocity.x = lerp(velocity.x, moveTarget.x, accel * delta)
	velocity.z = lerp(velocity.z, moveTarget.z, accel * delta)

	move_and_slide()
