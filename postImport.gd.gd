@tool # Needed so it runs in editor.
extends EditorScenePostImport

# This sample changes all node names.
# Called right after the scene is imported and gets the root node.
func _post_import(scene):
	# Change all node names to "modified_[oldnodename]"
	iterate(scene)
	return scene # Remember to return the imported scene

func iterate(node:Node):
	if node != null:
		if node.name == "soundSource":
			print("adding node")
			var sound = AudioStreamPlayer3D.new()
			node.add_child(sound)
			print("children: " + str(node.get_child_count()) )
		node.name = "modified__" + node.name
		for child in node.get_children():
			iterate(child)
