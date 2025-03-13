-- Load some default values for our rectangle.
function love.load()
    require("./factories");
    
    Screen_width = love.graphics.getWidth()
    Screen_height = love.graphics.getHeight()
    CookieX,CookieY = Screen_width/2,Screen_height/2
    Radius = 50
    Money = 0
    Clicked = false
    Factories = {}
end

-- Increase the size of the rectangle every frame.
function love.update(dt)
    Screen_width = love.graphics.getWidth()
    Screen_height = love.graphics.getHeight()
    CookieX,CookieY = Screen_width/2,(Screen_height/4)*3

    Cookie_Clicked()
    Check_Factory()
    Update_Cookies(dt)
    
end

function Update_Cookies(dt)
    for i=1, #Factories do
        Money = Money+(Factories[i].output*dt)
    end
end

function Check_Clicked_Circle(mouseX, mouseY, circleX, circleY, radius)
    local dist = math.sqrt((mouseX-circleX)^2 + (mouseY-circleY)^2)
    if (dist>radius) then
        return false
    end
    return true
end


function love.draw()
    -- In versions prior to 11.0, color component values are (0, 102, 102)
    love.graphics.setBackgroundColor(0, 0.4, 0.4)
    love.graphics.circle('fill', CookieX,CookieY, Radius)
    love.graphics.print(tostring(math.floor(Money)), Screen_width/2,Screen_height/2)
    Draw_Cards(10)
end

function Cookie_Clicked()
    if(love.mouse.isDown(1)) then
        local mouseX = love.mouse.getX()
        local mouseY = love.mouse.getY()
        if(Check_Clicked_Circle(mouseX,mouseY,CookieX,CookieY,Radius) and not Clicked) then
            Money=Money+1
            Clicked = true
        end
    elseif(not love.mouse.isDown(1))then
        Clicked=false
    end
end

function Draw_Cards(amount)
    for i=0, amount do
        love.graphics.rectangle("line", 0+ i*(Screen_width/amount), 0, Screen_width/amount,100)
    end
end

