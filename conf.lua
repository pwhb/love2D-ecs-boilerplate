local C = require("src.consts")

function love.conf(t)
    t.title = "Game Made In Love"
    t.window.width = C.SCREEN_WIDTH
    t.window.height = C.SCREEN_HEIGHT
    t.window.resizable = true
    -- t.window.fullscreen = true
    t.console = true
end
