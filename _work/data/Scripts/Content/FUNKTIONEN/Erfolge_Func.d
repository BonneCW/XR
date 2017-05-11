FUNC VOID CheckHalluAchievement() {
	if (Spine_OverallSaveGetInt("HalluHS") == 1 && Spine_OverallSaveGetInt("Wolkenwelt") == 1) {
		Spine_UnlockAchievement(SPINE_ACHIEVEMENT_20);
	};
};

FUNC VOID CheckSexAchievement() {
	if (Spine_OverallSaveGetInt("JudithSex") == 1 && Spine_OverallSaveGetInt("HexeSex") == 1 && Spine_OverallSaveGetInt("SonjaSex") == 1) {
		Spine_UnlockAchievement(SPINE_ACHIEVEMENT_38);
	};
};

FUNC VOID CheckMonsterHunterAchievement() {
	var int amount; amount = 0;
	amount += max(0, Spine_OverallSaveGetInt("UndeadOrcWarrior"));
	amount += max(0, Spine_OverallSaveGetInt("UndeadOrcPriest"));
	amount += max(0, Spine_OverallSaveGetInt("WaterOrc"));
	amount += max(0, Spine_OverallSaveGetInt("OrcWarrior"));
	amount += max(0, Spine_OverallSaveGetInt("OrcShaman"));
	amount += max(0, Spine_OverallSaveGetInt("OrcElite"));
	amount += max(0, Spine_OverallSaveGetInt("Stoneguardian"));
	amount += max(0, Spine_OverallSaveGetInt("Erzguardian"));
	amount += max(0, Spine_OverallSaveGetInt("Shadowbeast_Fire"));
	amount += max(0, Spine_OverallSaveGetInt("Razor"));
	amount += max(0, Spine_OverallSaveGetInt("OrcBiter"));
	amount += max(0, Spine_OverallSaveGetInt("Keiler"));
	amount += max(0, Spine_OverallSaveGetInt("Riesenkeiler"));
	amount += max(0, Spine_OverallSaveGetInt("Icewolf"));
	amount += max(0, Spine_OverallSaveGetInt("Gobbo_Warrior"));
	amount += max(0, Spine_OverallSaveGetInt("Giant_DesertRat"));
	amount += max(0, Spine_OverallSaveGetInt("Bloodhound"));
	amount += max(0, Spine_OverallSaveGetInt("Blattcrawler"));
	amount += max(0, Spine_OverallSaveGetInt("Erznager"));
	amount += max(0, Spine_OverallSaveGetInt("Insect"));
	amount += max(0, Spine_OverallSaveGetInt("Alligator"));
	amount += max(0, Spine_OverallSaveGetInt("Zombie"));
	amount += max(0, Spine_OverallSaveGetInt("Ziege"));
	amount += max(0, Spine_OverallSaveGetInt("Wolf"));
	amount += max(0, Spine_OverallSaveGetInt("Riesenwolf"));
	amount += max(0, Spine_OverallSaveGetInt("Wisp"));
	amount += max(0, Spine_OverallSaveGetInt("Warg"));
	amount += max(0, Spine_OverallSaveGetInt("BlackWolf"));
	amount += max(0, Spine_OverallSaveGetInt("Waran"));
	amount += max(0, Spine_OverallSaveGetInt("Truhe"));
	amount += max(0, Spine_OverallSaveGetInt("Troll_Black"));
	amount += max(0, Spine_OverallSaveGetInt("Troll_Silber"));
	amount += max(0, Spine_OverallSaveGetInt("Troll"));
	amount += max(0, Spine_OverallSaveGetInt("Tiger_White"));
	amount += max(0, Spine_OverallSaveGetInt("Swampshark"));
	amount += max(0, Spine_OverallSaveGetInt("Swampshark_Undead"));
	amount += max(0, Spine_OverallSaveGetInt("Lindwurm"));
	amount += max(0, Spine_OverallSaveGetInt("Wurm"));
	amount += max(0, Spine_OverallSaveGetInt("StoneGolem"));
	amount += max(0, Spine_OverallSaveGetInt("ErzGolem"));
	amount += max(0, Spine_OverallSaveGetInt("EisenGolem"));
	amount += max(0, Spine_OverallSaveGetInt("Spider"));
	amount += max(0, Spine_OverallSaveGetInt("Spider_Big"));
	amount += max(0, Spine_OverallSaveGetInt("Spider_Queen"));
	amount += max(0, Spine_OverallSaveGetInt("Dalma"));
	amount += max(0, Spine_OverallSaveGetInt("Snapper"));
	amount += max(0, Spine_OverallSaveGetInt("FeuerSnapper"));
	amount += max(0, Spine_OverallSaveGetInt("WasserSnapper"));
	amount += max(0, Spine_OverallSaveGetInt("SchattenSnapper"));
	amount += max(0, Spine_OverallSaveGetInt("Sleeper"));
	amount += max(0, Spine_OverallSaveGetInt("SkeletonMage"));
	amount += max(0, Spine_OverallSaveGetInt("Skeleton_Lord"));
	amount += max(0, Spine_OverallSaveGetInt("Skeleton_Lord_Ghost"));
	amount += max(0, Spine_OverallSaveGetInt("Skeleton"));
	amount += max(0, Spine_OverallSaveGetInt("SkeletonWarrior"));
	amount += max(0, Spine_OverallSaveGetInt("Lesser_Skeleton"));
	amount += max(0, Spine_OverallSaveGetInt("Sheep"));
	amount += max(0, Spine_OverallSaveGetInt("Hammel"));
	amount += max(0, Spine_OverallSaveGetInt("Shadowbeast_Skeleton"));
	amount += max(0, Spine_OverallSaveGetInt("Nightmare_Skeleton"));
	amount += max(0, Spine_OverallSaveGetInt("Shadowbeast"));
	amount += max(0, Spine_OverallSaveGetInt("Feuerlaeufer"));
	amount += max(0, Spine_OverallSaveGetInt("Wasserlaeufer"));
	amount += max(0, Spine_OverallSaveGetInt("Eislaeufer"));
	amount += max(0, Spine_OverallSaveGetInt("Nightmare"));
	amount += max(0, Spine_OverallSaveGetInt("Scavenger_Ice"));
	amount += max(0, Spine_OverallSaveGetInt("Scavenger_Demon"));
	amount += max(0, Spine_OverallSaveGetInt("Scavenger"));
	amount += max(0, Spine_OverallSaveGetInt("Rabbit"));
	amount += max(0, Spine_OverallSaveGetInt("Orcdog"));
	amount += max(0, Spine_OverallSaveGetInt("Molerat"));
	amount += max(0, Spine_OverallSaveGetInt("Minotaurus"));
	amount += max(0, Spine_OverallSaveGetInt("MinecrawlerWarrior"));
	amount += max(0, Spine_OverallSaveGetInt("MinecrawlerWarrior_Undead"));
	amount += max(0, Spine_OverallSaveGetInt("RedCrab"));
	amount += max(0, Spine_OverallSaveGetInt("MinecrawlerQueen"));
	amount += max(0, Spine_OverallSaveGetInt("ErznagerQueen"));
	amount += max(0, Spine_OverallSaveGetInt("Minecrawler"));
	amount += max(0, Spine_OverallSaveGetInt("Kristallcrawler"));
	amount += max(0, Spine_OverallSaveGetInt("Meatbug"));
	amount += max(0, Spine_OverallSaveGetInt("Lurker"));
	amount += max(0, Spine_OverallSaveGetInt("Kobold"));
	amount += max(0, Spine_OverallSaveGetInt("IceGolem"));
	amount += max(0, Spine_OverallSaveGetInt("Harpie"));
	amount += max(0, Spine_OverallSaveGetInt("Gobbo_Skeleton"));
	amount += max(0, Spine_OverallSaveGetInt("Gobbo_Green"));
	amount += max(0, Spine_OverallSaveGetInt("Gobbo_Black"));
	amount += max(0, Spine_OverallSaveGetInt("Giant_Rat"));
	amount += max(0, Spine_OverallSaveGetInt("Rat"));
	amount += max(0, Spine_OverallSaveGetInt("Giant_Bug"));
	amount += max(0, Spine_OverallSaveGetInt("FireWaran"));
	amount += max(0, Spine_OverallSaveGetInt("EisWaran"));
	amount += max(0, Spine_OverallSaveGetInt("FireGolem"));
	amount += max(0, Spine_OverallSaveGetInt("Erdgigant"));
	amount += max(0, Spine_OverallSaveGetInt("Eisdrachensnapper"));
	amount += max(0, Spine_OverallSaveGetInt("DungeonHarpie"));
	amount += max(0, Spine_OverallSaveGetInt("DragonSnapper"));
	amount += max(0, Spine_OverallSaveGetInt("RazorSkelett"));
	amount += max(0, Spine_OverallSaveGetInt("DemonLord"));
	amount += max(0, Spine_OverallSaveGetInt("DemonHigh"));
	amount += max(0, Spine_OverallSaveGetInt("Demon"));
	amount += max(0, Spine_OverallSaveGetInt("LessDemon"));
	amount += max(0, Spine_OverallSaveGetInt("Blutgolem"));
	amount += max(0, Spine_OverallSaveGetInt("Bloodfly"));
	amount += max(0, Spine_OverallSaveGetInt("Balrog"));
	amount += max(0, Spine_OverallSaveGetInt("Alraune"));
	amount += max(0, Spine_OverallSaveGetInt("Swamprat"));
	amount += max(0, Spine_OverallSaveGetInt("SwampGolem"));
	amount += max(0, Spine_OverallSaveGetInt("SwampDrone"));
	amount += max(0, Spine_OverallSaveGetInt("Puma"));
	amount += max(0, Spine_OverallSaveGetInt("StonePuma"));
	amount += max(0, Spine_OverallSaveGetInt("Apfelbaum"));
	amount += max(0, Spine_OverallSaveGetInt("StoneGolemerz"));
	amount += max(0, Spine_OverallSaveGetInt("Kristallgolem"));
	amount += max(0, Spine_OverallSaveGetInt("UndeadOrcWarriorHorn"));
	amount += max(0, Spine_OverallSaveGetInt("Hauertroll"));
	amount += max(0, Spine_OverallSaveGetInt("Schattenwark"));
	amount += max(0, Spine_OverallSaveGetInt("Zombie_Eisschnee"));
	amount += max(0, Spine_OverallSaveGetInt("SchneeHase"));
	Spine_UpdateAchievementProgress(SPINE_ACHIEVEMENT_23, amount);
};

