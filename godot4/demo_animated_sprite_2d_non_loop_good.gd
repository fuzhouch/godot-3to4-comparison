extends Node2D

func _ready() -> void:
    $AnimatedSprite2D.play("collected")

func _process(delta: float) -> void:
    pass
