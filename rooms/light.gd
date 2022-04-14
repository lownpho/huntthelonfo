extends Area2D


func _ready():
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")

func _on_body_entered(body: Node):
	$AnimationPlayer.play("FadeIn")
	
func _on_body_exited(body: Node):
	$AnimationPlayer.play("FadeOut")
