extends Area2D

@onready var player: CharacterBody2D = $"../Player"

var on_door1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if on_door1 == true:
		if Input.is_action_pressed("down"):
			Global.doors_entered.append(self.name)
			print(Global.doors_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	Global.on_door = true
	on_door1 = true
	


func _on_body_exited(body: Node2D) -> void:
	Global.on_door = false
	on_door1 = false
