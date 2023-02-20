require( "scripts/engine/utility" )
require( "scripts/engine/window" )

require( "scripts/input/button" )
require( "scripts/input/input" )

require( "scripts/map" )
require( "scripts/menu" )
require( "scripts/unit" )

frogs =
{
	love.graphics.newImage("imgs/blue_frog.png"),
	love.graphics.newImage("imgs/green_frog.png"),
	love.graphics.newImage("imgs/purple_frog.png"),
	love.graphics.newImage("imgs/red_frog.png"),
	selected = love.graphics.newImage("imgs/grid.png")
}