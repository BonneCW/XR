
func void zs_Transform_Ratte()
{
	B_ClearPerceptions (self);
	
	B_UseHat (self);

	Npc_PercEnable (self, PERC_ASSESSMAGIC, B_AssessMagic);
	B_ResetAll (self);
	self.aivar[AIV_TAPOSITION] = 0;
	self.aivar[AIV_DropDeadAndKill] = TRUE;
};

func int zs_Transform_Ratte_loop()
{
	if (self.aivar[AIV_TAPOSITION] == 0)
	{
		AI_PlayAni (self, "T_STAND_2_LIGHTNING_VICTIM");
		self.aivar[AIV_TAPOSITION] = 1;
	};
	if ((Npc_GetStateTime (self) > 3) && (self.aivar[AIV_TAPOSITION] == 1))
	{
		AI_PlayAni (self, "T_MAGRUN_2_TRFSHOOT");
		self.aivar[AIV_TAPOSITION] = 2;
		Npc_SetStateTime (self, 0);
	};
	if ((Npc_GetStateTime (self) > 2) && (self.aivar[AIV_TAPOSITION] == 2))
	{
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_Transform_Ratte_end()
{
	var string wp;
	B_ResetAll (self);
	if (!Npc_IsDead (self))
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7405_OUT_Cirio_REL))
		{
			wp = Npc_GetNearestWP (self);
			AI_Teleport (self, "TOT");
			Npc_ExchangeRoutine (self, "TOT");
			Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
			Wld_InsertNpc (Ratte_Cirio, wp);
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7409_OUT_Richard_EIS))
		{
			wp = Npc_GetNearestWP (self);
			AI_Teleport (self, "TOT");
			Npc_ExchangeRoutine (self, "TOT");
			Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
			Wld_InsertNpc (Ratte_Richard, wp);
		};
	};
};