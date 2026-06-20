_G.SlapFastNoCooldown = not _G.SlapFastNoCooldown

if _G.SlapFastNoCooldown then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Slap No Cooldown", 
        Text = "Đã BẬT - Tát Siêu Tốc Không Hồi Chiêu", 
        Duration = 3
    })
    
    task.spawn(function()
        while _G.SlapFastNoCooldown do
            -- Xóa bỏ hoàn toàn thời gian chờ task.wait() lớn, ép vòng lặp chạy ở tốc độ tối đa của game
            game:GetService("RunService").Heartbeat:Wait() 
            
            pcall(function()
                local lp = game.Players.LocalPlayer
                local char = lp.Character
                local tool = char:FindFirstChildOfClass("Tool") or lp.Backpack:FindFirstChildOfClass("Tool")
                
                if tool and char:FindFirstChild("HumanoidRootPart") then
                    -- Tự động lấy vũ khí ra tay nếu đang cất trong balo
                    if tool.Parent == lp.Backpack then 
                        tool.Parent = char 
                    end
                    
                    -- Quét tìm đối thủ trong phạm vi
                    for _, p in ipairs(game.Players:GetPlayers()) do
                        if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            local distance = (char.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude
                            
                            -- Nếu đối thủ nằm trong tầm đánh (18 studs)
                            if distance < 18 then
                                -- BỎ QUA COOLDOWN: Ép vũ khí chuyển trạng thái sẵn sàng liên tục
                                if tool:FindFirstChild("Grip") or tool:FindFirstChild("Click") then
                                    tool.Grip = CFrame.new(0, 0, 0) -- Reset vị trí cầm để tránh lỗi hoạt ảnh
                                end
                                
                                -- Kích hoạt tát liên thanh không giới hạn
                                tool:Activate()
                            end
                        end
                    end
                end
            end)
        end
    end)
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Slap No Cooldown", 
        Text = "Đã TẮT", 
        Duration = 2
    })
end
