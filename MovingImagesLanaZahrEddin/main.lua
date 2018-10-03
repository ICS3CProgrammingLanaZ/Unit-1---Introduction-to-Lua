--Title: MovingImages
--Name: Lana ZahrEddin
--Course: ICS23C
--In this program, I will display moving images. 

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--global variables
local scrollSpeed = 5

--background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

--first character image with width and height
local star = display.newImageRect("Images/star.png", 200, 200)

--set the first image to be transparent
star.alpha = 0

--set the initial x and y position of star 
star.x = 0
star.y = display.contentHeight / 3


--Function: MoveStar
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the ship
local function MoveStar(event)
--add the scroll speed to the x-value of the ship
star.x = star.x + scrollSpeed
--change the transparency of the ship every time it so fast that it fades out
star.alpha = star.alpha + 0.01
end

------------------------------------
local scrollSpeed2 = 4

--second character image with width and height
local octopus = display.newImageRect("Images/octopus.png", 230, 190)

octopus.alpha = 1

--set the initial x and y position of the octopus
octopus.x = display.contentWidth
octopus.y = display.contentHeight*2/3

--Function: MoveOctopus
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the girl
local function MoveOctopus(event)
--add the scroll speed to the x-value of the ship
octopus.x = octopus.x - scrollSpeed2
--change the transparency of the ship every time it so fast that it fades out
octopus.alpha = octopus.alpha - 0.00000000000000009
end

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveStar)
Runtime:addEventListener("enterFrame", MoveOctopus)





