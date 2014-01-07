// ****************************************************
// B_AssessThreat
// --------------
// Aufgerufen durch Wahrnehmung AssessThreat
// wenn der Spieler(!) mit FK-Waffe auf einen NSC zielt
// PERC_DIST_INTERMEDIAT
// ****************************************************

func void B_AssessThreat ()
{
	// EXIT IF...

	B_Vergiftet (self);

	if (Wld_IsTime(21,00,05,00))
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(hero))
	{
		if (!HeroAtLight)
		{
			HeroAtLight = 1 + C_HeroAtLight(); // sekündlich checken, ob Held in der Nähe einer Lampe ist
		};

		if (HeroAtLight == 1)
		{
			if (Npc_GetWalkMode(hero) == NPC_SNEAK)
			{
				if (Npc_GetDistToNpc(self, hero) > 200)
				{
					return;
				};
			}
			else if (Npc_GetWalkMode(hero) == NPC_WALK)
			{
				if (Npc_GetDistToNpc(self, hero) > 300)
				{
					return;
				};
			}
			else
			{
				if (Npc_GetDistToNpc(self, hero) > 400)
				{
					return;
				};
			};
		};
	};

	if (self.aivar[AIV_MM_REAL_ID] == ID_KOBOLD) {
		return;
	};

	if (C_NpcIsHero(other))
	&& (Unsichtbarkeitsperk == TRUE)
	{
		return;
	};
	
	// ------ weiter weg als PERC_DIST für ASSESSTHREAT ------
	if (Npc_GetDistToNpc(self, other) > PERC_DIST_INTERMEDIAT)
	{
		return;
	};
	
	// ------ NPC kann den Spieler nicht sehen ------			//wird einmal in der Sekunde aufgerufen, weil Programm einmal in der Sekunde Wahrnehmung aussendet
	if (!Npc_CanSeeNpc(self,other))
	{
		return;
	};
	
	// ------ gezogene Waffen sind diesem NPC egal ------
	if (!C_NpcIsBotheredByWeapon (self, other))
	{
		return;
	};
	

	// FUNC 
	
	Npc_ClearAIQueue	(self);
	B_ClearPerceptions	(self);
	AI_StartState 		(self, ZS_ReactToWeapon, 0, "");
	return;
};

