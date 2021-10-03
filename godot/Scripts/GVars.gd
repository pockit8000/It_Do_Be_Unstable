extends Node

#Signals
signal update_score




#Vars
var points = 500
var bluescreen = load("res://assets/bluescreen.png")
var onBS = false
var BS_Sprite
var BS_times = 0


#functions

func do_the_bluescreen():
	if onBS == false:
		BS_Sprite = Sprite.new()
		BS_times=+1
		get_node("..").get_child(1).hide()
		BS_Sprite.texture = bluescreen
		BS_Sprite.centered = false
		get_node("..").add_child(BS_Sprite, true)
		onBS = true
	
func _input(event):
	if event is InputEventKey && Input.is_action_just_pressed("resetbluescreen") && onBS:
		get_node("..").get_child(1).queue_free()
		var enviroment = load("res://Enviroment.tscn").instance()
		BS_Sprite.queue_free()
		get_node("..").add_child(enviroment, true)
		onBS = false
	elif event is InputEventKey && event.is_pressed() && not event.is_echo() && event.scancode != KEY_SHIFT && event.scancode != KEY_CONTROL && onBS:

		onBS = false
		BS_Sprite.hide()
		get_node("..").get_child(1).show()
		get_node("..").get_child(1).modulate = Color(1,0.5,0.5)
		
		
