-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local physics = require( "physics" )
display.setStatusBar( display.HiddenStatusBar );



local bg = display.newImage( "bg.jpg",display.contentWidth/2,display.contentHeight/2)
bg.width = display.contentWidth
bg.height = display.contentHeight*1.2

local bg2 = display.newImage( "bg.jpg",display.contentWidth,display.contentHeight/2)
bg2.width = display.contentWidth
bg2.height = display.contentHeight*1.2

local height = display.contentHeight/2;
local floor = display.newImage("floor.png",display.contentWidth/2, display.contentHeight)
local floor2 = display.newImage("floor.png",display.contentWidth*3.1/2, display.contentHeight)

local p1 = display.newImage("pipe.png",display.contentWidth*1.2, display.contentHeight - floor.height *1.65)
local p2 = display.newImage("p2.png",display.contentWidth*1.2, -100)
p1:scale(0.5,0.5)
p2:scale(0.5,0.5)

local p3 = display.newImage("pipe.png",display.contentWidth * 1.2, display.contentHeight - floor.height *1.65)
local p4 = display.newImage("p2.png",display.contentWidth * 1.44, -100)
p3:scale(0.5,0.5)
p4:scale(0.5,0.5)

local bird = display.newImage("flappy.png",display.contentWidth/2-50, height-10)
bird:scale(0.5,0.5)
local val = 1
local time = 0




local function myphysics() 
-------------------------------------------- 
-- PHYSICS STUFF
--------------------------------------------
    floor.x = floor.x - 2
    floor2.x = floor2.x - 2
    
    if floor2.x == display.contentWidth /2 then
        floor.x = display.contentWidth * 3.1/2
    end
    if floor.x == display.contentWidth /2 then
        floor2.x = display.contentWidth * 3.1/2
    end
    if bg2.x == display.contentWidth/2 then
        bg.x = display.contentWidth
    end
    if val>1 then
        if bg.x == display.contentWidth/2 then
            bg2.x = display.contentWidth
        end
    end
    bg.x = bg.x - 1
    bg2.x = bg2.x - 1
    
    bird.y = (bird.y + 4 )* 1.005
    timer.performWithDelay(10,myphysics)
    
--------------------------------------------
--PIPES STUFF
--------------------------------------------
    p2.x = p2.x - 2
    p1.x = p1.x - 2
    
    p3.x = p3.x -2
    p4.x = p4.x - 2
    
    if val > 1 then
        if p2.x == -p1.width then
           p1.x = display.contentWidth * 1.2 
           p2.x = display.contentWidth * 1.2
        end
    end
    
    if val == 1 then
       if p2.x == -p1.width then
           p1.x = display.contentWidth * 1.05
           p2.x = display.contentWidth * 1.05
        end
    end
     
    
    if p3.x == -p1.width then
        p3.x = display.contentWidth * 1.2
        p4.x = display.contentWidth * 1.2
    end
    if time>5 then
         
    end
            val = val + 1

end
myphysics()

--physics.start()
--physics.addBody( bird, { density=1.0, friction=0.3, bounce=0.2, radius=25 } )
--physics.setGravity( 0, 10 )

function bg:touch( event )
    if event.phase == "began" then
        bird.y =bird.y + -70
        return true
    end
end


        

bg:addEventListener( "touch", bg )

