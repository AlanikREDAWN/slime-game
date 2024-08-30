extends Node

var doors_entered = []
var on_door := false
signal fps_displayed(value)
signal bloom_toggled(value)

func toggle_fullscreen(value):
	DisplayServer.window_set_mode(value)
	#if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	#else:
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func set_vsync(value):
	DisplayServer.window_set_vsync_mode(value)

func toggle_fps_display(value):
	emit_signal("fps_displayed", value)

func set_max_fps(value):
	Engine.max_fps = value if value < 500 else 0

func update_master_vol(vol):
	AudioServer.set_bus_volume_db(0, vol)

func update_music_vol(vol):
	AudioServer.set_bus_volume_db(1, vol)

func update_sfx_vol(vol):
	AudioServer.set_bus_volume_db(2, vol)
