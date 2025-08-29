class_name sceneManagerClass extends Node

onready var gui = $GUI

export(Array, PackedScene) var GUIPackedScenes
var storedScenes : Dictionary

# doubles as the start index
var currentGUIsceneIndex = 1

func _ready() -> void:
	Global.sceneManager = self

	# store controls into storedScenes
	for i in range(GUIPackedScenes.size()):
		var loadedScene = GUIPackedScenes[i].instance()
		storedScenes[i] = loadedScene
	gui.add_child(storedScenes[currentGUIsceneIndex])

func GUIsceneTransition(newSceneIndex: int, delete :bool = true, keep_running:bool = false):
	if newSceneIndex < 0 || newSceneIndex >= GUIPackedScenes.size():
		return
	if delete:
		# memory is removed
		# reset scene to initial state and move to scene array
		storedScenes[currentGUIsceneIndex].queue_free()
		storedScenes[currentGUIsceneIndex] = GUIPackedScenes[currentGUIsceneIndex].instance()
		
	elif keep_running:
		# hides scene
		# does not remove scene from gui
		storedScenes[currentGUIsceneIndex].visible = false
		
	else:
		# removes scene from gui
		# memory is kept
		gui.remove_child(storedScenes[currentGUIsceneIndex])
	
	gui.add_child(storedScenes[newSceneIndex])
	storedScenes[newSceneIndex].visible = true
	currentGUIsceneIndex = newSceneIndex
		

