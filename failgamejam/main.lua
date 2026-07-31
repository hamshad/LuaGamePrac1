local GameManager = require("scripts.gamemanager")

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.window.setMode(1280, 720, {
		resizable = true,
		minwidth = 640,
		minheight = 360
	})
	GameManager.load()
end

function love.draw()
	GameManager.draw()
end

function love.mousepressed(x, y, button)
	GameManager.mousepressed(x, y, button)
end
