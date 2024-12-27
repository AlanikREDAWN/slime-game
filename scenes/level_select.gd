extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
