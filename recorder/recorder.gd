
extends Control

export var initial_position = Vector2(0, 0)
export var final_position = Vector2(0, 0)
export var speed = 1

const CAMERA_THRESHOLD = 1

var camera

func _ready():
    self.camera = self.get_node('viewport/camera')
    self.set_process(true)
    self.camera.set_offset(self.initial_position)

func _process(delta):
    var delta_x
    var delta_y
    var new_position
    var position = self.camera.get_offset()

    delta_x = abs(self.final_position.x - position.x)
    delta_y = abs(self.final_position.y - position.x)

    print(delta_x, delta_y)

    if delta_x < self.CAMERA_THRESHOLD and delta_y < self.CAMERA_THRESHOLD:
        return

    new_position = position + Vector2(self.speed, self.speed) * delta

    self.camera.set_offset(new_position)
