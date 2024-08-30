extends Control

# Video Settings
@onready var display_option_button: OptionButton = $SettingsTabs/Video/MarginContainer/VideoSettings/DisplayOptionButton
#@onready var vsync_button: CheckButton = $SettingsTabs/Video/MarginContainer/VideoSettings/VsyncButton
@onready var vsync_option_button: OptionButton = $SettingsTabs/Video/MarginContainer/VideoSettings/VsyncOptionButton
@onready var display_fps_button: CheckButton = $SettingsTabs/Video/MarginContainer/VideoSettings/DisplayFpsButton
@onready var max_fps_value: Label = $SettingsTabs/Video/MarginContainer/VideoSettings/HBoxContainer/MaxFpsValue
@onready var max_fps_slider: HSlider = $SettingsTabs/Video/MarginContainer/VideoSettings/HBoxContainer/MaxFpsSlider

# Audio Settings
@onready var master_volume_slider: HSlider = $SettingsTabs/Audio/MarginContainer/AudioSettings/MasterVolumeSlider
@onready var music_volume_slider: HSlider = $SettingsTabs/Audio/MarginContainer/AudioSettings/MusicVolumeSlider
@onready var sfx_volume_slider: HSlider = $SettingsTabs/Audio/MarginContainer/AudioSettings/SfxVolumeSlider
var back_pressed := false
@onready var back_click: AudioStreamPlayer2D = $backClick

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_display_option_button_item_selected(index: int) -> void:
	Global.toggle_fullscreen(DisplayServer.WINDOW_MODE_FULLSCREEN if index == 1 else DisplayServer.WINDOW_MODE_WINDOWED)


#func _on_vsync_button_toggled(toggled_on: bool) -> void:
	#pass # Replace with function body.

func _on_vsync_option_button_item_selected(index: int) -> void:
	Global.set_vsync	(
		DisplayServer.VSYNC_ENABLED if index == 1
		else DisplayServer.VSYNC_ADAPTIVE if index == 2
		else DisplayServer.VSYNC_MAILBOX if index == 3
		else DisplayServer.VSYNC_DISABLED
	)
	
func _on_display_fps_button_toggled(toggled_on: bool) -> void:
	Global.toggle_fps_display(toggled_on)


func _on_max_fps_slider_value_changed(value: float) -> void:
	Global.set_max_fps(value)
	max_fps_value.text = str(value) if value < max_fps_slider.max_value else "Max"


func _on_master_volume_slider_value_changed(value: float) -> void:
	Global.update_master_vol(value)


func _on_music_volume_slider_value_changed(value: float) -> void:
	Global.update_music_vol(value)


func _on_sfx_volume_slider_value_changed(value: float) -> void:
	Global.update_sfx_vol(value)


func _on_back_button_pressed() -> void:
	back_click.play()
	back_pressed = true


func _on_back_click_finished() -> void:
	if back_pressed == true:
		back_pressed = false
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
