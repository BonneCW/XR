// **************
// ZS_Gemeuchelt
// **************

func int ZS_Gemeuchelt()
{
	self.aivar[AIV_FreezeStateTime] = 0;
};



func int ZS_Gemeuchelt_Loop ()
{	
	// EXIT LOOP IF...
	
	if (Npc_GetStateTime(self) > 1)
	{
		Npc_ChangeAttribute (self, ATR_HITPOINTS, -99999);

		var C_ITEM rwp;
		rwp = Npc_GetEquippedMeleeWeapon(hero);

		if (Hlp_IsItem(rwp, ItMw_Avaquar) == FALSE)
		{
			Npc_SendPassivePerc	(self, PERC_ASSESSMURDER, self, hero);
		}
		else
		{
			Mod_ASS_AvaquarGemeuchelt = 1;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7100_ASS_Zahit_NW))
		{
			B_StartOtherRoutine	(Mod_7146_ASS_Mustafa_NW, "ATKISTEN");
		};

		// ------ XP ------
		if (Npc_IsPlayer(self))
		&& ((hero.guild == GIL_SHEEP)
		|| (hero.guild == GIL_MEATBUG))	
		&& (hero.aivar[AIV_VictoryXPGiven] == FALSE)
		{
			B_GivePlayerXP (5);			
		
			hero.aivar[AIV_VictoryXPGiven] = TRUE;
		};

		if (Npc_IsPlayer(self))
		&& (hero.aivar[AIV_VictoryXPGiven] == FALSE)
		&& (HeroIstKeinZombie == FALSE)
		{
			if (hero.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)
			{
				B_GivePlayerXP	(15);
			}
			else if (hero.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)
			{
				B_GivePlayerXP	(20);
			}
			else if (hero.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE)
			{
				B_GivePlayerXP	(20);
			};

			hero.aivar[AIV_VictoryXPGiven] = TRUE;
		};

		if ((Npc_IsPlayer(self))
		|| (self.guild == GIL_SUMMONED_GOBBO_SKELETON)	
		|| (self.guild == GIL_SUMMONED_WOLF)	
		|| (self.guild == GIL_SUMMONED_SKELETON)	
		|| (self.guild == GIL_SUMMONED_GOLEM)	
		|| (self.guild == GIL_SUMMONED_DEMON)	
		|| (self.guild == GIL_SUMMONEDGUARDIAN)	
		|| (self.guild == GIL_SUMMONEDZOMBIE)
		|| (C_NpcIsBossmonster(hero))
		|| (self.aivar[AIV_FLUGBLATTVERTEILT] == 1))	
		&& (hero.aivar[AIV_VictoryXPGiven] == FALSE)						
		{
			B_GivePlayerXP (hero.level * XP_PER_VICTORY);			
		
			hero.aivar[AIV_VictoryXPGiven] = TRUE;
		};
	
		if (self.aivar[AIV_PARTYMEMBER] == TRUE)
		&& (self.guild != GIL_SUMMONED_GOBBO_SKELETON)	
		&& (self.guild != GIL_SUMMONED_WOLF)	
		&& (self.guild != GIL_SUMMONED_SKELETON)	
		&& (self.guild != GIL_SUMMONED_GOLEM)	
		&& (self.guild != GIL_SUMMONED_DEMON)	
		&& (self.guild != GIL_SUMMONEDGUARDIAN)	
		&& (self.guild != GIL_SUMMONEDZOMBIE)
		&& (self.aivar[AIV_FLUGBLATTVERTEILT] == 0)
		&& (!C_NpcIsBossmonster(hero))	
		&& (hero.aivar[AIV_VictoryXPGiven] == FALSE)						
		{
			B_GivePlayerXP (hero.level * XP_PER_VICTORY / 2);			
		
			hero.aivar[AIV_VictoryXPGiven] = TRUE;
		};

		if ((Npc_IsPlayer(self))
		|| (self.aivar[AIV_PARTYMEMBER] == TRUE))
		&& (Mod_AutoInventar == TRUE)
		&& (Hlp_GetInstanceID(hero) != Hlp_GetInstanceID(Keiler_Ramsi))
		{
			B_TransferInventory_Weapons (hero, hero);
			B_TransferInventory_Runen (hero, hero);
			B_TransferInventory_Magics (hero, hero);
			B_TransferInventory_Food (hero, hero);
			B_TransferInventory_Potion (hero, hero);
			B_TransferInventory_Docs (hero, hero);
			B_TransferInventory_Misc (hero, hero);
		};

		AI_PlayAniBS	(self, "T_GEMEUCHELT", BS_DEAD);
		return LOOP_END;
	};
	/*if (Npc_GetDistToNpc(self, hero) > 100)
	{
		Npc_SetStateTime(self, 0);
	};*/
	
	// LOOP FUNC
	if (Npc_GetStateTime(self) != self.aivar[AIV_FreezeStateTime])
	{
		self.aivar[AIV_FreezeStateTime] = Npc_GetStateTime(self);
	
		
	};
	
	return	LOOP_CONTINUE;
};


func void ZS_Gemeuchelt_End()
{

};
