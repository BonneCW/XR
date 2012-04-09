// ************** 
// ZS_MM_FrissFleisch
// **************

func void ZS_MM_FrissFleisch()  
{
	B_ClearPerceptions(self);
	
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
		Npc_PerceiveAll	(Bloodhound_Untier);

		if (Wld_DetectItem (Bloodhound_Untier, ITEM_KAT_FOOD))
		{
			if (Hlp_IsValidItem(item))
			{
				if (Hlp_IsItem(item, ItFoMuttonZombie) == TRUE)
				{
					AI_GotoItem	(Bloodhound_Untier, item);

					/*if (Npc_GetDistToItem(Bloodhound_Untier, item) < 100)
					{
						AI_PlayAni (Bloodhound_Untier, "T_STAND_2_EAT");
						Wld_RemoveItem	(item);
						AI_PlayAni (Bloodhound_Untier, "T_EAT_2_STAND");

						if ((Bloodhound_Untier.attribute[ATR_HITPOINTS] - (Bloodhound_Untier.attribute[ATR_HITPOINTS_MAX]/3)) > 0)
						{
							Bloodhound_Untier.attribute[ATR_HITPOINTS] -= (Bloodhound_Untier.attribute[ATR_HITPOINTS_MAX]/3)+1;
						}
						else
						{
							Bloodhound_Untier.attribute[ATR_HITPOINTS] = 1;
						};
					};*/
				};
			};
		};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_MM_FrissFleisch_End ()
{

};







