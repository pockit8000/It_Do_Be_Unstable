extends Node

var on
var inside_button
var opening = null
var application 
var sprites = {
	"web": "res://assets/internet_small.png",
	"folder": "res://assets/computer_small.png",
	"space" : "res://assets/space.png"
}

var names = {
	"web": "THE WEB BROWSAAAA",
	"folder": "BROWSE THE FILES LIKE A PRO",
	"space": "PEW PEW PEW"
}

var image

func _ready():
	$AnimationPlayer.play("Boot")

func _input(event):
	if event.is_action_pressed('ui_toggleFullscreen'):
		OS.window_fullscreen = !OS.window_fullscreen
	
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event is InputEventMouseButton and event.doubleclick and inside_button:
		open_window(inside_button)

func open_window(inside_button):
	if opening != null:
		$ApplicationContainer.hide()
		if get_node("ApplicationContainer/Application").get_children() != []:
			get_node("ApplicationContainer/Application").remove_child(get_node("ApplicationContainer/Application").get_children()[0])
	opening = inside_button
	$Opening.frame = 0
	$Opening.show()
	$Opening.play("Opening")

func _on_AnimatedSprite_animation_finished():
	$ApplicationContainer.show()
	if opening == "web":
		image = load(sprites["web"])
		application = preload("res://applications/webz.tscn").instance()
		get_node("ApplicationContainer/Application").add_child(application)
	if opening == "folder":
		image = load(sprites["folder"])
		application = preload("res://applications/folder.tscn").instance()
		get_node("ApplicationContainer/Application").add_child(application)
	if opening == "space":
		image = load(sprites["space"])
		application = preload("res://applications/space.tscn").instance()
		get_node("ApplicationContainer/Application").add_child(application)
	$ApplicationContainer/Bar/Label.text = names[opening]
	$ApplicationContainer/Bar/Icon.texture = image
	$Opening.hide()
		


func _on_desktop_icon_button_mouse_entered(button_name):
	inside_button = button_name


func _on_desktop_icon_button_mouse_exited(button_name):
	inside_button = null



func _on_CloseButton_pressed():
	$ApplicationContainer.hide()
	opening = null
	$ApplicationContainer/Application.remove_child($ApplicationContainer/Application.get_children()[0])


func _on_register_button_pressed():
	$AudioStreamPlayer.stream = load("res://assets/audio/dont_care.wav")
	$AudioStreamPlayer.play()


func _on_skip_pressed():
	$AnimationPlayer.playback_speed = 20


func _on_start_button_toggled(button_pressed):
	if button_pressed:
		$menu.show()
	else:
		$menu.hide()


func _on_menu_logoff_pressed():
		get_tree().quit()
