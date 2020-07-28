local js = require "js"
local window = js.global
local document = window.document
local execute = document:getElementById("execute")
local stop = document:getElementById("stop")
local code =  ""
local function run()
    code = document:getElementById("textarea").value
    local hexchar = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
            "a", "b", "c", "d", "e", "f", "A", "B", "C", "D", "E", "F", "-"}
    local luacode = [[
    local i, clipboard, c = 0, 0, {}
    local window = js.global
    local document = window.document
    local output = document:getElementById("output")
    output.value = ""
    local function hex2int(str)
        return tonumber(str, 16)
    end

    local function jump(v)
        i = hex2int(v)
    end
    local function right()
        i = i+1
    end
    local function left()
        i = i-1
    end
    local function add()
        c[i] = (c[i] or 0) + 1
    end
    local function sub()
        c[i] = (c[i] or 0) - 1
    end
    local function set(v)
        c[i] = hex2int(v)
    end
    local function clear()
        c[i] = 0
    end
    local function outputInt()
        output.value = output.value .. (c[i] or 0)
    end
    local function outputChar()
        output.value = output.value .. string.char(c[i] or 0)
    end
    local function input()
        local a = window:prompt("Please, enter input char")
        c[i] = string.byte(a)-- or 0
    end
    local function copy()
        clipboard = c[i] or 0
    end
    local function paste()
        c[i] = clipboard or 0
    end
    -- The code starts here:

    ]]

    local function getHex(index)
        local hex = ""
        local isHex = true
        local n = 1
        while isHex do
            isHex = false
            local c = code:sub(index+n, index+n)
            for i=0, #hexchar do
                if hexchar[i] == c then
                    isHex = true
                    hex = hex .. c
                end
            end
            n = n + 1
        end
        if #hex == 0 then
            hex = "0"
        elseif #hex == 1 then
            if hex == "-" then
                hex = "0"
            end
        end
        return hex
    end

    local isComment = false
    local char = 1
    while char <= #code do
        local val = code:sub(char, char)
        if not isComment then
            if val == "$" then
                local hex = getHex(char)
                char = char + #hex
                luacode = luacode .. " jump([[" .. hex .. "]])"
            elseif val == ">" then luacode = luacode .. " right()"
            elseif val == "<" then luacode = luacode .. " left()"
            elseif val == "+" then luacode = luacode .. " add()"
            elseif val == "-" then luacode = luacode .. " sub()"
            elseif val == "#" then
                local hex = getHex(char)
                char = char + #hex
                luacode = luacode .. " set([[" .. hex .. "]])"
            elseif val == "?" then luacode = luacode .. " copy()"
            elseif val == "=" then luacode = luacode .. " paste()"
            elseif val == "*" then luacode = luacode .. " clear()"
            elseif val == "." then luacode = luacode .. " outputInt()"
            elseif val == "!" then luacode = luacode .. " outputChar()"
            elseif val == "@" then luacode = luacode .. " input()"
            elseif val == "[" then luacode = luacode .. " while (c[i] or 0) ~= 0 do"
            elseif val == "{" then luacode = luacode .. " for _=1, (c[i] or 0) do"
            elseif val == "(" then luacode = luacode .. " if (c[i] or 0) == clipboard then"
            elseif val == ")" or val == "]" or val == "}" then luacode = luacode .. " end"
            elseif val == "/" then isComment = true
            end
        elseif val == "\n" then isComment = false
        end
        char = char + 1
    end
    local exe
    if loadstring then
        exe = loadstring(luacode)
    else
        exe = load(luacode)
    end
    if exe then exe() end
end

execute:addEventListener("click", run, false)