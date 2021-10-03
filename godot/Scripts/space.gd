extends Node2D


var viewport_size
var ball

func _ready():
	viewport_size = get_viewport_rect()
	GVars.connect("update_score", self, "update_score")
	GVars.emit_signal("update_score")


func _process(delta):
	if Input.is_action_pressed("ui_up"):
		$player.move_and_slide(Vector2(0,-500))
	if Input.is_action_pressed("ui_down"):
		$player.move_and_slide(Vector2(0,500))
	if Input.is_action_pressed("ui_right"):
		$player.move_and_slide(Vector2(500,0))
	if Input.is_action_pressed("ui_left"):
		$player.move_and_slide(Vector2(-500,0))
	if Input.is_action_pressed("shoot"):
		if $Timer.is_stopped():
			shoot()
	if $Enemies.get_child_count() == 0:
		pass
		
func shoot():
	ball = preload("res://applications/space/ball.tscn").instance()
	ball.global_position = $player.global_position 
	$".".add_child(ball)
	ball.whoshot = "player"
	ball.points = 100
	ball.collision_mask = 0
	ball.modulate = Color(0,255,0)
	ball.set_axis_velocity(Vector2(500,0))
	$Timer.start()
	
func update_score():
	$score/label.text = String(GVars.points)
