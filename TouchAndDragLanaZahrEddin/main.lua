--Title: TouchAndDrag
--Name: LanaZahrEddin
--Course: ICS3C
--This program displays images that react to a peron's finger.

--hide status bar 
display.setStatusBar(display.HiddenStatusBar)

--local variables.
local backgroundImage = display.newImageRect("Images/background.png", 2048,1536)
local heart = display.newImageRect("Images/healthheart.png", 250, 190)
local heartWidth = heart.width
local heartHeight = heart.height

local planet = display.newImageRect("Images/planet.png", 200, 200)


--my boolean variables to keep track of which object I touched first
local alreadyTouchedHeart = false
local alreadyTouchedPlanet = false

--set teh initial x and y position of myImage
heart.x = 300
heart.y = 250

planet.x = 500
planet.y = 470


--Function: Heart
--Input: touch listener
--Output: none
--Description: when the heart is touched move it.
local function HeartListener(touch)
	if(touch.phase == "began") then
		if(alreadyTouchedPlanet == false) then
			alreadyTouchedHeart = true
		end
	end

	if ((touch.phase == "moved") and (alreadyTouchedHeart == true)) then
		heart.x = touch.x
		heart.y = touch.y
	end

	if (touch.phase == "ended") then
	  alreadyTouchedHeart = false
	  alreadyTouchedPlanet = false
	end
end
 -- add the respective listeners to each object 
 heart:addEventListener("touch", HeartListener)

--Function: Planet
--Input: touch listener
--Output: none
--Description: when the heart is touched move it.
local function PlanetListener(touch)
	if(touch.phase == "began") then
		if(alreadyTouchedHeart == false) then
			alreadyTouchedPlanet = true
		end
	end

	if ((touch.phase == "moved") and (alreadyTouchedPlanet == true)) then
		planet.x = touch.x
		planet.y = touch.y
	end

	if (touch.phase == "ended") then
	  alreadyTouchedPlanet = false
	  alreadyTouchedHeart = false
	end
end
 -- add the respective listeners to each object 
 planet:addEventListener("touch", PlanetListener)
