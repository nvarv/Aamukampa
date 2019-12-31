extends Node2D

const length = 3
const color = Color("e1d798")

onready var units = get_node("Units")
onready var left_end = get_node("LeftEnd")
onready var right_end = get_node("RightEnd")

var comb_unit = preload("res://Assets/comb_unit.svg")
var comb_unit_broken = preload("res://Assets/comb_unit_broken.svg")

func _ready():
	randomize()
	for i in range(length):
		add_base(i)
	left_end.modulate = color
	right_end.modulate = color
	right_end.position.x = 210 + 120 * (length - 1) + 135
	
func add_base(i):
	var base = Sprite.new()
	base.texture = comb_unit
	base.modulate = color
	base.position.x = 210 + 120 * i
	base.position.y = 270
	if (randf() < 1):
		base.texture = comb_unit
	else:
		base.texture = comb_unit_broken
		base.position.y = 120
	units.add_child(base)