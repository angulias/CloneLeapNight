extends CharacterBody2D
class_name Player

@export var max_speed := 180
@export var jump_force := 450
@export var max_jumps := 2
@export var gravity := 1600

@onready var visuals: Node2D = %Visuals
@onready var anim_sprite: AnimatedSprite2D = %AnimatedSprite2D
@onready var ray_cast_2d: RayCast2D = %RayCast2D
