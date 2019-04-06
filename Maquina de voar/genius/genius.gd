extends EventPlayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var count =0
var a1=0
var a2=0
var a3=0
var maximo = 3
var i = 0
var j = 0

var sequencias=[[2,1,1],[2,1,1,3]]
var veri=[]
var seq_atual = [0,0,0,0]
func _ready():
	# Called every time the node is added to the scene.
	
	get_node("btn-2").connect("pressed", self, "_on_btn2_pressed")
	get_node("btn-1").connect("pressed", self, "_on_btn1_pressed")
	get_node("btn-3").connect("pressed", self, "_on_btn3_pressed")
	
	seq_atual = sequencias[j]
	for i in seq_atual:
		if(i == 1):
			get_node("teclado1/AnimationPlayer").play("played")
			get_node("Timer").start()
			yield(get_node("Timer"), "timeout")
		elif(i == 2):
			get_node("teclado2/AnimationPlayer").play("played")
			get_node("Timer").start()
			yield(get_node("Timer"), "timeout")
		elif(i == 3):
			get_node("teclado3/AnimationPlayer").play("played")
			get_node("Timer").start()
			yield(get_node("Timer"), "timeout")
	
	i = 0
	
	# Initialization here
	pass



func _on_btn1_pressed():
	
	if(i <= maximo):
		veri.append(1)
		get_node("teclado1/AnimationPlayer").play("played")
		#audio_player.play("tema1")
		get_node("Timer").start()
		yield(get_node("Timer"), "timeout")
		#get_node("teclado1/AnimationPlayer").play("default")
		i = i+1
		if(i == maximo):
			certo()
	else: 
		print("Passou do limite!")
		i = 0
	pass # replace with function body


func _on_btn2_pressed():
	if(i <= maximo):
		veri.append(2)
		#print("apertou o 2")
		get_node("teclado2/AnimationPlayer").play("played")
		#audio_player.play("tema2")
		get_node("Timer").start()
		yield(get_node("Timer"), "timeout")
		#get_node("teclado2/AnimationPlayer").play("default")
		i = i+1
		if(i == maximo):
			certo()
	else:
		print("Passou do limite!")
		i = 0
	pass # replace with function body


func _on_btn3_pressed():
	if(i <= maximo):
		veri.append(3)
		#audio_player.play("tema3")
		get_node("teclado3/AnimationPlayer").play("played")
		#audio_player.play("tema3")
		get_node("Timer").start()
		yield(get_node("Timer"), "timeout")
		i = i+1
		if(i == maximo):
			certo()
	else:
		print("Passou do limite!")
		i = 0
	pass # replace with function body

func certo():
	var m = 0
	var cnt = 0
	for m in veri:
		if(m < maximo):
			if(veri[m] == sequencias[j][m]):
				print("um certo") 
				cnt = cnt + 1
	
	if(cnt == maximo):
		cnt = 0
		maximo = maximo + 1
		j = j + 1
		i = 0
		audio_player.play("tema1") 
		get_node("Label/AnimationPlayer").play("wait")
		get_node("Timer").start()
		yield(get_node("Timer"), "timeout")
	if(j == 2):
		print("fim de jogo")
#	else:
#		seq_atual = sequencias[j]
#	for i in seq_atual:
#		if(i == 1):
#			get_node("teclado1/AnimationPlayer").play("played")
#			get_node("Timer").start()
#			yield(get_node("Timer"), "timeout")
#		elif(i == 2):
#			get_node("teclado2/AnimationPlayer").play("played")
#			get_node("Timer").start()
#			yield(get_node("Timer"), "timeout")
#		elif(i == 3):
#			get_node("teclado3/AnimationPlayer").play("played")
#			get_node("Timer").start()
#			yield(get_node("Timer"), "timeout")
#		i = 0
#	if(veri[i] == sequencias[j][i]):
#		
	
#	print(veri)
#	var a=0
#	for i in range(0, veri.size()):
#		if(veri[i]==verifica[i]):
#			a+=1
#	print(a)
	
	
	
