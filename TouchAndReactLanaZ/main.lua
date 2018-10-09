--Title: Buttons in Lua
--name: Elizabeth
-- Course: ICS2O/3C
--This program displays a red button when the blue button is clicked.
-----------------------------------------------------------------------------------------

-- set background colour
display.setDefault ("background", 140/255, 20/255, 200/255)

--hide status bar
display.setStatusBar(display.HiddenStatusBar)

----create red button, set its position and make visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 300, 150)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

--create red button, set its position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 300, 150)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

--create text object, set its position and make it visible
local textObject = display.newText ("Clicked!",0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (245/255, 154/255, 216/255)
textObject.isVisible = false

-- create checkmark, set its position and make it visible
local checkmark = display.newImageRect("Images/checkmark.png", 200, 200)
checkmark.x = 700
checkmark.y = 500
checkmark.isVisible = false 

--Fucntion; BlueButtonListener
--Input: touch listener
--Output: none
--Description: when blue button is clicked, it will make the text appear with the red button,
--and make the blue button disappear
local function BlueButtonlistener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
	end 

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkmark.isVisible = true
	end
end

--add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonlistener)

--Fucntion; BlueButtonListener
--Input: touch listener
--Output: none
--Description: when blue button is clicked, it will make the text appear with the red button,
--and make the blue button disappear
local function RedButtonlistener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		checkmark.isVisible = false
	end 

	if (touch.phase == "ended") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		checkmark.isVisible = true
	end
end

--add the respective listeners to each object
redButton:addEventListener("touch", RedButtonlistener)