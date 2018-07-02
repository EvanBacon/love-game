local function includeUtil(to, from, seen)
    if from == nil then
        return to
    elseif type(from) ~= "table" then
        return from
    elseif seen[from] then
        return seen[from]
    end

    seen[from] = to
    for k, v in pairs(from) do
        k = includeUtil({}, k, seen)
        if to[k] == nil then
            to[k] = includeUtil({}, v, seen)
        end
    end
    return to
end

local function clone(other)
    return setmetatable(include({}, other), getmetatable(other))
end
local function include(class, other)
    return includeUtil(class, other, {})
end
local function new(class)
    class = class or {}
    local inc = class._extends or {}
    if getmetatable(inc) then
        inc = {inc}
    end
    for _, other in ipairs(inc) do
        if type(other) == "string" then
            other = _G[other]
        end
        include(class, other)
    end
    class.__index = class
    class.constructor = class.constructor or class[1] or function()
        end
    class.include = class.include or include
    class.clone = class.clone or clone
    return setmetatable(
        class,
        {
            __call = function(c, ...)
                local o = setmetatable({}, c)
                o:constructor(...)
                return o
            end
        }
    )
end
if class_commons ~= false and not common then
    common = {}
    function common.class(name, prototype, parent)
        return new {_extends = {prototype, parent}}
    end
    function common.instance(class, ...)
        return class(...)
    end
end
return setmetatable(
    {new = new, include = include, clone = clone},
    {
        __call = function(_, ...)
            return new(...)
        end
    }
)
