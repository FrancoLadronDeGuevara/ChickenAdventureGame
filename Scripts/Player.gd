extends CharacterBody2D

const moveSpeed = 50
const maxSpeed = 150
const jumpHeight = -450
const gravity = 15
var lifes = 3

@onready var sprite = $Sprite2D
@onready var animationPlayer = $AnimationPlayer
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(_delta):
	velocity.y += gravity
	var friction = false

	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		sprite.offset.x = 0
		animationPlayer.play("Walk")
		velocity.x = min(velocity.x + moveSpeed, maxSpeed)

	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = false
		sprite.offset.x = 5
		animationPlayer.play("Walk")
		velocity.x = max(velocity.x - moveSpeed, -maxSpeed)

	else:
		animationPlayer.play("Idle")
		friction = true

	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			velocity.y = jumpHeight
		if friction:
			velocity.x = lerp(velocity.x, 0.0, 0.5)
	else:
		if friction:
			velocity.x = lerp(velocity.x, 0.0, 0.01)
	
	position = position.clamp(Vector2.ZERO, screen_size)
	
	move_and_slide()
	
func add_coin():
	var canvasSlayer = get_tree().get_root().get_node(str(get_tree().current_scene.name)+"/CanvasLayer")
	canvasSlayer.handleCoinCollected()

func _loseLife(enemyposx):
	if position.x < enemyposx:
		velocity.x = -300
		velocity.y = -200
	if position.x > enemyposx:
		velocity.x = 300
		velocity.y = -200
		
	if lifes <= 0:
		get_tree().reload_current_scene()
	
	lifes -= 1
	
	var canvasSlayer = get_tree().get_root().get_node(str(get_tree().current_scene.name)+"/CanvasLayer")
	canvasSlayer.handleHearts(lifes)
	
	
	
