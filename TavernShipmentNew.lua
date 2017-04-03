local Food = 180001 -- Rustic Stove

local Vouchers = {190054, 190055, 190056}
local keys = {190057, 190058, 190059}

-- AMOUNTS (IMPORTANT!)

-- POOR:

local poorAle = 200 -- Watery Ale
local poorStew = 75 -- Rabbit Stew
local poorBread = 100 -- Sweet Potato Bread

-- WELL:

local wellAle = 300 -- Strahnbrad Stout
local wellStew = 180 -- Rabbit Stew
local wellBread = 200 -- Sweet Potato Bread

-- GOOD:

local goodAle = 400
local goodStew = 360 -- Rabbit Stew
local goodBread = 400 -- Sweet Potato Bread

local function vouchersCheck(Player)
    for x=1,#Vouchers,1 do
        if Player:HasItem(Vouchers[x]) then
            return true;
        end
    end
    return false;
end

local function restock(Player)
    if vouchersCheck(Player) then
        if Player:HasItem(190054) then
            Player:AddItem(190057)
            

    
        elseif vouchersCheck(Player) then
        if Player:HasItem(190055) then
            Player:AddItem(190058)
            

        elseif vouchersCheck(Player) then
        if Player:HasItem(190056) then
            Player:AddItem(190059)
            
        end
        end
    end
end
 
end

local function keysCheck(Player)
    for x=1,#keys,1 do
        if Player:HasItem(keys[x]) then
            return true;
        end
    end
    return false;
end

local function stoveGossip(Event, Player, Object)
    if keysCheck(Player) then
        Player:GossipMenuAddItem(0, "Use your key to access your goods.", 70008, 1)
        Player:GossipMenuAddItem(0, "Nevermind.", 70008, 2)
        Player:GossipSendMenu(70008, Object, menu_id)
        
    else
        Player:GossipMenuAddItem(0, "Step away.", 70009, 3)
        Player:GossipSendMenu(70009, Object, menu_id)
        
    end
end

local function access(Event, Player, Object, Sender, intid, code, menu_id)
    
    Player:GossipClearMenu()
    
    local poorVoucher=false;
    local wellVoucher=false;
    local goodVoucher=false;
    
    if Player:HasItem(190057) then
        poorVoucher=true;
        
    elseif Player:HasItem(190058) then
        wellVoucher=true;
        
    elseif Player:HasItem(190059) then
        goodVoucher=true;
        
    end
    
    if (intid == 1) then -- Exchanging voucher.
        
    if poorVoucher == true then
        
        
        Player:GossipMenuAddItem(0, "Retrieve ONE serving of ale from your stock.", 70010, 4)
        Player:GossipMenuAddItem(0, "Retrieve ONE serving of stew from your stock.", 70010, 5)
        Player:GossipMenuAddItem(0, "Retrieve ONE serving of bread from your stock.", 70010, 6)
        Player:GossipMenuAddItem(0, "Check your stock.", 700010, 16)
        Player:GossipMenuAddItem(0, "Restock. (Requires a voucher.)", 700010, 17)
        Player:GossipMenuAddItem(0, "No thanks.", 70010, 13)
        Player:GossipSendMenu(70010, Object, menu_id)
        
    elseif wellVoucher == true then
        
        
        Player:GossipMenuAddItem(0, "Retrieve ONE serving of ale from your stock.", 70010, 7)
        Player:GossipMenuAddItem(0, "Retrieve ONE serving of stew from your stock.", 70010, 8)
        Player:GossipMenuAddItem(0, "Retrieve ONE serving of bread from your stock.", 70010, 9)
        Player:GossipMenuAddItem(0, "Check your stock.", 700010, 16)
        Player:GossipMenuAddItem(0, "Restock. (Requires a voucher.)", 700010, 18)
        Player:GossipMenuAddItem(0, "No thanks.", 70010, 14)
        Player:GossipSendMenu(70010, Object, menu_id)
        
    elseif goodVoucher == true then
        
        
        Player:GossipMenuAddItem(0, "Retrieve ONE serving of ale from your stock.", 70010, 10)
        Player:GossipMenuAddItem(0, "Retrieve ONE serving of stew from your stock.", 70010, 11)
        Player:GossipMenuAddItem(0, "Retrieve ONE serving of bread from your stock.", 70010, 12)
        Player:GossipMenuAddItem(0, "Check your stock.", 700010, 16)
        Player:GossipMenuAddItem(0, "Restock. (Requires a voucher.)", 700010, 19)
        Player:GossipMenuAddItem(0, "No thanks.", 70010, 15)
        Player:GossipSendMenu(70010, Object, menu_id)
        
    end
end