FUNC VOID CheckWorldTravelerAchievement() {
	var int amount; amount = 0;
	amount += max(0, Spine_OverallSaveGetInt("JharkendarVisited"));
	amount += max(0, Spine_OverallSaveGetInt("KhorinisVisited"));
	amount += max(0, Spine_OverallSaveGetInt("MinentalVisited"));
	amount += max(0, Spine_OverallSaveGetInt("OrctempelVisited"));
	amount += max(0, Spine_OverallSaveGetInt("AbandonedMineVisited"));
	amount += max(0, Spine_OverallSaveGetInt("OldMineVisited"));
	amount += max(0, Spine_OverallSaveGetInt("OrcGraveyardVisited"));
	amount += max(0, Spine_OverallSaveGetInt("FreeMineVisited"));
	amount += max(0, Spine_OverallSaveGetInt("RitualinselVisited"));
	amount += max(0, Spine_OverallSaveGetInt("SchatzinselVisited"));
	amount += max(0, Spine_OverallSaveGetInt("OrcCityVisited"));
	amount += max(0, Spine_OverallSaveGetInt("XeresFortressVisited"));
	amount += max(0, Spine_OverallSaveGetInt("IrdorathVisited"));
	amount += max(0, Spine_OverallSaveGetInt("PatherionVisited"));
	amount += max(0, Spine_OverallSaveGetInt("BergweltVisited"));
	amount += max(0, Spine_OverallSaveGetInt("TugettsoVisited"));
	amount += max(0, Spine_OverallSaveGetInt("GelatoVisited"));
	amount += max(0, Spine_OverallSaveGetInt("FlyingIsleVisited"));
	amount += max(0, Spine_OverallSaveGetInt("RelendelVisited"));
	amount += max(0, Spine_OverallSaveGetInt("HunterCampVisited"));
	amount += max(0, Spine_OverallSaveGetInt("CloudWorldVisited"));
	amount += max(0, Spine_OverallSaveGetInt("HalluzinationVisited"));
	amount += max(0, Spine_OverallSaveGetInt("WaldschluchtVisited"));
	amount += max(0, Spine_OverallSaveGetInt("DrachentalVisited"));
	amount += max(0, Spine_OverallSaveGetInt("RelendelMineVisited"));
	Spine_UpdateAchievementProgress(SPINE_ACHIEVEMENT_42, amount);
};

FUNC VOID Erfolge_Func() {
	// Erfolge auswerten
	// Helferlein
	if (CurrentNQ >= ((80 * MaxNQ) / 100)) {
		Spine_UnlockAchievement(SPINE_ACHIEVEMENT_11);
	};
	// Rattenjäger
	if (Mod_REL_Wettstreit_Hero > 20) {
		Spine_UnlockAchievement(SPINE_ACHIEVEMENT_13);
	};
	if (Npc_HasItems(hero, ItMi_GreatPearl)) {
		Spine_UnlockAchievement(SPINE_ACHIEVEMENT_35);
	};
	if (Npc_HasItems(hero, ItBe_GuertelDerEhre) && Npc_HasItems(hero, ItAm_HalskettederEhre) && Npc_HasItems(hero, ItRi_LinkerRingDerEhre) && Npc_HasItems(hero, ItRi_RechterRingDerEhre)) {
		Spine_UnlockAchievement(SPINE_ACHIEVEMENT_37);
	};
	
	if (CurrentLevel == BERGWELT_ZEN) {
		if (Npc_HasItems(hero, ITAR_SleeperMask)) {
			Spine_UnlockAchievement(SPINE_ACHIEVEMENT_32);
		};
	};
};