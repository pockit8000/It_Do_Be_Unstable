extends RigidBody2D

export var whoshot = String()
export var power = 50
var points = 0

#func _physics_process(delta):
#	if $RayCast2D.is_colliding():
#		if ($RayCast2D.get_collider().is_in_group("enemy") && whoshot=="player"):
#			$RayCast2D.get_collider().health = $RayCast2D.get_collider().health - 100
#			if $RayCast2D.get_collider().health <= 0:
#				GVars.points+= $RayCast2D.get_collider().points
#				GVars.emit_signal("update_score")
#				$RayCast2D.get_collider().queue_free()
#			self.queue_free()
#		if ($RayCast2D.get_collider().is_in_group("player") && whoshot=="enemy"):
#			GVars.health =- 100
#			if GVars.health <= 0:
#				GVars.do_the_bluescreen()
func _physics_process(delta):
	if linear_velocity < Vector2(30,30) && linear_velocity > Vector2(-30,-30):
		self.queue_free()

func _on_Ball_body_entered(body):
	if body.is_in_group("limit"):
		self.queue_free()
	if (body.is_in_group("enemy") && whoshot=="player"):
		body.health-=power
		if body.health <= 0:
			GVars.points+= body.points
			GVars.emit_signal("update_score")
			body.queue_free()
	if body.is_in_group("player") && whoshot=="enemy":
		GVars.points-=50
		GVars.emit_signal("update_score")
		if GVars.points <= 0:
			GVars.do_the_bluescreen()


func _on_Ball_body_shape_entered(body_id, body, body_shape, local_shape):
	pass
