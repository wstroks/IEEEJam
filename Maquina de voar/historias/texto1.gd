extends RichTextLabel
var a= 1
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ALIGN_CENTER = 1
var page=0
var dialogo=["O aeroplano de Leonardo da Vinci, foi mais um dos projetos extremamente inovadores. Esse projeto foi desenhado em 1485.","No período entre 1480 e 1505, da Vinci efetuou uma grande quantidade de estudos sobre o voo, entre eles, estavam estudos sobre pipas.","Então agora vamos voar, com a invenção de Da Vinci!!!",""]
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
				if(page>2):
					get_tree().change_scene("res://main.tscn")
				
				
				
				set_bbcode(dialogo[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())
			
			
			
func _on_Timer_timeout():
	
	set_visible_characters(get_visible_characters()+1)
	pass # replace with function body


	pass # replace with function body


