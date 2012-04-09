func void zs_Rettung_Albert()
{
	B_ClearPerceptions (self);
	
	B_UseHat (self);

	Npc_PercEnable (self, PERC_ASSESSMAGIC, B_AssessMagic);
	B_ResetAll (self);
	self.aivar[AIV_TAPOSITION] = 0;
	self.aivar[AIV_DropDeadAndKill] = TRUE;
};

func int zs_Rettung_Albert_loop()
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
	if ((Npc_GetStateTime (self) > 9) && (self.aivar[AIV_TAPOSITION] == 2))
	{
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_Rettung_Albert_end()
{
	var string wp;
	B_ResetAll (self);

	Npc_ExchangeRoutine (self, "START");

	Wld_InsertNpc	(Mod_7179_BDT_Bandit_OC, "WP_OCC_258");
	Wld_InsertNpc	(Mod_7186_BDT_Morgahard_OC, "WP_OCC_258");
	Wld_InsertNpc	(Mod_7185_BDT_Bandit_OC, "WP_OCC_258");
	Wld_InsertNpc	(Mod_7184_BDT_Esteban_OC, "WP_OCC_258");
	Wld_InsertNpc	(Mod_7183_BDT_Miguel_OC, "WP_OCC_258");
	Wld_InsertNpc	(Mod_7182_BDT_Juan_OC, "WP_OCC_258");
	Wld_InsertNpc	(Mod_7181_BDT_Logan_OC, "WP_OCC_258");
	Wld_InsertNpc	(Mod_7180_BDT_Skinner_OC, "WP_OCC_258");
};

