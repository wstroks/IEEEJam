extends RichTextLabel
var a= 1
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ALIGN_CENTER = 1
var page=0
var dialogo=["Olá Julielson. Eu sou Monalisa e meus olhos vão te acompanhar por este museu.","Aqui você irá interagir com as obras do mestre da Vinci e conhecer um pouco mais sobre elas.",""]
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_bbcode(dialogo[page])
	get_node("../ceia").connect("pressed", self, "_on_ceia_pressed")
	
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
					
					get_parent().get_node("homem").show()
					get_parent().get_node("aviao").show()
					get_parent().get_node("genius").show()
					get_parent().get_node("TextureFrame").hide()
					get_parent().get_node("Panel").hide()
					get_parent().get_node("RichTextLabel").hide()
				
				
				set_bbcode(dialogo[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())
			
			
			
func _on_Timer_timeout():
	
	set_visible_characters(get_visible_characters()+1)
	pass # replace with function body


	pass # replace with function body

func _on_ceia_pressed():
	audio_player.play("Click") 
	get_tree().change_scene("res://historias/santa.tscn")

func _on_homem_pressed():
	audio_player.play("Click")

	get_tree().change_scene("res://historias/homem.tscn")
	
	#get_tree().change_scene("res://scenes/Main.tscn")
	pass # replace with function body


func _on_aviao_pressed():
	audio_player.play("Click")
	
	get_tree().change_scene("res://historias/aviao.tscn")
	#get_tree().change_scene("res://main.tscn")
	
	pass # replace with function body


func _on_genius_pressed():
	audio_player.play("Click")
	
	get_tree().change_scene("res://historias/genius.tscn")
	#get_tree().change_scene("res://genius/genius.tscn")
	pass # replace with function body
