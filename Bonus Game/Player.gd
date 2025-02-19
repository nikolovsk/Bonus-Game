extends KinematicBody

var speed = 5.0
var jump_strength = 10.0
var gravity = 9.8
var velocity = Vector3()

var collected_items = 0
var total_items = 5  

func _process(delta):
	var direction = Vector3()

	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	if Input.is_action_pressed("move_backward"):
		direction.z += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1

	direction = direction.normalized() * speed

	velocity.x = direction.x
	velocity.z = direction.z
	
	if is_on_floor():
		velocity.y = 0
	else:
		velocity.y -= gravity * delta

	# Проверка за скок
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_strength

	velocity = move_and_slide(velocity, Vector3.UP)

func _on_item_collected():
	collected_items += 1
	if collected_items == total_items:
		win_game()

func game_over():
	get_tree().change_scene("res://lose_scene.tscn")

func win_game():
	get_tree().change_scene("res://win_screen.tscn")
