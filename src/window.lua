window =
{
	aspect_ratio = {16,9},
	center = {w,h},
	w = nil, h = nil
}

function window.init()
	local w, h = love.window.getMode()
	window.center.w = w * 0.5
	window.center.h = h * 0.5
	window.w = w
	window.h = h
end

function window.resize(w,h)
	window.center.w = w * 0.5
	window.center.h = h * 0.5
	window.w = w
	window.h = h
end