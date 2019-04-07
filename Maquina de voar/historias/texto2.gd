extends RichTextLabel
var a= 1
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ALIGN_CENTER = 1
var page=0
var dialogo=["O Homem Vitruviano ou Homem de Vitrúvio é um desenho de Leonardo da Vinci (1452-1519) que foi produzido em 1490, durante o Renascimento.","Ele representa o ideal clássico de beleza, equilíbrio, harmonia das formas e perfeição das proporções.","Hoje é uma das obras mais conhecidas e reproduzidas no mundo.","Então agora vamos jogar o jogo que retrata essa obra de Da Vinci!!!"]
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_bbcode(dialogo[page])
	
	ALIGN_CENTER=1

	set_visible_characters(0)
	set_process_input(true)
	pass

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON && event.is_pressed():
		if get_visible_characters() > get_total_character_count():
			if page < dialogo.size()-1:
				page+=1
				print(page)
				if(page==3):
					get_tree().change_scene("res://scenes/Main.tscn")
				
				
				
				set_bbcode(dialogo[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())
			
			
			
func _on_Timer_timeout():
	
	set_visible_characters(get_visible_characters()+1)
	pass # replace with function body


	pass # replace with function body



