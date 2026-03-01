extends CharacterBody2D
class_name EnemyPig

@export var move_speed := 80

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast: RayCast2D = $RayCast2D

var direction := 1
var can_move := true
var defeated := false

func _process(delta: float) -> void:
	if can_move:
		velocity.x = move_speed * direction
		move_and_slide()
	
	if not ray_cast.is_colliding():
		direction *= -1
		anim_sprite.scale.x = direction
		ray_cast.scale.x = direction


func _on_top_area_body_entered(body: Node2D) -> void:
	if not body is Player or EventManager.player_hit: return
	
	can_move = false
	defeated = true
	body.velocity.y = -250
	anim_sprite.play("hit")
	await anim_sprite.animation_finished
	queue_free()


func _on_bottom_area_body_entered(body: Node2D) -> void:
	if not body is Player or defeated: return
	
	EventManager.player_hit = true
	EventManager.on_player_dead.emit()
