extends KinematicBody2D

export var max_speed : float = 200

func _ready():
	pass

func _physics_process(_delta):
	var direction := Vector2(0, 0)

	direction.x = float(Input.is_action_pressed("right")) - float(Input.is_action_pressed("left"))
	direction.y = float(Input.is_action_pressed("down")) - float(Input.is_action_pressed("up"))

	# If the direction module is zero, don't bother moving
	if direction.length_squared() > 0:
		# Normalization necessary to avoid moving faster when moving diagonally
		direction = direction.normalized()
		move_and_slide(direction * max_speed)

