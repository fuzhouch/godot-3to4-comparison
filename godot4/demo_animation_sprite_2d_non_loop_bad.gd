extends Node2D

func _ready() -> void:
    pass

func _process(delta: float) -> void:
    $AnimatedSprite2D.play("collected")
