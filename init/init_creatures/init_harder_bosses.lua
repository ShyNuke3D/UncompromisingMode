--BeeQueen now has AOE -Axe
AddPrefabPostInit("beequeen", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return
	end
    if inst.components.combat ~= nil then
		local function isnotbee(ent)
			if ent ~= nil and not ent:HasTag("bee") and not ent:HasTag("hive") then -- fix to friendly AOE: refer for later AOE mobs -Axe
				return true
			end
		end
        inst.components.combat:SetAreaDamage(TUNING.DEERCLOPS_AOE_RANGE/2, TUNING.DEERCLOPS_AOE_SCALE, isnotbee) -- you can edit these values to your liking -Axe
    end                                     
end)

AddPrefabPostInit("deerclops", function(inst)
	local function GetHeatFn(inst)
		return -40
	end

	if not GLOBAL.TheWorld.ismastersim then
		return
	end
	
	inst:RemoveComponent("freezable")
	
	inst:AddComponent("heater")
    inst.components.heater.heatfn = GetHeatFn
    inst.components.heater:SetThermics(false, true)
	
	inst:AddComponent("groundpounder")
	inst.components.groundpounder.destroyer = true
	inst.components.groundpounder.damageRings = 2
    inst.components.groundpounder.destructionRings = 2
    inst.components.groundpounder.platformPushingRings = 2
    inst.components.groundpounder.numRings = 3
	inst.components.groundpounder.groundpoundfx = "deerclops_ground_fx"
end)

AddPrefabPostInit("bearger", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return
	end
	
	if inst.components.groundpounder then
		inst.components.groundpounder.sinkhole = true
	end
end)

AddPrefabPostInit("spiderqueen", function(inst)
	inst.entity:AddGroundCreepEntity()
	
	if not GLOBAL.TheWorld.ismastersim then
		return
	end
	
	inst.GroundCreepEntity:SetRadius(2)
end)
------------

AddStategraphState("deerclops",
	GLOBAL.State{
        name = "fall",
        tags = {"busy"},
        onenter = function(inst, data)
			inst.Physics:SetDamping(0)
            inst.Physics:SetMotorVel(0,-20+math.random()*10,0)
            inst.AnimState:PlayAnimation("idle_loop", true)
        end,
        
        onupdate = function(inst)
            local pt = Point(inst.Transform:GetWorldPosition())
            if pt.y < 2 then
				inst.Physics:SetMotorVel(0,0,0)
				
				inst.components.groundpounder:GroundPound()
				
				local sinkhole = GLOBAL.SpawnPrefab("antlion_sinkhole")
				sinkhole.Transform:SetScale(1.2, 1.2, 1.2)
				sinkhole.Transform:SetPosition(pt.x, 0, pt.z)
				


                pt.y = 0

                inst.Physics:Stop()
				inst.Physics:SetDamping(5)
                inst.Physics:Teleport(pt.x,pt.y,pt.z)
	            inst.DynamicShadow:Enable(true)
                inst.sg:GoToState("idle")
            end
        end,
    }
)

AddComponentPostInit("groundpounder", function(self)
	self.sinkhole = false
	_OldDestroyPoints = self.DestroyPoints
	
	function self:DestroyPoints(points, breakobjects, dodamage, pushplatforms)
		local map = GLOBAL.TheWorld.Map

		for k, v in pairs(points) do
			if map:IsPassableAtPoint(v:Get()) then
				if self.sinkhole and GLOBAL.IsNumberEven(k) and #TheSim:FindEntities(v.x, 0, v.z, 5, { "antlion_sinkhole_blocker" }) == 0 then
					local sinkhole = GLOBAL.SpawnPrefab("antlion_sinkhole")
					sinkhole.Transform:SetPosition(v.x, 0, v.z)
					sinkhole:PushEvent("startcollapse")
				end
			end
		end
		
		return _OldDestroyPoints(self, points, breakobjects, dodamage, pushplatforms)
	end
end)

