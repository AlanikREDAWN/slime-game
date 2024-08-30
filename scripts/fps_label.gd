extends Label



func _ready() -> void:
	Global.fps_displayed.connect(_on_fps_displayed)

func _process(delta: float) -> void:
	text = "FPS: %s" % [Engine.get_frames_per_second()]

func _on_fps_displayed(value):
	visible = value
