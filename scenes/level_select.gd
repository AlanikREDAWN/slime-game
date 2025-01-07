extends Control

@onready var level_button_2: Button = $GridContainer/LevelButton2
@onready var level_button_3: Button = $GridContainer/LevelButton3
@onready var level_button_4: Button = $GridContainer/LevelButton4
@onready var level_button_5: Button = $GridContainer/LevelButton5
@onready var level_button_6: Button = $GridContainer/LevelButton6
@onready var level_button_7: Button = $GridContainer/LevelButton7
@onready var level_button_8: Button = $GridContainer/LevelButton8
@onready var level_button_9: Button = $GridContainer/LevelButton9
@onready var level_button_10: Button = $GridContainer/LevelButton10
@onready var level_button_11: Button = $GridContainer/LevelButton11
@onready var level_button_12: Button = $GridContainer/LevelButton12


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.level1_complete:
		level_button_2.disabled = false
		
	if Global.level2_complete:
		level_button_3.disabled = false
		
	if Global.level3_complete:
		level_button_4.disabled = false
		
	if Global.level4_complete:
		level_button_5.disabled = false
		
	if Global.level5_complete:
		level_button_6.disabled = false
		
	if Global.level6_complete:
		level_button_7.disabled = false
		
	if Global.level7_complete:
		level_button_8.disabled = false
		
	if Global.level8_complete:
		level_button_9.disabled = false
		
	if Global.level9_complete:
		level_button_10.disabled = false
		
	if Global.level10_complete:
		level_button_11.disabled = false
		
	if Global.level11_complete:
		level_button_12.disabled = false
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_level_button_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_level_button_2_pressed() -> void:
	if Global.level1_complete:
		get_tree().change_scene_to_file("res://scenes/level2.tscn")


func _on_level_button_3_pressed() -> void:
	if Global.level2_complete:
		get_tree().change_scene_to_file("res://scenes/level_3.tscn")


func _on_level_button_4_pressed() -> void:
	if Global.level3_complete:
		get_tree().change_scene_to_file("res://scenes/level_4.tscn")

func _on_level_button_5_pressed() -> void:
	if Global.level4_complete:
		get_tree().change_scene_to_file("res://scenes/level_5.tscn")


func _on_level_button_6_pressed() -> void:
	if Global.level5_complete:
		pass # put code here


func _on_level_button_7_pressed() -> void:
	if Global.level6_complete:
		pass # put code here


func _on_level_button_8_pressed() -> void:
	if Global.level7_complete:
		pass # put code here


func _on_level_button_9_pressed() -> void:
	if Global.level8_complete:
		pass # put code here


func _on_level_button_10_pressed() -> void:
	if Global.level9_complete:
		pass # put code here


func _on_level_button_11_pressed() -> void:
	if Global.level10_complete:
		pass # put code here


func _on_level_button_12_pressed() -> void:
	if Global.level11_complete:
		pass # put code here
