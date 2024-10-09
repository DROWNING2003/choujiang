extends Control
@onready var animation_player = %AnimationPlayer
@onready var icon: Sprite2D = %icon
@onready var tip: Label = $"机器/开奖/tip"

const data = "res://data.json"
# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("start")
	var res = getResult()
	print(res)
	if res.icon=="炸弹":
		var boom = load("res://assert/icon3.png")
		icon.texture = boom
	if res.icon=="钞票":
		var cp = load("res://assert/icon2.png")
		icon.texture = cp
	if res.icon=="运动":
		var yd = load("res://assert/icon6.png")
		icon.texture = yd
	if res.icon=="硬币":
		var yb = load("res://assert/icon1.png")
		icon.texture = yb
	if res.icon=="咖啡":
		var kf = load("res://assert/icon5.png")
		icon.texture = kf
#	
	tip.text = res.name

func _process(delta):
	pass

func _enter_tree():
	print("kaijiang")
	


func _on_button_pressed():
	print("fanhui")
	get_tree().change_scene_to_file("res://main.tscn")

func getResult():
	var data_list = LoadData()
	var temp = []
	for i in data_list:
		if i.pz=="传奇":
			temp.append(i)
		elif i.pz=="史诗":
			for y in range(10):
				temp.append(i)
		elif i.pz=="稀有":
			for y in range(100):
				temp.append(i)
		elif i.pz=="普通":
			for y in range(300):
				temp.append(i)
	return temp[randi_range(0, len(temp)-1)]
	
	
func LoadData():
	var file = FileAccess.open(data,FileAccess.READ)
	if FileAccess.file_exists(data):
		var data = JSON.parse_string(file.get_line())
		return data
	return[]
