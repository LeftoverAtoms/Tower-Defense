require( "scripts/engine/utility" )
require( "scripts/engine/window" )

require( "scripts/input/button" )
require( "scripts/input/input" )

require( "scripts/map" )
require( "scripts/menu" )
require( "scripts/unit" )

font_default = love.graphics.newFont("resources/fonts/Roboto-Regular.ttf", 32)

image =
{
	color =
	{
		gray = love.graphics.newImage("resources/images/colors/gray.jpg")
	},
	frog =
	{
		red = love.graphics.newImage("resources/images/dev/red_frog.png"),
		green = love.graphics.newImage("resources/images/dev/green_frog.png"),
		blue = love.graphics.newImage("resources/images/dev/blue_frog.png"),
		purple = love.graphics.newImage("resources/images/dev/purple_frog.png")
	},
	selected = love.graphics.newImage("resources/images/dev/grid.png")
}