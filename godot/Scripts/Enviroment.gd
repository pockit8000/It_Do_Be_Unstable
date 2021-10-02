extends Node

var on
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event is InputEventMouseButton and event.doubleclick:
		$AnimatedSprite.show()
		$AnimatedSprite.play("Opening")


func _on_AnimatedSprite_animation_finished():
	$ViewportContainer.show()
