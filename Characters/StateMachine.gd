extends Node

class_name StateMachine

@export var character : CharacterBody2D
@export var current_state : State
@export var animation_tree : AnimationTree

var states : Array[State]

func _ready():
	for child in get_children():
		if child is State:
			child.character = character
			child.playback = animation_tree["parameters/playback"]
			states.append(child)
		else:
			push_warning("Child " 
			+ child.name 
			+ " is not a valid State for the State Machine")
			
func _physics_process(delta: float) -> void:
	current_state.state_process(delta)
	if current_state.next_state != null:
		switch_states(current_state.next_state)

func can_move() -> bool:
	return current_state.can_move

func switch_states(next_state : State):
	if current_state != null:
		current_state.on_exit()
		current_state.next_state = null
	current_state = next_state
	current_state.on_enter()

func _input(event: InputEvent):
	current_state.state_input(event)
