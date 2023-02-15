--[[ NOTES:
-> Bloons map is a 16-12 grid
-> Shouldn't have a tile_size variable. I will manage this separately once I create a tileset
--]]

map =
{
	tile = {},
	width = 4, height = 3
}

function map.create()
	local tile_size = 128
	--if (map.width > map.height) then tile_size = window.width / map.width
	--else tile_size = window.height / map.height end

	--print(window.width / map.width .. ',' .. window.height / map.height)

	for x = 1, map.width do
		map.tile[x] = {}

		for y = 1, map.height do
			map.tile[x][y] =
			{
				image = love.math.random(4),
				vertices =
				{
					{ tile_size * (x - 1),	tile_size * (y - 1),	0,	0},
					{		tile_size * x,	tile_size * (y - 1),	1,	0},
					{		tile_size * x,	tile_size * y,			1,	1},
					{ tile_size * (x - 1),	tile_size * y,			0,	1}
				}
			}
		end
	end
end

function map.draw()
	for x = 1, map.width do
		for y = 1, map.height do
			local tile = map.tile[x][y]

			local mesh = love.graphics.newMesh( tile.vertices, 'fan' )
			mesh:setTexture(frogs[tile.image])

			love.graphics.draw(mesh, 2, 0)

			--love.graphics.print('1', tile.vertices[1][1], tile.vertices[1][2])
			--love.graphics.print('2', tile.vertices[2][1], tile.vertices[2][2])
			--love.graphics.print('3', tile.vertices[3][1], tile.vertices[3][2])
			--love.graphics.print('4', tile.vertices[4][1], tile.vertices[4][2])

			love.graphics.print(x .. ',' .. y, (tile.vertices[1][1] * 0.5) + (tile.vertices[3][1] * 0.5), (tile.vertices[1][2] * 0.5) + (tile.vertices[3][2] * 0.5))
		end
	end
end