FUNC VOID B_EXPVerteiler (var C_NPC slf, var C_NPC oth)
{
	// Weder Spieler, noch Partymember, noch Boss, noch mal draufgeschlagen

	if (!Hlp_IsValidNpc(oth)) {
		return;
	};
	
	if (C_NpcIsHero(slf)) {
		if (oth.aivar[AIV_MM_REAL_ID] == ID_UNDEADORCWARRIOR) {
			if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(UndeadOrcWarrior)) {
				Spine_OverallSaveSetInt("UndeadOrcWarrior", 1);
			};
			if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(UndeadOrcPriest)) {
				Spine_OverallSaveSetInt("UndeadOrcPriest", 1);
			};
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(WaterOrc)) {
			Spine_OverallSaveSetInt("WaterOrc", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(OrcWarrior_Roam)) {
			Spine_OverallSaveSetInt("OrcWarrior", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(OrcShaman_Sit) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(OrcShaman_Pray)) {
			Spine_OverallSaveSetInt("OrcShaman", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(OrcElite_Roam) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(OrcElite_Rest)) {
			Spine_OverallSaveSetInt("OrcElite", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Stoneguardian)) {
			Spine_OverallSaveSetInt("Stoneguardian", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Erzguardian)) {
			Spine_OverallSaveSetInt("Erzguardian", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Shadowbeast_Fire)) {
			Spine_OverallSaveSetInt("Shadowbeast_Fire", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Razor)) {
			Spine_OverallSaveSetInt("Razor", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(OrcBiter)) {
			Spine_OverallSaveSetInt("OrcBiter", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Keiler)) {
			Spine_OverallSaveSetInt("Keiler", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Riesenkeiler)) {
			Spine_OverallSaveSetInt("Riesenkeiler", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Icewolf) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(IcewolfEISGEBIET)) {
			Spine_OverallSaveSetInt("Icewolf", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Gobbo_Warrior) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Gobbo_Warrior_Visir)) {
			Spine_OverallSaveSetInt("Gobbo_Warrior", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Giant_DesertRat)) {
			Spine_OverallSaveSetInt("Giant_DesertRat", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Bloodhound)) {
			Spine_OverallSaveSetInt("Bloodhound", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Blattcrawler)) {
			Spine_OverallSaveSetInt("Blattcrawler", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Erznager)) {
			Spine_OverallSaveSetInt("Erznager", 1);
		};
		if (oth.aivar[AIV_MM_REAL_ID] == ID_INSEKT) {
			Spine_OverallSaveSetInt("Insect", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Alligator)) {
			Spine_OverallSaveSetInt("Alligator", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(ZombieRandom) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Zombie_OT)) {
			Spine_OverallSaveSetInt("Zombie", 1);
		};
		if (oth.aivar[AIV_MM_REAL_ID] == ID_ZIEGE) {
			Spine_OverallSaveSetInt("Ziege", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Wolf) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(YWolf)) {
			Spine_OverallSaveSetInt("Wolf", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Riesenwolf)) {
			Spine_OverallSaveSetInt("Riesenwolf", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Wisp)) {
			Spine_OverallSaveSetInt("Wisp", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Warg)) {
			Spine_OverallSaveSetInt("Warg", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(BlackWolf)) {
			Spine_OverallSaveSetInt("BlackWolf", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Waran)) {
			Spine_OverallSaveSetInt("Waran", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Truhe)) {
			Spine_OverallSaveSetInt("Truhe", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Troll_Black)) {
			Spine_OverallSaveSetInt("Troll_Black", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Troll_Silber)) {
			Spine_OverallSaveSetInt("Troll_Silber", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Troll)) {
			Spine_OverallSaveSetInt("Troll", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Tiger_White)) {
			Spine_OverallSaveSetInt("Tiger_White", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Swampshark)) {
			Spine_OverallSaveSetInt("Swampshark", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Swampshark_Undead)) {
			Spine_OverallSaveSetInt("Swampshark_Undead", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Lindwurm)) {
			Spine_OverallSaveSetInt("Lindwurm", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Wurm)) {
			Spine_OverallSaveSetInt("Wurm", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(StoneGolem)) {
			Spine_OverallSaveSetInt("StoneGolem", 1);
		};
		if (oth.aivar[AIV_MM_REAL_ID] == ID_ERZGOLEM) {
			Spine_OverallSaveSetInt("ErzGolem", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(EisenGolem)) {
			Spine_OverallSaveSetInt("EisenGolem", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Spider) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Spider_01) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Spider_Lib)) {
			Spine_OverallSaveSetInt("Spider", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Spider_Big) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Riesenspinne_XW_01) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Riesenspinne_XW_02) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Riesenspinne_XW_03) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Riesenspinne_XW_04)) {
			Spine_OverallSaveSetInt("Spider_Big", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Spider_Queen)) {
			Spine_OverallSaveSetInt("Spider_Queen", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Dalma)) {
			Spine_OverallSaveSetInt("Dalma", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Snapper)) {
			Spine_OverallSaveSetInt("Snapper", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(FeuerSnapper)) {
			Spine_OverallSaveSetInt("FeuerSnapper", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(WasserSnapper)) {
			Spine_OverallSaveSetInt("WasserSnapper", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(SchattenSnapper)) {
			Spine_OverallSaveSetInt("SchattenSnapper", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Sleeper)) {
			Spine_OverallSaveSetInt("Sleeper", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(SkeletonMage)) {
			Spine_OverallSaveSetInt("SkeletonMage", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Skeleton_Lord)) {
			Spine_OverallSaveSetInt("Skeleton_Lord", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Skeleton_Lord_Ghost)) {
			Spine_OverallSaveSetInt("Skeleton_Lord_Ghost", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Skeleton)) {
			Spine_OverallSaveSetInt("Skeleton", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(SkeletonWarrior)) {
			Spine_OverallSaveSetInt("SkeletonWarrior", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Lesser_Skeleton)) {
			Spine_OverallSaveSetInt("Lesser_Skeleton", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Sheep)) {
			Spine_OverallSaveSetInt("Sheep", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Hammel)) {
			Spine_OverallSaveSetInt("Hammel", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Shadowbeast_Skeleton)) {
			Spine_OverallSaveSetInt("Shadowbeast_Skeleton", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Nightmare_Skeleton)) {
			Spine_OverallSaveSetInt("Nightmare_Skeleton", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Shadowbeast)) {
			Spine_OverallSaveSetInt("Shadowbeast", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Feuerlaeufer)) {
			Spine_OverallSaveSetInt("Feuerlaeufer", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Wasserlaeufer)) {
			Spine_OverallSaveSetInt("Wasserlaeufer", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Eislaeufer)) {
			Spine_OverallSaveSetInt("Eislaeufer", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Nightmare)) {
			Spine_OverallSaveSetInt("Nightmare", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Scavenger_Ice)) {
			Spine_OverallSaveSetInt("Scavenger_Ice", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Scavenger_Demon)) {
			Spine_OverallSaveSetInt("Scavenger_Demon", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Scavenger)) {
			Spine_OverallSaveSetInt("Scavenger", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Rabbit)) {
			Spine_OverallSaveSetInt("Rabbit", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Orcdog)) {
			Spine_OverallSaveSetInt("Orcdog", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Molerat)) {
			Spine_OverallSaveSetInt("Molerat", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Minotaurus) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Minotaurus_Xeres)) {
			Spine_OverallSaveSetInt("Minotaurus", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(MinecrawlerWarrior)) {
			Spine_OverallSaveSetInt("MinecrawlerWarrior", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(MinecrawlerWarrior_Undead)) {
			Spine_OverallSaveSetInt("MinecrawlerWarrior_Undead", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(RedCrab)) {
			Spine_OverallSaveSetInt("RedCrab", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(MinecrawlerQueen)) {
			Spine_OverallSaveSetInt("MinecrawlerQueen", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(ErznagerQueen)) {
			Spine_OverallSaveSetInt("ErznagerQueen", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Minecrawler)) {
			Spine_OverallSaveSetInt("Minecrawler", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Kristallcrawler)) {
			Spine_OverallSaveSetInt("Kristallcrawler", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Meatbug)) {
			Spine_OverallSaveSetInt("Meatbug", 1);
		};
		if (oth.aivar[AIV_MM_REAL_ID] == ID_LURKER) {
			Spine_OverallSaveSetInt("Lurker", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Kobold)) {
			Spine_OverallSaveSetInt("Kobold", 1);
		};
		if (oth.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM) {
			Spine_OverallSaveSetInt("IceGolem", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Harpie)) {
			Spine_OverallSaveSetInt("Harpie", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Gobbo_Skeleton)) {
			Spine_OverallSaveSetInt("Gobbo_Skeleton", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Gobbo_Green) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(YGobbo_Green)) {
			Spine_OverallSaveSetInt("Gobbo_Green", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Gobbo_Matrone_01) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Gobbo_Matrone_02) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Gobbo_Matrone_03) || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Gobbo_Matrone_04)) {
			Spine_OverallSaveSetInt("OrcWarrior", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Gobbo_Black)) {
			Spine_OverallSaveSetInt("Gobbo_Black", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Giant_Rat)) {
			Spine_OverallSaveSetInt("Giant_Rat", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Rat)) {
			Spine_OverallSaveSetInt("Rat", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Giant_Bug)) {
			Spine_OverallSaveSetInt("Giant_Bug", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(FireWaran)) {
			Spine_OverallSaveSetInt("FireWaran", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(EisWaran)) {
			Spine_OverallSaveSetInt("EisWaran", 1);
		};
		if (oth.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM) {
			Spine_OverallSaveSetInt("FireGolem", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Erdgigant)) {
			Spine_OverallSaveSetInt("Erdgigant", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Eisdrachensnapper)) {
			Spine_OverallSaveSetInt("Eisdrachensnapper", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(DungeonHarpie)) {
			Spine_OverallSaveSetInt("DungeonHarpie", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(DragonSnapper)) {
			Spine_OverallSaveSetInt("DragonSnapper", 1);
		};
		if (oth.aivar[AIV_MM_REAL_ID] == ID_RazorSkelett || Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(SKELETRazor)) {
			Spine_OverallSaveSetInt("RazorSkelett", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(DemonLord)) {
			Spine_OverallSaveSetInt("DemonLord", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(DemonHigh)) {
			Spine_OverallSaveSetInt("DemonHigh", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Demon)) {
			Spine_OverallSaveSetInt("Demon", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(LessDemon)) {
			Spine_OverallSaveSetInt("LessDemon", 1);
		};
		if (oth.aivar[AIV_MM_REAL_ID] == ID_Blutgolem) {
			Spine_OverallSaveSetInt("Blutgolem", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Bloodfly)) {
			Spine_OverallSaveSetInt("Bloodfly", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Balrog)) {
			Spine_OverallSaveSetInt("Balrog", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Alraune)) {
			Spine_OverallSaveSetInt("Alraune", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Swamprat)) {
			Spine_OverallSaveSetInt("Swamprat", 1);
		};
		if (oth.aivar[AIV_MM_REAL_ID] == ID_SWAMPGOLEM) {
			Spine_OverallSaveSetInt("SwampGolem", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(SwampDrone)) {
			Spine_OverallSaveSetInt("SwampDrone", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Puma)) {
			Spine_OverallSaveSetInt("Puma", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(StonePuma)) {
			Spine_OverallSaveSetInt("StonePuma", 1);
		};
		if (oth.aivar[AIV_MM_REAL_ID] == ID_APFELBAUM) {
			Spine_OverallSaveSetInt("Apfelbaum", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(StoneGolemerz)) {
			Spine_OverallSaveSetInt("StoneGolemerz", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(XR_Kristallgolem)) {
			Spine_OverallSaveSetInt("Kristallgolem", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(UndeadOrcWarriorHorn)) {
			Spine_OverallSaveSetInt("UndeadOrcWarriorHorn", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Hauertroll)) {
			Spine_OverallSaveSetInt("Hauertroll", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Schattenwark)) {
			Spine_OverallSaveSetInt("Schattenwark", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Zombie_Eisschnee)) {
			Spine_OverallSaveSetInt("Zombie_Eisschnee", 1);
		};
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(SchneeHase)) {
			Spine_OverallSaveSetInt("SchneeHase", 1);
		};
		CheckMonsterHunterAchievement();
	};

	if (!Npc_IsPlayer(oth))
	&& (!C_NpcIsBossmonster(slf))
	&& (slf.aivar[AIV_FLUGBLATTVERTEILT] == 0)
	&& (oth.aivar[AIV_Partymember] == FALSE)
	{
		return;
	};

	if (FinsternisPanzerhandschuh_Equipped)
	&& (Wld_IsTime(22,00,05,00))
	{
		Wld_SpawnNpcRange (slf, Summoned_Harpie, 1, 300);
	};

	// Schafe, Fleischwanzen und Ratten geben immer 5 XP

	if ((slf.aivar[AIV_VictoryXPGiven] == FALSE)	
	|| (slf.aivar[AIV_VictoryXPGiven] == -1))
	&& ((slf.guild == GIL_SHEEP)
	|| (slf.guild == GIL_MEATBUG))
	{
		B_GivePlayerXP (5);

		slf.aivar[AIV_VictoryXPGiven] = TRUE;
	};

	// Im Schläfertempel ist auch noch alles festgeschrieben

	if (slf.aivar[AIV_VictoryXPGiven] == FALSE)
	&& (HeroIstKeinZombie == FALSE)
	&& (CurrentLevel == ORCTEMPEL_ZEN)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)
		{
			B_GivePlayerXP	(15);
		}
		else if (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)
		{
			B_GivePlayerXP	(20);
		}
		else if (slf.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE)
		{
			B_GivePlayerXP	(20);
		};

		slf.aivar[AIV_VictoryXPGiven] = TRUE;
	};

	// respawnte Gegner geben immer nur 10 XP

	if (slf.aivar[AIV_VictoryXPGiven] == -1)
	{
		B_GivePlayerXP	(10);

		slf.aivar[AIV_VictoryXPGiven] = TRUE;
	};

	// Bei eigenen Kills, Kills beschworener Monster oder wenn der Gegner Boss ist oder ich mal draufgehauen habe, gibt's volle XP
	
	if ((Npc_IsPlayer(oth))
	|| (oth.guild == GIL_SUMMONED_GOBBO_SKELETON)	
	|| (oth.guild == GIL_SUMMONED_WOLF)	
	|| (oth.guild == GIL_SUMMONED_SKELETON)	
	|| (oth.guild == GIL_SUMMONED_GOLEM)	
	|| (oth.guild == GIL_SUMMONED_DEMON)	
	|| (oth.guild == GIL_SUMMONEDGUARDIAN)	
	|| (oth.guild == GIL_SUMMONEDZOMBIE)
	|| (C_NpcIsBossmonster(slf))
	|| (slf.aivar[AIV_FLUGBLATTVERTEILT] == 1))
	&& (slf.aivar[AIV_VictoryXPGiven] == FALSE)							
	{
		B_GivePlayerXP (slf.level * XP_PER_VICTORY);	

		slf.aivar[AIV_VictoryXPGiven] = TRUE;
	};
	
	if (oth.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (slf.aivar[AIV_VictoryXPGiven] == FALSE)						
	{
		B_GivePlayerXP (slf.level * XP_PER_VICTORY / 2);

		slf.aivar[AIV_VictoryXPGiven] = TRUE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Rabbit_Gomez))
	{
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Mod_517_DMR_Gomez_MT))
		{
			Mod_Gomez_HasenKiller += 1;
		}
		else
		{
			Mod_Gomez_HasenKiller2 += 1;
		};
	};
};