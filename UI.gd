extends CanvasLayer


func _ready():
	pass

# Whumpus signals
func _on_Wumpus_win():
	$Control/Text.text = "yee you win"
	

func _on_Wumpus_defeat():
	$Control/Text.text = "oh no, you're dead"

	
func _on_Wumpus_warning_enter():
	$Control/Text.text += "\nyou smell a lonfo"


func _on_Wumpus_warning_exit():
	$Control/Text.text = "" # non funge, usare regex per eliminare msg - mettere msg in file

# Bats signals
func _on_Bats_collision():
	$Control/Text.text = "oh no, bats!"


func _on_Bats_warning_enter():
	$Control/Text.text += "\nyou hear bats"


func _on_Bats_warning_exit():
	$Control/Text.text = ""

# Slime signals
func _on_Slime_collision():
	$Control/Text.text = "oh no, slime!"


func _on_Slime_warning_enter():
	$Control/Text.text += "\nyou feel slime"


func _on_Slime_warning_exit():
	$Control/Text.text = ""
