
func void zs_Transform_Wolf()
{
	B_ClearPerceptions (self);
	
	B_UseHat (self);

	Npc_PercEnable (self, PERC_ASSESSMAGIC, B_AssessMagic);
	B_ResetAll (self);
	self.aivar[AIV_TAPOSITION] = 0;
	self.aivar[AIV_DropDeadAndKill] = TRUE;
};

func int zs_Transform_Wolf_loop()
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

func void zs_Transform_Wolf_end()
{
	var string wp;
	B_ResetAll (self);
	if (Npc_GetDistToWP(self, "TOT") < 1000)
	{
		wp = Npc_GetNearestWP (self);
		B_ResetAll (self);

		Npc_ClearAIQueue	(self);
		AI_StandUP	(self);

		AI_Teleport (self, "TOT");
		Npc_ExchangeRoutine (self, "TOT");
		AI_Teleport (self, "TOT");
		//Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_104_BAU_Rega_NW))
		{
			Wld_InsertNpc (Schattenwolf_Rega, wp);
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_783_BAU_Elena_NW))
		{
			Wld_InsertNpc (Schattenwolf_Elena, wp);
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1403_BAU_Baeuerin_NW))
		{
			Wld_InsertNpc (Schattenwolf_Magd, wp);
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7678_OUT_Atalante_NW))
		{
			Wld_InsertNpc (Warg_Atalante2, wp);
		};
	};
};

