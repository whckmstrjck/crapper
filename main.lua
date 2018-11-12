local desktopResX, desktopResY = love.window.getDesktopDimensions()
local localResX = 320
local localResY = 180
local integerX = math.floor(desktopResX / localResX)
local integerY = math.floor(desktopResY / localResY)

local desiredScale = integerX < integerY and integerX or integerY
local scaledResX = localResX * desiredScale
local scaledResY = localResY * desiredScale

local offsetX = (desktopResX - scaledResX) / 2
local offsetY = (desktopResY - scaledResY) / 2

function love.load(arg)
	love.window.setFullscreen(true)
    love.graphics.setDefaultFilter('nearest', 'nearest', 0)
	playerImg = love.graphics.newImage('assets/lonk-1.png')
end

function love.update(dt)
end

function love.draw(dt)
	love.graphics.setScissor(offsetX, offsetY, scaledResX, scaledResY)
	love.graphics.translate(offsetX, offsetY)
	love.graphics.scale(desiredScale, desiredScale)

	love.graphics.setBackgroundColor(.2, .2, .2)
    love.graphics.draw(playerImg, 0, 0)
    love.graphics.draw(playerImg, 100, 100)
    love.graphics.draw(playerImg, 320 - 16, 180 - 16)
end