extends Camera3D
@export_range(0.0, 10.0) var sensitivity: float = 0.045
@export_range(-360, 360) var rotXClamp: float = 90.0
@export var body: Node3D
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(_delta):
	if(Input.is_key_pressed(KEY_ESCAPE)):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
func _input(event):
	if event is InputEventMouseMotion:
		var rel = event.relative
		body.rotation_degrees.y -= rel.x * sensitivity
		self.rotation_degrees.x -= rel.y * sensitivity
		self.rotation_degrees.x = clamp(self.rotation_degrees.x,-rotXClamp,rotXClamp )
