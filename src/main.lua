--Allow Sublime to display outputs from LOVE
io.stdout:setvbuf('no')

require('resources')

function love.load()
	--TODO: Make a tileset
	frogs = {}
	frogs[1] = love.graphics.newImage('imgs/blue_frog.png')
	frogs[2] = love.graphics.newImage('imgs/green_frog.png')
	frogs[3] = love.graphics.newImage('imgs/purple_frog.png')
	frogs[4] = love.graphics.newImage('imgs/red_frog.png')

	unit.parse_data()
	unit.create('Dart Monkey')
	unit.create('Super Monkey')
	unit.find_all()

	map.create()
end

function love.draw()
	--Protect eyes from a lethal flashbang
	love.graphics.setColor(0.25, 0.25, 0.25, 1)
	map.draw()
end

function love.resize(w, h)
	map.create()
end