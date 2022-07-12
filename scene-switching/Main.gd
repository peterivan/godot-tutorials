extends Control


func _ready() -> void:
	pass


func _on_Button_1_pressed() -> void:
	get_tree().change_scene("res://Scene1.tscn")


func _on_Button_2_pressed() -> void:
	get_tree().change_scene("res://Scene2.tscn")


func _on_Button_3_pressed() -> void:
	get_tree().change_scene("res://Scene3.tscn")


func _on_Button_4_pressed() -> void:
	get_tree().change_scene("res://Scene4.tscn")
