extends EventPlayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var count =0
var a1=0
var a2=0
var a3=0

var veri=[]
var verifica=[]
func _ready():
	# Called every time the node is added to the scene.
	get_node("Panel/Label").set_text("Faça a sequencia 1,3 e 2. Dos tecladose forme uma melodia.")
	verifica=[1,3,2]
	# Initialization here
	pass


func _on_teclado1_pressed():
	veri.append(1)
	audio_player.play("tema1")
	certo()
	pass # replace with function body


func _on_teclado2_pressed():
	veri.append(2)
	audio_player.play("tema2")
	certo()
	pass # replace with function body


func _on_teclado3_pressed():
	veri.append(3)
	audio_player.play("tema3")
	certo()
	pass # replace with function body

func certo():
	print(verifica)
	var a=0
	for i in range(0, veri.size()):
		if(veri[i]==verifica[i]):
			a+=1
	print(a)
	if(a==3):
		get_node("Panel/Label").set_text("Parabens você acertou a sequencia")
	
	
	