extends Node2D

func _physics_process(delta):
	if $RayCast2D.is_colliding():
		if ($RayCast2D.get_collider().is_in_group("enemy")):
			$RayCast2D.get_collider().health = $RayCast2D.get_collider().health - 100
			if $RayCast2D.get_collider().health <= 0:
				$RayCast2D.get_collider().queue_free()
			self.queue_free()
#		pass
