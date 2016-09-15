
extends Control

export var initial_position = Vector2(0, 0)
export var final_position = Vector2(0, 0)
export var speed_x = 1
export var speed_y = 1
export var ease_off = false
export var ease_mod = 1
export var autostart = true

const CAMERA_THRESHOLD = 1

var camera

func _ready():
    self.camera = self.get_node('viewport/camera')
    self.camera.set_offset(self.initial_position)
    if self.autostart:
        self.set_process(true)
    self.set_process_input(true)

func _input(event):
    if event.type == InputEvent.KEY:
        self.set_process(true)

func _process(delta):
    var delta_x
    var delta_y
    var new_position
    var diff_x
    var diff_y
    var position = self.camera.get_offset()
    var movement_diff_x
    var movement_diff_y

    delta_x = self.final_position.x - position.x
    delta_y = self.final_position.y - position.x
    diff_x = abs(delta_x)
    diff_y = abs(delta_y)

    print(delta_x, delta_y)

    if diff_x < self.CAMERA_THRESHOLD and diff_y < self.CAMERA_THRESHOLD:
        return

    movement_diff_x = self.speed_x * delta
    movement_diff_y = self.speed_y * delta
    if self.ease_off:
        delta_x = delta_x * delta * self.ease_mod
        if abs(delta_x) > abs(movement_diff_x):
            delta_x = movement_diff_x
        delta_y = delta_y * delta * self.ease_mod
        if abs(delta_y) > abs(movement_diff_y):
            delta_y = movement_diff_y
        new_position = position + Vector2(delta_x, delta_y)
    else:
        new_position = position + Vector2(movement_diff_x, movement_diff_y)

    self.camera.set_offset(new_position)
