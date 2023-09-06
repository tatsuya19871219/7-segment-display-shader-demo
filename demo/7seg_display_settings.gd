@tool

extends Node2D

@export var skew_angle = 0.0
@export var segment_width = 0.1
@export var color_on: Color = Color.RED
@export var color_off: Color = Color.WHITE
@export var color_background: Color = Color.BLACK
@export var segment_offset = 0.5
@export var margin = 0.0

@onready var S0 = get_node("0")
@onready var S1 = get_node("1")
@onready var S2 = get_node("2")
@onready var S3 = get_node("3")
@onready var S4 = get_node("4")
@onready var S5 = get_node("5")
@onready var S6 = get_node("6")
@onready var S7 = get_node("7")
@onready var S8 = get_node("8")
@onready var S9 = get_node("9")

const my_7seg_width = 64

# Called when the node enters the scene tree for the first time.
func _ready():
	var Sset = [S0, S1, S2, S3, S4, S5, S6, S7, S8, S9]
	
	for i in range(10):
		#print(i)
		var S = Sset[i]
		S.material = S.material.duplicate()
		S.material.set_shader_parameter("SkewAngle", skew_angle)
		S.material.set_shader_parameter("SegmentWidth", segment_width)
		S.material.set_shader_parameter("SegmentOnColor", color_on)
		S.material.set_shader_parameter("SegmentOffColor", color_off)
		S.material.set_shader_parameter("BackgroundColor", color_background)
		S.material.set_shader_parameter("Number", i)
		S.material.set_shader_parameter("Size", my_7seg_width)
		S.material.set_shader_parameter("SegmentOffsetRatio", segment_offset)
		
		if (skew_angle >= 0.0):
			S.position.x = i*my_7seg_width*(1+sin(deg_to_rad(skew_angle)/2.0))
		else:
			S.position.x = i*my_7seg_width*(1+abs(sin(deg_to_rad(skew_angle))))
			
		S.position.x += i*margin
	
