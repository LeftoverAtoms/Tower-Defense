--NOTE: Bloons map is a 16-12 grid
--Multiply half of width by tile_size to get offset from left side

map =
{
	tiles = {},
	width = 4,
	height = 3
}

tile_size = 256

function map.init()

end

function map.create()

	local width, height = love.window.getMode()
	local center =
	{
		x = width * 0.5,
		y = height * 0.5
	}

	--Create new tiles row by row
	for x = 1, map.width do
		map.tiles[x] = {}
		for y = 1, map.height do
		map.tiles[x][y] =
		{
			x = (map.width * 0.5 - x) * tile_size + center.x,
			y = (map.height * 0.5 - y) * tile_size + center.y,
			image = love.math.random(4)
		}
		end
	end

	for x, _ in ipairs(map.tiles) do
		for y, _ in ipairs(map.tiles[x]) do
			local tile = map.tiles[x][y]
				--print('index[' .. x .. ',' .. y .. '] ' .. 'pixel[' .. tile.x .. ',' .. tile.y .. ']')
		end
	end
end

function map.draw()

	for x, _ in ipairs(map.tiles) do
		for y, _ in ipairs(map.tiles[x]) do

			local tile = map.tiles[x][y]

			love.graphics.draw(frogs[tile.image], tile.x, tile.y, 0, 1, 1)
		end
	end
end