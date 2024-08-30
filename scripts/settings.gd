extends Control

# Video Settings
@onready var display_option_button: OptionButton = $SettingsTabs/Video/MarginContainer/VideoSettings/DisplayOptionButton
@onready var vsync_button: CheckButton = $SettingsTabs/Video/MarginContainer/VideoSettings/VsyncButton
@onready var display_fps_button: CheckButton = $SettingsTabs/Video/MarginContainer/VideoSettings/DisplayFpsButton
@onready var max_fps_value: Label = $SettingsTabs/Video/MarginContainer/VideoSettings/HBoxContainer/MaxFpsValue
@onready var max_fps_slider: HSlider = $SettingsTabs/Video/MarginContainer/VideoSettings/HBoxContainer/MaxFpsSlider
@onready var bloom_button: CheckButton = $SettingsTabs/Video/MarginContainer/VideoSettings/BloomButton

# Audio Settings
@onready var master_volume_slider: HSlider = $SettingsTabs/Audio/MarginContainer/AudioSettings/MasterVolumeSlider
@onready var music_volume_slider: HSlider = $SettingsTabs/Audio/MarginContainer/AudioSettings/MusicVolumeSlider
@onready var sfx_volume_slider: HSlider = $SettingsTabs/Audio/MarginContainer/AudioSettings/SfxVolumeSlider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_display_option_button_item_selected(index: int) -> void:
	pass # Replace with function body.


func _on_vsync_button_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.


func _on_display_fps_button_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.


func _on_max_fps_slider_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_bloom_button_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.


func _on_master_volume_slider_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_music_volume_slider_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_sfx_volume_slider_value_changed(value: float) -> void:
	pass # Replace with function body.
