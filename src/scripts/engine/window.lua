window =
{
	aspect_ratio = {16,9},
	center = {x,y},
	w = nil, h = nil
}

function window.load()
	local w, h = love.window.getMode()
	window.center.x = w * 0.5
	window.center.y = h * 0.5
	window.w = w
	window.h = h
end

function window.resize(w,h)
	window.center.x = w * 0.5
	window.center.y = h * 0.5
	window.w = w
	window.h = h
end