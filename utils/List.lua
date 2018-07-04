local class = require "libs.middleclass"

local List = class("List")

function List:initialize()
    self.list = {}
end

function List:add(obj, id)
    table.insert(self.list, {object = obj, id = id})
end

function List:remove(id)
    for i = 1, #self.list do
        if self.list[i].id == id then
            return self.list[i].object
        end
    end
end

function List:forEach(callback)
    for i = 1, #self.list do
        callback(self.list[i].object, i)
    end
end

function List:clear()
    self.list = {}
end

return List
