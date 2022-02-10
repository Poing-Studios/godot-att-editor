tool
extends EditorPlugin

func _enter_tree():
	add_autoload_singleton("AppTrackingTransparency", "res://addons/att/src/singletons/ATTSingleton.gd")

func _exit_tree():
	remove_autoload_singleton("AppTrackingTransparency")
	
