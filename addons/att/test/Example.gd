extends Control

func _ready():
	$Output.text = "To make the ATT dialog appear a second time, you must uninstall and reinstall your app on your test device.\n\n" + \
	str(AppTrackingTransparency.Status) + "\n"
	AppTrackingTransparency.connect("request_tracking_authorization_complete", self, "_on_ATT_request_tracking_authorization_complete")

func _on_ATT_request_tracking_authorization_complete(status: int) -> void:
	$Output.text += "Tracking Authorization Status: " + str(status) + "\n"

func _on_RequestTrackingAuthorization_pressed():
	AppTrackingTransparency.request_tracking_authorization()

func _on_GetTrackingAuthorizationStatus_pressed():
	var tracking_authorization_status = AppTrackingTransparency.get_tracking_authorization_status()
	$Output.text += "Tracking Authorization Status: " + str(tracking_authorization_status) + "\n"
