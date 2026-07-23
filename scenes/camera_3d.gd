extends Camera3D

var cameraAccel: float = 20.0
@onready var target: Node3D = get_parent()
var offset: Vector3

func _ready() -> void:
	offset = position
	top_level = true

func _physics_process(delta: float) -> void:
	var goal := target.global_position + offset
	var w := 1.0 - exp(-cameraAccel * delta)
	global_position.x = lerp(global_position.x, goal.x, w)
	global_position.y = lerp(global_position.y, goal.y, w)
	global_position.z = lerp(global_position.z, goal.z, w)
