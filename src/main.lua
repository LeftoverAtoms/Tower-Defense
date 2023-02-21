--Allow Sublime to display outputs from LOVE
io.stdout:setvbuf("no")

require("resources")

--"main_menu", "paused", "active"
game_state = "main_menu"

function love.load()
	window.load()

	button:create("level.select", {x = 0, y = -125, w = 640, h = 100}, image.color.gray, "Select Level")
	button:create("game.options", {x = 0, y =    0, w = 640, h = 100}, image.color.gray, "Options")
	button:create("game.quit", 	  {x = 0, y =  125, w = 640, h = 100}, image.color.gray, "Quit")
end

function love.draw()
	button:draw()
end

function love.update(dt)
	input:update(dt)
	button:update(dt)
	
	input:lateUpdate(dt)
end