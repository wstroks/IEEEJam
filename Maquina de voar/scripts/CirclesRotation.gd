extends Node2D

export var rot_speed = 40
onready var circle_entity = get_node(".")

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	circle_entity.rotate(deg2rad(rot_speed * delta))

func _on_voltar_pressed():
	get_tree().change_scene("res://museu/apresenta1.tscn")
	
	pass # replace with function body


func _on_voltar1_pressed():
	get_tree().change_scene("res://museu/apresenta1.tscn")
	pass # replace with function body
