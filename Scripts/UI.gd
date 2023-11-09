extends CanvasLayer

var coins = 0
var heart1
var heart2
var heart3

func _ready():
	heart1 = get_node("Heart")
	heart2 = get_node("Heart2")
	heart3 = get_node("Heart3")

	$CoinCollectedText.text = str(coins)

func handleCoinCollected():
	coins += 1
	$CoinCollectedText.text = str(coins)
	
	if coins == 3:
		get_tree().change_scene_to_file("res://Scenes//Worlds/" + str(get_tree().current_scene.name.to_int()+1) + ".tscn")
		
func handleHearts(lifes):
	if lifes == 0:
		heart1.visible = false
		get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
	if lifes == 1:
		heart2.visible = false
	if lifes == 2:
		heart3.visible = false
