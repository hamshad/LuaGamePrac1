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
  local ax, ay = 0, 0

  if love.keyboard.isDown("d") then
    ax = ax + accel
  end

  if love.keyboard.isDown("a") then
    ax = ax - accel
  end

  if love.keyboard.isDown("w") then
    ay = ay - accel
  end

  if love.keyboard.isDown("s") then
    ay = ay + accel
  end

  -- Apply acceleration
  circle.vx = circle.vx + ax * dt
  circle.vy = circle.vy + ay * dt

  -- Apply friction
  circle.vx = circle.vx * (1 - friction * dt)
  circle.vy = circle.vy * (1 - friction * dt)

  -- Move
  circle.x = circle.x + circle.vx * dt
  circle.y = circle.y + circle.vy * dt
end

function love.draw()
  love.graphics.circle('fill', circle.x, circle.y, circle.radius)

  love.graphics.setBackgroundColor(0, 0.24, 0.1)
end
