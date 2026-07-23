extends Camera3D

@export var speed := 3.0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_pressed("moveForward")):
		global_position += Vector3(0.0, 0.0, -1.0) * speed * delta
	if (Input.is_action_pressed("moveBack")):
		global_position += Vector3(0.0, 0.0, 1.0) * speed * delta
	if (Input.is_action_pressed("moveLeft")):
		global_position += Vector3(-1.0, 0.0, 0.0) * speed * delta
	if (Input.is_action_pressed("moveRight")):
		global_position += Vector3(1.0, 0.0, 0.0) * speed * delta
	if (Input.is_action_pressed("moveUp")):
		global_position += Vector3(0.0, 1.0, 0.0) * speed * delta
	if (Input.is_action_pressed("moveDown")):
		global_position += Vector3(0.0, -1.0, 0.0) * speed * delta
