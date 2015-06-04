// ****************************************************
// B_MM_AssessOthersDamage
// -----------------------
// wird auch von beschworenen Monstern benutzt,
// die die Atitüde zum SC auf FRIENDLY gesetzt bekommen
// ****************************************************

func void B_AssessOthersDamage ()
{
	//EXIT IF...

	B_Vergiftet (self);

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_534_KDF_Milten_NW))
		&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Troll_Black))
		{
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_534_KDF_Milten_NW))
		&& (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Troll_Black))
		{
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

	if (self.guild == GIL_DMT)
	&& (CurrentLevel == FLIEGENDEINSEL_ZEN)
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
	
	// ------ wenn ich zu weit weg bin ------	//wichtig für Aufruf über FIGHTSOUND aus ZS_MM_Rtn_Summoned
	if (Npc_GetDistToNpc (self, victim) > PERC_DIST_INTERMEDIAT)
	{
		if (Npc_GetDistToNpc (self, other) > PERC_DIST_INTERMEDIAT)
		&& (self.guild != GIL_KDF)
		{
			return;
		};
	};
	
	// ------ wenn Opfer hinter Wand ------
	if (!Npc_CanSeeNpcFreeLOS(self, victim)) //Sichtckeck i.d.R. nur einmal pro Kampf, da in den Folge-ZS (z.B. ZS_Attack) keine OthersDamage-Wahrnehmung angemeldet ist 
	{
		return;
	};

	if (C_IsBandit(self))
	&& (C_NpcIsHero(other))
	{
		return;
	};
	
	// ------ Party-Monster -----
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		// ------ Player wird angegriffen ------
		if (Npc_IsPlayer (victim))
		{
			Npc_ClearAIQueue	(self);
			B_ClearPerceptions	(self);
			B_Attack	(self, other, AR_NONE, 0);
			return;
		};
		
		// ------ Player greift an ------
		if (Npc_IsPlayer (other))
		&& (!Npc_IsDead (victim)) //Funktion wird auch über AssessMurder angesprungen
		{
			Npc_ClearAIQueue	(self);
			B_ClearPerceptions	(self);
			B_Attack	(self, victim, AR_NONE, 0);
			return;
		};
	};
	
	//FUNC

	if (C_NpcIsHero(other))
	&& (Npc_IsInState(victim, ZS_Knockout))
	&& (Wld_GetGuildAttitude(self.guild, victim.guild) != ATT_HOSTILE)
	&& (self.npctype != NPCTYPE_FRIEND)
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (victim.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (Npc_CanSeeNpc(self, other))
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);
		B_Attack	(self, other, AR_ReactToDamage, 0);
		return;
	};

	// ------ Freund wird angegriffen ------
	if (Wld_GetGuildAttitude(self.guild, victim.guild) == ATT_FRIENDLY)
	&& (Wld_GetGuildAttitude(self.guild, other.guild) != ATT_FRIENDLY) //kein Kampf zwischen Freunden
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);		
		B_Attack	(self, other, AR_NONE, 0);
		return;
	};
	
	// ------ Freund greift an ------
	if (Wld_GetGuildAttitude(self.guild, other.guild) == ATT_FRIENDLY)
	&& (Wld_GetGuildAttitude(self.guild, victim.guild) != ATT_FRIENDLY)  //kein Kampf zwischen Freunden
	&& (!Npc_IsDead (victim)) //Funktion wird auch über AssessMurder angesprungen
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);
		B_Attack	(self, victim, AR_NONE, 0);
		return;
	};

	if (CurrentLevel == PATHERION_ZEN)
	&& (self.guild == GIL_KDF)
	&& (other.guild != GIL_KDF)
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);
		B_Attack	(self, other, AR_GuildEnemy, 0);
		return;
	};
};
