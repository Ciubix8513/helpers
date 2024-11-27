local component = require("component")
local fs = require("filesystem")
local shell = require("shell")
local io = require("io")

local args, _ = shell.parse(...)

if #args == 0 then
  print("NO ARGS")
  return;
end

local path = shell.resolve(args[1])

if not fs.exists(path) then
  print("File does not exist!")
  return;
end

if fs.isDirectory(path) then
  print("File is a directory")
  return;
end

-- file exists reading it
local file = io.open(path, "r")
local f_content = file:read("*a")


component.eeprom.set(f_content)
component.eeprom.setLabel(fs.name(path))
