local Level1 = require("scripts/levels/level1")
local Level2 = require("scripts/levels/level1")

local Game = {
	currentIndex = 0
}

local Levels = {Level1, Level2}

function Game.load()
	for i, level in ipairs(Levels) do
		level.load()
	end
end

function Game.switch(index)
	Game.currentIndex = index
end

function Game.draw()
	Levels[Game.currentIndex].draw()
end

function Game.mousepressed(x, y, button)
	Levels[Game.currentIndex].mousepressed(x, y, button)
end

return Game
