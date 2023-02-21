input =
{ 
	mouse = { position = { x, y }, pressed = false, down = false },
	keyboard = {},
	gamepad = {}
}

function input:update(dt)
end

function input:lateUpdate(dt)
	input.mouse.pressed = false
end



function love.mousepressed(x,y,button,istouch,presses)
	if button == 1 then
		input.mouse.pressed = true
		input.mouse.down = true
	end
end
function love.mousereleased(x,y,button,istouch,presses)
	if button == 1 then
		input.mouse.down = false
	end
end
function love.mousemoved(x,y,dx,dy,istouch)
	input.mouse.position.x = x
	input.mouse.position.y = y
end