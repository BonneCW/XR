// ****************************************************
// B_AssessUseMob
// --------------
// wird durch Wahrnehmung ASSESSUSEMOB aufgerufen
// wird von ÜBERALL her aufgerufen (auch von ZS_Attack)
// ****************************************************

func void B_AssessUseMob ()
{
	// EXIT IF...

	var string detMob; detMob = Npc_GetDetectedMob(other);

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
	
	// ------ other ist NICHT der Spieler ------
	if (!Npc_IsPlayer (other)) 
	{
		return;
	};

	if (Hlp_StrCmp(detMob, "BEDHIGH") == TRUE)
	&& (Npc_IsDetectedMobOwnedByNpc(other, self))
	{
		AI_TurnToNpc	(self, other);

		if (Npc_CanSeeNpc(self, other))
		{
			B_Say	(self, other, "$GETOUTOFMYBED");

			AI_UseMob (other, "BEDHIGH", -1);

			return;
		};
	};

	if (Hlp_StrCmp(detMob, "BEDLOW") == TRUE)
	&& (Npc_IsDetectedMobOwnedByNpc(other, self))
	{
		AI_TurnToNpc	(self, other);

		if (Npc_CanSeeNpc(self, other))
		{
			B_Say	(self, other, "$GETOUTOFMYBED");

			AI_UseMob (other, "BEDLOW", -1);

			return;
		};
	};

	if (Hlp_StrCmp(detMob, "BED") == TRUE)
	&& (Npc_IsDetectedMobOwnedByNpc(other, self))
	{
		AI_TurnToNpc	(self, other);

		if (Npc_CanSeeNpc(self, other))
		{
			B_Say	(self, other, "$GETOUTOFMYBED");

			AI_UseMob (other, "BED", -1);

			return;
		};
	};

	if (C_NpcIsHero(other))
	&& (Unsichtbarkeitsperk == TRUE)
	{		
		hero.flags = 0;

		Unsichtbarkeitsperk = FALSE;

		AI_Teleport	(hero, "PC_HERO");
	};
	
	// ------- Player im Haus und NSC in anderem Stockwerk ------
	if (Wld_GetPlayerPortalGuild() >= GIL_NONE) //also NICHT Draussen (== -1)
	{
		if (Npc_GetHeightToNpc(self, other) > PERC_DIST_INDOOR_HEIGHT)
		{
			return;
		};
	};

	if (!Npc_IsInPlayersRoom (self))
	{
		return;
	};

	if (self.npctype == NPCTYPE_FRIEND)
	{
		return;
	};
	
	// ------ ignorieren, wenn NSC-Gilde freundlich zu Taeter-Gilde ------
	if (Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
	{
		if (Npc_IsDetectedMobOwnedByNpc(other, self))
		{
			//weiter (kein Abbruch bei persönlichem Besitz)
		}
		else
		{
			return;
		};		
	};

	// ------ Mob gehörte mir nicht ------
	if (!C_IsUsedMobMyPossession (self, other))
	{
		return;
	};

	AI_TurnToNpc	(self, other);
	
	// ------ NSC kann Taeter NICHT sehen ------
	if (!Npc_CanSeeNpc (self, other))
	{
		return;
	};
	
	// ------ nur bestimmte Mobsis ------
	//var string detMob; detMob = Npc_GetDetectedMob(other);
	
	if (Hlp_StrCmp(detMob, "CHESTBIG") == FALSE)
	&& (Hlp_StrCmp(detMob, "CHESTSMALL") == FALSE)
	{
		return;
		
		/*
		// ------ bei unwichtigen Mobs ------
		if (Hlp_StrCmp(detMob, "BEDHIGH") == TRUE)
		|| (Hlp_StrCmp(detMob, "LEVER") == TRUE)
		|| (Hlp_StrCmp(detMob, "TOUCHPLATE") == TRUE)
		|| (Hlp_StrCmp(detMob, "TURNSWITCH") == TRUE)
		|| (Hlp_StrCmp(detMob, "VWHEEL") == TRUE)
		|| (Hlp_StrCmp(detMob, "LAB") == TRUE)
		|| (Hlp_StrCmp(detMob, "RMAKER") == TRUE)
		|| (Hlp_StrCmp(detMob, "BSANVIL") == TRUE)
		|| (Hlp_StrCmp(detMob, "BSFIRE") == TRUE)
		|| (Hlp_StrCmp(detMob, "STOVE") == TRUE)
		|| (Hlp_StrCmp(detMob, "PAN") == TRUE)
		|| (Hlp_StrCmp(detMob, "HERB") == TRUE) //BAUMSAEGE CAULDRON SMOKE BOOK BSCOOL BSSHARP SDW
		{
			B_Say (self, other, "$BLA"); //***Fixme*** Raus aus meinem Bett!
		};
		
		return;
		*/
	};
	
	// ------ ignore THEFT ------
	if (!C_WantToAttackThief(self, other))
	{
		// ------ Torwachen greifen nicht an, memorizen aber News ------
		if (C_NpcIsGateGuard(self))
		{
			B_MemorizePlayerCrime (self, other, CRIME_THEFT);
		};
		
		return;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_746_NONE_Ramirez_NW))
	&& (Npc_GetDistToWP(hero, "NW_CITY_ANDRE") < 1000)
	{
		return; // Ramirez ignoriert Truhe knacken bei Lord Andre
	};
		
	
	// FUNC

	B_Attack (self, other, AR_UseMob, 0);						//angreifen oder fliehen
	return;
};



