// *********************
// NSC benutzt Ore-Mobsi
// *********************

FUNC VOID ZS_Pick_Ore ()
{
	B_ClearPerceptions	(self);
	
	B_UseHat (self);

	if (self.guild < GIL_SEPERATOR_HUM)
	|| (self.guild == GIL_ZOMBIE)
	{
		Perception_Set_Normal();
	}
	else if (self.guild == GIL_GOBBO)
	{
		Perception_Set_Minenzwerg();
	};
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
   	{
		AI_GotoWP	(self, self.wp);
	};

	if (Npc_HasItems(self, ItMw_2H_Axe_L_01) == 0)
	{
		CreateInvItem (self, ItMw_2H_Axe_L_01);				
	};
	
	EquipItem (self, ItMw_2H_Axe_L_01);
};

FUNC int ZS_Pick_Ore_Loop ()
{
	// ------ Erz Picken ------
	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& ((self.guild < GIL_SEPERATOR_HUM)
	|| (self.guild == GIL_ZOMBIE))
	&& (Wld_IsMobAvailable(self,"ORE"))
	{
		AI_UseMob (self, "ORE", 1);		
	}
	else if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (self.guild == GIL_GOBBO)
	&& (Wld_IsMobAvailable(self,"GOBBOORE"))
	{
		AI_UseMob (self, "GOBBOORE", 1);		
	};

	if (C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (CurrentLevel == RELENDELMINE_ZEN)
	{
		if (Npc_GetStateTime(self) > 5)
		{
			var int Randi;
			Randi = r_max(99);

			if (Randi == 0)
			{
				B_Say_Overlay (self, self, "$RELMINE01");
			}
			else if (Randi == 1)
			{
				B_Say_Overlay (self, self, "$RELMINE02");
			}
			else if (Randi == 2)
			{
				B_Say_Overlay (self, self, "$RELMINE03");
			}
			else if (Randi == 3)
			{
				B_Say_Overlay (self, self, "$RELMINE04");
			}
			else if (Randi == 4)
			{
				B_Say_Overlay (self, self, "$RELMINE05");
			}
			else if (Randi == 5)
			{
				B_Say_Overlay (self, self, "$RELMINE06");
			}
			else if (Randi == 6)
			{
				B_Say_Overlay (self, self, "$RELMINE07");
			}
			else if (Randi == 7)
			{
				B_Say_Overlay (self, self, "$RELMINE08");
			}
			else if (Randi == 8)
			{
				B_Say_Overlay (self, self, "$RELMINE09");
			}
			else if (Randi == 9)
			{
				B_Say_Overlay (self, self, "$RELMINE10");
			}
			else if (Randi == 10)
			{
				B_Say_Overlay (self, self, "$RELMINE11");
			}
			else if (Randi == 11)
			{
				B_Say_Overlay (self, self, "$RELMINE12");
			};

			Npc_SetStateTime	(self, 0);
		};
	};
	
	return LOOP_CONTINUE;
};

FUNC VOID ZS_Pick_Ore_End ()
{
	if (self.guild < GIL_SEPERATOR_HUM)
	|| (self.guild == GIL_ZOMBIE)
	{
		AI_UseMob (self, "ORE", -1);
	}
	else if (self.guild == GIL_GOBBO)
	{
		AI_UseMob (self, "GOBBOORE", -1);
	};
};