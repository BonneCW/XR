// ****************************************************
// B_MM_AssessOthersDamage
// -----------------------
// wird auch von beschworenen Monstern benutzt,
// die die Atitüde zum SC auf FRIENDLY gesetzt bekommen
// ****************************************************

func void B_MM_AssessOthersDamage ()
{
	//EXIT IF...

	B_Vergiftet (self);

	if (C_NpcIsHero(other))
	&& (Unsichtbarkeitsperk == TRUE)
	{		
		hero.flags = 0;

		Unsichtbarkeitsperk = FALSE;

		AI_Teleport	(hero, "PC_HERO");
	};

	if (Npc_IsInState(other, ZS_Unconscious))
	{
		return;
	};

	if (CurrentLevel == ORCGRAVEYARD_ZEN)
	{
		if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_10033_ORC_UndeadShamane_OGY))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Mod_10033_ORC_UndeadShamane_OGY))
		|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_01))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_01))
		|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_02))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_02))
		|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_03))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_03))
		|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_04))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_04))
		|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_05))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_05))
		|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_06))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_06))
		{
			if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_01))
			|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_02))
			|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_03))
			|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_04))
			|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_05))
			|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_06))
			{
				B_Attack	(UndeadOrcWarrior_Geiselwache_01, Mod_7261_PSINOV_Novize_OGY, AR_Kill, 0);
				B_Attack	(UndeadOrcWarrior_Geiselwache_02, Mod_7262_PSINOV_Novize_OGY, AR_Kill, 0);
				B_Attack	(UndeadOrcWarrior_Geiselwache_03, Mod_7263_PSINOV_Novize_OGY, AR_Kill, 0);
				B_Attack	(UndeadOrcWarrior_Geiselwache_04, Mod_7264_PSINOV_Novize_OGY, AR_Kill, 0);
				B_Attack	(UndeadOrcWarrior_Geiselwache_05, Mod_7265_GUR_BaalTavor_OGY, AR_Kill, 0);
			};
		};
	};
	
	if (CurrentLevel == ADDONWORLD_ZEN) {		
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7315_BK_Bshydal_AW))
		&& ((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Blutgolem_02))
		|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Blutgolem_03))) {
			return;
		};
		
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7315_BK_Bshydal_AW))
		&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Blutgolem_02)) {
			return;
		};
		
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7315_BK_Bshydal_AW))
		&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Blutgolem_03)) {
			return;
		};
	};
	
	// ------ wenn ich zu weit weg bin ------	//wichtig für Aufruf über FIGHTSOUND aus ZS_MM_Rtn_Summoned
	if (Npc_GetDistToNpc(self, victim) > PERC_DIST_INTERMEDIAT)
	&& (Npc_GetDistToNpc(self, other) > PERC_DIST_INTERMEDIAT)
	{
		return;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wisp_Detector))
	&& (WispSearching == WispSearch_Fight)
	{
		if (other.guild > GIL_SEPERATOR_HUM)
		&& (other.guild != GIL_FRIENDLY_ORC)
		&& (other.guild != GIL_SHEEP)
		&& (C_NpcIsHero(victim))
		{
			Npc_ClearAIQueue	(self);
			Npc_SetTarget		(self, other);
			B_ClearPerceptions	(self);
			AI_StartState 		(self, ZS_MM_Attack, 0, "");
			return;
		};
	};
	
	// ------ wenn Opfer hinter Wand ------
	if (!Npc_CanSeeNpcFreeLOS(self, victim)) //Sichtckeck i.d.R. nur einmal pro Kampf, da in den Folge-ZS (z.B. ZS_Attack) keine OthersDamage-Wahrnehmung angemeldet ist 
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
			Npc_SetTarget		(self, other);
			AI_StartState		(self, ZS_MM_Attack, 0, "");
			return;
		};
		
		// ------ Player greift an ------
		if (Npc_IsPlayer (other))
		&& (!Npc_IsDead (victim)) //Funktion wird auch über AssessMurder angesprungen
		{
			Npc_ClearAIQueue	(self);
			B_ClearPerceptions	(self);
			Npc_SetTarget		(self, victim);
			AI_StartState		(self, ZS_MM_Attack, 0, "");
			return;
		};
	};

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schaeferhund_Pepe))
		&& ((Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Mod_793_BAU_Pepe_NW))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Sheep))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Hammel)))
		{
			Npc_ClearAIQueue	(self);
			B_ClearPerceptions	(self);
			Npc_SetTarget	(self, other);
			AI_StartState	(self, ZS_MM_Attack, 0, "");
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schaeferhund_Balthasar))
		&& ((Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Mod_101_BAU_Balthasar_NW))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Sheep))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Hammel)))
		{
			Npc_ClearAIQueue	(self);
			B_ClearPerceptions	(self);
			Npc_SetTarget	(self, other);
			AI_StartState	(self, ZS_MM_Attack, 0, "");
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schaeferhund_Maleth))
		&& ((Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Mod_911_BAU_Maleth_NW))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Sheep))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Hammel)))
		{
			Npc_ClearAIQueue	(self);
			B_ClearPerceptions	(self);
			Npc_SetTarget	(self, other);
			AI_StartState	(self, ZS_MM_Attack, 0, "");
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schaeferhund_Lobart_01))
		&& ((Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Mod_910_BAU_Lobart_NW))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Sheep))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Hammel)))
		{
			Npc_ClearAIQueue	(self);
			B_ClearPerceptions	(self);
			Npc_SetTarget	(self, other);
			AI_StartState	(self, ZS_MM_Attack, 0, "");
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schaeferhund_Malak))
		&& ((Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Mod_767_BAU_Malak_NW))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Sheep))
		|| (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Hammel)))
		{
			Npc_ClearAIQueue	(self);
			B_ClearPerceptions	(self);
			Npc_SetTarget	(self, other);
			AI_StartState	(self, ZS_MM_Attack, 0, "");
			return;
		};
	};
	
	// ------ Sonderfall: Wolf ------
	if (self.guild == GIL_WOLF)
	{
		if (victim.guild == GIL_WOLF)
		&& (other.guild == GIL_WOLF)
		&& (Npc_IsPlayer(other))
		&& (Npc_IsDead (victim)) 
		{
			Npc_ClearAIQueue	(self);
			B_ClearPerceptions	(self);
			self.start_aistate = ZS_MM_Rtn_Summoned;
			AI_StartState (self, ZS_MM_Rtn_Summoned, 0, "");
			return;
		};
	};
	
	//FUNC
	
	if (self.guild == GIL_STONEGUARDIAN)
	&& (victim.guild == GIL_STONEGUARDIAN)
	&& (self.aivar[AIV_EnemyOverride] == TRUE)
	{
		B_AWAKE_STONEGUARDIAN (self);
	};	

	// ------ Freund wird angegriffen ------
	if (Wld_GetGuildAttitude(self.guild, victim.guild) == ATT_FRIENDLY)
	&& (Wld_GetGuildAttitude(self.guild, other.guild) != ATT_FRIENDLY) //kein Kampf zwischen Freunden
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);
		Npc_SetTarget		(self, other);
		AI_StartState		(self, ZS_MM_Attack, 0, "");
		return;
	};
	
	// ------ Freund greift an ------
	if (Wld_GetGuildAttitude(self.guild, other.guild) == ATT_FRIENDLY)
	&& (Wld_GetGuildAttitude(self.guild, victim.guild) != ATT_FRIENDLY)  //kein Kampf zwischen Freunden
	&& (!Npc_IsDead (victim)) //Funktion wird auch über AssessMurder angesprungen
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);
		Npc_SetTarget		(self, victim);
		AI_StartState		(self, ZS_MM_Attack, 0, "");
		return;
	};
};
