input =
{
	mouse =
	{
		clicked = false,

		pressed = false,
		position = { x, y }
	}
}

local mouse_was_clicked = false

function input.update()
	if input.mouse.clicked == true and mouse_was_clicked == false then
		mouse_was_clicked = true
	elseif input.mouse.clicked == true and mouse_was_clicked == true then
		mouse_was_clicked = false
		input.mouse.clicked = false
	end
end

--[LOVE FUNCTIONS BELOW]

function love.mousepressed(x,y,button,istouch,presses)
	mouse_was_clicked = false
	input.mouse.clicked = true
	input.mouse.pressed = true
end

function love.mousereleased(x,y,button,istouch,presses)
	input.mouse.clicked = false
	input.mouse.pressed = false
end

function love.mousemoved(x,y,dx,dy,istouch)
	input.mouse.position.x = x
	input.mouse.position.y = y
end