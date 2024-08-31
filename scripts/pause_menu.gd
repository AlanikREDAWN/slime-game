extends Control

@onready var game: Node2D = $"../.."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	game.connect("toggle_game_paused", _on_game_toggle_game_pause)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_game_toggle_game_pause(is_paused: bool):
	if is_paused:
		show()
	else:
		hide()


func _on_resume_button_pressed() -> void:
	pass # Replace with function body.
