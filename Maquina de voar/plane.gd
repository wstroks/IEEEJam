extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var MAX_SPEED = 200
export(float) var TURN_SPEED = 2.0
export(float) var COAST_TURN_SPEED = 1.0
export(float) var FUEL_CONSUMPTION_RATE_PER_SECOND = 3.0
export var FUEL_REFILL = 1
export var MAX_FUEL = 1
export var fuel = 0
export(bool) var be_quiet = false

var velocity = Vector2(MAX_SPEED, 0)
var turn_speed = 0
var gas_caught = 0
var plane_voice
var wind_voice

signal update_fuel(fuel)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	

	wind_voice = Sfx.play("wind")
	if be_quiet:

		Sfx.set_volume(wind_voice, 0)


func _fixed_process(delta):
	var p = get_pos()
	var r = get_rot()
	
	# Consume fuel

	

	
	# Rotate the sprite
	set_rot(r + turn_speed * delta)
	turn_speed = turn_speed * 0.85
	
	# Update propeller soound
	if G.state == 'playing':
		# Restart sounds
		
			
		wind_voice = Sfx.play("wind")
			
		
		

	# Rotate the velocity vectory
	velocity = Vector2(MAX_SPEED, 0).rotated(get_rot())
	
	# Track total distance flown
	if G.state == 'playing':
		G.total_distance += velocity.length() * delta
	
	move(velocity * delta)
	

# Called from main game input handler
func go_up():
	turn_speed = TURN_SPEED

func go_down():
	turn_speed = -TURN_SPEED

func coast():
	var r = get_rot()
	if r >= PI/2 || r < -PI/4:
		turn_speed = COAST_TURN_SPEED
	else:
		turn_speed = -COAST_TURN_SPEED
	
func add_gas():
	fuel = fuel + 1
	if fuel > MAX_FUEL:
		fuel = MAX_FUEL
	emit_signal("update_fuel", fuel)

	gas_caught = gas_caught + 1
	if gas_caught >= 1:
		G.tutorial = false
