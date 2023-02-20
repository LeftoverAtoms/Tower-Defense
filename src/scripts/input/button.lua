button =
{
	entity =
	{
		count = 0
	}
}

function button:create(pos, width, height)
	height = height or width
	ent =
	{
		pos = pos,
		bounds =
		{
			{x = pos.x - (width), y = pos.y - (height)},
			{x = pos.x + (width), y = pos.y + (height)}
		}
	}
	self.entity.count = self.entity.count + 1
	button.entity[self.entity.count] = ent
end

function button:update(dt)
	if input.mouse.down then
		for i = 1, self.entity.count do
			button:checkbounds(button.entity[i].bounds)
		end
	end
end

function button:checkbounds(bounds)
	local mx, my = input.mouse.position.x, input.mouse.position.y
	local lx, ly = bounds[1].x, bounds[1].y
	local rx, ry = bounds[2].x, bounds[2].y

	if mx >= lx and mx < rx and my >= ly and my < ry then
		print("Pressed: " .. ly + 50 .. "px")
	else
		print("---")
	end
end