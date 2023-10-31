extends Node2D

const STATUS_DEFAULT: int   = 0
const STATUS_COLLECTED: int = 1
var action_status: int = STATUS_DEFAULT
var animation: Array = [ "default", "collected" ]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    $AnimatedSprite2D.play(animation[STATUS_DEFAULT])
    $SelfDestroyTimer.start()

# _process() is not needed.

func _on_self_destroy_timer_timeout() -> void:
    action_status = STATUS_COLLECTED
    $AnimatedSprite2D.play(animation[STATUS_COLLECTED])

func _on_animated_sprite_2d_animation_finished() -> void:
    if action_status == STATUS_COLLECTED:
        print("STATUS_COLLECTED animation played once - guaranteed")
        queue_free() # Call queue_free() when animation is finished.
    # In real game logic we use action_status to represent more complicated
    # status change, e.g., charge -> throw fireball -> backswing -> ...
