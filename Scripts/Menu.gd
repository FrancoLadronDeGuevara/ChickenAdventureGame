extends Control

func _ready():
	$VBoxContainer/start.grab_focus()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes//Worlds/1.tscn")


func _on_quit_pressed():
	get_tree().quit()
