extends Control
@onready var jpname:LineEdit = $"TextureRect2/HBoxContainer/奖品名称/jpname"
@onready var pz:OptionButton = $"TextureRect2/HBoxContainer/品质/pz"
@onready var icon:OptionButton = $TextureRect2/HBoxContainer/icon/icon
@onready var item_list: ItemList = %ItemList

const data = "res://data.json"
# Called when the node enters the scene tree for the first time.
func _ready():
	reload_data()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var data_list = LoadData()
	data_list.append({
		"name":jpname.text,
		"pz":pz.get_item_text(pz.get_selected_id()),
		"icon":icon.get_item_text(icon.get_selected_id()),
	})
	SaveData(JSON.stringify(data_list))
	reload_data()

func _on_button_2_pressed():
	input_clear()
	

func SaveData(json:String):
	var file = FileAccess.open(data,FileAccess.WRITE)
	file.store_line(json)
	input_clear()

func LoadData():
	var file = FileAccess.open(data,FileAccess.READ)
	if FileAccess.file_exists(data):
		var data = JSON.parse_string(file.get_line())
		return data
	return[]


func _on_item_list_item_activated(index: int) -> void:
	var data_list = LoadData()
	data_list.remove_at(index)
	SaveData(JSON.stringify(data_list))
	reload_data()
	
func reload_data():
	item_list.clear()
	var data_list = LoadData()
	for item in data_list:
		item_list.add_item(item.name+":"+item.pz)

func input_clear():
	jpname.text = ""
	pz.select(-1)
	icon.select(-1)


func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
