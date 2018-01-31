FUNC VOID B_EXPVerteiler (var C_NPC opfer, var C_NPC taeter)
{
	if (!Hlp_IsValidNpc(taeter)) {
		return;
	};
	
	if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Lich_11008_NW))
	&& (Mod_NL_HasKamm < 2) {
		return;
	};
	
	if (C_NpcIsHero(taeter)) {
		if (opfer.aivar[AIV_MM_REAL_ID] == ID_UNDEADORCWARRIOR) {
			if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(UndeadOrcWarrior)) {
				Spine_OverallSaveSetInt("UndeadOrcWarrior", 1);
			};
			if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(UndeadOrcPriest)) {
				Spine_OverallSaveSetInt("UndeadOrcPriest", 1);
			};
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(WaterOrc)) {
			Spine_OverallSaveSetInt("WaterOrc", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(OrcWarrior_Roam)) {
			Spine_OverallSaveSetInt("OrcWarrior", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(OrcShaman_Sit) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(OrcShaman_Pray)) {
			Spine_OverallSaveSetInt("OrcShaman", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(OrcElite_Roam) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(OrcElite_Rest)) {
			Spine_OverallSaveSetInt("OrcElite", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Stoneguardian)) {
			Spine_OverallSaveSetInt("Stoneguardian", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Erzguardian)) {
			Spine_OverallSaveSetInt("Erzguardian", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Shadowbeast_Fire)) {
			Spine_OverallSaveSetInt("Shadowbeast_Fire", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Razor)) {
			Spine_OverallSaveSetInt("Razor", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(OrcBiter)) {
			Spine_OverallSaveSetInt("OrcBiter", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Keiler)) {
			Spine_OverallSaveSetInt("Keiler", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Riesenkeiler)) {
			Spine_OverallSaveSetInt("Riesenkeiler", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Icewolf) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(IcewolfEISGEBIET)) {
			Spine_OverallSaveSetInt("Icewolf", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Gobbo_Warrior) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Gobbo_Warrior_Visir)) {
			Spine_OverallSaveSetInt("Gobbo_Warrior", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Giant_DesertRat)) {
			Spine_OverallSaveSetInt("Giant_DesertRat", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Bloodhound)) {
			Spine_OverallSaveSetInt("Bloodhound", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Blattcrawler)) {
			Spine_OverallSaveSetInt("Blattcrawler", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Erznager)) {
			Spine_OverallSaveSetInt("Erznager", 1);
		};
		if (opfer.aivar[AIV_MM_REAL_ID] == ID_INSEKT) {
			Spine_OverallSaveSetInt("Insect", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Alligator)) {
			Spine_OverallSaveSetInt("Alligator", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(ZombieRandom) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Zombie_OT)) {
			Spine_OverallSaveSetInt("Zombie", 1);
		};
		if (opfer.aivar[AIV_MM_REAL_ID] == ID_ZIEGE) {
			Spine_OverallSaveSetInt("Ziege", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Wolf) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(YWolf)) {
			Spine_OverallSaveSetInt("Wolf", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Riesenwolf)) {
			Spine_OverallSaveSetInt("Riesenwolf", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Wisp)) {
			Spine_OverallSaveSetInt("Wisp", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Warg)) {
			Spine_OverallSaveSetInt("Warg", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(BlackWolf)) {
			Spine_OverallSaveSetInt("BlackWolf", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Waran)) {
			Spine_OverallSaveSetInt("Waran", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Truhe)) {
			Spine_OverallSaveSetInt("Truhe", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Troll_Black)) {
			Spine_OverallSaveSetInt("Troll_Black", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Troll_Silber)) {
			Spine_OverallSaveSetInt("Troll_Silber", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Troll)) {
			Spine_OverallSaveSetInt("Troll", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Tiger_White)) {
			Spine_OverallSaveSetInt("Tiger_White", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Swampshark)) {
			Spine_OverallSaveSetInt("Swampshark", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Swampshark_Undead)) {
			Spine_OverallSaveSetInt("Swampshark_Undead", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Lindwurm)) {
			Spine_OverallSaveSetInt("Lindwurm", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Wurm)) {
			Spine_OverallSaveSetInt("Wurm", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(StoneGolem)) {
			Spine_OverallSaveSetInt("StoneGolem", 1);
		};
		if (opfer.aivar[AIV_MM_REAL_ID] == ID_ERZGOLEM) {
			Spine_OverallSaveSetInt("ErzGolem", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(EisenGolem)) {
			Spine_OverallSaveSetInt("EisenGolem", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Spider) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Spider_01) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Spider_Lib)) {
			Spine_OverallSaveSetInt("Spider", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Spider_Big) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Riesenspinne_XW_01) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Riesenspinne_XW_02) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Riesenspinne_XW_03) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Riesenspinne_XW_04)) {
			Spine_OverallSaveSetInt("Spider_Big", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Spider_Queen)) {
			Spine_OverallSaveSetInt("Spider_Queen", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Dalma)) {
			Spine_OverallSaveSetInt("Dalma", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Snapper)) {
			Spine_OverallSaveSetInt("Snapper", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(FeuerSnapper)) {
			Spine_OverallSaveSetInt("FeuerSnapper", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(WasserSnapper)) {
			Spine_OverallSaveSetInt("WasserSnapper", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(SchattenSnapper)) {
			Spine_OverallSaveSetInt("SchattenSnapper", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Sleeper)) {
			Spine_OverallSaveSetInt("Sleeper", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(SkeletonMage)) {
			Spine_OverallSaveSetInt("SkeletonMage", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Skeleton_Lord)) {
			Spine_OverallSaveSetInt("Skeleton_Lord", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Skeleton_Lord_Ghost)) {
			Spine_OverallSaveSetInt("Skeleton_Lord_Ghost", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Skeleton)) {
			Spine_OverallSaveSetInt("Skeleton", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(SkeletonWarrior)) {
			Spine_OverallSaveSetInt("SkeletonWarrior", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Lesser_Skeleton)) {
			Spine_OverallSaveSetInt("Lesser_Skeleton", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Sheep)) {
			Spine_OverallSaveSetInt("Sheep", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Hammel)) {
			Spine_OverallSaveSetInt("Hammel", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Shadowbeast_Skeleton)) {
			Spine_OverallSaveSetInt("Shadowbeast_Skeleton", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Nightmare_Skeleton)) {
			Spine_OverallSaveSetInt("Nightmare_Skeleton", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Shadowbeast)) {
			Spine_OverallSaveSetInt("Shadowbeast", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Feuerlaeufer)) {
			Spine_OverallSaveSetInt("Feuerlaeufer", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Wasserlaeufer)) {
			Spine_OverallSaveSetInt("Wasserlaeufer", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Eislaeufer)) {
			Spine_OverallSaveSetInt("Eislaeufer", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Nightmare)) {
			Spine_OverallSaveSetInt("Nightmare", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Scavenger_Ice)) {
			Spine_OverallSaveSetInt("Scavenger_Ice", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Scavenger_Demon)) {
			Spine_OverallSaveSetInt("Scavenger_Demon", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Scavenger)) {
			Spine_OverallSaveSetInt("Scavenger", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Rabbit)) {
			Spine_OverallSaveSetInt("Rabbit", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Orcdog)) {
			Spine_OverallSaveSetInt("Orcdog", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Molerat)) {
			Spine_OverallSaveSetInt("Molerat", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Minotaurus) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Minotaurus_Xeres)) {
			Spine_OverallSaveSetInt("Minotaurus", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(MinecrawlerWarrior)) {
			Spine_OverallSaveSetInt("MinecrawlerWarrior", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(MinecrawlerWarrior_Undead)) {
			Spine_OverallSaveSetInt("MinecrawlerWarrior_Undead", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(RedCrab)) {
			Spine_OverallSaveSetInt("RedCrab", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(MinecrawlerQueen)) {
			Spine_OverallSaveSetInt("MinecrawlerQueen", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(ErznagerQueen)) {
			Spine_OverallSaveSetInt("ErznagerQueen", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Minecrawler)) {
			Spine_OverallSaveSetInt("Minecrawler", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Kristallcrawler)) {
			Spine_OverallSaveSetInt("Kristallcrawler", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Meatbug)) {
			Spine_OverallSaveSetInt("Meatbug", 1);
		};
		if (opfer.aivar[AIV_MM_REAL_ID] == ID_LURKER) {
			Spine_OverallSaveSetInt("Lurker", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Kobold)) {
			Spine_OverallSaveSetInt("Kobold", 1);
		};
		if (opfer.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM) {
			Spine_OverallSaveSetInt("IceGolem", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Harpie)) {
			Spine_OverallSaveSetInt("Harpie", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Gobbo_Skeleton)) {
			Spine_OverallSaveSetInt("Gobbo_Skeleton", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Gobbo_Green) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(YGobbo_Green)) {
			Spine_OverallSaveSetInt("Gobbo_Green", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Gobbo_Matrone_01) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Gobbo_Matrone_02) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Gobbo_Matrone_03) || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Gobbo_Matrone_04)) {
			Spine_OverallSaveSetInt("OrcWarrior", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Gobbo_Black)) {
			Spine_OverallSaveSetInt("Gobbo_Black", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Giant_Rat)) {
			Spine_OverallSaveSetInt("Giant_Rat", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Rat)) {
			Spine_OverallSaveSetInt("Rat", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Giant_Bug)) {
			Spine_OverallSaveSetInt("Giant_Bug", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(FireWaran)) {
			Spine_OverallSaveSetInt("FireWaran", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(EisWaran)) {
			Spine_OverallSaveSetInt("EisWaran", 1);
		};
		if (opfer.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM) {
			Spine_OverallSaveSetInt("FireGolem", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Erdgigant)) {
			Spine_OverallSaveSetInt("Erdgigant", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Eisdrachensnapper)) {
			Spine_OverallSaveSetInt("Eisdrachensnapper", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(DungeonHarpie)) {
			Spine_OverallSaveSetInt("DungeonHarpie", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(DragonSnapper)) {
			Spine_OverallSaveSetInt("DragonSnapper", 1);
		};
		if (opfer.aivar[AIV_MM_REAL_ID] == ID_RazorSkelett || Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(SKELETRazor)) {
			Spine_OverallSaveSetInt("RazorSkelett", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(DemonLord)) {
			Spine_OverallSaveSetInt("DemonLord", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(DemonHigh)) {
			Spine_OverallSaveSetInt("DemonHigh", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Demon)) {
			Spine_OverallSaveSetInt("Demon", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(LessDemon)) {
			Spine_OverallSaveSetInt("LessDemon", 1);
		};
		if (opfer.aivar[AIV_MM_REAL_ID] == ID_Blutgolem) {
			Spine_OverallSaveSetInt("Blutgolem", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Bloodfly)) {
			Spine_OverallSaveSetInt("Bloodfly", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Balrog)) {
			Spine_OverallSaveSetInt("Balrog", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Alraune)) {
			Spine_OverallSaveSetInt("Alraune", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Swamprat)) {
			Spine_OverallSaveSetInt("Swamprat", 1);
		};
		if (opfer.aivar[AIV_MM_REAL_ID] == ID_SWAMPGOLEM) {
			Spine_OverallSaveSetInt("SwampGolem", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(SwampDrone)) {
			Spine_OverallSaveSetInt("SwampDrone", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Puma)) {
			Spine_OverallSaveSetInt("Puma", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(StonePuma)) {
			Spine_OverallSaveSetInt("StonePuma", 1);
		};
		if (opfer.aivar[AIV_MM_REAL_ID] == ID_APFELBAUM) {
			Spine_OverallSaveSetInt("Apfelbaum", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(StoneGolemerz)) {
			Spine_OverallSaveSetInt("StoneGolemerz", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(XR_Kristallgolem)) {
			Spine_OverallSaveSetInt("Kristallgolem", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(UndeadOrcWarriorHorn)) {
			Spine_OverallSaveSetInt("UndeadOrcWarriorHorn", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Hauertroll)) {
			Spine_OverallSaveSetInt("Hauertroll", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Schattenwark)) {
			Spine_OverallSaveSetInt("Schattenwark", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Zombie_Eisschnee)) {
			Spine_OverallSaveSetInt("Zombie_Eisschnee", 1);
		};
		if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(SchneeHase)) {
			Spine_OverallSaveSetInt("SchneeHase", 1);
		};
		CheckMonsterHunterAchievement();
	};

	if (opfer.guild == GIL_DRACONIAN)
	&& (C_NpcIsHero(taeter))
	&& (Mod_Echsis != 1)
	{
		Mod_Echsis = 1;
	};

	if (C_NpcIsHero(opfer))
	&& (opfer.guild > GIL_SEPERATOR_HUM)
	{
		Mod_MonsterGekillt += 1;
	};

	if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Giant_Rat_Friedel))
	{
		if (Hlp_GetInstanceID(taeter) == Hlp_GetInstanceID(Mod_7519_OUT_Tyrus_REL))
		{
			Mod_REL_Wettstreit_Tyrus += 1;
		}
		else if (Hlp_GetInstanceID(taeter) == Hlp_GetInstanceID(Mod_7518_OUT_Davon_REL))
		{
			Mod_REL_Wettstreit_Davon += 1;
		}
		else
		{
			Mod_REL_Wettstreit_Hero += 1;
		};
	};

	if (opfer.guild < GIL_SEPERATOR_HUM)
	&& (C_NpcIsHero(taeter))
	&& (Piratenhut_Equipped == 1)
	{
		var int BlackbartsRandi;
		BlackbartsRandi = Hlp_Random(21);

		if (BlackbartsRandi == 0)
		{
			CreateInvItems	(opfer, ItMi_GoldRing, 1);
		}
		else
		{
			CreateInvItems	(opfer, ItMi_Gold, BlackbartsRandi);
		};
	};
		
	if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Mod_1082_BAU_Rufus_MT))
	&& (C_NpcIsHero(taeter))
	{
		Mod_SLD_Rufus = 5;
	};

	if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Swampshark_Undead))
	&& (Npc_HasItems(hero, ItMi_SumpfhaiStein) == 1)
	&& ((C_NpcIsHero(taeter))
	|| (Hlp_GetInstanceID(taeter) == Hlp_GetInstanceID(Mod_1219_TPL_Templer_MT))
	|| (Hlp_GetInstanceID(taeter) == Hlp_GetInstanceID(Mod_1218_TPL_Templer_MT)))
	{
		Mod_Sekte_UDS_Stein += 1;
	};

	var C_ITEM AxtTest;

	AxtTest = Npc_GetReadiedWeapon(taeter);

	if (Hlp_IsItem(AxtTest, ItMw_AxtDesUntergangs))
	&& (Hlp_GetInstanceID(taeter) == Hlp_GetInstanceID(PC_Hero))
	{
		AxtDamage += 2;

		AxtUpgrade = 0;
	};

	if (taeter.guild == GIL_DRACONIAN)
	&& (opfer.guild == GIL_SWAMPGOLEM)
	{
		opfer.exp += 1;

		B_EchsenBody(taeter);
	};

	var int GiftChance;
	GiftChance = 0;
	
	// ------ Sumpfdrohne -------
	if (opfer.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	&& (GGD_Sumpfgasdrohne_Time == 0)
	{
		if (Npc_GetDistToNpc(taeter, opfer) < 300)
		{
			//opfer.attribute[ATR_HITPOINTS] -= 50;
			//Npc_ChangeAttribute(opfer, ATR_HITPOINTS, -50);

			// Wahrscheinlichkeit, eine Vergiftung zu erleiden

			if (Gift == 0)
			{
				GiftChance = 100; //100%
			}
			else if (Gift == 1)
			{
				GiftChance = 85; //- 15%
			}
			else if (Gift == 2)
			{
				GiftChance = 72; //nochmal -15% vom Rest
			}
			else if (Gift == 3)
			{
				GiftChance = 61; //nochmal -15% vom Rest
			};

			if (Hlp_Random(100) < GiftChance)
			{
				// Zeit erhöhen

				if (Giftdampf == 0)
				{
					GGD_Sumpfgasdrohne_Time += 10;
				}
				else if (Giftdampf == 1) // 20% weniger
				{
					GGD_Sumpfgasdrohne_Time += 8;
				}
				else if (Giftdampf == 2) // 40% weniger
				{
					GGD_Sumpfgasdrohne_Time += 6;
				}
				else if (Giftdampf == 3) // 60% weniger
				{
					GGD_Sumpfgasdrohne_Time += 4;
				}
				else if (Giftdampf == 4) // 80% weniger
				{
					GGD_Sumpfgasdrohne_Time += 2;
				};

				// neuer Schaden

				if (Giftdampf == 0)
				{
					GGD_Sumpfgasdrohne_Damage = 20;
				}
				else if (Giftdampf == 1) // 10% weniger
				{
					GGD_Sumpfgasdrohne_Damage = 18;
				}
				else if (Giftdampf == 2) // noch mal 10% weniger
				{
					GGD_Sumpfgasdrohne_Damage += 16;
				}
				else if (Giftdampf == 3) // und noch mal 10% weniger
				{
					GGD_Sumpfgasdrohne_Damage = 14;
				}
				else if (Giftdampf == 4) // und noch mal 10% weniger
				{
					GGD_Sumpfgasdrohne_Damage = 13;
				};
			};
		};
	};
	if (opfer.aivar[AIV_MM_REAL_ID] == ID_SWAMPGOLEM)
	&& (GGD_Sumpfgolem_Time == 0)
	{
		if (Npc_GetDistToNpc(taeter, opfer) < 300)
		&& (Mod_TrfSkeleton2 == 0)
		{
			//opfer.attribute[ATR_HITPOINTS] -= 50;
			//Npc_ChangeAttribute(opfer, ATR_HITPOINTS, -50);

			// Wahrscheinlichkeit, eine Vergiftung zu erleiden

			if (Gift == 0)
			{
				GiftChance = 100; //100%
			}
			else if (Gift == 1)
			{
				GiftChance = 85; //- 15%
			}
			else if (Gift == 2)
			{
				GiftChance = 72; //nochmal -15% vom Rest
			}
			else if (Gift == 3)
			{
				GiftChance = 61; //nochmal -15% vom Rest
			};

			if (Hlp_Random(100) < GiftChance)
			{
				// Zeit erhöhen

				if (Giftdampf == 0)
				{
					GGD_Sumpfgolem_Time += 10;
				}
				else if (Giftdampf == 1) // 20% weniger
				{
					GGD_Sumpfgolem_Time += 8;
				}
				else if (Giftdampf == 2) // 40% weniger
				{
					GGD_Sumpfgolem_Time += 6;
				}
				else if (Giftdampf == 3) // 60% weniger
				{
					GGD_Sumpfgolem_Time += 4;
				}
				else if (Giftdampf == 4) // 80% weniger
				{
					GGD_Sumpfgolem_Time += 2;
				};

				// neuer Schaden

				if (Giftdampf == 0)
				{
					GGD_Sumpfgolem_Damage = 20;
				}
				else if (Giftdampf == 1) // 10% weniger
				{
					GGD_Sumpfgolem_Damage = 18;
				}
				else if (Giftdampf == 2) // noch mal 10% weniger
				{
					GGD_Sumpfgolem_Damage = 16;
				}
				else if (Giftdampf == 3) // und noch mal 10% weniger
				{
					GGD_Sumpfgolem_Damage = 14;
				}
				else if (Giftdampf == 4) // und noch mal 10% weniger
				{
					GGD_Sumpfgolem_Damage = 13;
				};
			};
		};
	};
	
	if (Npc_IsPlayer(taeter))
	{
		opfer.aivar[AIV_KilledByPlayer] = TRUE;		
	};
	
	// Weder Spieler, noch Partymember, noch Boss, noch mal draufgeschlagen

	if (!Npc_IsPlayer(taeter))
	&& (!C_NpcIsBossmonster(opfer))
	&& (opfer.aivar[AIV_FLUGBLATTVERTEILT] == 0)
	&& (taeter.aivar[AIV_Partymember] == FALSE)
	{
		return;
	};

	if (FinsternisPanzerhandschuh_Equipped)
	&& (Wld_IsTime(22,00,05,00))
	{
		Wld_SpawnNpcRange (opfer, Summoned_Harpie, 1, 300);
	};

	// Schafe, Fleischwanzen und Ratten geben immer 5 XP

	if ((opfer.aivar[AIV_VictoryXPGiven] == FALSE)	
	|| (opfer.aivar[AIV_VictoryXPGiven] == -1))
	&& ((opfer.guild == GIL_SHEEP)
	|| (opfer.guild == GIL_MEATBUG))
	{
		B_GivePlayerXP (5);

		opfer.aivar[AIV_VictoryXPGiven] = TRUE;
	};

	// Im Schläfertempel ist auch noch alles festgeschrieben

	if (opfer.aivar[AIV_VictoryXPGiven] == FALSE)
	&& (HeroIstKeinZombie == FALSE)
	&& (CurrentLevel == ORCTEMPEL_ZEN)
	{
		if (opfer.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)
		{
			B_GivePlayerXP	(15);
		}
		else if (opfer.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)
		{
			B_GivePlayerXP	(20);
		}
		else if (opfer.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE)
		{
			B_GivePlayerXP	(20);
		};

		opfer.aivar[AIV_VictoryXPGiven] = TRUE;
	};

	// respawnte Gegner geben immer nur 10 XP

	if (opfer.aivar[AIV_VictoryXPGiven] == -1)
	{
		B_GivePlayerXP	(10);

		opfer.aivar[AIV_VictoryXPGiven] = TRUE;
	};

	// Bei eigenen Kills, Kills beschworener Monster oder wenn der Gegner Boss ist oder ich mal draufgehauen habe, gibt's volle XP
	
	if ((Npc_IsPlayer(taeter))
	|| (taeter.guild == GIL_SUMMONED_GOBBO_SKELETON)	
	|| (taeter.guild == GIL_SUMMONED_WOLF)	
	|| (taeter.guild == GIL_SUMMONED_SKELETON)	
	|| (taeter.guild == GIL_SUMMONED_GOLEM)	
	|| (taeter.guild == GIL_SUMMONED_DEMON)	
	|| (taeter.guild == GIL_SUMMONEDGUARDIAN)	
	|| (taeter.guild == GIL_SUMMONEDZOMBIE)
	|| (C_NpcIsBossmonster(opfer))
	|| (opfer.aivar[AIV_FLUGBLATTVERTEILT] == 1))
	&& (opfer.aivar[AIV_VictoryXPGiven] == FALSE)							
	{
		B_GivePlayerXP (opfer.level * XP_PER_VICTORY);	

		opfer.aivar[AIV_VictoryXPGiven] = TRUE;
	};
	
	if (taeter.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (opfer.aivar[AIV_VictoryXPGiven] == FALSE)						
	{
		B_GivePlayerXP (opfer.level * XP_PER_VICTORY / 2);

		opfer.aivar[AIV_VictoryXPGiven] = TRUE;
	};

	if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Rabbit_Gomez))
	{
		if (Hlp_GetInstanceID(taeter) == Hlp_GetInstanceID(Mod_517_DMR_Gomez_MT))
		{
			Mod_Gomez_HasenKiller += 1;
		}
		else
		{
			Mod_Gomez_HasenKiller2 += 1;
		};
	};
};