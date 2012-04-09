// ************** 
// ZS_MM_Rtn_Roam
// **************

var int DrinkCooldown;	// Damit Schafe nicht eine Art Rudeltrinken veranstalten und Schlange bilden :D

func void ZS_MM_Rtn_Roam()
{
	Perception_Set_Monster_Rtn();
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rabbit))
	{
		AI_SetWalkmode	(self, NPC_RUN);
	}
	else
	{
		AI_SetWalkmode 	(self, NPC_WALK);
	};

	B_MM_DeSynchronize();
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE)  //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
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

func int ZS_MM_Rtn_Roam_loop()
{

	if (Npc_KnowsInfo(hero, PC_Fokus1_Einsetzen))
	&& (Npc_HasItems(hero, ItMi_Focus_Troll) == 1)
	{
		Npc_RemoveInvItems	(hero, ItMi_Focus_Troll, 1);
	}
	else if (Npc_KnowsInfo(hero, PC_Fokus2_Einsetzen))
	&& (Npc_HasItems(hero, ItMi_Focus_Meer) == 1)
	{
		Npc_RemoveInvItems	(hero, ItMi_Focus_Meer, 1);
	}
	else if (Npc_KnowsInfo(hero, PC_Fokus3_Einsetzen))
	&& (Npc_HasItems(hero, ItMi_Focus_Stonehenge) == 1)
	{
		Npc_RemoveInvItems	(hero, ItMi_Focus_Stonehenge, 1);
	}
	else if (Npc_KnowsInfo(hero, PC_Fokus4_Einsetzen))
	&& (Npc_HasItems(hero, ItMi_Focus_Kloster) == 1)
	{
		Npc_RemoveInvItems	(hero, ItMi_Focus_Kloster, 1);
	}
	else if (Npc_KnowsInfo(hero, PC_Fokus5_Einsetzen))
	&& (Npc_HasItems(hero, ItMi_Focus_Bergfestung) == 1)
	{
		Npc_RemoveInvItems	(hero, ItMi_Focus_Bergfestung, 1);
	};

	if ((!Wld_IsTime (self.aivar[AIV_MM_RoamStart],00,self.aivar[AIV_MM_RoamEnd],00)) && (self.aivar[AIV_MM_RoamStart] != OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_AllScheduler, 1, "");
		return LOOP_END;
	};
	
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		var int wanderTime;
		wanderTime = Hlp_Random(5);
		Npc_SetStateTime (self, 0);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};

	if (Npc_GetStateTime(self) != self.aivar[AIV_CurrentState])
	{
		self.aivar[AIV_CurrentState] = Npc_GetStateTime(self);

		if (self.aivar[AIV_DrinkCooldown] > 0)
		{
			self.aivar[AIV_DrinkCooldown] -= 1;
		};
	};

	if (Npc_GetStateTime(self) > wanderTime)
	&& (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsNextFPAvailable(self,	"ROAM"))
	{
		AI_GotoNextFP	(self,	"ROAM");
		
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	}
	else if (Npc_GetStateTime(self) > wanderTime)
	&& (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsNextFPAvailable(self,	"FP"))
	{
		AI_GotoNextFP	(self,	"FP");
		
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	}
	else if (C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	{
		if (Npc_GetStateTime(self) > 30)
		{
			AI_UseMob	(self, "EIMER", -1);

			self.aivar[AIV_TAPOSITION] = NOTINPOS;

			self.aivar[AIV_DrinkCooldown] = 300;

			DrinkCooldown = 10;

			if (Wld_IsNextFPAvailable(self,	"ROAM"))
			{
				AI_GotoNextFP	(self,	"ROAM");
		
				self.aivar[AIV_TAPOSITION] = NOTINPOS;
			}
			else if (Wld_IsNextFPAvailable(self,	"FP"))
			{
				AI_GotoNextFP	(self,	"FP");
		
				self.aivar[AIV_TAPOSITION] = NOTINPOS;
			};
		};
	}
	else if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	{
		if (Hlp_Random(1000) <= 5)
		{
			var int randomMove;
			randomMove = Hlp_Random(3);
			if (randomMove == 0) {AI_PlayAni(self, "R_ROAM1");};
			if (randomMove == 1) {AI_PlayAni(self, "R_ROAM2");};
			if (randomMove == 2) {AI_PlayAni(self, "R_ROAM3");};
		}
		else
		{
			if (Hlp_Random(100) < 10)
			{
				if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
				&& (Wld_IsMobAvailable(self,"EIMER"))
				&& (self.guild == GIL_SHEEP)
				&& (self.aivar[AIV_DrinkCooldown] == 0)
				&& (DrinkCooldown == 0)
				{
					AI_UseMob (self, "EIMER", 1);

					Npc_SetStateTime	(self, 0);
				};
			};
		};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Roam_end()
{

};
