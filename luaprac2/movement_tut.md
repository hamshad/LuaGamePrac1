Excellent question. This is one of those moments where game programming starts feeling like physics instead of just moving pixels.

Let's think like Richard Feynman would. Instead of memorizing code, let's ask:

> **What is actually happening to the object?**

Imagine your circle is not a game object.

It's a **hockey puck on ice**.

When you press **D**, are you telling the puck:

> "Move right."

No.

You're saying:

> **"Push yourself to the right."**

That push is called **acceleration**.

The puck doesn't instantly move at full speed. It speeds up gradually.

Then when you stop pushing, the puck doesn't instantly stop. It keeps sliding.

Something has to slow it down.

That's **friction**.

---

## Step 1: Position

Right now you only have:

```lua
circle.x
circle.y
```

This answers:

> **"Where is the circle?"**

---

## Step 2: Velocity

Now add

```lua
circle.vx = 0
circle.vy = 0
```

Velocity answers a different question:

> **"How fast and in what direction is it already moving?"**

Think of velocity as **momentum**.

Even if you stop pressing keys...

the velocity still exists.

---

## Step 3: Acceleration

Now imagine pressing D.

You are **not** moving the circle.

You are changing its velocity.

```
Keyboard
     ↓
Acceleration
     ↓
Velocity
     ↓
Position
```

This chain is the whole idea.

---

Suppose

```lua
local accel = 500
```

If D is held:

```lua
circle.vx = circle.vx + accel * dt
```

Notice something important.

We are **not touching x.**

We're only increasing velocity.

---

## What happens after one frame?

Initially

```
vx = 0
```

After

```
0.016 seconds
```

(about 60 FPS)

```
vx = 8
```

Next frame

```
vx = 16
```

Next

```
vx = 24
```

The speed keeps increasing.

Just like holding the gas pedal.

---

## Step 4: Velocity moves position

Now velocity finally affects position.

```lua
circle.x = circle.x + circle.vx * dt
circle.y = circle.y + circle.vy * dt
```

Notice the separation.

Keyboard never changes position.

Keyboard changes acceleration.

Acceleration changes velocity.

Velocity changes position.

That's exactly how nature works.

---

## Step 5: But now the puck never stops...

If you release D,

```
vx = 250
```

Nothing changes it anymore.

So it keeps moving forever.

That's Newton's First Law.

genui{"physics_motion_forces_learning_block":{"type_id":"NEWTON_FIRST_LAW"}}

This is actually correct physics in space.

Games usually don't want that.

So we invent friction.

---

# Step 6: Friction

Think of friction as someone constantly pulling backward.

Every frame:

```lua
local friction = 8

circle.vx = circle.vx * (1 - friction * dt)
circle.vy = circle.vy * (1 - friction * dt)
```

What happens?

Suppose

```
vx = 200
```

Next frame

```
197
```

Then

```
194
```

Then

```
191
```

Eventually

```
0
```

So when you release the key,

the player smoothly glides to a stop.

---

# Putting it together

The update loop becomes

```lua
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
```

Read it like a story:

```
Player presses key
        ↓
Acceleration changes
        ↓
Velocity changes
        ↓
Friction reduces velocity
        ↓
Velocity moves position
```

---

## Why most beginners get confused

Most tutorials jump straight to code.

But there are actually **three separate things** living inside every moving object.

Imagine driving a car.

### Position

"Where is the car?"

```
x = 120
```

---

### Velocity

"How fast is the car already moving?"

```
60 km/h
```

Even with your foot off the pedal, the answer isn't zero.

---

### Acceleration

"How hard are you pressing the gas?"

```
0
```

or

```
+5 m/s²
```

Acceleration is **not movement**.

It's the thing that changes movement.

A nice way to remember it is:

* **Position** → Where am I?
* **Velocity** → How fast am I moving?
* **Acceleration** → How quickly is my speed changing?

Once this "chain of influence" clicks—

**Input → Acceleration → Velocity → Position**

—you'll recognize it everywhere in game development: player movement, cars, projectiles, enemies, camera smoothing, and even UI animations.
