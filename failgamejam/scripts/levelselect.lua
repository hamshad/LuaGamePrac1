local LevelSelect = {}

local levels = {}
local ww, wh
local font

function LevelSelect.load()
	ww, wh = love.graphics.getDimensions()
	font = love.graphics.newFont(math.ceil(0.050*wh))
	for i = 1, 5 do
		table.insert(levels, {
			x = 100 + (i - 1) * (0.175*ww),
			y = (wh - 100) / 2,
			w = 200,
			h = 100,
			name = "Level " .. i
			})
	end
end

function LevelSelect.draw()

	love.graphics.setBackgroundColor(0.2, 0.5, 0.1)


	love.graphics.setFont(font)

	for _, level in ipairs(levels) do
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("fill", level.x, level.y, level.w, level.h)
		love.graphics.setColor(1,1,1,1)
		love.graphics.printf(level.name, level.x, level.y + (level.h - font:getHeight()) / 2, level.w, "center")
	end
end

function LevelSelect.mousepressed(x, y, button)
	for i, level in ipairs(levels) do
		if x >= level.x and x <= level.x + level.w and y >= level.y and y <= level.y + level.h then
			print("Start " .. level.name)
			LevelSelect.manager.current = LevelSelect.game
			LevelSelect.manager.startLevel(i)
		end
	end
end

return LevelSelect