if (intid == 4) then
    
    if (poorAle > 0) then
        
    poorAle = poorAle-1
    Player:AddItem(19222, 1)
    Player:SendBroadcastMessage("You have acquired an ale from your stock.")
    
else
    
    Player:SendBroadcastMessage("You've ran out of stock!")
    Player:GossipMenuComplete()
    
end
end
       

if (intid == 5) then
    
    if (poorStew > 0) then
        
        poorStew = poorStew-1
        Player:AddItem(34747, 1)
        Player:SendBroadcastMessage("You have acquired stew from your stock.")
        
        else
    
    Player:SendBroadcastMessage("You've ran out of stock!")
    Player:GossipMenuComplete()
        
    end
end

if (intid == 6) then
    
    if (poorBread > 0) then
        
        poorBread = poorBread-1
        Player:AddItem(35950, 1)
        Player:SendBroadcastMessage("You have acquired bread from your stock.")
        
        else
    
    Player:SendBroadcastMessage("You've ran out of stock!")
    Player:GossipMenuComplete()
        
    end
end

if (intid == 7) then
    
    if (wellAle > 0) then
        
        wellAle = wellAle-1
        Player:AddItem(2686, 1)
        Player:SendBroadcastMessage("You have acquired an ale from your stock.")
        
        else
    
    Player:SendBroadcastMessage("You've ran out of stock!")
    Player:GossipMenuComplete()
        
    end
end

if (intid == 8) then
    
    if (wellStew > 0) then
        
        wellStew = wellStew-1
        Player:AddItem(34747, 1)
        Player:SendBroadcastMessage("You have acquired stew from your stock.")
        
        else
    
    Player:SendBroadcastMessage("You've ran out of stock!")
    Player:GossipMenuComplete()
        
    end
end

if (intid == 9) then
    
    if (wellBread > 0) then
        
        wellBread = wellBread-1
        Player:AddItem(35950, 1)
        Player:SendBroadcastMessage("You have acquired bread from your stock.")
        
        else
    
    Player:SendBroadcastMessage("You've ran out of stock!")
    Player:GossipMenuComplete()
        
    end
end

if (intid == 10) then
    
    if (goodAle > 0) then
        
        goodAle = goodAle-1
        Player:AddItem(2686, 1)
        Player:SendBroadcastMessage("You have acquired an ale from your stock.")
        
        else
    
    Player:SendBroadcastMessage("You've ran out of stock!")
    Player:GossipMenuComplete()
        
    end
end

if (intid == 11) then
    
    if (goodStew > 0) then
        
        goodStew = goodStew-1
        Player:AddItem(34747, 1)
        Player:SendBroadcastMessage("You have acquired stew from your stock.")
        
        else
    
    Player:SendBroadcastMessage("You've ran out of stock!")
    Player:GossipMenuComplete()
    
end
end
    
    if (intid == 12) then
        
        if (goodBread > 0) then
            
            goodBread = goodBread-1
            Player:AddItem(35950, 1)
            Player:SendBroadcastMessage("You have acquired bread from your stock.")
            
            else
    
    Player:SendBroadcastMessage("You've ran out of stock!")
    Player:GossipMenuComplete()
    
end
end  
    
local function restock2(Event, Player, Object, Sender, intid, code, menu_id)
    
    if (intid == 17) then
        if Player:HasItem(190054) then
            Player:RemoveItem(190054)
            
            local PAdifference = poorAle-200
        local poorAle = poorAle+PAdifference
        
        local PSdifference = poorStew-75
        local poorStew = poorStew+PSdifference
        
        local PBdifference = poorBread-100
        local poorBread = poorBread+PBdifference
    end
        
    elseif (intid == 18) then
    if Player:HasItem(190055) then
        Player:RemoveItem(190055)
        
        local WAdifference = wellAle-300
         local wellAle = wellAle+WAdifference
        
         local WSdifference = wellStew-180
         local wellStew = wellStew+WSdifference
        
         local WBdifference = wellBread-200
         local wellBread = wellBread+WBdifference
     end
        
    elseif (intid == 19) then
     if Player:HasItem(190056) then
         Player:RemoveItem(190056)
         
         local GAdifference = goodAle-400
         local goodAle = goodAle+GAdifference
        
         local GSdifference = goodStew-360
         local goodStew = goodStew+GSdifference
        
         local GBdifference = goodBread-400
         local goodBread = goodBread+GBdifference
     end
        
    end
end
        
        if (intid == 2) then
            Player:GossipComplete()
            
        end
        
        if (intid == 3) then
            Player:GossipComplete()
        
        end
        
    end


  
RegisterGameObjectGossipEvent(Food, 1, stoveGossip, 0)
RegisterGameObjectGossipEvent(Food, 2, access, 0)