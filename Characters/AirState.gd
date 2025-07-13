extends State

class_name AirState

@export var ground_state : State
@export var dashing_state : State

func state_process(delta):
	if character.is_on_floor():
		next_state = ground_state
	move()
	super(delta)

func state_input(event):
	if event.is_action_pressed("dash"):
		dash()

func dash():
	next_state = dashing_state
