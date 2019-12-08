// **************************************************
// B_MM_AssessEnemy
// ----------------
// Monster nehmen andere Monster und Humans NUR wahr, 
// wenn sie ATT_HOSTILE gesetzt haben
// (oder wenn sie oder ein Freund getroffen werden)
// Beutetiere nehmen Jäger über PERC_ASSESSWARN wahr
// --------------------------------------------------
// Orcs greifen direkt an
// **************************************************

func void B_MM_AssessEnemy ()
{
	// EXIT IF...

	B_Vergiftet (self);

	if (!Hlp_IsValidNpc(other)) {
		return;
	};
	
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Krauttroll) && Mod_Leichengase_Kraut < 7) {
		return;
	};

	if (Npc_IsInState(other, ZS_Unconscious)) {
		return;
	};
	
	if (CutsceneAn == TRUE) {
		return;
	};
	
	if (CurrentLevel == HALLUZINATION_ZEN) {
		return;
	};
	
	if (CurrentLevel == XERESWELT_ZEN) {
		if (Kapitel == 6 && Npc_GetHeightToNpc(self, other) > 1000) {
			return;
		};
	};

	if (CurrentLevel == EISGEBIET_ZEN) {
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wolf_Griselda_01))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Blutfliege_Griselda_01))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Blutfliege_Griselda_02))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Spinne_Griselda_01))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Spinne_Griselda_02))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Swampgolem_Griselda_01))
		&& (Npc_GetDistToWP(other, "HEXE_ARENA") > 1000) {
			return;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Firegolem_Griselda_01))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Icegolem_Griselda_01))
		&& (Npc_GetDistToWP(other, "HEXE_ARENA") > 500) {
			if (IceGolem_Attacking_FireGolem == FALSE && FireGolem_Attacking_IceGolem == FALSE) {
				return;
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Firegolem_Griselda_01))
		&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Icegolem_Griselda_01)) {
			return;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Icegolem_Griselda_01))
		&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Firegolem_Griselda_01)) {
			return;
		};
		
		if (RidingLorry == TRUE) {
			Npc_ClearAIQueue(self);
			Npc_SetTarget		(self, other);
			B_ClearPerceptions	(self);
			AI_StartState 		(self, ZS_MM_Flee, 0, "");
			return;
		};
	};

	// Tiere nehmen Gegner, die schleichen und nicht im Sichtfeld sind erst viel später wahr

	if (Npc_GetWalkMode(other) == NPC_SNEAK)
	&& (Npc_CanSeeNpc(self, other))
	&& (Npc_GetDistToNpc(self, other) > self.senses_range/2)
	{
		return;
	};

	if (CurrentLevel == MINENTAL_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11058_Demon_MT))
		&& (!Npc_KnowsInfo(hero, Info_Mod_DemonChromanin_Hi))
		{
			return;
		};
	};

	if (self.aivar[AIV_MM_REAL_ID] == ID_SCHAEFERHUND)
	{
		return;
	};

	if (CurrentLevel == DRAGONISLAND_ZEN)
	{
		if (self.guild == GIL_DEMON)
		&& (!Npc_KnowsInfo(hero, Info_Mod_Demonlord_IR_Hi))
		{
			return;
		};
	};

	if (CurrentLevel == RELENDEL_ZEN)
	{
		if (self.aivar[AIV_MM_REAL_ID] == ID_Insekt)
		&& (!Npc_KnowsInfo(hero, Info_Mod_Axon_Plagenquest))
		{
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wolf_Rotkaeppchen))
		&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_TIER] == TRUE)
		&& (C_NpcIsHero(other))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Wolf_Rotkaeppchen_NimmMich))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Wolf_Rotkaeppchen_NimmSie))
		{
			Npc_SendSinglePerc(hero, self, PERC_ASSESSTALK);
			return;
		};
		
		if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_7657_OUT_Suchender_REL))
		|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_7656_OUT_Suchender_REL))
		|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_7651_OUT_Suchender_REL))
		|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_7658_OUT_Suchender_REL)) {
			return;
		};
	};

	if (other.guild == GIL_DRACONIAN)
	&& (self.guild == GIL_SWAMPSHARK)
	{
		return;
	};

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Kleindrache))
		|| ((self.aivar[AIV_MM_REAL_ID] == ID_KOBOLD)
		&& (Npc_GetDistToWP(self, "LICH") > 2000))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11011_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11019_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11020_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11021_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11022_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Feuerdrache_11002_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Knucker_11001_NW)))
		&& (Npc_KnowsInfo(hero, Info_Mod_Dragon_Kamm))
		{
			self.flags = 0;
			Npc_ClearAIQueue	(self);
			Npc_SetTarget		(self, other);
			B_ClearPerceptions	(self);
			AI_StartState 		(self, ZS_MM_Attack, 0, "");
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Kobold_11000_NW))
		&& (Mod_NL_Siegelbuch > 5)
		{
			return;
		};

		if (C_NpcIsHero(other))
		&& (Mod_WM_Kontrolled > 0)
		&& ((C_NpcIsAdanosStoryMonster(self))
		|| (Npc_GetDistToWP(hero, "NW_FARM2_TAVERNCAVE1_02") < 1000))
		{
			return;
		};

		// Sherome should be ignored by monsters on his way home
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schaeferhund_Lobart_01))
		|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Schaeferhund_Lobart_01)))
		&& (Npc_KnowsInfo(hero, Info_Mod_Schaeferhund_Lobart_Hi))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Lobart_SheromeDa)) {
			return;
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Minenzwerg_01))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Minenzwerg_02))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Minenzwerg_03))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Minenzwerg_04))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dschinn_11012_FM))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dschinn_11013_OM))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dschinn_11014_VM))
	{
		return;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Kleindrache))
	&& (Mod_NL_HasKamm >= 4)
	{
		self.flags = 0;
	};

	if (self.aivar[AIV_MM_REAL_ID] == ID_KOBOLD)
	&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Kobold_11000_NW))
	{
		return;
	};

	if (CurrentLevel == ORCGRAVEYARD_ZEN)
	{
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_01))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_02))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_03))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_04))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_05))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_06))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7261_PSINOV_Novize_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7262_PSINOV_Novize_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7263_PSINOV_Novize_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7264_PSINOV_Novize_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_10033_ORC_UndeadShamane_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7265_GUR_BaalTavor_OGY)))
		&& (Mod_NL_BarriereAttack == 0)
		{
			return;
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

	if (self.guild == GIL_STONEGUARDIAN)
	&& (Mod_BEL_Bshydal < 4)
	&& (hero.guild == GIL_KDF)
	{
		return;
	};

	if (self.guild == GIL_ZOMBIE)
	&& (C_NpcIsHero(other))
	&& (HeroIstKeinZombie == FALSE)
	{
		return;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_GDG))
	{
		Npc_RemoveInvItems	(hero, ItAt_SoulStone, 20);
	};

	if (C_NpcIsHero(other))
	&& (self.guild == GIL_DEMON)
	&& (Mod_HeroIstDemon == 1)
	{
		return;
	};

	if (C_NpcIsHero(other))
	&& (Unsichtbarkeitsperk == TRUE)
	{
		return;
	};

	if (C_NpcIsHero(other))
	&& (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1552_SKE_Skelett_DI))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Skelett_Hi))
	{
		return;
	};

	if (C_NpcIsHero(other))
	&& (Feldraeubertrank_Used == TRUE)
	&& (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Giant_Bug))
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
	 

	// ------- Drache greift nicht an, wenn SC LaberAmulett hat ------
	if (self.guild == GIL_DRAGON)
	&& (Npc_HasItems (hero, ItMi_InnosEye_Mis) >= 1)
	{
		return;
	}; 

	if (self.guild == GIL_FRIENDLY_ORC)
	{
		return;
	};
		
	//--------Feind wird toleriert --------
	if (C_OtherIsToleratedEnemy(self, other)) 
	{
		if (self.aivar[AIV_OrkUluMulu] == FALSE)
		{
			AI_TurnToNpc(self, other);
			AI_PlayAni	(self, "T_ANGRY");

			self.aivar[AIV_OrkUluMulu] = TRUE;
		};

		return;
	};
	
	// ------- OVERRIDE für menschliche Enemies ------
	if ((self.aivar[AIV_NoFightParker] == TRUE)	//werden nie angegriffen und greifen auch selbst nicht an.
	|| 	(other.aivar[AIV_NoFightParker] == TRUE))
	{
		return;
	};
	
	// ------- OVERRIDE für menschliche Enemies ------
	if (self.aivar[AIV_EnemyOverride] == TRUE)	//Joly: für Inubis, Skelette in der Krypta und ä.
	&& (other.guild < GIL_SEPERATOR_HUM)
	{
		return;
	};
	
	//Ulu-Mulu bei Orks
	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PC_Hero))
	&& ((self.guild	==	GIL_ORC)
	|| (self.aivar[AIV_MM_REAL_ID] == ID_ORCDOG)
	|| (self.aivar[AIV_MM_REAL_ID] == ID_ORCBITER))
	{
		if (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_10005_Orc_HoshPak_OC) || !Npc_KnowsInfo(hero, Info_Mod_HoshPak_OC_Hi)) {
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
	};
	
	// ------- TESTMODE: Levelinspektor wird ignoriert ------
	var C_NPC PCL; PCL = Hlp_GetNpc(PC_Levelinspektor);
	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PCL))
	{
		return;
	};
	
	// ------ Opfer im Wasser und ich will nicht ins Wasser ------
	if (C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE))
	&& (self.aivar[AIV_MM_FollowInWater] == FALSE)
	{
		return;
	};
	
	// ------- Monster sollen sich zu Tode stürzen, etc. ------
	if (Npc_GetHeightToNpc(self, other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	
	// ------ Spieler ist in ein Monster verwandelt ------
	// ACHTUNG: NSCs haben noch Perm_Attitude zu verwandeltem Player, die Guild-Attitude overridet (d.h. sie sind i.d.R. neutral), weswegen AssessEnemy nicht greift
	if (Npc_IsPlayer (other))
	&& (other.guild > GIL_SEPERATOR_HUM) 
	{
		if (Wld_GetGuildAttitude(self.guild, other.guild) != ATT_HOSTILE)
		{
			return;
		};
	};

	if (B_GetAivar(other, AIV_INVINCIBLE) == TRUE)
	{
		return;
	};
		
	// ------ Monster können nach HINTEN nicht so weit riechen ------
	// --------------------------------------------------------------
	// ------ wenn ich weit riechen kann ------
	if (self.senses_range > PERC_DIST_MONSTER_ACTIVE_MAX)
	{
		// ------ und Feind weit weg ist ------
		if (Npc_GetDistToNpc (self, other) > PERC_DIST_MONSTER_ACTIVE_MAX)
		{
			// ------ und Feind hinter mir ist ------
			if (!Npc_CanSeeNpc(self, other))
			{
				return;
			};
		};
	};
			
	// ------ wenn man sich an mich anschleichen kann ------
	if (self.guild == GIL_ORC)
	|| (self.guild == GIL_FRIENDLY_ORC)
	{
		// ------ und Feind schleicht ------
		if (C_BodyStateContains (other, BS_SNEAK))
		|| (C_BodyStateContains (other, BS_STAND))
		{
			// ------ und Feind hinter mir ist ------
			if (!Npc_CanSeeNpc(self, other))
			{
				return;
			};
		};
	};

	// ------ other hinter Wand ------
	if (!Npc_CanSeeNpcFreeLOS(self,other))
	{
		return;
	};

	// ------ Ich bin ein SUMMONED Monster ------
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		// ------ NpcType_Friend ignorieren ------
		if (other.npctype == NPCTYPE_FRIEND)
		{
			return;
		};
	
		// ------ sonst Enemy IMMER angreifen ------
		Npc_ClearAIQueue	(self);
		Npc_SetTarget		(self, other);
		B_ClearPerceptions	(self);
		AI_StartState 		(self, ZS_MM_Attack, 0, "");
		return;
	};
	
	// ------ Monster greift direkt an ------
	if (self.aivar[AIV_MM_ThreatenBeforeAttack] == FALSE)
	{
		Npc_ClearAIQueue	(self);
		Npc_SetTarget		(self, other);
		B_ClearPerceptions	(self);
		AI_StartState		(self, ZS_MM_Attack, 0, "");
		return;
	};
	
	// ------ in ZS_MM_EatBody - fressendes Monster ignoriert bzw. vertreibt Enemy ------
	if (Npc_IsInState (self, ZS_MM_EatBody))
	{
		// ------ Enemy kommt in die AttackRange (nah) ------
		if (Npc_GetDistToNpc(self, other) <= FIGHT_DIST_MONSTER_ATTACKRANGE) //Stoerenfried ist zu nah an body
		{
			Npc_ClearAIQueue	(self);
			Npc_SetTarget		(self, other);
			B_ClearPerceptions	(self);
			AI_StartState		(self, ZS_MM_Attack, 0, "");
			return;
		};

		return;		
	};
	
	// ------- in ZS_MM_Hunt - wenn in Attack-Range angreifen ------
	if (Npc_IsInState (self, ZS_MM_Hunt))
	{
		if (Npc_GetDistToNpc(self, other) <= FIGHT_DIST_MONSTER_ATTACKRANGE)
		{
			Npc_ClearAIQueue	(self);
			Npc_SetTarget 		(self,other);
			B_ClearPerceptions	(self);
			AI_StartState 		(self, ZS_MM_Attack, 0, "");
			return;
		}
		else
		{
			return;
		};
	};
		
	// ------ Jäger greift Beute immer direkt an ------
	if (C_PredatorFoundPrey(self, other)) 	
	{
		Npc_ClearAIQueue	(self);
		Npc_SetTarget 		(self,other);
		B_ClearPerceptions	(self);
		AI_StartState 		(self, ZS_MM_Hunt, 0, "");
		return;
	};
	
	// ------ Beute flieht vor Jäger (wenn in Droh-Reichweite (Abfrage s.o.) ------
	if (C_PredatorFoundPrey(other, self))
	{
		if (!Npc_IsInState (other, ZS_MM_Hunt))
		&& (Npc_GetDistToNpc (self, other) <= FIGHT_DIST_MONSTER_FLEE)
		{
			Npc_ClearAIQueue	(self);
			Npc_SetTarget 		(self,other);
			B_ClearPerceptions	(self);
			AI_StartState 		(self, ZS_MM_Flee, 0, "");
			return;
		}
		else
		{
			return;
		};
	};
	

	// FUNC

	// ------ Feind bedrohen & wenn zu nah: angeifen ------
	Npc_ClearAIQueue	(self);
	B_ClearPerceptions	(self);
	AI_StartState 		(self, ZS_MM_ThreatenEnemy, 0, "");
	return;
};
