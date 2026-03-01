extends CharacterBody2D
class_name  EnemyBlueBird

@export var path: CustomPathFollow

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

var defeated := false

func _process(_delta: float) -> void:
	anim_sprite.flip_h = path.direction == 1


func _on_top_area_body_entered(body: Node2D) -> void:	
	if not body is Player or EventManager.player_hit: return
	
	path.can_move = false
	anim_sprite.play("hit")
	body.velocity.y = -250
	defeated = true
	SoundManager.play_impact()
	
	await anim_sprite.animation_finished
	queue_free()


func _on_bottom_area_body_entered(body: Node2D) -> void:
	if not body is Player or defeated: return
	
	SoundManager.play_impact()
	EventManager.player_hit = true
	EventManager.on_player_dead.emit()
