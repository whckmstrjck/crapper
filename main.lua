debug = true

function love.load(arg)
    love.window.setFullscreen(true, "desktop")
end

function love.update(dt)

end

function love.draw(dt)
    love.graphics.print("Hello World", 400, 300)
end