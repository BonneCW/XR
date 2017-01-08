const int ORCBITER_ID = 1;
const int KEILER_ID = 2;
const int ICWOLF_ID = 3;
const int GOBBO_WARRIOR_VISIR_ID = 4;
const int GIANT_DESERTRAT_ID = 5;
const int BLOODHOUND_ID = 6;
const int BLATTCRAWLER_ID = 7;
const int ALLIGATOR_ID = 8;
const int RAZOR_ID = 9;
const int ALRAUNE_ID = 10;
const int SWAMPZOMBIE_ID = 11;
const int SWAMPZOMBIE_MOOR_ID = 12;
const int SWAMPRAT_ID = 13;
const int SWAMPDRONE_ID = 14;
const int PUMA_ID = 15;
const int STONEPUMA_ID = 16;
const int BLOODFLY_ID = 17;
const int YBLOODFLY_ID = 18;
const int DRAGONSNAPPER_ID = 19;
const int DEMON_ID = 20;
const int DEMONLORD_ID = 21;
const int DEMONHIGH_ID = 22;
const int EISDRACHENSNAPPER_ID = 23;
const int GOBBO_SKELETON_ID = 24;
const int GOBBO_SKELETON_EIS_ID = 25;
const int GOBBO_GREEN_ID = 26;
const int YGOBBO_GREEN_ID = 27;
const int GOBBO_EIS_ID = 28;
const int GOBBO_BLACK_ID = 29;
const int EISGOBLIN_ID = 30;
const int GIANT_RAT_ID = 31;
const int RAT_ID = 32;
const int GIANT_BUG_ID = 33;
const int YGIANT_BUG_ID = 34;
const int FLEISCHFLY_ID = 35;
const int YFLEISCHFLY_ID = 36;
const int FIREWARAN_ID = 37;
const int EISWARAN_ID = 38;
const int HARPIE_ID = 39;
const int MOLERAT_ID = 40;
const int YMOLERAT_ID = 41;
const int MOLERAT_BIG_ID = 42;
const int MINECRAWLER_ID = 43;
const int MINECRAWLERWARRIOR_ID = 44;
const int KRISTALLMINECRAWLER_ID = 45;
const int KRISTALLCRAWLER_ID = 46;
const int MEATBUG_ID = 47;
const int LURKER_ID = 48;
const int LURKER01_ID = 49;
const int LURKER_YOUNG_ID = 50;
const int LURKER_SWAMP_ID = 51;
const int LURKER_WIESE_ID = 52;
const int LURKER_STRAND_ID = 53;
const int LURKER_CAVE_ID = 54;
const int LURKER_WALD_ID = 55;
const int RABBIT_ID = 56;
const int ICERABBIT_ID = 57;
const int SNAPPER_ID = 58;
const int SKELETONMAGE_ID = 59;
const int SKELETON_ID = 60;
const int SKELETONWARRIOR_ID = 61;
const int LESSER_SKELETON_ID = 62;
const int SHADOWBEAST_ID = 63;
const int SHADOWBEAST_SKELETON_ID = 64;
const int SCAVENGER_ICE_ID = 65;
const int SCAVENGER_DEMON_ID = 66;
const int SCAVENGER_ID = 67;
const int YSCAVENGER_ID = 68;
const int SPIDER_ID = 69;
const int SPIDER_01_ID = 70;
const int WOLF_ID = 71;
const int YWOLF_ID = 72;
const int WISP_ID = 73;
const int WARG_ID = 74;
const int BLACKWOLF_ID = 75;
const int WARAN_ID = 76;
const int TROLL_ID = 77;
const int YTROLL_ID = 78;
const int SWAMPSHARK_ID = 79;
const int ZOMBIERANDOM_ID = 80;
const int EISTROLL_ID = 81;

class RespawnObject {
	var int id; // Die Monsterinstanz
	var string wp; // Der Wegpunkt
	var int chapter; // The chapter this monster died
	var int area;	// the area (world) this monster died
};

const int MAX_RESPAWN = 2000; // Wir definieren diese Konstante, um unser System leicher anpassen zu können, z.B. bei vielen Monstern. Außerdem ist das schöner.
var int RespawnArray[MAX_RESPAWN];
var int nextRespawnIndex;

