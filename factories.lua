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

function Check_Factory()
    if(love.mouse.isDown(1)) then
        if(not Clicked or not Which_Factory() == -1) then
            Buy_Factory(1,100,Which_Factory())
            Clicked = true
        end
        
    else 
        Clicked = false
    end
end

function Buy_Factory(workers, wage,id)
    if(id == 0 and Money>=10) then
        Money=Money-10
        table.insert(Factories, Factory(workers,wage,1))
    elseif(id == 1 and Money>=50) then
        Money=Money-50
        table.insert(Factories, Factory(workers,wage,5))
    elseif(id == 2 and Money>=100) then
        Money=Money-100
        table.insert(Factories, Factory(workers,wage,10))
    
    elseif(id == 3 and Money>=1000) then
        Money=Money-1000
        table.insert(Factories, Factory(workers,wage,100))
    
    elseif(id == 4 and Money>=10000) then
        Money=Money-10000
        table.insert(Factories, Factory(workers,wage,1000))
    
    elseif(id == 5 and Money>=100000) then
        Money=Money-100000
        table.insert(Factories, Factory(workers,wage,10000))
    
    elseif(id == 6 and Money>=1000000) then
        Money=Money-1000000
        table.insert(Factories, Factory(workers,wage,100000))
    
    elseif(id == 7 and Money>=10000000) then
        Money=Money-10000000
        table.insert(Factories, Factory(workers,wage,1000000))
    
    elseif(id == 8 and Money>=100000000) then
        Money=Money-100000000
        table.insert(Factories, Factory(workers,wage,10000000))
    
    elseif(id == 9 and Money>=1000000000) then
        Money=Money-1000000000
        table.insert(Factories, Factory(workers,wage,100000000))
    end
end
