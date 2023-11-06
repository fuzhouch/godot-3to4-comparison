extends Node2D

@onready var start_position1: Vector2 = Vector2($Group1/Character_LayerSet_MaskUnset.position.x, $Group1/Character_LayerSet_MaskUnset.position.y)
@onready var start_position2: Vector2 = Vector2($Group2/Character_LayerUnset_MaskSet.position.x, $Group2/Character_LayerUnset_MaskSet.position.y)

func _on_detection_timer1_timeout() -> void:
    var tween = get_tree().create_tween()
    var new_position: Vector2 = Vector2(start_position1.x + 64, start_position1.y)
    tween.tween_property($Group1/Character_LayerSet_MaskUnset, "position", new_position, 0.5)
    await tween.finished
    var tween2 = get_tree().create_tween()
    tween2.tween_property($Group1/Character_LayerSet_MaskUnset, "position", start_position1, 0.5)
    await tween2.finished


func _on_detector_body1_entered(body: Node2D) -> void:
    print("detector area Blue entered: ", body.name)


func _on_detection_timer2_timeout() -> void:
    var tween = get_tree().create_tween()
    var new_position: Vector2 = Vector2(start_position2.x + 64, start_position2.y)
    tween.tween_property($Group2/Character_LayerUnset_MaskSet, "position", new_position, 0.5)
    await tween.finished
    var tween2 = get_tree().create_tween()
    tween2.tween_property($Group2/Character_LayerUnset_MaskSet, "position", start_position2, 0.5)
    await tween2.finished


func _on_detector_body2_entered(body: Node2D) -> void:
    print("detector area Red entered: ", body.name)
