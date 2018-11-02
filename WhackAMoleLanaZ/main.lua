------------------------------------------------------------
--Title: Whack A Mole
--Name: Lana ZahrEddin
--Course: ICS3C
--This program displays a mole randomly on the screen and if the user clicks on it before it disapears, the score increases by 1.
------------------------------------------------------------
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--LOCAL VARIABLES--
local scoreNumber = 0

--Sounds
local whackSound = audio.loadSound( "Sounds/whack.mp3")
local whackSoundChannel

local backgroundSound = audio.loadSound("Sounds/bensound-buddy.mp3")
local backgroundSoundChannel
------------------------------------------------------
--set the background colour and add background music
display.setDefault( "background", 128/255, 91/255, 155/255 )
backgroundSoundChannel = audio.play(backgroundSound)

--create the mole and siplay it on the screen
local mole = display.newImage("Images/mole2.png", 0, 0 )

--set the position of the mole and rescale the size of the mole to  one third of its original size
mole.x = display.contentCenterX
mole.y = display.contentCenterY
mole:scale(1*1/2, 1*1/2)

--set the mole to invisible
mole.isVisible = false

--create the score text and display it on the screen
local scoreObject = display.newText( "Score :) = ".. scoreNumber, 160, 700, nil, 50)
scoreObject:setTextColor(11/255, 18/255, 232/255)


--FUNCTIONS--
--Creating a function that makes the mole appears in random (x,y) positions on the screen  
function PopUp()
 --Choosing random Position on the screen between 0 and the size of the screen
 mole.x = math.random( 0, display.contentWidth)
 mole.y = math.random( 0, display.contentHeight)
 --make the mole visible
 mole.isVisible = true

 --make the mole disapear after 1000 miliseconds
 timer.performWithDelay( 1000, Hide)
end

--This function calls the PopUp function after 1 seconds
function PopUpDelay( )
 timer.performWithDelay( 1000, PopUp)
end

--This function makes the mole invisible and then calls the PopUpDelay function
function Hide( )
 --Changing visibility
  mole.isVisible = false
  PopUpDelay()
end

--this function starts the game
function GameStart( )
 PopUpDelay()
end

--this function increments the score only if the mole is clicked.It then displays the new score.
function Whacked( event )
     -- If touch phase just started
	if (event.phase == "began") then
  		whackSoundChannel = audio.play(whackSound)
  		scoreNumber = scoreNumber + 1
  		scoreObject.isVisible = true
  		Hide()
  		scoreObject.text = ( "Score :) = "..scoreNumber)
 	end
end
--EVENT LISTENERS
--Add the event listener to the moles so that if the mole is touched, the whacked function is called
mole:addEventListener( "touch", Whacked)

--START GAME
GameStart()