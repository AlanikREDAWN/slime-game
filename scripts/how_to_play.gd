extends Control

@onready var back_click: AudioStreamPlayer2D = $backClick
var back_pressed := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_button_pressed() -> void:
	back_click.play()
	back_pressed = true


func _on_back_click_finished() -> void:
	if back_pressed == true:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
