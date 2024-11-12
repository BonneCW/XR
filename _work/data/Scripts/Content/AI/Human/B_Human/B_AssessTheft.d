// ***********************************************************
// B_AssessTheft
// -------------
// wird durch Wahrnehmung PERC_ASSESSTHEFT angesprungen
// wir von ÜBERALL her aufgerufen (auch aus ZS_Attack)
// Wenn SC/NSC irgendein Item aufhebt in PERC_DIST_INTERMEDIAT
// ***********************************************************

func void B_AssessTheft ()
{
	// EXIT IF...

	PrintDebug("Theft: 1");

	B_Vergiftet (self);

	/*if (Wld_IsTime(21,00,05,00))
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
	};*/
	PrintDebug("Theft: 2");


	var C_NPC portalowner; portalowner = Wld_GetPlayerPortalOwner();

	if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(portalowner))
	|| (CurrentLevel == RELENDELMINE_ZEN))
	&& (Npc_CanSeeNpc(self, other))
	&& (Npc_GetHeightToNpc(self, other) <= PERC_DIST_INDOOR_HEIGHT)
	{
		B_Attack (self, other, AR_Theft, 0);						//angreifen oder fliehen

		return;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7708_OUT_Ramirez_REL)) {
		return;
	};

	// ------ other ist NICHT der Spieler ------
	if (!Npc_IsPlayer (other))
	{
		return;
	};

	if (self.guild == GIL_DRACONIAN)
	|| (self.guild == GIL_FRIENDLY_ORC)
	|| (self.guild > GIL_SEPERATOR_HUM)
	{
		return;
	};

	if (Wld_GetPlayerPortalGuild() == -1)
	&& (!C_IsTakenItemMyPossession (self, other, item))
	{
		return;
	};

	if (C_NpcIsHero(other))
	&& (Unsichtbarkeitsperk == TRUE)
	{
		return;
	};

	// ------- Player im Haus und NSC in anderem Stockwerk ------
	if (Wld_GetPlayerPortalGuild() >= GIL_NONE) //also NICHT Draussen (== -1)
	&& (Npc_GetHeightToNpc(self, other) > PERC_DIST_INDOOR_HEIGHT)
	{
		return;
	};

	// ------ ignorieren, wenn NSC-Gilde freundlich zu Taeter-Gilde ------
	/*if (Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
	{
		if (Hlp_IsValidItem(item))
		&& (Npc_OwnedByNpc(item, self))
		{
			//weiter (kein Abbruch bei persönlichem Besitz)
		}
		else
		{
			return;
		};
	};*/

	// ------ Item gehörte mir nicht ------
	if (!C_IsTakenItemMyPossession (self, other, item))
	{
		return;
	};

	// ------ NSC kann Taeter NICHT sehen ------
	if (!Npc_CanSeeNpc (self, other))
	{
		if (Npc_IsInPlayersRoom (self))
		&& ( (Npc_IsInState(self, ZS_ObservePlayer)) || (Npc_IsInState(self, ZS_ClearRoom)) )
		{
			//troztdem gesehen!
		}
		else
		{
			return;
		};
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


	// FUNC

	B_Attack (self, other, AR_Theft, 0);						//angreifen oder fliehen

	return;
};
