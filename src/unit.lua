unit =
{
	towers = {}
}

local data = {}
function unit.parse_data()

	local header = ''

	for str in love.filesystem.lines( 'data/towers.json' ) do

		--Iterate through line to locate markers
		local offsets = {}
		for i = 1, #str do
			local char = str:sub( i, i )
			if ( char == '"' ) then
				table.insert( offsets, i )
			end
		end

		--Reconstruct and record data
		if ( offsets[1] ~= nil ) then

			local key = string.sub( str, offsets[1] + 1, offsets[2] - 1 )
			local value = string.sub( str, offsets[3] + 1, offsets[4] - 1 )

			if ( key == 'name' ) then
				header = value
				data[header] = {}
			else
				data[header][key] = value
			end
		end
	end
end

function unit.create( name )

	if (data[name] == nil) then print('"' .. name .. '" does not exist') return end

	local obj =
	{
		name        = name,
		description = data[name]['description'],
		cost        = data[name]['cost'],
		--TODO: weapon = separate class that handles projectiles or aoe attacks and upgrades

		init = function(self)
			table.insert(unit.towers, self)
		end
	}

	obj:init()
	return obj
end

function unit.findall()

	print('Found ' .. #unit.towers .. ' Unit(s)')

	for i = 1, #unit.towers do
		if (unit.towers[i] ~= nil) then
			print('-> ' .. unit.towers[i].name)
		end
	end

	print()
end