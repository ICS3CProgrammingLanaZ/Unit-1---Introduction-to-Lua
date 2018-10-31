-----------------------------------------------------------------------------------------
--Title: Interacting Onject 2
--Name: Lana ZahrEddin
--Course: ICS3C
--This program displays different sized balls falling on a beam.
-----------------------------------------------------------------------------------------

-- Hide the status a=bar
display.setStatusBar(display.HiddenStatusBar)

--load physics
local  physics = require("physics")

--start physics
physics.start()
-------------------------------------------------------------------
--OBJECTS--
-------------------------------------------------------------------
--Ground
local ground = display.newImage("Images/ground.png", 0, 740)

--change the width to be the same as the screen
ground.width = display.contentWidth
ground.x = display.contentWidth/2

--add to physics
physics.addBody(ground, "static", {friction=0.5, bounce=0.3})
---------------------------------------------------------------------
local beam = display.newImage("Images/beam.png", 0, 0)
beam.width = display.contentWidth/2
beam.height = display.contentHeight*1/9
--set the x and y pos
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65

--rotate the beam -60 degrees so its on an angle 
beam:rotate(45)

--send it to the back layer
beam:toBack()

--add to physics 
physics.addBody(beam, "static", {friction=0.5, bounce=0.3})
----------------------------------------------------------
--create second beam
local beam2 = display.newImage("Images/beam.png", 900, 700)
beam2.width = display.contentWidth/6
beam2.height = display.contentHeight*2

--send it to back
beam2:toBack()

--add to physics
physics.addBody(beam2, "static", {friction=0.5, bounce})
----------------------------------------------------------
--create bkg
local bkg = display.newImage("Images/bkg.png", 0, 0)

	--set the x and the y pos
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY
	bkg.width = display.contentWidth
	bkg.height = display.contentHeight

	--send to back
	bkg:toBack()

	-----------------------------------------------------------
	--FUNCTIONS
	-----------------------------------------------------------

--create the first ball
local function firstBall()
		-- creating first ball
		local ball1 = display.newImage("Images/super_ball.png", 0, 0)
		--add to physics
	 	physics.addBody(ball1, {density= 2.0, friction=1.5, bounce=0.3, radius= 25})
	end
	------------------------------------------------------------------------------------------------------------

	--create the second ball
	local function secondBall()
		-- creating second ball
		local ball2 = display.newImage("Images/super_ball.png", 0, 0)
		--add to physics
		physics.addBody(ball2, {density=1,0, friction=0.5, bounce=1.1, radius=12.5})
		ball2:scale(0.5, 0.5)
	end
	-------------------------------------------------------------------------------------------------------------
	--create the third ball
	local function thirdBall()
		-- creating third ball
		local ball3 = display.newImage("Images/super_ball.png", 0, 0)
		
		--add to physics
		physics.addBody(ball3, {density=1,7, friction=9.5, bounce=0.7, radius=50})
		ball3:scale(2, 2)
	
	end
	--------------------------------------------------------------------------------------------------------------
	--create the fourth ball
	local function fourthBall()
		-- creating fourth ball
		local ball4 = display.newImage("Images/super_ball.png", 0, 0)
		ball4:scale(1.5, 1.5)
	
		--add to physics
		physics.addBody(ball4, {density=1,0, friction=0.8, bounce=0.7, radius=37.5})
	end
	--------------------------------------------------------------------------------------------------------------
	--create the fifthball
	local function fifthBall()
		-- creating fifth ball
		local ball5 = display.newImage("Images/super_ball.png", 0, 0)
		--add to physics
		physics.addBody(ball5, {density=1,0, friction=0.8, bounce=0.7, radius=200})
		ball5:scale(8, 8)
	end

	--------------------------------------------------------------
	--Sounds
	--------------------------------------------------------------
	local backgroundSound = audio.loadSound("Sounds/background.mp3")
	local backgroundSoundChannel

	---------------------------------------------------------------
	--TIMER DELAYS - CALL EACH FUNCTION AFTER THE GIVEN MILLISECOND
	---------------------------------------------------------------
	timer.performWithDelay(0, firstBall)
	timer.performWithDelay(500, secondBall)
	timer.performWithDelay(1000, thirdBall)
	timer.performWithDelay(1500, thirdBall)
	timer.performWithDelay(2000, thirdBall)

	backgroundSoundChannel = audio.play(backgroundSound)