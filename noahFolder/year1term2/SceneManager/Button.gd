extends Button


export var is_delete :bool
export var is_keep_running: bool
export var sceneIndex: int


func _on_Button_pressed():
	Global.sceneManager.GUIsceneTransition(sceneIndex, is_delete, is_keep_running)
