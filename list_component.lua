local component = require("component")

local comps = component.list()

for adress, name in pairs(comps) do
  print(name, adress)
end
