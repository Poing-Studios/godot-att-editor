extends Node

signal request_tracking_authorization_complete(status)

enum Status {
	NOT_DETERMINED,
	RESTRICTED,
	DENIED,
	AUTHORIZED
}

var _plugin : Object

func _ready() -> void:
	if (Engine.has_singleton("ATT")):
		_plugin = Engine.get_singleton("ATT")
		_connect_signals()


func _connect_signals() -> void:
	_plugin.connect("request_tracking_authorization_complete", self, "_on_ATT_request_tracking_authorization_complete")

func _on_ATT_request_tracking_authorization_complete(status : int) -> void:
	emit_signal("request_tracking_authorization_complete", status)

func get_tracking_authorization_status() -> int:
	if _plugin:
		return _plugin.get_tracking_authorization_status()
	return 0

func request_tracking_authorization() -> void:
	if _plugin:
		_plugin.request_tracking_authorization()
