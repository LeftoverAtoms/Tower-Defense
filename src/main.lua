--Allow Sublime to display outputs from LOVE
io.stdout:setvbuf("no")

require("resources")

--"main_menu", "paused", "active"
game_state = "main_menu"

function love.load()
	window.load()

	button:create({x = window.center.x, y = window.center.y - 125}, 250, 50)

	button:create(window.center, 250, 50)

	button:create({x = window.center.x, y = window.center.y + 125}, 250, 50)

	--map.create()
end

function love.draw()
	--map.draw()
	for i = 1, button.entity.count do
		love.graphics.line(button.entity[i].bounds[1].x, button.entity[i].bounds[1].y, button.entity[i].bounds[2].x, button.entity[i].bounds[1].y)
		love.graphics.line(button.entity[i].bounds[2].x, button.entity[i].bounds[1].y, button.entity[i].bounds[2].x, button.entity[i].bounds[2].y)
		love.graphics.line(button.entity[i].bounds[1].x, button.entity[i].bounds[2].y, button.entity[i].bounds[2].x, button.entity[i].bounds[2].y)
		love.graphics.line(button.entity[i].bounds[1].x, button.entity[i].bounds[1].y, button.entity[i].bounds[1].x, button.entity[i].bounds[2].y)
	end
end

function love.update(dt)
	input:update(dt)
	button:update(dt)
	
	input:lateupdate(dt)
end