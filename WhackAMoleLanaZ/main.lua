--Title: Whack A Mole
--Name:Lana ZahrEddin
-- Course: ICS3C
--This program places a random object on the screen. If the user clicks on it in time the scrore increases by 1
---------------------------------------------------------------------------------------------------------------
--VARIABLES
-----------------------------
local numberPoints = 0
local pointTextObject



--hide status bar 
display.setStatusBar(display.HiddenStatusBar)

--create the background and set the color
display.setDefault( "background",0/255, 45/255, 200/255)

--crating the mole
local mole = display.newImage("Images/mole.png" ,0, 0)

--setting the position of the mole
mole.x = display.contentCenterX
mole.y = display.contentCenterY
--set the mole to ba third of its original size
mole:scale(1/3,1/3)
--make the mole invisible
mole.isVisible = false

--text object to display the score
pointsTextObject = display.newText( "Points = ".. numberPoints, 150, 100, nil, 50 )
pointsTextObject:setTextColor(37/255, 223/255, 43/255)
--------------------------------------------------------------------------------
--FUNCTIONS
---------------------------------
--This function that make sthe mole appear in a random (x,y) position on the screen before calling the function
function PopUp()
	--choosing random position on the screen between 0 and the size of the screen
	mole.x = math.random(0, display.contentWidth)
	mole.y = math.random(0, display.contentHeight)

	--making the mole visible 
	mole.isVisible = true 

end
PopUp()