const string RespawnObject_Struct = "auto|4";

instance RespawnObject@(RespawnObject);

func int MeetsRespawnCondition(var c_npc slf) {
	var int canRespawn; canRespawn = FALSE;
	canRespawn = (CurrentLevel == NEWWORLD_ZEN || CurrentLevel == ADDONWORLD_ZEN || CurrentLevel == MINENTAL_ZEN || CurrentLevel == PATHERION_ZEN || CurrentLevel == EISGEBIET_ZEN || CurrentLevel == RELENDEL_ZEN);
	var int isValidInstance; isValidInstance = FALSE;
	isValidInstance = 
		(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(OrcBiter)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Keiler)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(IceWolf)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Warrior_Visir)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Giant_DesertRat)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bloodhound)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Blattcrawler)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Alligator)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Razor)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Alraune)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SwampZombie)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SwampZombie_Moor)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Swamprat)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SwampDrone)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Puma)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(StonePuma)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bloodfly)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(YBloodfly)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DragonSnapper)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DemonLord)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DemonHigh)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Demon)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Eisdrachensnapper)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Skeleton)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Skeleton_Eis)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Green)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(YGobbo_Green)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Eis)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Eisgoblin)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Black)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Giant_Rat)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Rat)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Giant_Bug)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(YGiant_Bug)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Fleischfly)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(YFleischfly)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(FireWaran)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(EisWaran)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Harpie)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Molerat)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Molerat_Big)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(YMolerat)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(MinecrawlerWarrior)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Minecrawler)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(KristallMinecrawler)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Kristallcrawler)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Meatbug)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lurker)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lurker_Young)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lurker01)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lurker_Swamp)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lurker_Wiese)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lurker_Strand)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lurker_Höhle)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lurker_Wald)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Rabbit)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(IceRabbit)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Snapper)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SkeletonMage)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Skeleton)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SkeletonWarrior)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lesser_Skeleton)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Shadowbeast_Skeleton)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Shadowbeast)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Scavenger_Ice)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Scavenger_Demon)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Scavenger)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(YScavenger)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Spider)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Spider_01)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Wolf)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(YWolf)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Wisp)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Warg)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BlackWolf)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Waran)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Troll)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(YTroll)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Swampshark)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ZombieRandom)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(IcewolfEISGEBIET)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SchneeHase)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Zombie_Eisschnee)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Troll_Black_Eis)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Scavenger_RELENDEL)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Molerat_RELENDEL)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lurker_RELENDEL)
		|| Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Wolf_RELENDEL));
	canRespawn = canRespawn && slf.guild > GIL_SEPERATOR_HUM && isValidInstance && !Hlp_StrCmp(slf.wp, "TOT");
	return canRespawn;
};

