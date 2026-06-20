_G.SlapAura = not _G.SlapAura
if _G.SlapAura then
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Slap Aura", Text = "Đã BẬT", Duration = 2})
    task.spawn(function()
        while _G.SlapAura do
            task.wait(0.05)
            pcall(function()
                local lp = game.Players.LocalPlayer
                local char = lp.Character
                local tool = char:FindFirstChildOfClass("Tool") or lp.Backpack:FindFirstChildOfClass("Tool")
                if tool and char:FindFirstChild("HumanoidRootPart") then
                    if tool.Parent == lp.Backpack then tool.Parent = char end
                    for _, p in ipairs(game.Players:GetPlayers()) do
                        if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            if (char.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude < 18 then
                                tool:Activate()
                            end
                        end
                    end
                end
            end)
        end
    end)
else
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Slap Aura", Text = "Đã TẮT", Duration = 2})
end
