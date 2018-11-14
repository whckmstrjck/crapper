require('utils.palette')
local forceIntegerScaling = true

local desktopResX, desktopResY = love.window.getDesktopDimensions()
local localResX = 320
local localResY = 180

local scaleX = forceIntegerScaling == true and math.floor(desktopResX / localResX) or desktopResX / localResX
local scaleY = forceIntegerScaling == true and math.floor(desktopResY / localResY) or desktopResY / localResY
local desiredScale = scaleX < scaleY and scaleX or scaleY

local scaledResX = localResX * desiredScale
local scaledResY = localResY * desiredScale

local offsetX = (desktopResX - scaledResX) / 2
local offsetY = (desktopResY - scaledResY) / 2

player = {
	id = 'PLAYER',
	x = 10,
	xi = 10, 
	y = 10,
	yi = 10,
	speed = 32,
	img = nil,
	palette = 'DEFAULT'
}

function love.load(arg)
	love.window.setFullscreen(true)
	love.graphics.setDefaultFilter('nearest', 'nearest', 0)
	
	player.img = love.image.newImageData('assets/plonk-1.png')
	Palette:setPal(player, 'P_DEFAULT')
end

function love.update(dt)
		if love.keyboard.isDown('left','a') then
			player.x = player.x - player.speed*dt
		elseif love.keyboard.isDown('right','d') then
			player.x = player.x + player.speed*dt
		elseif love.keyboard.isDown('up','w') then
			player.y = player.y - player.speed*dt
		elseif love.keyboard.isDown('down','s') then
			player.y = player.y + player.speed*dt
		end

	player.xi = math.floor(player.x) ~= player.xi and math.floor(player.x) or player.xi
	player.yi = math.floor(player.y) ~= player.yi and math.floor(player.y) or player.yi

	
end

function love.draw(dt)
	love.graphics.setScissor(offsetX, offsetY, scaledResX, scaledResY)
	love.graphics.translate(offsetX, offsetY)
	love.graphics.scale(desiredScale, desiredScale)
	love.graphics.setBackgroundColor(.2, .2, .2)

	love.graphics.draw(love.graphics.newImage(player.img), player.xi, player.yi)
	love.graphics.print('fps: '..love.timer.getFPS(), 5, 160)
end