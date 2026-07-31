local MainMenu = {}

local background

local playButton = {x = 0, y = 0, w = 100, h = 60}

function MainMenu.load()
	background = love.graphics.newImage("assets/mainmenu.png")
end

function MainMenu.draw()
	local ww, wh = love.graphics.getDimensions()
	local iw, ih = background:getDimensions()
	local scale = math.min(ww/iw,wh/ih)
	local x = (ww - iw * scale) / 2
	local y = (wh - ih * scale) / 2

	local font = love.graphics.newFont(math.ceil(0.1*wh))
	love.graphics.setFont(font)

	playButton = {x = 0.10*ww, y = 0.60*wh, w = 0.3*ww, h = 0.12*wh}

	quitButton = {x = 0.10*ww, y = 0.80*wh, w = 0.3*ww, h = 0.12*wh}

	love.graphics.draw(background, x, y, 0, scale, scale)

	love.graphics.setColor(0, 0.4, 0.4, 0.5)
	love.graphics.rectangle("fill", playButton.x, playButton.y,playButton.w,playButton.h)
	love.graphics.setColor(1,1,1,1)
	love.graphics.printf("Play", playButton.x, playButton.y + (playButton.h - font:getHeight()) / 2, playButton.w, "center")

	love.graphics.setColor(0, 0.4, 0.4, 0.5)
	love.graphics.rectangle("fill", quitButton.x, quitButton.y,quitButton.w,quitButton.h)
	love.graphics.setColor(1,1,1,1)
	love.graphics.printf("Quit", quitButton.x, quitButton.y + (quitButton.h - font:getHeight()) / 2, quitButton.w, "center")

end

function MainMenu.mousepressed(x, y, button)
	if x >= playButton.x and x <=playButton.x + playButton.w and y >= playButton.y and y <= playButton.y + playButton.h then
		MainMenu.manager.switch(MainMenu.levelSelect)
	end

	if x >= quitButton.x and x <=quitButton.x + quitButton.w and y >= quitButton.y and y <= quitButton.y + quitButton.h then
		love.event.quit()
	end
end

return MainMenu
