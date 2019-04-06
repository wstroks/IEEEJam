extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var velocity = Vector2(-rand_range(10,50), 0)
var MAX_DEPTH = 10
var distance = rand_range(-MAX_DEPTH, 1)
var currentCloud = null
var dead = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	
	# Choose a random cloud sprite
	var random = rand_range(0, get_child_count()-1)
	currentCloud = get_child(random)
	currentCloud.show()
	
	# Remove all nodes that are not the selected cloud
	for cloud in get_children():
		if cloud != currentCloud:
			cloud.queue_free()

	# Set size
	var scale = rand_range(1,2)
	set_scale(Vector2(scale, scale))
	
	# Randomly flip for variety
	if rand_range(0,100) < 50:
		currentCloud.set_flip_h(true)
		
	# Modulate color so more distance clouds blend in with the sky
	if distance < -9:
		var c = Color(0, 0.5, 1, 1)
		currentCloud.set_modulate(c)
	elif distance < -7:
		var c = Color(0.3, 0.7, 1, 1)
		currentCloud.set_modulate(c)
	elif distance < -5:
		var c = Color(0.5, 0.8, 1, 1)
		currentCloud.set_modulate(c)
	elif distance < -3:
		var c = Color(0.7, 0.9, 1, 1)
		currentCloud.set_modulate(c)
	
	# Randomly tint some clouds reddish
	if rand_range(0,100) < 10:
		var c = currentCloud.get_modulate()
		c.r = rand_range(0,1)
		currentCloud.set_modulate(c)
	
	# Speed up foreground clouds
	if distance > 0:
		velocity = velocity * 2
		
	# Set depth
	set_z(distance)
	
	
	

func _fixed_process(delta):
	# Move clouds
	move(velocity * delta)
	
	# Kill clouds when far from player
	var distance = get_pos().distance_to(G.get_player().get_pos())
	if distance > G.get_screen_width() * 2:
		kill()
		

func kill():
	dead = true
	
	
# Bring back from the dead
func revive():
	dead = false
	
	# Randomly position cloud outside of camera
	var pos = G.get_player().get_pos() + Vector2(G.get_screen_width(), 0).rotated(randf() * 2 * PI)
	set_pos(pos)
	






	
		