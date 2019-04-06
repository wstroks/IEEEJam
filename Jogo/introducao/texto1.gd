extends RichTextLabel
var a= 1
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ALIGN_CENTER = 1
var page=0
var dialogo=["1","tema 1", "tema 2", "tema22", "tema3","tema33","tema4","tema44","tema5","tema55"]
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
				
				if(page==2):
					get_parent().get_node("ParallaxBackground/ParallaxLayer/TextureFrame").set_texture(load("res://sprites/2-diario.png"))
				if(page==4):
					get_parent().get_node("ParallaxBackground/ParallaxLayer/TextureFrame").set_texture(load("res://sprites/3-cave.png"))
				if(page==6):
					get_parent().get_node("ParallaxBackground/ParallaxLayer/TextureFrame").set_texture(load("res://sprites/4-ovni.png"))
				if(page==8):
					get_parent().get_node("ParallaxBackground/ParallaxLayer/TextureFrame").set_texture(load("res://sprites/5-boyzinho.png"))
				set_bbcode(dialogo[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())
			
			
			
func _on_Timer_timeout():
	
	set_visible_characters(get_visible_characters()+1)
	pass # replace with function body


	pass # replace with function body

