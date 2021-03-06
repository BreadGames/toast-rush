extends KinematicBody2D

const GRAVITY = 200.0
const WALK_SPEED = 200
const JUMP_SPEED = 100

var velocity = Vector2()

func _physics_process(delta):
    velocity.y += delta * GRAVITY

    velocity.x = 0
    if Input.is_action_pressed("left"):
        velocity.x = -WALK_SPEED
    if Input.is_action_pressed("right"):
        velocity.x =  WALK_SPEED
    if Input.is_action_pressed("up"):
        velocity.y = -JUMP_SPEED

    # We don't need to multiply velocity by delta because "move_and_slide" already takes delta time into account.

    # The second parameter of "move_and_slide" is the normal pointing up.
    # In the case of a 2D platformer, in Godot, upward is negative y, which translates to -1 as a normal.
    move_and_slide(velocity, Vector2(0, -1))
