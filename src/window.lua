window =
{
	aspect_ratio = {16,9},
	center = {w,h},
	size = {w,h},
}

function window.init()
	local w, h = love.window.getMode()
	window.center.w = w * 0.5
	window.center.h = h * 0.5
	window.size.w = w
	window.size.h = h
end

function window.resize(w,h)
	window.center.w = w * 0.5
	window.center.h = h * 0.5
	window.size.w = w
	window.size.h = h
end