func int MapRespawnInstanceToID(var int inst) {
	var int id;
	id = 0;
	if (inst == Hlp_GetInstanceID(OrcBiter)) {
		id = ORCBITER_ID;
	} else if (inst == Hlp_GetInstanceID(Keiler)) {
		id = KEILER_ID;
	} else if (inst == Hlp_GetInstanceID(IceWolf)) {
		id = ICWOLF_ID;
	} else if (inst == Hlp_GetInstanceID(Gobbo_Warrior_Visir)) {
		id = GOBBO_WARRIOR_VISIR_ID;
	} else if (inst == Hlp_GetInstanceID(Giant_DesertRat)) {
		id = GIANT_DESERTRAT_ID;
	} else if (inst == Hlp_GetInstanceID(Bloodhound)) {
		id = BLOODHOUND_ID;
	} else if (inst == Hlp_GetInstanceID(Blattcrawler)) {
		id = BLATTCRAWLER_ID;
	} else if (inst == Hlp_GetInstanceID(Alligator)) {
		id = ALLIGATOR_ID;
	} else if (inst == Hlp_GetInstanceID(Razor)) {
		id = RAZOR_ID;
	} else if (inst == Hlp_GetInstanceID(Alraune)) {
		id = ALRAUNE_ID;
	} else if (inst == Hlp_GetInstanceID(SwampZombie)) {
		id = SWAMPZOMBIE_ID;
	} else if (inst == Hlp_GetInstanceID(SwampZombie_Moor)) {
		id = SWAMPZOMBIE_MOOR_ID;
	} else if (inst == Hlp_GetInstanceID(Swamprat)) {
		id = SWAMPRAT_ID;
	} else if (inst == Hlp_GetInstanceID(SwampDrone)) {
		id = SWAMPDRONE_ID;
	} else if (inst == Hlp_GetInstanceID(Puma)) {
		id = PUMA_ID;
	} else if (inst == Hlp_GetInstanceID(StonePuma)) {
		id = STONEPUMA_ID;
	} else if (inst == Hlp_GetInstanceID(Bloodfly)) {
		id = BLOODFLY_ID;
	} else if (inst == Hlp_GetInstanceID(YBloodfly)) {
		id = YBLOODFLY_ID;
	} else if (inst == Hlp_GetInstanceID(DragonSnapper)) {
		id = DRAGONSNAPPER_ID;
	} else if (inst == Hlp_GetInstanceID(DemonLord)) {
		id = DEMONLORD_ID;
	} else if (inst == Hlp_GetInstanceID(DemonHigh)) {
		id = DEMONHIGH_ID;
	} else if (inst == Hlp_GetInstanceID(Demon)) {
		id = DEMON_ID;
	} else if (inst == Hlp_GetInstanceID(Eisdrachensnapper)) {
		id = EISDRACHENSNAPPER_ID;
	} else if (inst == Hlp_GetInstanceID(Gobbo_Skeleton)) {
		id = GOBBO_SKELETON_ID;
	} else if (inst == Hlp_GetInstanceID(Gobbo_Skeleton_Eis)) {
		id = GOBBO_SKELETON_EIS_ID;
	} else if (inst == Hlp_GetInstanceID(Gobbo_Green)) {
		id = GOBBO_GREEN_ID;
	} else if (inst == Hlp_GetInstanceID(YGobbo_Green)) {
		id = YGOBBO_GREEN_ID;
	} else if (inst == Hlp_GetInstanceID(Gobbo_Eis)) {
		id = GOBBO_EIS_ID;
	} else if (inst == Hlp_GetInstanceID(Eisgoblin)) {
		id = EISGOBLIN_ID;
	} else if (inst == Hlp_GetInstanceID(Gobbo_Black)) {
		id = GOBBO_BLACK_ID;
	} else if (inst == Hlp_GetInstanceID(Giant_Rat)) {
		id = GIANT_RAT_ID;
	} else if (inst == Hlp_GetInstanceID(Rat)) {
		id = RAT_ID;
	} else if (inst == Hlp_GetInstanceID(Giant_Bug)) {
		id = GIANT_BUG_ID;
	} else if (inst == Hlp_GetInstanceID(YGiant_Bug)) {
		id = YGIANT_BUG_ID;
	} else if (inst == Hlp_GetInstanceID(Fleischfly)) {
		id = FLEISCHFLY_ID;
	} else if (inst == Hlp_GetInstanceID(YFleischfly)) {
		id = YFLEISCHFLY_ID;
	} else if (inst == Hlp_GetInstanceID(FireWaran)) {
		id = FIREWARAN_ID;
	} else if (inst == Hlp_GetInstanceID(EisWaran)) {
		id = EISWARAN_ID;
	} else if (inst == Hlp_GetInstanceID(Harpie)) {
		id = HARPIE_ID;
	} else if (inst == Hlp_GetInstanceID(Molerat)) {
		id = MOLERAT_ID;
	} else if (inst == Hlp_GetInstanceID(Molerat_Big)) {
		id = MOLERAT_BIG_ID;
	} else if (inst == Hlp_GetInstanceID(YMolerat)) {
		id = YMOLERAT_ID;
	} else if (inst == Hlp_GetInstanceID(MinecrawlerWarrior)) {
		id = MINECRAWLERWARRIOR_ID;
	} else if (inst == Hlp_GetInstanceID(Minecrawler)) {
		id = MINECRAWLER_ID;
	} else if (inst == Hlp_GetInstanceID(KristallMinecrawler)) {
		id = KRISTALLMINECRAWLER_ID;
	} else if (inst == Hlp_GetInstanceID(Kristallcrawler)) {
		id = KRISTALLCRAWLER_ID;
	} else if (inst == Hlp_GetInstanceID(Meatbug)) {
		id = MEATBUG_ID;
	} else if (inst == Hlp_GetInstanceID(Lurker)) {
		id = LURKER_ID;
	} else if (inst == Hlp_GetInstanceID(Lurker_Young)) {
		id = LURKER_YOUNG_ID;
	} else if (inst == Hlp_GetInstanceID(Lurker01)) {
		id = LURKER01_ID;
	} else if (inst == Hlp_GetInstanceID(Lurker_Swamp)) {
		id = LURKER_SWAMP_ID;
	} else if (inst == Hlp_GetInstanceID(Lurker_Wiese)) {
		id = LURKER_WIESE_ID;
	} else if (inst == Hlp_GetInstanceID(Lurker_Strand)) {
		id = LURKER_STRAND_ID;
	} else if (inst == Hlp_GetInstanceID(Lurker_Höhle)) {
		id = LURKER_CAVE_ID;
	} else if (inst == Hlp_GetInstanceID(Lurker_Wald)) {
		id = LURKER_WALD_ID;
	} else if (inst == Hlp_GetInstanceID(Rabbit)) {
		id = RABBIT_ID;
	} else if (inst == Hlp_GetInstanceID(IceRabbit)) {
		id = ICERABBIT_ID;
	} else if (inst == Hlp_GetInstanceID(Snapper)) {
		id = SNAPPER_ID;
	} else if (inst == Hlp_GetInstanceID(SkeletonMage)) {
		id = SKELETONMAGE_ID;
	} else if (inst == Hlp_GetInstanceID(Skeleton)) {
		id = SKELETON_ID;
	} else if (inst == Hlp_GetInstanceID(SkeletonWarrior)) {
		id = SKELETONWARRIOR_ID;
	} else if (inst == Hlp_GetInstanceID(Lesser_Skeleton)) {
		id = LESSER_SKELETON_ID;
	} else if (inst == Hlp_GetInstanceID(Shadowbeast_Skeleton)) {
		id = SHADOWBEAST_SKELETON_ID;
	} else if (inst == Hlp_GetInstanceID(Shadowbeast)) {
		id = SHADOWBEAST_ID;
	} else if (inst == Hlp_GetInstanceID(Scavenger_Ice)) {
		id = SCAVENGER_ICE_ID;
	} else if (inst == Hlp_GetInstanceID(Scavenger_Demon)) {
		id = SCAVENGER_DEMON_ID;
	} else if (inst == Hlp_GetInstanceID(Scavenger)) {
		id = SCAVENGER_ID;
	} else if (inst == Hlp_GetInstanceID(YScavenger)) {
		id = YSCAVENGER_ID;
	} else if (inst == Hlp_GetInstanceID(Spider)) {
		id = SPIDER_ID;
	} else if (inst == Hlp_GetInstanceID(Spider_01)) {
		id = SPIDER_01_ID;
	} else if (inst == Hlp_GetInstanceID(Wolf)) {
		id = WOLF_ID;
	} else if (inst == Hlp_GetInstanceID(YWolf)) {
		id = YWOLF_ID;
	} else if (inst == Hlp_GetInstanceID(Wisp)) {
		id = WISP_ID;
	} else if (inst == Hlp_GetInstanceID(Warg)) {
		id = WARG_ID;
	} else if (inst == Hlp_GetInstanceID(BlackWolf)) {
		id = BLACKWOLF_ID;
	} else if (inst == Hlp_GetInstanceID(Waran)) {
		id = WARAN_ID;
	} else if (inst == Hlp_GetInstanceID(Troll)) {
		id = TROLL_ID;
	} else if (inst == Hlp_GetInstanceID(YTroll)) {
		id = YTROLL_ID;
	} else if (inst == Hlp_GetInstanceID(Swampshark)) {
		id = SWAMPSHARK_ID;
	} else if (inst == Hlp_GetInstanceID(ZombieRandom)) {
		id = ZOMBIERANDOM_ID;
	} else if (inst == Hlp_GetInstanceID(IcewolfEISGEBIET)) {
		id = ICWOLF_ID;
	} else if (inst == Hlp_GetInstanceID(SchneeHase)) {
		id = ICERABBIT_ID;
	} else if (inst == Hlp_GetInstanceID(Zombie_Eisschnee)) {
		id = ZOMBIERANDOM_ID;
	} else if (inst == Hlp_GetInstanceID(Troll_Black_Eis)) {
		id = EISTROLL_ID;
	} else if (inst == Hlp_GetInstanceID(Scavenger_RELENDEL)) {
		id = SCAVENGER_ID;
	} else if (inst == Hlp_GetInstanceID(Molerat_RELENDEL)) {
		id = MOLERAT_ID;
	} else if (inst == Hlp_GetInstanceID(Lurker_RELENDEL)) {
		id = LURKER_ID;
	} else if (inst == Hlp_GetInstanceID(Wolf_RELENDEL)) {
		id = WOLF_ID;
	};
	return id;
};

