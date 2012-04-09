// ********************************************************
// B_MM_AssessPlayer
// -----------------
// Wird von Monstern benutzt, die important-infos haben
// Party-Member blieben stehen
// ********************************************************

func void B_MM_AssessPlayer()
{
	// EXIT IF...

	B_Vergiftet (self);

	if (Npc_IsInState(other, ZS_Unconscious))
	{
		return;
	};

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

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rabbit))
	{
		Npc_ClearAIQueue 	(self);
		B_ClearPerceptions 	(self);
		Npc_SetTarget		(self, other);
		AI_StartState 		(self, ZS_MM_Flee, 0, "");
		return; 
	};

	if (CurrentLevel == EISGEBIET_ZEN)
	{
		if (playerIsTransformed == TRUE)
		&& (Npc_GetDistToWP(hero, "HEXE_ARENA") < 1000)
		{
			Npc_ClearAIQueue	(self);
			Npc_SetTarget		(self, other);
			B_ClearPerceptions	(self);
			AI_StartState 		(self, ZS_MM_Attack, 0, "");
			return;
		};
	};

	if (C_NpcIsHero(other))
	&& (Unsichtbarkeitsperk == TRUE)
	{
		return;
	};

	if (C_NpcIsHero(other))
	&& (Feldraeubertrank_Used == TRUE)
	&& (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Giant_Bug))
	{
		return;
	};

	if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Kleindrache))
	|| (self.aivar[AIV_MM_REAL_ID] == ID_KOBOLD)
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11011_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11019_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11020_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11021_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11022_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Feuerdrache_11002_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Knucker_11001_NW)))
	&& (Mod_NL_HasKamm >= 3)
	{
		self.flags = 0;
		Npc_ClearAIQueue	(self);
		Npc_SetTarget		(self, other);
		B_ClearPerceptions	(self);
		AI_StartState 		(self, ZS_MM_Attack, 0, "");
		return;
	};

	if (C_NpcIsHero(other))
	&& (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1552_SKE_Skelett_DI))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Skelett_Hi))
	{
		return;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dschinn_11012_FM))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dschinn_11013_OM))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dschinn_11014_VM))
	{
		return;
	};
	
	// ------ SC im Dialog ------
	if (other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	
	// ------ Ignorieren, wenn SC tot, ohnmächtig oder in magischem Schlaf ------
	if (C_NpcIsDown (other))
	{
		return;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wisp_Detector))
	&& (WispSearching == WispSearch_Fight)
	{
		if (other.guild > GIL_SEPERATOR_HUM)
		&& (other.guild != GIL_FRIENDLY_ORC)
		&& (other.guild != GIL_SHEEP)
		{
			Npc_ClearAIQueue	(self);
			Npc_SetTarget		(self, other);
			B_ClearPerceptions	(self);
			AI_StartState 		(self, ZS_MM_Attack, 0, "");
			return;
		};
	};
	
	//Ulu-Mulu bei Orks
	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PC_Hero))
	&& ((self.guild	==	GIL_ORC)
	|| (self.aivar[AIV_MM_REAL_ID] == ID_ORCDOG)
	|| (self.aivar[AIV_MM_REAL_ID] == ID_ORCBITER))
	{
		if (C_ScHasEquippedUluMulu())
		{
			if (self.aivar[AIV_OrkUluMulu] == FALSE)
			{
				AI_TurnToNpc(self, other);
				AI_PlayAni	(self, "T_ANGRY");

				self.aivar[AIV_OrkUluMulu] = TRUE;
			};

			return;
		};
	};

	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PC_Hero))
	&& ((self.guild	==	GIL_ORC)
	|| (self.aivar[AIV_MM_REAL_ID] == ID_ORCDOG)
	|| (self.aivar[AIV_MM_REAL_ID] == ID_ORCBITER))
	{
		if (C_ScHasReadiedUluMulu())
		{
			if (self.aivar[AIV_OrkUluMulu] == FALSE)
			{
				AI_TurnToNpc(self, other);
				AI_PlayAni	(self, "T_ANGRY");

				self.aivar[AIV_OrkUluMulu] = TRUE;
			};

			return;
		};
	};	
	
	// FUNC
	
		// ------ Hat Monster Important Info für Spieler? ------
	if (Npc_GetDistToNpc(self,other) <= 700)	//Joly:FINGER WEG!!!!!!!!!!!
	&& (Npc_CheckInfo (self, 1))	//REIHENFOLGE nicht vertauschen! (Check ist dahingehend buggy (darf nicht als erste Abfrage in &&-verknüpfter If-Abfrage stehen))
	{
		// ------ wenn Distanz abh. v. Gilde korrekt ------
		if (self.guild == GIL_DRAGON)
		|| ( (self.guild != GIL_DRAGON) && (Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG) )
		|| (self.guild == GIL_FRIENDLY_ORC)
		{
			// ------- Spieler fällt, schwimmt und taucht NICHT ------
			if  (!C_BodyStateContains(other,BS_FALL))
			&& 	(!C_BodyStateContains(other,BS_SWIM))
			&&  (!C_BodyStateContains(other,BS_DIVE))
			{
				self.aivar[AIV_NpcStartedTalk] = TRUE;
				
				B_AssessTalk(); //Human-AI-Befehl, wird auch von Monstern benutzt
				return;
			};
		};
	};
	
	// ------ Party-Member blieben stehen ------
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (Npc_GetDistToNpc(self,hero) < 500)
		&& (!C_BodyStateContains (self,BS_STAND))
		{
			Npc_ClearAIQueue(self);
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
	};
};

