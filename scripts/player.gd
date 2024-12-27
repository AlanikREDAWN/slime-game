class_name Player
extends CharacterBody2D
#
#enum States { AIR = 1, FLOOR, LADDER }
#var state = States.AIR
var on_sewer := false
#var on_door := false
var on_ladder := false
const SPEED = 500.0
const JUMP_VELOCITY = -800.0

var level = 0
@onready var player_start: Node2D = $"../PlayerStart"

@onready var game_manager: Node = %GameManager
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var you_win: Label = $"../YouWin"
@onready var tile_map_sewer: TileMapLayer = $"../TileMapSewer"


var isCrouching = false


func _ready() -> void:
	if get_tree().current_scene.name == "Game":
		level = 1
		Global.doors_entered = []
		Global.level1_complete = true
	if get_tree().current_scene.name == "level2":
		level = 2
		Global.doors_entered = []
		print(Global.doors_entered)
		Global.level1_complete = true
		Global.level2_complete = true
	if get_tree().current_scene.name == "level3":
		level = 3
		Global.doors_entered = []
		Global.level1_complete = true
		Global.level2_complete = true
		Global.level3_complete = true
	if get_tree().current_scene.name == "level4":
		level = 4
		Global.doors_entered = []
		Global.level1_complete = true
		Global.level2_complete = true
		Global.level3_complete = true
		Global.level4_complete = true
	if get_tree().current_scene.name == "level5":
		level = 5
		Global.doors_entered = []
		Global.level1_complete = true
		Global.level2_complete = true
		Global.level3_complete = true
		Global.level5_complete = true
		
func _physics_process(delta: float) -> void:
	#if get_tree().current_scene.name == "Game":
		#level = 1
	#if get_tree().current_scene.name == "level2":
		#level = 2
		#Global.doors_entered = []
	#print(on_door)
	
	#match state:
		#States.AIR:
			#animated_sprite.play("jump")
			#if Input.is_action_pressed("move_right")
		#States.FLOOR:
			#pass
		
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = true
	elif direction < 0:
		animated_sprite.flip_h = false
	
	# Play animations
	if is_on_floor():
		if Input.is_action_pressed("duck"):
			animated_sprite.play("duck")
		elif direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if on_ladder == true:
		animated_sprite.play("climb")
		if Input.is_action_pressed("down"):
			velocity.y = SPEED*delta*35
		elif Input.is_action_pressed("up"):
			velocity.y = -SPEED*delta*35
		else:
			velocity.y = 0

	if Global.on_door == true:
		if Input.is_action_pressed("down"):
			if level == 1:
				self.position = Vector2(198, 1299)
			if level == 2:
				self.position = Vector2(-1947, 1386)
			if level == 3:
				self.position = Vector2(181, -1634)
	
	if level == 1:		
	
		if "Door1" in Global.doors_entered:
			if "Door2" in Global.doors_entered:
				if "Door3" in Global.doors_entered:
					if "Door4" in Global.doors_entered:
						tile_map_sewer.visible = true

		if "Door1" in Global.doors_entered and "Door2" in Global.doors_entered and "Door3" in Global.doors_entered and "Door4" in Global.doors_entered:
			tile_map_sewer.visible = true
	
		if on_sewer == true:
			if Input.is_action_pressed("down"):
				#you_win.visible = true
				get_tree().change_scene_to_file("res://scenes/level2.tscn")
				level = 2
				Global.level1_complete = true

	
	if level == 2:
		if "Door1" in Global.doors_entered:
			if "Door2" in Global.doors_entered:
				if "Door3" in Global.doors_entered:
					if "Door4" in Global.doors_entered:
						if "Door5" in Global.doors_entered:
							tile_map_sewer.visible = true
		
		if "Door1" in Global.doors_entered and "Door2" in Global.doors_entered and "Door3" in Global.doors_entered and "Door4" in Global.doors_entered and "Door5" in Global.doors_entered:
			tile_map_sewer.visible = true
			
		if on_sewer == true:
			if Input.is_action_pressed("down"):
				#you_win.visible = true
				get_tree().change_scene_to_file("res://scenes/level_3.tscn")
				level = 3
				Global.level1_complete = true
				Global.level2_complete = true
				
	if level == 3:
		if "Door1" in Global.doors_entered:
			if "Door2" in Global.doors_entered:
				if "Door3" in Global.doors_entered:
					if "Door4" in Global.doors_entered:
							tile_map_sewer.visible = true
		
		if "Door1" in Global.doors_entered and "Door2" in Global.doors_entered and "Door3" in Global.doors_entered and "Door4" in Global.doors_entered:
			tile_map_sewer.visible = true
			
		if on_sewer == true:
			if Input.is_action_pressed("down"):
				#you_win.visible = true
				get_tree().change_scene_to_file("res://scenes/level_4.tscn")
				level = 4
				Global.level1_complete = true
				Global.level2_complete = true
				Global.level3_complete = true
	
	if level == 4:
		#var game_manager = get_node("%GameManager")  
		#if game_manager != null:
			#print(game_manager.coinsCollected)
		#else:
			#print("Error: Player node not found!")
		if game_manager.coinsCollected == 26:
			tile_map_sewer.visible = true
			
		if on_sewer == true:
			if Input.is_action_pressed("down"):
				#you_win.visible = true
				get_tree().change_scene_to_file("res://scenes/level_5.tscn")
				level = 5
				Global.level1_complete = true
				Global.level2_complete = true
				Global.level3_complete = true
				Global.level4_complete = true
	if level == 5:
		if game_manager.coinsCollected == 60:
			tile_map_sewer.visible = true
		#var can_control : bool = true
			
			#if "Door1" in Global.doors_entered:
				#if "Door2" in Global.doors_entered:
					#if "Door3" in Global.doors_entered:
						#if "Door4" in Global.doors_entered:
								#tile_map_sewer.visible = true
			
			#if "Door1" in Global.doors_entered and "Door2" in Global.doors_entered and "Door3" in Global.doors_entered and "Door4" in Global.doors_entered:
				#tile_map_sewer.visible = true
				
			if on_sewer == true:
				if Input.is_action_pressed("down"):
					#you_win.visible = true
					get_tree().change_scene_to_file("res://scenes/level_4.tscn")
					level = 4
					Global.level1_complete = true
					Global.level2_complete = true
					Global.level3_complete = true
					Global.level4_complete = true
					Global.level5_complete = true
		
	#if Input.is_action_pressed("down"):
		#self.position = Vector2(198, 1299)
	move_and_slide()


func _on_ladder_checker_body_entered(body: Node2D) -> void:
	on_ladder = true


func _on_ladder_checker_body_exited(body: Node2D) -> void:
	on_ladder = false


func _on_door_checker_body_entered(body: Node2D) -> void:
	Global.on_door = true


func _on_door_checker_body_exited(body: Node2D) -> void:
	Global.on_door = false


func _on_sewer_checker_body_entered(body: Node2D) -> void:
	on_sewer = true


func _on_sewer_checker_body_exited(body: Node2D) -> void:
	on_sewer = false

func handle_danger() -> void:
	print("player fell of the world")
	visible = false
	#can_control = false
	
	reset_player()

func reset_player() -> void:
	global_position = player_start.global_position
	visible = true
