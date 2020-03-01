-- Chat History by Illuminati1260.
local chats = {}
local pos = 0
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local uis = game:GetService("UserInputService")
local connection1
local playerGui = localPlayer.PlayerGui
print('loading xd')
repeat wait(1) until playerGui:FindFirstChild("Chat")
local chatGui = playerGui:FindFirstChild("Chat")
local ChatBar = chatGui.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
print('loaded lol')
localPlayer.Chatted:Connect(function(chat) table.insert(chats,chat) end)
ChatBar.Focused:Connect(function()
	connection1 = uis.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Keyboard then
			if input.KeyCode == Enum.KeyCode.Up then
				pos = pos - 1
				if pos <= 0 then pos = #chats end
				print('Position: '..pos)
				ChatBar.Text = chats[pos]
			elseif input.KeyCode == Enum.KeyCode.Down then
				pos = pos + 1
				if pos > #chats then pos = 1 end
				print('Position: '..pos)
				ChatBar.Text = chats[pos]
			end
		end
	end)
end)
ChatBar.FocusLost:Connect(function()
	connection1:Disconnect()
	connection1 = nil
end)