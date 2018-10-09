-----------------------------------------------------------------------------------------
-- Title: AreaRectCircle
-- Name: Lana ZahrEddin
-- Course: ICS20/3C
-- This program displays a rectangle and shows its area
-----------------------------------------------------------------------------------------

-- create my local variables 
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 500
local heightOfRectangle = 300
local areaOfRectangle
local myCircle
local areaTextCircle
local circumference 
local radiusOfCircle = 140
local PI = 3.14
local areaOfCircle = PI*radiusOfCircle*radiusOfCircle

--set the backgorund colour of my screen. Remember that colors are between 0 and 1.
display.setDefault("background", 229/255, 195/255, 217/255)

--to remove status bar
display.setStatusBar(display.HiddenStatusBar)

--draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(10, 10, widthOfRectangle, heightOfRectangle)

--draw the circle that has coordinates of (850,150) and a radius of 140
myCircle = display.newCircle(850, 150, radiusOfCircle)

--anchor the rectangle in the top left cornor of thge screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 30
myRectangle.y = 20

--set the width of the border
myRectangle.strokeWidth = 20

--set the width of the border
myCircle.strokeWidth = 20

--set the color of the rectangle
myRectangle:setFillColor(144/255, 0/255, 70/255)

--set the color of the rectangle
myCircle:setFillColor(144/255, 0/255, 70/255)

--set the color of the border
myRectangle:setStrokeColor(1, 1, 1)

--set the color of the border
myCircle:setStrokeColor(1, 1, 1)

--calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle


--write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this rectangle with a width of \n" ..
   widthOfRectangle .. " and a heigh of " .. heightOfRectangle .. "is " ..
   areaOfRectangle .. " pixels². ", 0, 0, Arial, textSize)

--anchor the text and set its (x,y) position 
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2

-- set the color of the newText 
areaText:setTextColor (0, 0, 0)

-- set the color of the newText 
areaText:setTextColor (0, 0, 0)


--write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this circle with a radius of \n" ..
   radiusOfCircle .. " is " ..
   areaOfCircle .. " pixels². ", 0, 0, Arial, textSize)--anchor the text and set its (x,y) position 

--anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = 550


