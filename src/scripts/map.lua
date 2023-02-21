map = 
{
	w = 16, h = 12,
	tile = {}
}

local map_size = map.w * map.h

function map.create()
	-- Scale tiles relative to window
	local tile_size = window.h / map.h

	for x = 1, map.w do
		for y = 1, map.h do
			local tile =
			{
				position = { x = x, y = y},
				mesh = nil,
				tower = nil,
				image = love.math.random(4)
			}
			local vertices =
			{
				--   [ X AXIS ]              [ Y AXIS ]         [ UV ]     [ RGBA ]
				{tile_size * (x - 1),    tile_size * (y - 1),    0, 0,    1, 1, 1, 1},
				{tile_size * (x - 1),    tile_size *       y,    0, 1,    1, 1, 1, 1},
				{tile_size *       x,    tile_size *       y,    1, 1,    1, 1, 1, 1},
				{tile_size *       x,    tile_size * (y - 1),    1, 0,    1, 1, 1, 1}
			}
			tile.mesh = love.graphics.newMesh(vertices, "fan")
			tile.mesh:setTexture(image.frog.blue)
			table.insert(map.tile, tile)
		end
	end
end

function map.draw()
	for i = 1, map_size do
		love.graphics.draw(map.tile[i].mesh, 2, 0)
	end
end

function map.select()
	local mx = input.mouse.position.x
	local my = input.mouse.position.y

	local selection = nil

	for i = 1, map_size do
		local lx, ly = map.tile[i].mesh:getVertex(1)
		local rx, ry = map.tile[i].mesh:getVertex(3)

		if mx >= lx and mx < rx and my >= ly and my < ry then
			map.tile[i].mesh:setTexture(image.selected)
			selection = map.tile[i]
		else
			map.tile[i].mesh:setTexture(image.frog.blue)
		end
	end

	return selection
end

function map.place_tower()
	local tile = map.select()
	if tile ~= nil and tile.tower == nil then
		print(tile.position.x .. "," .. tile.position.y)
	end
end