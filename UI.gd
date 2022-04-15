extends CanvasLayer


func _ready():
	pass


func _on_Wumpus_win():
	$Control/Text.text = "yee you win"
	

func _on_Wumpus_defeat():
	$Control/Text.text = "oh no, you're dead"

	
func _on_Wumpus_warning_enter():
	$Control/Text.text += "\nyou smell a lonfo"


func _on_Wumpus_warning_exit():
	$Control/Text.text = ""