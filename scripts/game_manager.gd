extends Node

@onready var coins_label: Label = $CoinsLabel

var coinsCollected = 0

func add_coin():
	coinsCollected += 1
	coins_label.text = "Coins: " + str(coinsCollected)
