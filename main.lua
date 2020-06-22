local filePath = ({...})[1]
local file = io.open(filePath,"r")
local code = ""
if file then
    code = file:read("*all")
else
    print("Unable to open "..filePath)
end

local function hex2int(str)
    return tonumber(str, 16)
end
local luacode = [[
local M = 65535
local i, clipboard, c = 0, 0, {}

local function clamp(n, min , max)
    if n < min then
        n = max - math.abs(n)
    elseif n > max then
        n = min + (max-math.abs(n))
    end
    return n
end
local function jump(v)
    i = clamp(v, 0, M)
end
local function right()
    i = clamp(i+1, 0, M)
end
local function left()
    i = clamp(i-1, 0, M)
end
local function add()
    c[i] = (c[i] or 0) + 1
end
local function sub()
    c[i] = (c[i] or 0) - 1
end
local function set(v)
    c[i] = v
end
local function clear()
    c[i] = 0
end
local function outputInt()
    io.write(c[i] or 0)
end
local function outputChar()
    io.write(string.char(c[i] or 0))
end
local function input()
    c[i] = io.read():byte()
end
local function copy()
    clipboard = c[i] or 0
end
local function paste()
    c[i] = clipboard or 0
end
-- The code starts here:

]]
local isComment = false
for char=1, #code do
    local val = code:sub(char, char)
    if not isComment then
        if val == "$" then luacode = luacode .. " jump(" .. hex2int(code:sub(char+1, char+4)) .. ")"
        elseif val == ">" then luacode = luacode .. " right()"
        elseif val == "<" then luacode = luacode .. " left()"
        elseif val == "+" then luacode = luacode .. " add()"
        elseif val == "-" then luacode = luacode .. " sub()"
        elseif val == "#" then luacode = luacode .. " set(" .. hex2int(code:sub(char+1, char+2)) .. ")"
        elseif val == "?" then luacode = luacode .. " copy()"
        elseif val == "=" then luacode = luacode .. " paste()"
        elseif val == "*" then luacode = luacode .. " clear()"
        elseif val == "." then luacode = luacode .. " outputInt()"
        elseif val == "!" then luacode = luacode .. " outputChar()"
        elseif val == "@" then luacode = luacode .. " input()"
        elseif val == "[" then luacode = luacode .. " while (c[i] or 0) ~= 0 do"
        elseif val == "{" then luacode = luacode .. " for _=1, (c[i] or 0) do"
        elseif val == "(" then luacode = luacode .. " if (c[i] or 0) ~= 0 then"
        elseif val == ")" or val == "]" or val == "}" then luacode = luacode .. " end"
        elseif val == "/" then isComment = true
        end
    elseif val == "\n" then isComment = false
    end
end

local exe = loadstring(luacode)
if exe then exe() end
