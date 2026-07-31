local MainMenu = require("scripts.mainmenu")
local LevelSelect = require("scripts.levelselect")
local Game = require("scripts.game")

local GameManager = {
	current = nil
}

MainMenu.manager = GameManager
MainMenu.levelSelect = LevelSelect
LevelSelect.manager = GameManager
LevelSelect.game = Game
Game.manager = GameManager


function GameManager.load()
	MainMenu.load()
	LevelSelect.load()
	Game.load()
	GameManager.current = MainMenu
end

function GameManager.switch(screen)
	GameManager.current = screen
end

function GameManager.startLevel(index)
	Game.currentIndex = index
end

function GameManager.draw()
	GameManager.current.draw()
end

function GameManager.mousepressed(x, y, button)
	GameManager.current.mousepressed(x, y, button)
end

return GameManager
