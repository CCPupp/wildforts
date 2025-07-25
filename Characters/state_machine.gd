extends Node

class_name StateMachine

@export var current_state : State

var states : Array[State]

func _ready():
	for child in get_children():
		if child is State:
			states.append(child)
		else:
			push_warning("Child " 
			+ child.name 
			+ " is not a valid State for the State Machine")

func can_move() -> bool:
	return current_state.can_move
