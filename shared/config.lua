
--██╗░░██╗  ░██████╗░█████╗░██████╗░██╗██████╗░████████╗░██████╗
--╚██╗██╔╝  ██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝
--░╚███╔╝░  ╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░╚█████╗░
--░██╔██╗░  ░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░░╚═══██╗
--██╔╝╚██╗  ██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░██████╔╝
--╚═╝░░╚═╝  ╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░╚═════╝░
-- Support : https://discord.gg/N74Yuq9ARQ

Config = {}

-- Cut
Config.CuttingToolItem = 'brake_cutter' -- Item for cutting brakes
Config.AnimationDict = 'mp_car_bomb' -- anim dict
Config.AnimationName = 'car_bomb_mechanic' -- anim name
Config.ProgressDuration = 1250 -- duration of the progress

-- Fix 
Config.RepairKitItem = 'fixkit' -- item for fixing the brakes
Config.FixAnimationDict = 'mp_car_bomb' -- anim dict
Config.FixAnimationName = 'car_bomb_mechanic' -- anim name
Config.FixProgressDuration = 1250 -- duration of the progress


-- Notifications
Config.BrakesCut = "Brakes Cut"
Config.BrakesCutDesc = "The vehicle's brakes have been cut."
Config.BrakesFixed = "Brakes Repaired"
Config.BrakesFixedDesc = "The vehicle's brakes have been repaired."
Config.Canceled = "Action Canceled"
Config.CanceledDesc = "You canceled the brake cutting/fixing."
Config.NoItem = "No Cutting Tool"
Config.NoItemDesc = "You need a cutting tool to cut the brakes."
Config.NoRepairKit = "No Repair Kit"
Config.NoRepairKitDesc = "You need a repair kit to fix the brakes."
Config.BrakesNotCut = "Brakes Normal"
Config.BrakesNotCutDesc = "The vehicle's brakes are already working fine."
