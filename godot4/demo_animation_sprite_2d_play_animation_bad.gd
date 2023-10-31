extends Node2D

const STATUS_DEFAULT: int = 0
const STATUS_COLLECTED: int = 1
var action_status: int = STATUS_DEFAULT
var animation: Array = [ "default", "collected"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    $SelfDestroyTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    $AnimatedSprite2D.play(animation[action_status])

func _on_self_destroy_timer_timeout() -> void:
    action_status = STATUS_COLLECTED

func _on_animated_sprite_2d_animation_finished() -> void:
    if action_status == STATUS_COLLECTED:
        print("STATUS_COLLECTED animation played once - can't be guranteed")
        queue_free() # Call queue_free() when animation is finished.
