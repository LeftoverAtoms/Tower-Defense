button = { entity = { count = 0 } }

function button:create(action, transform, image, text)
	local transform =
	{
		x = window.center.x + transform.x,
		y = window.center.y + transform.y,
		w = transform.w,
		h = transform.h
	}

	--Improve readability for vertices table
	local half_width, half_height = transform.w * 0.5, transform.h * 0.5

	local btn =
	{
		action = action,
		transform = transform,
		mesh = nil,
		text = text,
		vertices =
		{
			--      [ X AXIS ]                   [ Y AXIS ]            [ UV ]     [ RGBA ]
			{transform.x - half_width,    transform.y - half_height,    0, 0,    1, 1, 1, 1},
			{transform.x - half_width,    transform.y + half_height,    0, 1,    1, 1, 1, 1},
			{transform.x + half_width,    transform.y + half_height,    1, 1,    1, 1, 1, 1},
			{transform.x + half_width,    transform.y - half_height,    1, 0,    1, 1, 1, 1}
		}
	}

	--Append button to entities
	self.entity.count = self.entity.count + 1
	self.entity[self.entity.count] = btn

	--Draw buttons independently when an image is provided
	if image ~= nil then
		btn.mesh = love.graphics.newMesh(btn.vertices, "fan", "static")
		btn.mesh:setTexture(image)
	end
end

function button:draw()
	for i = 1, self.entity.count do
		local btn = self.entity[i]
		if btn.mesh ~= nil then
			love.graphics.draw(btn.mesh, 2, 0)

			love.graphics.printf(
				{{0,0,0}, btn.text}, 
				font_default, 
				btn.transform.x - 100, 
				btn.transform.y - font_default:getHeight() * 0.5, 200, 
				"center")
		end
	end
end

function button:update(dt)
	--Find which button the mouse has clicked or if any
	if input.mouse.pressed then
		for i = 1, self.entity.count do
			button:checkBounds(self.entity[i])
		end
	end
end

--
function button:interact()

end

function button:checkBounds(btn)
	local mx, my = input.mouse.position.x, input.mouse.position.y
	local lx, ly = btn.vertices[1][1], btn.vertices[1][2]
	local rx, ry = btn.vertices[3][1], btn.vertices[3][2]

	if mx >= lx and mx < rx and my >= ly and my < ry then
		print(btn.action)
	end
end

function button:reset()
	for i = 1, self.entity.count do
		self.entity[i] = nil
	end
	self.entity.count = 0
end