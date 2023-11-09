extends Node2D


func _ready():
	$AnimationPlayer.play("Fly")
	


func _on_area_2d_body_entered(body):
	if body.get_name() == "Player":
		body._loseLife(position.x)
		pass
