if SERVER then
  --Affiliated Servers
  AddCSLuaFile("gui/cl_serverswindow.lua")
  AddCSLuaFile("sh_descriptionparagraph.lua")
  AddCSLuaFile("sh_serverlisting.lua")
  include("sh_descriptionparagraph.lua")
  include("sh_serverlisting.lua")
  include("config/sv_serverconfig.lua")
  include("gui/sv_serverswindow.lua")
  --include("net/sv_getserverinfo.lua")
end

if CLIENT then
  include("sh_descriptionparagraph.lua")
  include("sh_serverlisting.lua")
  include("gui/cl_serverswindow.lua")
  concommand.Add("dsm", function() DSM.Gui.MainWindow.drawMainWindow() end)
  
  local function checkForChatCommand(ply, chatMessage)
    if (chatMessage == "!servers") then
        return true
    end
    return false
  end

   hook.Add("OnPlayerChat", "Catch when someone is looking for the server list", function(ply, text, isTeamChat, isDead)
    if (checkForChatCommand(ply, text)) then
      if (LocalPlayer() == ply) then
        ply:ConCommand("dsm")
      end 
      return true
    end
  end)
end