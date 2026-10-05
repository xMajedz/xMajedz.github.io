package background

import "core:sys/wasm/js"
import gl "vendor:wasm/WebGL"

CANVAS_ID :: "canvas"

updateCanvasSize :: proc()
{
    rect := js.get_bounding_client_rect(CANVAS_ID)
    dpi := js.device_pixel_ratio()

    width := f64(rect.width) * dpi
    height := f64(rect.height) * dpi

    js.set_element_key_f64(CANVAS_ID, "width", width)
    js.set_element_key_f64(CANVAS_ID, "height", height)

    gl.Viewport(0, 0, i32(width), i32(height))
}

resizeCallback :: proc(e: js.Event)
{
    updateCanvasSize()
}

main :: proc()
{
    js.add_window_event_listener(.Resize, nil, resizeCallback)

    gl.CreateCurrentContextById(CANVAS_ID, gl.DEFAULT_CONTEXT_ATTRIBUTES)
    gl.SetCurrentContextById(CANVAS_ID)
}

@export
step :: proc(dt: f32) -> (next: bool = true)
{
    gl.ClearColor(0.0, 0.0, 0.0, 1.0)
    gl.Clear(u32(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT))

    return;
}