local Palette = require 'utils.Palette'

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
	pal = 'DEFAULT',
	x = 10,
	xi = 10, 
	y = 10,
	yi = 10,
	speed = 32,
	img = nil
}

function player.setPal(pal)
	player.img = love.image.newImageData('assets/plonk-1.png')
	player.pal = pal
	Palette:processPal(player)
end


--
function love.load(arg)
	love.window.setFullscreen(true)
	love.graphics.setDefaultFilter('nearest', 'nearest', 0)
	
	player.setPal('DEFAULT')
end

function love.update(dt)
	if love.keyboard.isDown('1') then
		player.setPal('DEFAULT')
	end
	if love.keyboard.isDown('2') then
		player.setPal('CRAPPY')
	end
	if love.keyboard.isDown('3') then
		player.setPal('BUNGY')
	end

		if love.keyboard.isDown('left') then
			player.x = player.x - player.speed*dt
		end
		if love.keyboard.isDown('right') then
			player.x = player.x + player.speed*dt
		end
		if love.keyboard.isDown('up') then
			player.y = player.y - player.speed*dt
		end
		if love.keyboard.isDown('down') then
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