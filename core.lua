local function CreateNewChatWindows()

	-- Rename the 'Combat Log' chat window
    for i = 1, NUM_CHAT_WINDOWS do
        local chatFrame = _G["ChatFrame" .. i]
        local name = chatFrame:GetName()
        if name == "ChatFrame2" then
            FCF_SetWindowName(chatFrame, "Log")
        elseif name == "ChatFrame1" then
            -- Remove the 'Trade' & 'Services' channel from the general window
            ChatFrame_RemoveChannel(chatFrame, "Trade")
			ChatFrame_RemoveChannel(chatFrame, "Services")
			ChatFrame_RemoveMessageGroup(chatFrame, "COMBAT_XP_GAIN")
			ChatFrame_RemoveMessageGroup(chatFrame, "COMBAT_HONOR_GAIN")
			ChatFrame_RemoveMessageGroup(chatFrame, "COMBAT_FACTION_CHANGE")
			ChatFrame_RemoveMessageGroup(chatFrame, "SKILL")
			ChatFrame_RemoveMessageGroup(chatFrame, "LOOT")
			ChatFrame_RemoveMessageGroup(chatFrame, "CURRENCY")
			ChatFrame_RemoveMessageGroup(chatFrame, "MONEY")
			ChatFrame_RemoveMessageGroup(chatFrame, "TRADESKILLS")
        end
    end
	
    -- Create a new chat window
    local instanceWindow = FCF_OpenNewWindow("Instance")
	

    -- Set chat window properties
    FCF_SetWindowName(instanceWindow, "Instance")

    -- Add chat channels to the window
    FCF_SelectDockFrame(instanceWindow)
    ChatFrame_AddMessageGroup(instanceWindow, "PARTY")
    ChatFrame_AddMessageGroup(instanceWindow, "PARTY_LEADER")
    ChatFrame_AddMessageGroup(instanceWindow, "RAID")
    ChatFrame_AddMessageGroup(instanceWindow, "RAID_LEADER")
    ChatFrame_AddMessageGroup(instanceWindow, "RAID_WARNING")
    ChatFrame_AddMessageGroup(instanceWindow, "INSTANCE_CHAT")
    ChatFrame_AddMessageGroup(instanceWindow, "INSTANCE_CHAT_LEADER")
	ChatFrame_AddMessageGroup(instanceWindow, "SYSTEM")

    -- Remove unwanted chat channels
    ChatFrame_RemoveMessageGroup(instanceWindow, "WHISPER")
    ChatFrame_RemoveMessageGroup(instanceWindow, "BN_WHISPER")
    ChatFrame_RemoveMessageGroup(instanceWindow, "GUILD")
    ChatFrame_RemoveMessageGroup(instanceWindow, "YELL")
    ChatFrame_RemoveMessageGroup(instanceWindow, "SAY")
	
	-- Create a new chat window
    local whisperWindow = FCF_OpenNewWindow("Whispers")

    -- Set chat window properties
    FCF_SetWindowName(whisperWindow, "Whispers")

    -- Add chat channels to the window
    FCF_SelectDockFrame(whisperWindow)
    ChatFrame_AddMessageGroup(whisperWindow, "WHISPER")
    ChatFrame_AddMessageGroup(whisperWindow, "BN_WHISPER")

    -- Remove unwanted chat channels
    ChatFrame_RemoveMessageGroup(whisperWindow, "GUILD")
    ChatFrame_RemoveMessageGroup(whisperWindow, "YELL")
    ChatFrame_RemoveMessageGroup(whisperWindow, "SAY")
	ChatFrame_RemoveMessageGroup(whisperWindow, "CHANNEL")
	ChatFrame_RemoveMessageGroup(whisperWindow, "PARTY")
	ChatFrame_RemoveMessageGroup(whisperWindow, "PARTY_LEADER")
	
	-- Create a new chat window
    local lootWindow = FCF_OpenNewWindow("Loot / Trade")

    -- Set chat window properties
    FCF_SetWindowName(lootWindow, "Loot / Trade")
	
    -- Add chat channels to the window
    FCF_SelectDockFrame(lootWindow)
    ChatFrame_AddMessageGroup(lootWindow, "COMBAT_XP_GAIN")
    ChatFrame_AddMessageGroup(lootWindow, "COMBAT_HONOR_GAIN")
    ChatFrame_AddMessageGroup(lootWindow, "COMBAT_FACTION_CHANGE")
    ChatFrame_AddMessageGroup(lootWindow, "SKILL")
    ChatFrame_AddMessageGroup(lootWindow, "LOOT")
    ChatFrame_AddMessageGroup(lootWindow, "CURRENCY")
    ChatFrame_AddMessageGroup(lootWindow, "MONEY")
    ChatFrame_AddChannel(lootWindow, "Trade")
	ChatFrame_AddChannel(lootWindow, "Services")
	ChatFrame_AddChannel(lootWindow, "General")

    -- Remove unwanted chat channels
    ChatFrame_RemoveMessageGroup(lootWindow, "GUILD")
    ChatFrame_RemoveMessageGroup(lootWindow, "YELL")
	ChatFrame_RemoveMessageGroup(lootWindow, "WHISPER")
    ChatFrame_RemoveMessageGroup(lootWindow, "BN_WHISPER")
    ChatFrame_RemoveMessageGroup(lootWindow, "SAY")
	ChatFrame_RemoveMessageGroup(lootWindow, "CHANNEL")
	ChatFrame_RemoveMessageGroup(lootWindow, "PARTY")
	ChatFrame_RemoveMessageGroup(lootWindow, "PARTY_LEADER")

	-- Undock and redock 'Notifications' above the default chat frame
    FCF_UnDockFrame(lootWindow)

	-- Reload
	ReloadUI()
	
end

-- Register a slash command
SLASH_MYCHATCOMMAND1 = "/mychat"
SlashCmdList["MYCHATCOMMAND"] = CreateNewChatWindows
