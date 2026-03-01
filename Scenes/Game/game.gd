extends Node2D
class_name Game

@onready var player: Player = $Player
@onready var spawn_pos: Marker2D = $SpawnPos

var points := 0

func _ready() -> void:
	EventManager.on_player_dead.connect(_on_player_dead)
	EventManager.on_fruit_collected.connect(_on_fruit_collected)

func _on_player_dead() -> void:
	player.player_dead()
	await player.anim_sprite.animation_finished
	
	var tween := create_tween()
	tween.tween_property(player, "global_position", spawn_pos.position, 0.5)
	tween.tween_callback(player.player_respawn)
	

func _on_fruit_collected() -> void:
	points += 1
	print(points)
