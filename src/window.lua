window =
{
	size = { width, height },
	center = { x, y }
}

function window.load()
	window.width, window.height = love.window.getMode()

	window.center.x = window.width * 0.5
	window.center.y = window.height * 0.5
end

function window.resize(w,h)
	window.width = w
	window.height = h

	window.center.x = window.width * 0.5
	window.center.y = window.height * 0.5
end