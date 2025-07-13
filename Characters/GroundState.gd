extends State

class_name GroundState

@export var air_state : State
@export var dashing_state : State

func state_process(delta):
	move()
	super(delta)

func state_input(event: InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
	elif(event.is_action_pressed("dash")):
		dash()

func dash():
	next_state = dashing_state

func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
