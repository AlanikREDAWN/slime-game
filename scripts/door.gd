extends Area2D

@onready var player: CharacterBody2D = $"../Player"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	Global.on_door = true
	if Input.is_action_pressed("down"):
		Global.doors_entered.append(self.name)
		print(Global.doors_entered)
		player.position = Vector2(198, 1299)


func _on_body_exited(body: Node2D) -> void:
	Global.on_door = false
