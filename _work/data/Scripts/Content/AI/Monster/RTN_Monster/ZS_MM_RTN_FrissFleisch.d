// ************** 
// ZS_MM_FrissFleisch
// **************

func void ZS_MM_FrissFleisch()  
{
	Perception_Set_Monster_Rtn();
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self, NPC_WALK);
	B_MM_DeSynchronize();
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE) //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};

	if (LeisenLaufen_Perk == TRUE)
	{
		if (self.senses_range == PERC_DIST_MONSTER_ACTIVE_MAX)
		{
			self.senses_range = (7*PERC_DIST_MONSTER_ACTIVE_MAX)/10;
		}
		else if (self.senses_range == PERC_DIST_ORC_ACTIVE_MAX)
		{
			self.senses_range = (7*PERC_DIST_ORC_ACTIVE_MAX)/10;
		};
	};
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_MM_FrissFleisch_Loop ()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Bloodhound_Untier))
	{
		Npc_PerceiveAll	(self);

		if (Wld_DetectItem (self, ITEM_KAT_FOOD))
		{
			if (Hlp_IsValidItem(item))
			{
				if (Hlp_IsItem(item, ItFoMuttonZombie) == TRUE)
				{
					AI_GotoItem	(self, item);
					AI_PlayAni (self, "T_STAND_2_EAT");
					Wld_RemoveItem	(item);
					AI_PlayAni (self, "T_EAT_2_STAND");

					B_MagicHurtNpc	(hero, self, self.attribute[ATR_HITPOINTS_MAX]/3);
				};
			};
		};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_MM_FrissFleisch_End ()
{

};







