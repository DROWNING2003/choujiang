extends Control

@onready var guo:VideoStreamPlayer = %guo
@onready var 机器 = $"机器"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	print("start")
	机器.visible = false
	guo.play()
	


func _on_guo_finished():
	print("结束")
	get_tree().change_scene_to_file("res://kaijiang.tscn")
	
