extends Area2D

signal impacted

var speed = 300

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta


func _on_Bullet_body_entered(body: Node) -> void:
	emit_signal("impacted")
	queue_free()
