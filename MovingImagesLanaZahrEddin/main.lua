--Title: MovingImages
--Name: Lana ZahrEddin
--Course: ICS23C
--In this program, I will display moving images. 

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--global variables
scrollSpeed = 7

--background image with width and height
local backgrounfImage = display.newImageRect("Images/background.png", 2048, 1536)
 
 --character image with width and height 
 local beetleship = display.newImageRect("Images/beetleship.png", 300, 280)

 --set the image to be transperant
 beetleship.alpha = 0

 --set the initial x and y position of beetleship 
 beetleship.x = 0
 beetleship.y = display.contentHeight/3

 -- Function: MoveShip
 -- Input: this function accepts an event listener 
 -- Output: none 
 -- Description: This function adds the scroll speed to the x-value of the ship
 local function MoveShip(event)
       -- add the scroll speed to the x-value of the ship
       beetleship.x = beetleship.x + scrollSpeed
       -- change the transparency of the ship every time it moves so that it fades out  
       beetleship.alpha = beetleship.alpha + 0.01
end

--MoveShip will be calles over and over again 
Runtime:addEventListener("enterFrame", MoveShip)