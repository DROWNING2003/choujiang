extends Control
@onready var animation_player = %AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("start")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _enter_tree():
	print("kaijiang")
	


func _on_button_pressed():
	print("fanhui")
	get_tree().change_scene_to_file("res://main.tscn")
