extends State

class_name DashingState

@export var air_state : State
@export var dash_timer : float = 20
@export var dash_multiplier : float = 2

var dash_time = 0

func state_process(delta):
	if dash_time < dash_timer:
		var direction := Input.get_vector("left", "right", "ui_up", "ui_down")
		character.velocity.x = direction.x * character.speed * dash_multiplier
		dash_time += 1
	else:
		dash_time = 0
		next_state = air_state
	super(delta)
