--[[ NOTES:
-> Bloons map is a 16-12 grid
-> Multiply half of width by tile_size to get offset from left side
-> Shouldn't have a tile_size variable. I will manage this separately once I create a tileset
--]]

map =
{
	tiles = {},
	tile_size = 256,
	width = 4,
	height = 3
}

function map.create()
	--NOTE: Storing these values in a display-related class seems significantly better
	local width, height = love.window.getMode()
	local center =
	{
		x = width * 0.5,
		y = height * 0.5
	}

	for x = 1, map.width do
		map.tiles[x] = {}

		for y = 1, map.height do
			map.tiles[x][y] =
			{
				x = (map.width * 0.5 - x) * map.tile_size + center.x,
				y = (map.height * 0.5 - y) * map.tile_size + center.y,
				image = love.math.random(4)
			}

			--Debug
			print('index[' .. x .. ',' .. y .. '] ' .. 'pixel[' .. map.tiles[x][y].x .. ',' .. map.tiles[x][y].y .. ']')
		end
	end
end

function map.draw()
	for x = 1, map.width do
		for y = 1, map.height do
			local tile = map.tiles[x][y]
			love.graphics.draw(frogs[tile.image], tile.x, tile.y, 0, 1, 1)
		end
	end
end