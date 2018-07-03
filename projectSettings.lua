local json = require "libs.json"

function parseConfig()
    local filename = "config.json"
    local s = readAll(filename)
    local config = json.decode(s)
    return config
end

function readAll(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end

return parseConfig
