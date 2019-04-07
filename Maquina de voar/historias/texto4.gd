extends RichTextLabel
var a= 1
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ALIGN_CENTER = 1
var page=0
var dialogo=["A Última Ceia é uma pintura sobre parede realizada por Leonardo da Vinci entre 1494 e 1497.","No refeitório do Convento de Santa Maria Delle Grazie, em Milão, Itália.","Da Vinci foi um gênio, com isso despertava a inveja de muitas pessoas e principalmente da Igreja, que o via como herege.","Em termos iconográficos a Última Ceia representa o momento bíblico em que Cristo compartilha sua última refeição com os discípulos.","O instante captado pela pintura será aquele em que Cristo terá acabado de afirmar que 'um de vós me há-de trair'","E os discípulos estarão perguntando 'Sou eu, Senhor'?","Então agora vamos jogar, ache JUDAS!!!"]
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
				
				
				
				
				set_bbcode(dialogo[page])
				set_visible_characters(0)
			else: 
				audio_player.play("Click")
				get_tree().change_scene("res://scenes/Ceia.tscn")
			
		else:
			set_visible_characters(get_total_character_count())
			
			
			
func _on_Timer_timeout():
	
	set_visible_characters(get_visible_characters()+1)
	pass # replace with function body


	pass # replace with function body



func _on_homem_pressed():
	audio_player.play("Click")
	get_tree().change_scene("res://scenes/Main.tscn")
	pass # replace with function body

