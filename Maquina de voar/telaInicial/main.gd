extends EventPlayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _notification(what):
    if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
        get_tree().quit() # default behavior
func _on_jogar_pressed():
	audio_player.play("Click")
	
	get_tree().change_scene("res://telaInicial/introducao/apresenta1.tscn")
	pass # replace with function body


func _on_sair_pressed():
	get_tree().quit()
	pass # replace with function body
