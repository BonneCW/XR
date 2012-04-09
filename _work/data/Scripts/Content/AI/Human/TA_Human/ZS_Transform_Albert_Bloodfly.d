
func void zs_Transform_Albert_Bloodfly()
{
	B_ClearPerceptions (self);
	
	B_UseHat (self);

	Npc_PercEnable (self, PERC_ASSESSMAGIC, B_AssessMagic);
	B_ResetAll (self);
	self.aivar[AIV_TAPOSITION] = 0;
	self.aivar[AIV_DropDeadAndKill] = TRUE;
};

func int zs_Transform_Albert_Bloodfly_loop()
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
	if ((Npc_GetStateTime (self) > 2) && (self.aivar[AIV_TAPOSITION] == 2))
	{
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_Transform_Albert_Bloodfly_end()
{
	B_ResetAll (self);
	if (!Npc_IsDead (self))
	{
		//Wld_InsertNpc (Bloodfly_Albert, "WP_MINENTAL_START_ORCCITY");

		Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

		Npc_ClearAIQueue	(self);
		AI_StandUpQuick	(self);
		B_StartOtherRoutine (self, "ATORKS");
		AI_Teleport (self, "WP_MINENTAL_START_ORCCITY");
		//B_StartOtherRoutine (self, "TOT");
		//Wld_InsertNpc (Bloodfly_Hero, "WP_SPAWN_HERO_BLOODFLY");
		AI_Teleport (hero, "WP_SPAWN_HERO_BLOODFLY");

		//Wld_SendTrigger	("VERWANDLUNGSKAMERA_02");

		Mod_AlbertGoesToOrks = 1;
	};
};