func int MapRespawnInstance(var int id) {
	var int inst;
	inst = -1;
	if (KEILER_ID == id && Kapitel >= 4) {
		inst = RiesenKeiler;
	} else if (BLOODFLY_ID == id && Kapitel >= 4) {
		inst = SwampDrone;
	} else if (YBLOODFLY_ID == id && Kapitel >= 4) {
		inst = SwampDrone;
	} else if (YBLOODFLY_ID == id && Kapitel >= 2) {
		inst = Bloodfly;
	} else if (DEMONLORD_ID == id && Kapitel >= 6) {
		inst = DemonHigh;
	} else if (DEMON_ID == id && Kapitel >= 6) {
		inst = DemonHigh;
	} else if (DEMON_ID == id && Kapitel >= 4) {
		inst = DemonLord;
	} else if (GOBBO_GREEN_ID == id && Kapitel >= 5) {
		inst = Gobbo_Warrior_Visir;
	} else if (GOBBO_GREEN_ID == id && Kapitel >= 3) {
		inst = Gobbo_Black;
	} else if (YGOBBO_GREEN_ID == id && Kapitel >= 5) {
		inst = Gobbo_Warrior_Visir;
	} else if (YGOBBO_GREEN_ID == id && Kapitel >= 3) {
		inst = Gobbo_Black;
	} else if (YGOBBO_GREEN_ID == id && Kapitel >= 2) {
		inst = Gobbo_Green;
	} else if (GOBBO_BLACK_ID == id && Kapitel >= 5) {
		inst = Gobbo_Warrior_Visir;
	} else if (YGIANT_BUG_ID == id && Kapitel >= 2) {
		inst = Giant_Bug;
	} else if (YFLEISCHFLY_ID == id && Kapitel >= 2) {
		inst = Fleischfly;
	} else if (MOLERAT_ID == id && Kapitel >= 4) {
		inst = Molerat_Big;
	} else if (YMOLERAT_ID == id && Kapitel >= 4) {
		inst = Molerat_Big;
	} else if (YMOLERAT_ID == id && Kapitel >= 2) {
		inst = Molerat;
	} else if (MINECRAWLER_ID == id && Kapitel >= 4) {
		inst = MinecrawlerWarrior;
	} else if (LURKER_YOUNG_ID == id && Kapitel >= 2) {
		inst = Lurker;
	} else if (SNAPPER_ID == id && Kapitel >= 4) {
		inst = DragonSnapper;
	} else if (LESSER_SKELETON_ID == id && Kapitel >= 4) {
		inst = SkeletonWarrior;
	} else if (LESSER_SKELETON_ID == id && Kapitel >= 2) {
		inst = Skeleton;
	} else if (LESSER_SKELETON_ID == id && Kapitel >= 4) {
		inst = Skeleton;
	} else if (SCAVENGER_ID == id && Kapitel >= 3) {
		inst = Scavenger_Demon;
	} else if (WOLF_ID == id && Kapitel >= 5) {
		inst = RiesenWolf;
	} else if (YWOLF_ID == id && Kapitel >= 5) {
		inst = RiesenWolf;
	} else if (YWOLF_ID == id && Kapitel >= 2) {
		inst = Wolf;
	} else if (WARG_ID == id && Kapitel >= 5) {
		inst = Schattenwark;
	} else if (BLACKWOLF_ID == id && Kapitel >= 4) {
		inst = Warg;
	} else if (WARAN_ID == id && Kapitel >= 4 && CurrentLevel == EISGEBIET_ZEN) {
		inst = EisWaran;
	} else if (WARAN_ID == id && Kapitel >= 4 && CurrentLevel != EISGEBIET_ZEN) {
		inst = FireWaran;
	} else if (TROLL_ID == id && Kapitel >= 5) {
		inst = Troll_Black;
	} else if (YTROLL_ID == id && Kapitel >= 5 && CurrentLevel == EISGEBIET_ZEN) {
		inst = Troll_Black;
	} else if (YTROLL_ID == id && Kapitel >= 5 && CurrentLevel != EISGEBIET_ZEN) {
		inst = Troll_Black_Eis;
	} else if (YTROLL_ID == id && Kapitel >= 2) {
		inst = Troll;
	} else if (RAZOR_ID == id && Kapitel >= 5) {
		inst = SKELETRazor;
	} else {
		if (id == ORCBITER_ID) {
			inst = OrcBiter;
		} else if (id == KEILER_ID) {
			inst = Keiler;
		} else if (id == ICWOLF_ID) {
			inst = IceWolf;
		} else if (id == GOBBO_WARRIOR_VISIR_ID) {
			inst = Gobbo_Warrior_Visir;
		} else if (id == GIANT_DESERTRAT_ID) {
			inst = Giant_DesertRat;
		} else if (id == BLOODHOUND_ID) {
			inst = Bloodhound;
		} else if (id == BLATTCRAWLER_ID) {
			inst = Blattcrawler;
		} else if (id == ALLIGATOR_ID) {
			inst = Alligator;
		} else if (id == RAZOR_ID) {
			inst = Razor;
		} else if (id == ALRAUNE_ID) {
			inst = Alraune;
		} else if (id == SWAMPZOMBIE_ID) {
			inst = SwampZombie;
		} else if (id == SWAMPZOMBIE_MOOR_ID) {
			inst = SwampZombie_Moor;
		} else if (id == SWAMPRAT_ID) {
			inst = SwampRat;
		} else if (id == SWAMPDRONE_ID) {
			inst = SwampDrone;
		} else if (id == PUMA_ID) {
			inst = Puma;
		} else if (id == STONEPUMA_ID) {
			inst = StonePuma;
		} else if (id == BLOODFLY_ID) {
			inst = Bloodfly;
		} else if (id == YBLOODFLY_ID) {
			inst = YBloodfly;
		} else if (id == DRAGONSNAPPER_ID) {
			inst = DragonSnapper;
		} else if (id == DEMON_ID) {
			inst = Demon;
		} else if (id == DEMONLORD_ID) {
			inst = DemonLord;
		} else if (id == DEMONHIGH_ID) {
			inst = DemonHigh;
		} else if (id == EISDRACHENSNAPPER_ID) {
			inst = Eisdrachensnapper;
		} else if (id == GOBBO_SKELETON_ID) {
			inst = Gobbo_Skeleton;
		} else if (id == GOBBO_SKELETON_EIS_ID) {
			inst = Gobbo_Skeleton_Eis;
		} else if (id == GOBBO_GREEN_ID) {
			inst = Gobbo_Green;
		} else if (id == YGOBBO_GREEN_ID) {
			inst = YGobbo_Green;
		} else if (id == GOBBO_EIS_ID) {
			inst = Gobbo_Eis;
		} else if (id == GOBBO_BLACK_ID) {
			inst = Gobbo_Black;
		} else if (id == EISGOBLIN_ID) {
			inst = Eisgoblin;
		} else if (id == GIANT_RAT_ID) {
			inst = Giant_Rat;
		} else if (id == RAT_ID) {
			inst = Rat;
		} else if (id == GIANT_BUG_ID) {
			inst = Giant_Bug;
		} else if (id == YGIANT_BUG_ID) {
			inst = YGiant_Bug;
		} else if (id == FLEISCHFLY_ID) {
			inst = Fleischfly;
		} else if (id == YFLEISCHFLY_ID) {
			inst = YFleischfly;
		} else if (id == FIREWARAN_ID) {
			inst = FireWaran;
		} else if (id == EISWARAN_ID) {
			inst = Eiswaran;
		} else if (id == HARPIE_ID) {
			inst = Harpie;
		} else if (id == MOLERAT_ID) {
			inst = Molerat;
		} else if (id == YMOLERAT_ID) {
			inst = YMolerat;
		} else if (id == MOLERAT_BIG_ID) {
			inst = Molerat_Big;
		} else if (id == MINECRAWLER_ID) {
			inst = Minecrawler;
		} else if (id == MINECRAWLERWARRIOR_ID) {
			inst = MinecrawlerWarrior;
		} else if (id == KRISTALLCRAWLER_ID) {
			inst = Kristallcrawler;
		} else if (id == MEATBUG_ID) {
			inst = Meatbug;
		} else if (id == LURKER_ID) {
			inst = Lurker;
		} else if (id == LURKER01_ID) {
			inst = Lurker01;
		} else if (id == LURKER_CAVE_ID) {
			inst = Lurker_Höhle;
		} else if (id == LURKER_STRAND_ID) {
			inst = Lurker_Strand;
		} else if (id == LURKER_SWAMP_ID) {
			inst = Lurker_Swamp;
		} else if (id == LURKER_WALD_ID) {
			inst = Lurker_Wald;
		} else if (id == LURKER_WIESE_ID) {
			inst = Lurker_Wiese;
		} else if (id == LURKER_YOUNG_ID) {
			inst = Lurker_Young;
		} else if (id == RABBIT_ID) {
			inst = Rabbit;
		} else if (id == ICERABBIT_ID) {
			inst = IceRabbit;
		} else if (id == SNAPPER_ID) {
			inst = Snapper;
		} else if (id == SKELETONMAGE_ID) {
			inst = SkeletonMage;
		} else if (id == SKELETON_ID) {
			inst = Skeleton;
		} else if (id == SKELETONWARRIOR_ID) {
			inst = SkeletonWarrior;
		} else if (id == LESSER_SKELETON_ID) {
			inst = Lesser_Skeleton;
		} else if (id == SHADOWBEAST_ID) {
			inst = Shadowbeast;
		} else if (id == SHADOWBEAST_SKELETON_ID) {
			inst = Shadowbeast_Skeleton;
		} else if (id == SCAVENGER_ICE_ID) {
			inst = Scavenger_Ice;
		} else if (id == SCAVENGER_DEMON_ID) {
			inst = Scavenger_Demon;
		} else if (id == SCAVENGER_ID) {
			inst = Scavenger;
		} else if (id == YSCAVENGER_ID) {
			inst = YScavenger;
		} else if (id == SPIDER_ID) {
			inst = Spider;
		} else if (id == SPIDER_01_ID) {
			inst = Spider_01;
		} else if (id == WOLF_ID) {
			inst = Wolf;
		} else if (id == YWOLF_ID) {
			inst = YWolf;
		} else if (id == WISP_ID) {
			inst = Wisp;
		} else if (id == WARG_ID) {
			inst = Warg;
		} else if (id == BLACKWOLF_ID) {
			inst = BlackWolf;
		} else if (id == WARAN_ID) {
			inst = Waran;
		} else if (id == TROLL_ID) {
			inst = Troll;
		} else if (id == YTROLL_ID) {
			inst = YTroll;
		} else if (id == SWAMPSHARK_ID) {
			inst = Swampshark;
		} else if (id == ZOMBIERANDOM_ID) {
			inst = ZombieRandom;
		} else if (id == EISTROLL_ID) {
			inst = Troll_Black_Eis;
		};
	};
	return inst;
};

