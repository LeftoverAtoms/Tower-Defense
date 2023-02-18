--Allow Sublime to display outputs from LOVE
io.stdout:setvbuf('no')

require('resources')

function love.load()
	--unit.parse_data()
	--unit.create('Dart Monkey')
	--unit.create('Super Monkey')
	--unit.find_all()

	window.init()
	map.create()
end

function love.draw()
	map.draw()
end

function love.update(dt)
	input.update()

	if input.mouse.clicked == true then
		map.select()
		--map.place_tower()
	end
end