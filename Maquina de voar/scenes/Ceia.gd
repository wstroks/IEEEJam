extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("Button2").connect("pressed", self, "_on_judas_pressed")
	get_node("Button11").connect("pressed", self, "_on_another_press")
	get_node("Button1").connect("pressed", self, "_on_another_press")
	get_node("Button8").connect("pressed", self, "_on_another_press")
	get_node("Button9").connect("pressed", self, "_on_another_press")
	get_node("Button10").connect("pressed", self, "_on_another_press")
					# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_judas_pressed():
	get_node("errou").hide()
	get_node("Label").show()
	

func _on_another_press():
	get_node("Label").hide()
	get_node("errou").show()
