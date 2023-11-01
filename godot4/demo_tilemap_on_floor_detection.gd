extends Node2D

var print_msg: bool = false

func _physics_process(_delta: float) -> void:
    $Item_Is_On_Floor_Detector1.velocity.y += PhysicsServer2D.AREA_PARAM_GRAVITY

    var is_on_floor_before = $Item_Is_On_Floor_Detector1.is_on_floor()
    $Item_Is_On_Floor_Detector1.move_and_slide()
    var is_on_floor_after = $Item_Is_On_Floor_Detector1.is_on_floor()

    if print_msg:
        print("[before] Item_Is_On_Floor_Detector1.is_on_floor()?", is_on_floor_before)
        print("[after] Item_Is_On_Floor_Detector1.is_on_floor()?", is_on_floor_after)
        print_msg = false

func _on_print_frequency_control_timer_timeout() -> void:
    print_msg = true
