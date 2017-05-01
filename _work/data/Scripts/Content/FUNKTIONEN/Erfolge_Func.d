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
	amount += Spine_OverallSaveGetInt("UndeadOrcWarrior");
	amount += Spine_OverallSaveGetInt("UndeadOrcPriest");
	amount += Spine_OverallSaveGetInt("WaterOrc");
	amount += Spine_OverallSaveGetInt("OrcWarrior");
	amount += Spine_OverallSaveGetInt("OrcShaman");
	amount += Spine_OverallSaveGetInt("OrcElite");
	amount += Spine_OverallSaveGetInt("Stoneguardian");
	amount += Spine_OverallSaveGetInt("Erzguardian");
	amount += Spine_OverallSaveGetInt("Shadowbeast_Fire");
	amount += Spine_OverallSaveGetInt("Razor");
	amount += Spine_OverallSaveGetInt("OrcBiter");
	amount += Spine_OverallSaveGetInt("Keiler");
	amount += Spine_OverallSaveGetInt("Riesenkeiler");
	amount += Spine_OverallSaveGetInt("Icewolf");
	amount += Spine_OverallSaveGetInt("Gobbo_Warrior");
	amount += Spine_OverallSaveGetInt("Giant_DesertRat");
	amount += Spine_OverallSaveGetInt("Bloodhound");
	amount += Spine_OverallSaveGetInt("Blattcrawler");
	amount += Spine_OverallSaveGetInt("Erznager");
	amount += Spine_OverallSaveGetInt("Insect");
	amount += Spine_OverallSaveGetInt("Alligator");
	amount += Spine_OverallSaveGetInt("Zombie");
	amount += Spine_OverallSaveGetInt("Ziege");
	amount += Spine_OverallSaveGetInt("Wolf");
	amount += Spine_OverallSaveGetInt("Riesenwolf");
	amount += Spine_OverallSaveGetInt("Wisp");
	amount += Spine_OverallSaveGetInt("Warg");
	amount += Spine_OverallSaveGetInt("BlackWolf");
	amount += Spine_OverallSaveGetInt("Waran");
	amount += Spine_OverallSaveGetInt("Truhe");
	amount += Spine_OverallSaveGetInt("Troll_Black");
	amount += Spine_OverallSaveGetInt("Troll_Silber");
	amount += Spine_OverallSaveGetInt("Troll");
	amount += Spine_OverallSaveGetInt("Tiger_White");
	amount += Spine_OverallSaveGetInt("Swampshark");
	amount += Spine_OverallSaveGetInt("Swampshark_Undead");
	amount += Spine_OverallSaveGetInt("Lindwurm");
	amount += Spine_OverallSaveGetInt("Wurm");
	amount += Spine_OverallSaveGetInt("StoneGolem");
	amount += Spine_OverallSaveGetInt("ErzGolem");
	amount += Spine_OverallSaveGetInt("EisenGolem");
	amount += Spine_OverallSaveGetInt("Spider");
	amount += Spine_OverallSaveGetInt("Spider_Big");
	amount += Spine_OverallSaveGetInt("Spider_Queen");
	amount += Spine_OverallSaveGetInt("Dalma");
	amount += Spine_OverallSaveGetInt("Snapper");
	amount += Spine_OverallSaveGetInt("FeuerSnapper");
	amount += Spine_OverallSaveGetInt("WasserSnapper");
	amount += Spine_OverallSaveGetInt("SchattenSnapper");
	amount += Spine_OverallSaveGetInt("Sleeper");
	amount += Spine_OverallSaveGetInt("SkeletonMage");
	amount += Spine_OverallSaveGetInt("Skeleton_Lord");
	amount += Spine_OverallSaveGetInt("Skeleton_Lord_Ghost");
	amount += Spine_OverallSaveGetInt("Skeleton");
	amount += Spine_OverallSaveGetInt("SkeletonWarrior");
	amount += Spine_OverallSaveGetInt("Lesser_Skeleton");
	amount += Spine_OverallSaveGetInt("Sheep");
	amount += Spine_OverallSaveGetInt("Hammel");
	amount += Spine_OverallSaveGetInt("Shadowbeast_Skeleton");
	amount += Spine_OverallSaveGetInt("Nightmare_Skeleton");
	amount += Spine_OverallSaveGetInt("Shadowbeast");
	amount += Spine_OverallSaveGetInt("Feuerlaeufer");
	amount += Spine_OverallSaveGetInt("Wasserlaeufer");
	amount += Spine_OverallSaveGetInt("Eislaeufer");
	amount += Spine_OverallSaveGetInt("Nightmare");
	amount += Spine_OverallSaveGetInt("Scavenger_Ice");
	amount += Spine_OverallSaveGetInt("Scavenger_Demon");
	amount += Spine_OverallSaveGetInt("Scavenger");
	amount += Spine_OverallSaveGetInt("Rabbit");
	amount += Spine_OverallSaveGetInt("Orcdog");
	amount += Spine_OverallSaveGetInt("Molerat");
	amount += Spine_OverallSaveGetInt("Minotaurus");
	amount += Spine_OverallSaveGetInt("MinecrawlerWarrior");
	amount += Spine_OverallSaveGetInt("MinecrawlerWarrior_Undead");
	amount += Spine_OverallSaveGetInt("RedCrab");
	amount += Spine_OverallSaveGetInt("MinecrawlerQueen");
	amount += Spine_OverallSaveGetInt("ErznagerQueen");
	amount += Spine_OverallSaveGetInt("Minecrawler");
	amount += Spine_OverallSaveGetInt("Kristallcrawler");
	amount += Spine_OverallSaveGetInt("Meatbug");
	amount += Spine_OverallSaveGetInt("Lurker");
	amount += Spine_OverallSaveGetInt("Kobold");
	amount += Spine_OverallSaveGetInt("IceGolem");
	amount += Spine_OverallSaveGetInt("Harpie");
	amount += Spine_OverallSaveGetInt("Gobbo_Skeleton");
	amount += Spine_OverallSaveGetInt("Gobbo_Green");
	amount += Spine_OverallSaveGetInt("Gobbo_Black");
	amount += Spine_OverallSaveGetInt("Giant_Rat");
	amount += Spine_OverallSaveGetInt("Rat");
	amount += Spine_OverallSaveGetInt("Giant_Bug");
	amount += Spine_OverallSaveGetInt("FireWaran");
	amount += Spine_OverallSaveGetInt("EisWaran");
	amount += Spine_OverallSaveGetInt("FireGolem");
	amount += Spine_OverallSaveGetInt("Erdgigant");
	amount += Spine_OverallSaveGetInt("Eisdrachensnapper");
	amount += Spine_OverallSaveGetInt("DungeonHarpie");
	amount += Spine_OverallSaveGetInt("DragonSnapper");
	amount += Spine_OverallSaveGetInt("RazorSkelett");
	amount += Spine_OverallSaveGetInt("DemonLord");
	amount += Spine_OverallSaveGetInt("DemonHigh");
	amount += Spine_OverallSaveGetInt("Demon");
	amount += Spine_OverallSaveGetInt("LessDemon");
	amount += Spine_OverallSaveGetInt("Blutgolem");
	amount += Spine_OverallSaveGetInt("Bloodfly");
	amount += Spine_OverallSaveGetInt("Balrog");
	amount += Spine_OverallSaveGetInt("Alraune");
	amount += Spine_OverallSaveGetInt("Swamprat");
	amount += Spine_OverallSaveGetInt("SwampGolem");
	amount += Spine_OverallSaveGetInt("SwampDrone");
	amount += Spine_OverallSaveGetInt("Puma");
	amount += Spine_OverallSaveGetInt("StonePuma");
	amount += Spine_OverallSaveGetInt("Apfelbaum");
	amount += Spine_OverallSaveGetInt("StoneGolemerz");
	amount += Spine_OverallSaveGetInt("Kristallgolem");
	amount += Spine_OverallSaveGetInt("UndeadOrcWarriorHorn");
	amount += Spine_OverallSaveGetInt("Hauertroll");
	amount += Spine_OverallSaveGetInt("Schattenwark");
	amount += Spine_OverallSaveGetInt("Zombie_Eisschnee");
	amount += Spine_OverallSaveGetInt("SchneeHase");
	Spine_UpdateAchievementProgress(SPINE_ACHIEVEMENT_23, amount);
};

