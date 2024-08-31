extends Control

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var play_pressed := false
var how_to_play_pressed := false
var credits_pressed := false
var settings_pressed := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	audio_stream_player_2d.play()
	play_pressed = true
	


func _on_how_to_play_button_pressed() -> void:
	audio_stream_player_2d.play()
	how_to_play_pressed = true


func _on_credits_pressed() -> void:
	audio_stream_player_2d.play()
	credits_pressed = true


func _on_settings_pressed() -> void:
	audio_stream_player_2d.play()
	settings_pressed = true


func _on_audio_stream_player_2d_finished() -> void:
	if play_pressed == true:
		play_pressed = false
		Global.back_button_path = "res://scenes/main_menu.tscn"
		get_tree().change_scene_to_file("res://scenes/game.tscn")
	elif how_to_play_pressed == true:
		how_to_play_pressed = false
		Global.back_button_path = "res://scenes/main_menu.tscn"
		get_tree().change_scene_to_file("res://scenes/how_to_play.tscn")
	elif credits_pressed == true:
		credits_pressed = false
		Global.back_button_path = "res://scenes/main_menu.tscn"
		get_tree().change_scene_to_file("res://scenes/credits.tscn")
	elif settings_pressed == true:
		settings_pressed = false
		Global.back_button_path = "res://scenes/main_menu.tscn"
		get_tree().change_scene_to_file("res://scenes/settings.tscn")
