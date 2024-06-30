# example code from https://docs.godotengine.org/en/stable/classes/class_editorscenepostimport.html

@tool # Needed so it runs in editor.
extends EditorScenePostImport

# This sample changes all node names.
# Called right after the scene is imported and gets the root node.
func _post_import(scene):
	# Change all node names to "modified_[oldnodename]"
	iterate(scene, scene)
	return scene # Remember to return the imported scene

func iterate(node:Node, owner:Node):
	if node != null:
		# this has been added
		if node.name == "soundSource":
			print("adding node")
			var sound = AudioStreamPlayer3D.new()
			node.add_child(sound)
			sound.set_owner(owner)
			print("children: " + str(node.get_child_count()) )
			print("owner: " + str(sound.owner))
			print("parent: " + str(sound.get_parent()))
		node.name = "modified__" + node.name
		for child in node.get_children():
			iterate(child, owner)