func void RemoveRespawnObject(var int hndl, var int i) {
	if (nextRespawnIndex == 0) { // Das Array ist leer.
		return;
	};

	delete(hndl); // Hier erledigen wir den PM-Teil unseres Destruktors, alles weitere macht PM dann selber. Unter anderem wird versucht, Respawn_Object_Delete() aufzurufen, allerdings gibt es diese Funktion nicht (sie ist optional)
	
	var int h; h = MEM_ReadStatArr(RespawnArray, i); //[I]// h = RespawnArray;
	MEM_WriteStatArr(RespawnArray, i, MEM_ReadStatArr(RespawnArray, nextRespawnIndex - 1)); // Alte Referenz mit der letzten Referenz überschreiben
	MEM_WriteStatArr(RespawnArray, nextRespawnIndex - 1, 0); // Letzte Referenz gleich 0 setzen
	nextRespawnIndex -= 1; // Unseren Zähler dekrementieren
	return; // Mehr wollen wir nicht machen.	
};

func void CheckRespawns() {
	if (nextRespawnIndex == 0) { // Das Array ist leer.
		return;
	};
	var int i; i = 0; // Das mag verwirren, aber ich baue bloß eine Schleife in Daedalus. Mit dem neuen Ikarus-Release geht das auch wesentlich schöner. 
	var int pos; pos = MEM_StackPos.position; // Stellt euch einfach vor, das hier wäre eine While(1)-Schleife. Zur Übersicht habe ich eingerückt.
	
		var int hndl; hndl = MEM_ReadStatArr(RespawnArray, i); // hndl = RespawnArray[i];
		var RespawnObject myRespawnObject; myRespawnObject = get(hndl);
		PrintDebug(ConcatStrings("Respawn: Check i = ", IntToString(i)));
		PrintDebug(ConcatStrings("Respawn: id = ", IntToString(myRespawnObject.id)));
		PrintDebug(ConcatStrings("Respawn: wp = ", myRespawnObject.wp));
		PrintDebug(ConcatStrings("Respawn: length = ", IntToString(STR_Len(myRespawnObject.wp))));
		
		//Jetzt haben wir unser Objekt!
		if (STR_Len(myRespawnObject.wp) == 0) {
			RemoveRespawnObject(hndl, i);
		} else if (myRespawnObject.chapter < Kapitel && myRespawnObject.area == CurrentLevel) {
			var int newInst; newInst = myRespawnObject.id;
			newInst = MapRespawnInstance(newInst);
			if (newInst != -1) {
				Wld_InsertNpc(newInst, myRespawnObject.wp);
			};
			RemoveRespawnObject(hndl, i);
		} else {
			i += 1; // Falls ich ein Objekt gelöscht habe, muss ich den selben Index nochmal lesen.
		};	
	if (i >= nextRespawnIndex) { // Wenn i größer oder gleich dem nextRespawnIndex ist, haben wir das Array komplett durchlaufen.
		return;
	};
	MEM_StackPos.position = pos;
};

