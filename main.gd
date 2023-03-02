extends Node


const SavePath := "user://jason"



func _ready() -> void:
	SaveJson()
	$CenterContainer/SceneTree/VBoxContainer/HBoxContainer/Load.pressed.connect(LoadJson)
	$CenterContainer/SceneTree/VBoxContainer/HBoxContainer/Save.pressed.connect(SaveJson)
	

func LoadJson() -> void:
	var Dictionaryy := {
		"label0": $CenterContainer/SceneTree/VBoxContainer/RichTextLabel/Label1.text,
		"label1": $CenterContainer/SceneTree/VBoxContainer/RichTextLabel/Label3.text,
		"label2": $CenterContainer/SceneTree/VBoxContainer/RichTextLabel/Label2.text,
	}
	var Jason := JSON.stringify(Dictionaryy)
	var File := FileAccess.open(SavePath, FileAccess.WRITE)
	File.store_line(Jason)
	File.close()


func SaveJson() -> void:
	if not FileAccess.file_exists(SavePath):
		return
	var File := FileAccess.open(SavePath, FileAccess.READ)
	var Data := File.get_line()
	var Jason: Dictionary = JSON.parse_string(Data)
	$CenterContainer/SceneTree/VBoxContainer/RichTextLabel/Label1.text = Jason.label0
	$CenterContainer/SceneTree/VBoxContainer/RichTextLabel/Label3.text = Jason.label1
	$CenterContainer/SceneTree/VBoxContainer/RichTextLabel/Label2.text = Jason.label2
