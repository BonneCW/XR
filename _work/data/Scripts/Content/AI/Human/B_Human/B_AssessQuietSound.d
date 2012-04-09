// *****************************************************************
// B_AssessQuietSound
// ------------------
// aufgerufen durch Wahrnehmung PERC_ASSESSQUIETSOUND 
// (Schrittgeräusche des Spielers oder fallengelassenes Item)
// PERC_DIST_INTERMEDIAT wegen Monster-AI eingestellt, hier verkürzt 
// *****************************************************************

func void B_AssessQuietSound ()
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

	if (C_NpcIsHero(other))
	&& (Unsichtbarkeitsperk == TRUE)
	{
		return;
	};

	// ------ SoundSource ist KEIN NPC (kann fallengelassenes Item sein) ------
	if (!Hlp_IsValidNpc (other))
	{
		return;
	};

	if (CurrentLevel == FREEMINE_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gormgniez_11007_FM))
		{
			return;
		};
	};
	
	// ------- Burgzinnenwachen sollen sich nicht zu Tode stürzen, etc. ------
	if (Npc_GetHeightToNpc(self, other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	
	// ------- Player im Haus und NSC in anderem Stockwerk ------
	if (Wld_GetPlayerPortalGuild() >= GIL_NONE) //also NICHT Draussen (== -1)
	&& (Npc_GetHeightToNpc(self, other) > PERC_DIST_INDOOR_HEIGHT)
	{
		return;
	};

	// ------- Schlafende wecken oder Schritte im Raum hören ------
	if (B_AssessEnterRoom())
	{ 
		return;
	};

	// ------ Torwachen reagiern nicht auf Quiet Sound ------
	if (C_NpcIsGateGuard(self))
	{
		return;
	};

	// ------ NPC ist NICHT hostile (upset-(temp-) oder Gilden-hostile) ------
	// ------ UND hat auch keine Important-Info ------
	if (Npc_GetAttitude(self, other) != ATT_HOSTILE)
	&& (Npc_CheckInfo (self, 1) == FALSE)
	{
		return;
	};

	// ------ NICHT Override-Enemies ------
	if (Npc_GetAttitude(self, other) == ATT_HOSTILE)
	&& ( 	(self.aivar[AIV_EnemyOverride] == TRUE)
		||  ( C_PlayerIsFakeBandit(self, other) && (self.guild == GIL_BDT) )
	   )
	{
		return;
	};

	// ------ NPC kann Soundquelle sehen ------
	if (Npc_CanSeeSource(self))							//Sichtcheck EINMAL in der Sekunde (Programm sendet Wahrnehmung EINMAL in der Sekunde, wenn der Spieler sich bewegt)
	{
		return;
	};	
	
	// FUNC
	
	Npc_ClearAIQueue 	(self);
	B_ClearPerceptions	(self);
	AI_StartState 		(self, ZS_ObservePlayer, 1, "");	//NSC steht sauber auf
	return;
};	

