function Factory(workers, wage, output,id)
    local factory = {
        workers = workers,
        wage = wage,
        output = output,
    }
    return factory
end

function Which_Factory()
    if(love.mouse.getY()<= 100) then
        return math.floor(love.mouse.getX()/(Screen_width/10))
    end
    return -1
end

function Check_Factory(id)
    if(love.mouse.isDown(1)) then
        if(not Clicked or not Which_Factory() == -1) then
            Buy_Factory(1,100,1,Which_Factory())
            Clicked = true
        end
        
    else 
        Clicked = false
    end
end

function Buy_Factory(workers, wage, output,id)
    if(id == 0 and Money>=10) then
        Money=Money-10

        table.insert(Factories, Factory(workers,wage,output))
    end
end
