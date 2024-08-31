extends Control

@onready var game: Node2D = $"../.."
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var how_to_play_pressed := false
var main_menu_pressed := false
var credits_pressed := false
var settings_pressed := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	Global.connect("toggle_game_paused", _on_game_toggle_game_pause)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.game_paused == true:
		show()
	else:
		hide()

func _on_game_toggle_game_pause(is_paused: bool):
	if is_paused:
		show()
	else:
		hide()


func _on_resume_button_pressed() -> void:
	audio_stream_player_2d.play()
	Global.game_paused = false


func _on_how_to_play_button_pressed() -> void:
	audio_stream_player_2d.play()
	how_to_play_pressed = true


func _on_main_menu_pressed() -> void:
	audio_stream_player_2d.play()
	main_menu_pressed = true


func _on_credits_pressed() -> void:
	audio_stream_player_2d.play()
	credits_pressed = true


func _on_settings_pressed() -> void:
	audio_stream_player_2d.play()
	settings_pressed = true


func _on_audio_stream_player_2d_finished() -> void:
	if how_to_play_pressed == true:
		how_to_play_pressed = false
		Global.game_paused = false
		Global.back_button_path = "res://scenes/game.tscn"
		get_tree().change_scene_to_file("res://scenes/how_to_play.tscn")
	elif main_menu_pressed == true:
		main_menu_pressed = false
		Global.game_paused = false
		Global.back_button_path = "res://scenes/game.tscn"
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	elif credits_pressed == true:
		credits_pressed = false
		Global.game_paused = false
		Global.back_button_path = "res://scenes/game.tscn"
		get_tree().change_scene_to_file("res://scenes/credits.tscn")
	elif settings_pressed == true:
		settings_pressed = false
		Global.game_paused = false
		Global.back_button_path = "res://scenes/game.tscn"
		get_tree().change_scene_to_file("res://scenes/settings.tscn")
