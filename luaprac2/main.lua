local WIDTH = 640
local HEIGHT = 360

local circle = {
  x = WIDTH / 2,
  y = HEIGHT / 2,
  vx = 0,
  vy = 0,
  radius = 40
}

function love.load()
  love.window.setMode(WIDTH, HEIGHT, {
    resizable = true
  })
end

function love.update(dt)
  local accel = 2600
  local friction = 5
  local dx, dy = 0, 0

  if love.keyboard.isDown("d") then
    dx = dx + 1
  end

  if love.keyboard.isDown("a") then
    dx = dx - 1
  end

  if love.keyboard.isDown("w") then
    dy = dy - 1
  end

  if love.keyboard.isDown("s") then
    dy = dy + 1
  end

  if love.keyboard.isDown("j") then
    accel = 15000
  else
    accel = 2600
  end

  if love.keyboard.isDown("k") then
    friction = 15
  else
    friction = 5
  end

  -- Normalize
  local length = math.sqrt(dx * dx + dy * dy)
  if length ~= 0 then dx, dy = dx / length, dy / length end

  -- Apply acceleration
  circle.vx = circle.vx + dx * accel * dt
  circle.vy = circle.vy + dy * accel * dt

  -- Apply friction
  circle.vx = circle.vx * (1 - friction * dt)
  circle.vy = circle.vy * (1 - friction * dt)

  -- Move
  circle.x = circle.x + circle.vx * dt
  circle.y = circle.y + circle.vy * dt
end

function love.draw()
  love.graphics.circle('fill', circle.x, circle.y, circle.radius)

  love.graphics.setBackgroundColor(0.08, 0.44, 1)
end
