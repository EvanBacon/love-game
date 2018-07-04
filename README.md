# love-game

Playing with löve2d stuff

## Style

### General

1.  No using `_G` for globals. ex: ✅ `local love = love` ❌ `local love = _G.love`
2.  Declare globals locally at the top of the file. ex: `local love = love`
3.  Single quotes. `lua.format.singleQuote: true`
4.  Camel case naming for variables. ex: ✅ `local sofaKing = {}` ❌ `local sofaking = {}`
5.  Classes start with a capital letter. ex: ✅ `local Player = class('Player')` ❌ `local player = class('player')`

### Imports:

1.  Imports should be defined as `local` from a file that returns one module.
2.  Single quotes
3.  No semi
4.  No global
5.  No parentheses
6.  Use slashes `/` instead of dots `.`

```lua
✅
local uuid = require 'utils/uuid'
❌
uuid = require("utils.uuid");
❌
local uuid, anotherThing = require("utils.uuid");
```

## SpriteCore

- `Node` the base object used for drawing other child Nodes
- `Sprite` extends `Node` and adds physics, animation
- `Scene` extends `Node` and adds debug physics
- `Game` references a `Scene`, `Camera`, `world` (physics world), and bubbles events to the scene.

The base node must call `fullDraw` which is an alias for `preDraw`, `draw`, `postDraw`

When the draw function is called, each node will bubble that event to it's children.
In order to have the parent influence the scale, position, rotation of it's children, a `preDraw` and `postDraw` method is called.
`preDraw` pushes a new drawing matrix and applies the nodes position, scale, rotation(todo).
`postDraw` pops the drawing matrix.

### Making something

If you want to make something like a player, you would extend the `Sprite` node.

```lua
local Player = class('Player')
function Player:initialize(props)
    props = props or {}
    Sprite.initialize(self, props)
end
return Player

...

local player = Player{
    x = 0,
    y = 0,
    width = 10,
    height = 20
}
parent:addChild(player)
```

You could also just override the `draw` method.

```lua
function Player:draw(dt)
    love.graphics.drawRectangle('line', 0, 0, self.width, self.height)
end
```

## Libs

Some of the libs I've been using and like

### anim8

Used for creating sprite animations - this is part of `Sprite.lua`

### json

Used for parsing json

### middleclass

OOP stuff, pretty good
