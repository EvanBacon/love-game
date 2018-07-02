local EventEmitter = {}
EventEmitter.__index = function(self, key)
    return EventEmitter[key] or (function()
            local t = {}
            rawset(self, key, t)
            return t
        end)()
end
function EventEmitter:addListener(s, f)
    self[s][f] = f
    return f
end
function EventEmitter:emit(s, ...)
    for f in pairs(self[s]) do
        f(...)
    end
end
function EventEmitter:removeListener(s, ...)
    local f = {...}
    for i = 1, select("#", ...) do
        self[s][f[i]] = nil
    end
end
function EventEmitter:clear(...)
    local s = {...}
    for i = 1, select("#", ...) do
        self[s[i]] = {}
    end
end
function EventEmitter.new()
    return setmetatable({}, EventEmitter)
end
local default = EventEmitter.new()

local module = {}
for k in pairs(EventEmitter) do
    if k ~= "__index" then
        module[k] = function(...)
            return default[k](default, ...)
        end
    end
end

return setmetatable(module, {__call = EventEmitter.new})
