unit = { towers = {} }

local data = {}
function unit.parseData()
	local header = ""
	for str in love.filesystem.lines( "resources/data/towers.json" ) do

		--Iterate through line to locate markers
		local offsets = {}
		for i = 1, #str do
			local char = str:sub(i, i)
			if char == '"' then
				table.insert(offsets, i)
			end
		end

		--Reconstruct and record data
		if offsets[1] ~= nil then

			local key = str:sub(offsets[1] + 1, offsets[2] - 1)
			local value = str:sub(offsets[3] + 1, offsets[4] - 1)

			if key == "name" then
				header = value
				data[header] = {}
			else
				data[header][key] = value
			end
		end
	end
end

function unit.create(name)
	if data[name] == nil then print('"' .. name .. '" does not exist') return end
	local obj =
	{
		name        = name,
		description = data[name]["description"],
		cost        = data[name]["cost"],
		--TODO: weapon = separate class that handles projectiles or aoe attacks and upgrades

		init = function(self)
			table.insert(unit.towers, self)
		end
	}

	obj:init()
	return obj
end

function unit.findAll()
	local count = #unit.towers
	print("Found " .. count .. " Towers(s)")
	for i = 1, count do print("-> " .. unit.towers[i].name) end
	print()
end