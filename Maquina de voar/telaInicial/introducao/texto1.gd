extends RichTextLabel
var a= 1
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ALIGN_CENTER = 1
var page=0
var dialogo=["Há muito tempo atrás nasceu um homem em Florença. Até os 24 anos, era um homem comum, até entrar numa caverna misteriosa…","Dentro desta caverna, este homem encontrou extraterrestres que lhe dotaram de loucura e criatividade. Após este evento, este homem se tornou…","LEONARDO DA VINCI!!!!","Da Vinci deixou escritos em seu diário, porém as páginas que continham seus relatos da caverna foram… A-R-R-A-N-C-A-D-A-S! !!!!!!!!!","Uma tarde, o caderno com os escritos de Leonardo da Vinci caiu nos colos do jovem artista Julielson.","Ao se deparar com as páginas da transformação arrancadas, Julielson resolve ir ao museu da Vinci para solucionar o Mistério da Caverna."]
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
				
				if(page==1):
					get_parent().get_node("ParallaxBackground/ParallaxLayer/TextureFrame").set_texture(load("res://telaInicial/sprites/4-ovni.png"))
				if(page==2):
					get_parent().get_node("ParallaxBackground/ParallaxLayer/TextureFrame").set_texture(load("res://telaInicial/sprites/1-da-vinci.png"))
				if(page==3):
					get_parent().get_node("ParallaxBackground/ParallaxLayer/TextureFrame").set_texture(load("res://telaInicial/sprites/2-diario.png"))
				if(page==4):
					get_parent().get_node("ParallaxBackground/ParallaxLayer/TextureFrame").set_texture(load("res://telaInicial/sprites/5-boyzinho.png"))
				if(page==5):
					get_tree().change_scene("res://main.tscn")
				
				set_bbcode(dialogo[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())
			
			
			
func _on_Timer_timeout():
	
	set_visible_characters(get_visible_characters()+1)
	pass # replace with function body


	pass # replace with function body
