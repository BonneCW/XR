
func void zs_Transform_Albert_Rabbit()
{
	B_ClearPerceptions (self);
	
	B_UseHat (self);

	Npc_PercEnable (self, PERC_ASSESSMAGIC, B_AssessMagic);
	B_ResetAll (self);
	self.aivar[AIV_TAPOSITION] = 0;
	self.aivar[AIV_DropDeadAndKill] = TRUE;
};

func int zs_Transform_Albert_Rabbit_loop()
{
	if (self.aivar[AIV_TAPOSITION] == 0)
	{
		AI_PlayAni (self, "T_STAND_2_LIGHTNING_VICTIM");
		self.aivar[AIV_TAPOSITION] = 1;

		//Wld_SendTrigger	("VERWANDLUNGSKAMERA_01");

		Mod_AlbertGoesToOrks = 1;
	};
	if ((Npc_GetStateTime (self) > 3) && (self.aivar[AIV_TAPOSITION] == 1))
	{
		AI_PlayAni (self, "T_MAGRUN_2_TRFSHOOT");
		self.aivar[AIV_TAPOSITION] = 2;
		Npc_SetStateTime (self, 0);
	};
	if ((Npc_GetStateTime (self) > 14) && (self.aivar[AIV_TAPOSITION] == 2))
	{
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_Transform_Albert_Rabbit_end()
{
	B_ResetAll (self);
	if (!Npc_IsDead (self))
	{
		Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

		Npc_ClearAIQueue	(self);
		AI_StandUpQuick	(self);
		B_StartOtherRoutine (self, "START");

		AI_Teleport	(self, "WP_OCC_257");
		AI_Teleport	(Mod_7179_BDT_Bandit_OC, "WP_OCC_257");
		AI_Teleport	(Mod_7186_BDT_Morgahard_OC, "WP_OCC_257");
		AI_Teleport	(Mod_7185_BDT_Bandit_OC, "WP_OCC_257");
		AI_Teleport	(Mod_7184_BDT_Esteban_OC, "WP_OCC_257");
		AI_Teleport	(Mod_7183_BDT_Miguel_OC, "WP_OCC_257");
		AI_Teleport	(Mod_7182_BDT_Juan_OC, "WP_OCC_257");
		AI_Teleport	(Mod_7181_BDT_Logan_OC, "WP_OCC_257");
		AI_Teleport	(Mod_7180_BDT_Skinner_OC, "WP_OCC_257");

		AI_Teleport (hero, "WP_OC_START");

		//Wld_SendTrigger	("VERWANDLUNGSKAMERA_02");

		Mod_AlbertGoesToOrks = 1;
	};
};

