
if hookfunction then 
    task.delay(2,function()
        hookfunction(require(game.ReplicatedStorage.Notification).new,function(v1,v2) 
            v1 = tostring(v1):gsub("<Color=[^>]+>", "") 
            local Nof = game.Players.LocalPlayer.Character:FindFirstChild('Notify') or (function() 
                if not game.Players.LocalPlayer.Character:FindFirstChild('Notify') then 
                    local nof = Instance.new('StringValue',game.Players.LocalPlayer.Character)
                    nof.Name = 'Notify'
                    nof.Value = ''
                    return nof
                end 
            end)()
            Nof.Value = v1 
            local FakeLOL = {}
            function FakeLOL.Display(p18)
                return true;
            end; 
            function FakeLOL.Dead()
            end
            return FakeLOL
        end)   
        task.delay(15,function() 
            warn('Disabling effects') 
            if hookfunction and not islclosure(hookfunction) then 
                for i,v in pairs(require(game.ReplicatedStorage.Effect.Container.Misc.Damage)) do 
                    if typeof(v) == 'function' then 
                        hookfunction(
                            v, 
                            function()
                                return {
                                    Run = function() end,
                                    Stop = function() end,
                                }
                            end
                        )
                    end
                end 
                for i,v in pairs(game.ReplicatedStorage.Assets.GUI:GetChildren()) do 
                    v.Enabled = false 
                end
                hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Death), function()end)
                hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Respawn), function()end)
                hookfunction(require(game:GetService("ReplicatedStorage"):WaitForChild("GuideModule")).ChangeDisplayedNPC,function() end) 
                task.delay(0.1,function()
                    for i,v2 in pairs(game.ReplicatedStorage.Effect.Container:GetDescendants()) do 
                        pcall(function()
                            if v2.ClassName =='ModuleScript' and typeof(require(v2)) == 'function' then 
                                hookfunction(require(v2),function()end)     
                                task.wait(1)
                            end
                        end)
                    end
                end)
            end
        end)
    end)
end
