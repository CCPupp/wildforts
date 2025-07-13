extends CharacterBody2D

@export var speed : float = -20.0
@export_range(-1, 1) var dir : int = 1

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

enum States {SPAWNING, IDLE, ATTACK}

var state = States.SPAWNING
const spawn_timer : float = 40
var spawn_time : float = 0

func _physics_process(delta: float):
	if state == States.SPAWNING and spawn_time < spawn_timer:
		spawn_time += 1
	else:
		state = States.IDLE
		animated_sprite.play("walk")
		velocity.x = lerp(velocity.x, dir * speed, 10.0 * delta)
		velocity.y += get_gravity().y * delta
	move_and_slide()
