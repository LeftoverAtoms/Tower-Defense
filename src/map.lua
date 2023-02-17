map =
{
	tile = {},
	w = 6, h = 4 --16x12
}

function map.create()
	local tile_size = 128
	--if map.w > map.h then tile_size = window.w / map.w
	--else tile_size = window.h / map.h end
	--print(window.w / map.w .. ',' .. window.h / map.h)

	for x = 1, map.w do
		map.tile[x] = {}
	end

	for x = 1, map.w do
		for y = 1, map.h do
			map.tile[x][y] =
			{
				position = { x = x, y = y},
				mesh = nil,
				tower = nil,
				image = love.math.random(4)
			}
			local vertices =
			{
				--    [ X AXIS ]              [ Y AXIS ]       [ U ] [ V ]
				{tile_size * (x - 1),    tile_size * (y - 1),    0,    0},
				{tile_size *       x,    tile_size * (y - 1),    1,    0},
				{tile_size *       x,    tile_size *       y,    1,    1},
				{tile_size * (x - 1),    tile_size *       y,    0,    1}
			}
			map.tile[x][y].mesh = love.graphics.newMesh(vertices, 'fan')
			map.tile[x][y].mesh:setTexture(frogs[map.tile[x][y].image])
		end
	end
end

function map.draw()
	for x = 1, map.w do
		for y = 1, map.h do
			love.graphics.draw(map.tile[x][y].mesh, 2, 0)
		end
	end
end

function map.select()
	local mx = input.mouse.position.x
	local my = input.mouse.position.y
	local selection = nil
	for x = 1, map.w do
		for y = 1, map.h do
			local lx, ly = map.tile[x][y].mesh:getVertex(1) -- Top Left
			local rx, ry = map.tile[x][y].mesh:getVertex(3) -- Bottom Right

			-- Collision Check
			if mx >= lx and mx < rx and my >= ly and my < ry then
				map.tile[x][y].mesh:setTexture(frogs['selected'])
				selection = map.tile[x][y]
			else
				--Ideally, something is overlayed over the image.
				map.tile[x][y].mesh:setTexture(frogs[map.tile[x][y].image])
			end
		end
	end
	return selection
end

function map.place_tower()
	local tile = map.select()
	if tile ~= nil and tile.tower == nil then
		print(tile.position.x .. ',' .. tile.position.y)
	end
end