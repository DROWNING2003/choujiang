extends Node

var db:SQLite # 数据库对象
var db_path = "res://database/test.db" # 数据库名称和保存路径
var table_name = "godoter"  # 表格名称

# Called when the node enters the scene tree for the first time.
func _ready():
	if db == null:
		db = SQLite.new()
		db.path = db_path # 指定数据库文件
		db.open_db()
		db.create_table("item",{
			"id": {"data_type": "int", "primary_key": true, "not_null": true},
			"jpname": {"data_type": "text", "not_null": true, "unique": false},
			"icon": {"data_type": "text", "not_null": true},
			"pz": {"data_type": "text", "not_null": true}
		})
	
func close_db():
	if db:
		db.close_db()
		db = null
