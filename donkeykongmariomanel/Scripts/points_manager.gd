extends Node

class_name PointsManager

@onready var player = $"../Player" as Player
@onready var points_label_scene = preload("res://Scripts/points_label.gd")

@export var point_increment = 100

const POINTS_LABEL_OFFSET = Vector2(0, -25)

var points = 0

func _ready():
	player.award_points.connect(on_award_points)

func on_award_points(position: Vector2):
	var label = points_label_scene.instantiate()
	add_child(label)
	label.position = position + POINTS_LABEL_OFFSET
	label.text = "%d" % point_increment
	points += point_increment
