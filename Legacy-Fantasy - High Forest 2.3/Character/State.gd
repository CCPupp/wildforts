extends Node

class_name State

@export var can_move : bool = true
@export var jump_velocity : float = -300.0

var character : CharacterBody2D
var next_state : State

func state_process(delta):
	var direction := Input.get_vector("left", "right", "ui_up", "ui_down")
	if direction.x > 0:
		character.sprite.flip_h = false
	elif direction.x < 0:
		character.sprite.flip_h = true
	character.velocity += character.get_gravity() * delta
	character.move_and_slide()

func move():
	var direction := Input.get_vector("left", "right", "ui_up", "ui_down")
	if direction:
		character.velocity.x = direction.x * character.speed
		character.animation_tree.set("parameters/Move/blend_position", direction.x)
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, character.speed)
		character.animation_tree.set("parameters/Move/blend_position", 0)

func state_input(event: InputEvent):
	pass

func on_enter():
	pass
	
func on_exit():
	pass
