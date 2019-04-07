extends RichTextLabel
var a= 1
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ALIGN_CENTER = 1
var page=0
var dialogo=["Combinando piano e violoncelo, este instrumento criado por Leonardo da Vinci","Há cinco séculos foi tocado pela primeira vez no último dia 18 pelo polonês Slawomir Zubrycki.","Um apaixonado por interpretar os planos do gênio renascentista.","Então acerte a sequência solicitada e ouça a melodia do instrumento projetado por Vinci!!!",""]
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
				if(page==4):
					get_tree().change_scene("res://genius/genius.tscn")
				
				
				
				set_bbcode(dialogo[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())
			
			
			
func _on_Timer_timeout():
	
	set_visible_characters(get_visible_characters()+1)
	pass # replace with function body


	pass # replace with function body


