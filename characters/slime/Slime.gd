extends Position2D

signal warning_enter
signal warning_exit
signal collision

func _ready():
	pass


func _on_warning_enter(body: Node):
	emit_signal("warning_enter")

func _on_Warning_body_exited(body:Node):
	emit_signal("warning_exit")

func _on_collision_enter(body: Node):
	emit_signal("collision")
