# love-game

Playing with löve2d stuff

## Style

### General

1.  No using `_G` for globals. ex: ✅ `local love = love` ❌ `local love = _G.love`
2.  Declare globals locally at the top of the file. ex: `local love = love`
3.  Single quotes
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

## Libs

Some of the libs I've been using and like

### anim8

Used for creating sprite animations - this is part of `Sprite.lua`

### json

Used for parsing json

### middleclass

OOP stuff, pretty good
