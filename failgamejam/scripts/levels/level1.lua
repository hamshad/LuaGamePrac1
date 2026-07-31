local Level1 = {}

local background

function Level1.load()
	background = love.graphics.newImage("assets/level1.png")
end

function Level1.draw()
	local ww, wh = love.graphics.getDimensions()
	local iw, ih = background:getDimensions()
	local scale = math.min(ww/iw,wh/ih)
	local x = (ww - iw * scale) / 2
	local y = (wh - ih * scale) / 2

	love.graphics.draw(background, x, y, 0, scale, scale)
	local ww, wh = love.graphics.getDimensions()
	local iw, ih = background:getDimensions()
	local scale = math.min(ww/iw,wh/ih)
	local x = (ww - iw * scale) / 2
	local y = (wh - ih * scale) / 2
end

function Level1.mousepressed(x, y, button)
end

return Level1
