extends Node2D

var print_msg: bool = false

const GRAVITY: int = 50
var item_velocity: Vector2 = Vector2(0, 0)

func _physics_process(_delta: float) -> void:
    item_velocity.y = GRAVITY

    var is_on_floor_before = $Item_Is_On_Floor_Detector1.is_on_floor()
    item_velocity = $Item_Is_On_Floor_Detector1.move_and_slide(item_velocity, Vector2.UP)
    var is_on_floor_after = $Item_Is_On_Floor_Detector1.is_on_floor()

    if print_msg:
        print("[before] Item_Is_On_Floor_Detector1.is_on_floor()?", is_on_floor_before)
        print("[after] Item_Is_On_Floor_Detector1.is_on_floor()?", is_on_floor_after)
        print_msg = false

func _on_PrintFrequencyControlTimer_timeout() -> void:
    print_msg = true