FUNC VOID CheckWorldTravelerAchievement() {
	var int amount; amount = 0;
	amount += Spine_OverallSaveGetInt("JharkendarVisited");
	amount += Spine_OverallSaveGetInt("KhorinisVisited");
	amount += Spine_OverallSaveGetInt("MinentalVisited");
	amount += Spine_OverallSaveGetInt("OrctempelVisited");
	amount += Spine_OverallSaveGetInt("AbandonedMineVisited");
	amount += Spine_OverallSaveGetInt("OldMineVisited");
	amount += Spine_OverallSaveGetInt("OrcGraveyardVisited");
	amount += Spine_OverallSaveGetInt("FreeMineVisited");
	amount += Spine_OverallSaveGetInt("RitualinselVisited");
	amount += Spine_OverallSaveGetInt("SchatzinselVisited");
	amount += Spine_OverallSaveGetInt("OrcCityVisited");
	amount += Spine_OverallSaveGetInt("XeresFortressVisited");
	amount += Spine_OverallSaveGetInt("IrdorathVisited");
	amount += Spine_OverallSaveGetInt("PatherionVisited");
	amount += Spine_OverallSaveGetInt("BergweltVisited");
	amount += Spine_OverallSaveGetInt("TugettsoVisited");
	amount += Spine_OverallSaveGetInt("GelatoVisited");
	amount += Spine_OverallSaveGetInt("FlyingIsleVisited");
	amount += Spine_OverallSaveGetInt("RelendelVisited");
	amount += Spine_OverallSaveGetInt("HunterCampVisited");
	amount += Spine_OverallSaveGetInt("CloudWorldVisited");
	amount += Spine_OverallSaveGetInt("HalluzinationVisited");
	amount += Spine_OverallSaveGetInt("WaldschluchtVisited");
	amount += Spine_OverallSaveGetInt("DrachentalVisited");
	amount += Spine_OverallSaveGetInt("RelendelMineVisited");
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