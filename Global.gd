extends Node

var starting_score = 0
var current_score = 0
@export var starting_time = 30
var time_left = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	current_score = starting_score
	time_left = starting_time
	
func _process(delta: float):
	pass

