extends KinematicBody2D

var vel = Vector2.ZERO

var rSpeed = 5.0
var speed = 0.1
var maxSpeed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	position = position + vel
	vel = vel.normalized() * clamp(vel.length(), 0, maxSpeed)
	
	$Exhaust.hide()
	if Input.is_action_pressed("forward"):
		vel = vel + Vector2(0,-speed).rotated(rotation)
		$Exhaust.show()
	if Input.is_action_pressed("left"):
		rotation_degrees = rotation_degrees - rSpeed
	if Input.is_action_pressed("right"):
		rotation_degrees = rotation_degrees + rSpeed
	
	position.x = wrapf(position.x, 0, 1024)
	position.y = wrapf(position.y, 0, 600)
