extends Node2D

onready var start_position1: Vector2 = Vector2($Group1/Character_LayerSet_MaskUnset.position.x, $Group1/Character_LayerSet_MaskUnset.position.y)
onready var start_position2: Vector2 = Vector2($Group2/Character_LayerUnset_MaskSet.position.x, $Group2/Character_LayerUnset_MaskSet.position.y)

func _on_DetectionTimer1_timeout():
	var new_position: Vector2 = Vector2(start_position1.x + 64, start_position1.y)
	$Group1/Tween.interpolate_property($Group1/Character_LayerSet_MaskUnset,
			"position", start_position1, new_position, 0.5,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Group1/Tween.start()
	yield($Group1/Tween, "tween_all_completed")
	$Group1/Tween.interpolate_property($Group1/Character_LayerSet_MaskUnset,
			"position", new_position, start_position1, 0.5,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Group1/Tween.start()
	yield($Group1/Tween, "tween_all_completed")


func _on_Detector1_body_entered(body: Node2D):
	print("detector area Blue entered: ", body.name)

func _on_DetectionTimer2_timeout():
	var new_position: Vector2 = Vector2(start_position2.x + 64, start_position1.y)
	$Group2/Tween.interpolate_property($Group2/Character_LayerUnset_MaskSet,
			"position", start_position2, new_position, 0.5,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Group2/Tween.start()
	yield($Group2/Tween, "tween_all_completed")
	$Group2/Tween.interpolate_property($Group2/Character_LayerUnset_MaskSet,
			"position", new_position, start_position2, 0.5,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Group2/Tween.start()
	yield($Group2/Tween, "tween_all_completed")


func _on_Detector2_body_entered(body: Node2D):
	print("detector area Red entered: ", body.name)