func void AddToRespawnArray(var c_npc slf) {
	PrintDebug("Respawn: Adding Respawner");
	if (!MeetsRespawnCondition(slf)) {
		PrintDebug("Respawn: Skipped Add Because of no respawner");
		return;
	};
	if (nextRespawnIndex == MAX_RESPAWN) {
		PrintDebug("Respawn: Skipped Add Because of Too many");
		return;
	};
	var int hndl; hndl = new(RespawnObject@);
	MEM_WriteStatArr(RespawnArray, nextRespawnIndex, hndl); // RespawnArray[nextRespawnIndex] = hndl;
	nextRespawnIndex += 1; // Beim nächsten Mal in den nächsten Index schreiben
	
	var RespawnObject myRespawnObject; myRespawnObject = get(hndl);
	var int inst; inst = Hlp_GetInstanceID(slf);
	var int id; id = MapRespawnInstanceToID(inst);
	myRespawnObject.id = id;
	myRespawnObject.wp = slf.wp;
	myRespawnObject.chapter = Kapitel;
	myRespawnObject.area = CurrentLevel;
	PrintDebug(ConcatStrings("Respawn: wp = ", slf.wp));
	
	if (STR_Len(myRespawnObject.wp) == 0) {
		RemoveRespawnObject(hndl, nextRespawnIndex - 1);
	};
};
