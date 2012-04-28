// *******************************************************************
// Startup und Init Funktionen der Level-zen-files
// -----------------------------------------------
// Die STARTUP-Funktionen werden NUR beim ersten Betreten eines Levels 
// (nach NewGame) aufgerufen, die INIT-Funktionen jedesmal
// Die Funktionen müssen so heissen wie die zen-files
// *******************************************************************

// *********
// GLOBAL
// *********
var int INSERT_FAKE_HERO_ONETIME;

func void STARTUP_GLOBAL()
{
	// wird fuer jede Welt aufgerufen (vor STARTUP_<LevelName>)
	Game_InitGerman();
};

func void INIT_GLOBAL()
{
	// wird fuer jede Welt aufgerufen (vor INIT_<LevelName>)
	Game_InitGerman();

	var int divetime;
	divetime = 30000;

	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	if (Kapitel > 1)
	&& (Npc_HasItems(hero, ItMi_PortalRing_Addon) > 0)
	{
		Npc_RemoveInvItems	(hero, ItMi_PortalRing_Addon, Npc_HasItems(hero, ItMi_PortalRing_Addon));
	};

	gameloaded = Hlp_GetNpc(0);

	LeGo_Init(LeGo_All & ~LeGo_Focusnames);

	if (CurrentLevel == SCHIFFSCHLACHT_ZEN)
	{
		StopRain ();
	};

	// Tauchzeit des Heros auf richtigen Wert setzen, da er beim Speichern verloren geht

	if (Npc_KnowsInfo(hero, Info_Mod_Jeremiah_SpecialTrank))
	{
		divetime += 30000;
	};
	if (Mod_Amulett_LangerAtem == TRUE)
	{
		divetime += 30000;
	};
	if (Mod_GuertelDerGolemBand == TRUE)
	{
		divetime -= 15000;
	};

	var oCNpc her;
	her = Hlp_GetNpc (hero);
	var int totaldivingtime;
	totaldivingtime = divetime;	// 60 Sekunden nach dem Trank
	her.divetime = mkf(totaldivingtime);

	// Erfolge einlesen

	if (Erfolg_EifrigerBuesser == 0)
	{
		Erfolg_EifrigerBuesser = STR_ToInt(MEM_GetGothOpt("XERES", "acheb"));
	};
	if (Erfolg_EiserneKonstitution == 0)
	{
		Erfolg_EiserneKonstitution = STR_ToInt(MEM_GetGothOpt("XERES", "achek"));
	};
	if (Erfolg_Backgroundstory2 == 0)
	{
		Erfolg_Backgroundstory2 = STR_ToInt(MEM_GetGothOpt("XERES", "achbgs2"));
	};
	if (Erfolg_FLehrling == 0)
	{
		Erfolg_FLehrling = STR_ToInt(MEM_GetGothOpt("XERES", "achfl"));
	};
	if (Erfolg_Helferlein == 0)
	{
		Erfolg_Helferlein = STR_ToInt(MEM_GetGothOpt("XERES", "achh"));
	};
	if (Erfolg_Kiffer == 0)
	{
		Erfolg_Kiffer = STR_ToInt(MEM_GetGothOpt("XERES", "achk"));
	};
	if (Erfolg_LangeFinger == 0)
	{
		Erfolg_LangeFinger = STR_ToInt(MEM_GetGothOpt("XERES", "achlf"));
	};
	if (Erfolg_Leidensfaehigkeit == 0)
	{
		Erfolg_Leidensfaehigkeit = STR_ToInt(MEM_GetGothOpt("XERES", "achlf"));
	};
	if (Erfolg_MaxLevel == 0)
	{
		Erfolg_MaxLevel = STR_ToInt(MEM_GetGothOpt("XERES", "achlm"));
	};
	if (Erfolg_Magersucht == 0)
	{
		Erfolg_Magersucht = STR_ToInt(MEM_GetGothOpt("XERES", "achms"));
	};
	if (Erfolg_MonsterHunter == 0)
	{
		Erfolg_MonsterHunter = STR_ToInt(MEM_GetGothOpt("XERES", "achmj"));
	};
	if (Erfolg_Rattenjaeger == 0)
	{
		Erfolg_Rattenjaeger = STR_ToInt(MEM_GetGothOpt("XERES", "achrj"));
	};
	if (Erfolg_Seepferdchen == 0)
	{
		Erfolg_Seepferdchen = STR_ToInt(MEM_GetGothOpt("XERES", "achsp"));
	};
	if (Erfolg_Selbstlosigkeit == 0)
	{
		Erfolg_Selbstlosigkeit = STR_ToInt(MEM_GetGothOpt("XERES", "achsl"));
	};
	if (Erfolg_Sparschwein == 0)
	{
		Erfolg_Sparschwein = STR_ToInt(MEM_GetGothOpt("XERES", "achss"));
	};
	if (Erfolg_Trampel == 0)
	{
		Erfolg_Trampel = STR_ToInt(MEM_GetGothOpt("XERES", "achtr"));
	};
	if (Erfolg_Wandlungskuenstler == 0)
	{
		Erfolg_Wandlungskuenstler = STR_ToInt(MEM_GetGothOpt("XERES", "achwk"));
	};
	if (Erfolg_Backgroundstory == 0)
	{
		Erfolg_Backgroundstory = STR_ToInt(MEM_GetGothOpt("XERES", "achbgs1"));
	};
	if (Erfolg_Zeitspiel == 0)
	{
		Erfolg_Zeitspiel = STR_ToInt(MEM_GetGothOpt("XERES", "achzs"));
	};

	if (CurrentErfolge == 0)
	{
		CurrentErfolge = STR_ToInt(MEM_GetGothOpt("XERES", "ach"));

		if (CurrentErfolge > 0)
		{
			Mod_GiveErfolgXP = 1;
		};
	}
	else
	{
		CurrentErfolge = STR_ToInt(MEM_GetGothOpt("XERES", "ach"));

		ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

		Npc_RemoveInvItems	(PC_Hero, ItWr_Erfolge, 1);
		CreateInvItems	(PC_Hero, ItWr_Erfolge, 1);
	};

	Autosave_Blocker = 120;	// nach dem Laden eines Spielstandes wird 2 Minuten nicht automatisch gespeichert

	Mod_KG_TrentLicht = 0;

	username = MEM_GetGothOpt("CLOCKWORK", "username");
	passwort = MEM_GetGothOpt("CLOCKWORK", "passwort");

	Wld_StopEffect("DEMENTOR_FX");

	/*if (!FF_Active(FRAMEFUNC))
	{
		FF_Apply(FRAMEFUNC);
	};

	if (!FF_Active(DAUERFUNC_01))
	{
		FF_ApplyExt(DAUERFUNC_01, 1000, -1);
	};*/

	if (FF_Active(FRAMEFUNC))
	{
		FF_Remove(FRAMEFUNC);
	};

	if (FF_Active(DAUERFUNC_01))
	{
		FF_Remove(DAUERFUNC_01);
	};

	Wld_SendTrigger	("FRAMETRIGGER");
	Wld_SendTrigger ("DAUERTRIGGER");
	Wld_SendTrigger ("SPECIALTRIGGER");

	MEM_SetShowDebug (1);

	SetMagicDamage();

	FixPlayerControllsTurnOnNpcAttackMoveBug();

	ShowManabar(1);

	if (!Hlp_StrCmp(GOTHIC_RESTART, "Y"))
	{
		HookEngine (4349731, 7, "B_ENDGAME");
		HookEngine (7742032, 6, "B_OPENINVENTORY");
		HookEngine (7742480, 9, "B_CLOSEINVENTORY");

		GOTHIC_RESTART = "Y";
	};

	MoreAlphaVobs(2048); //normal: 256
	MoreAlphaPolys(16384); //normal: 2048
};

FUNC VOID OldLevel(var int newlevel)
{
	CurrentLevel2 = newlevel;
};

//------------------------------------------------------------
//		Addon World ADANOSTEMPEL
//------------------------------------------------------------
func void STARTUP_ADDON_PART_ADANOSTEMPLE_01 ()
{
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADATMPL_ENTR_STONEGD_01");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADATMPL_ENTR_STONEGD_02");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADATMPL_ENTR_STONEGD_03");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADATMPL_ENTR_STONEGD_04");

	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_09C");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_09A");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_09B");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_09F");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_09D");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_09E");

	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_05C");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_05A");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_05B");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_05F");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_05D");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_05E");

	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_14C");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_14A");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_14B");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_14F");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_14D");
	Wld_InsertNpc	(ErzGuardian,	"FP_ROAM_ADW_ADANOSTEMPEL_TREASUREPITS_14E");

	Wld_InsertNpc	(ErzGuardian,	"FP_PRAY_RAVEN");
};

func void INIT_SUB_ADDON_PART_ADANOSTEMPLE_01 ()
{
};

func void INIT_ADDON_PART_ADANOSTEMPLE_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	//OldLevel(ADDONWORLD_ZEN);	 

	INIT_SUB_ADDON_PART_ADANOSTEMPLE_01();
};

//------------------------------------------------------------
//		Addon World GOLDMINE
//------------------------------------------------------------
func void STARTUP_ADDON_PART_GOLDMINE_01 ()
{

};

func void INIT_SUB_ADDON_PART_GOLDMINE_01 ()
{
	
};

func void INIT_ADDON_PART_GOLDMINE_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals (); 
	
	INIT_SUB_ADDON_PART_GOLDMINE_01();
};

//------------------------------------------------------------
//		Addon World CANYON
//------------------------------------------------------------
func void STARTUP_ADDON_PART_CANYON_01 ()
{
	// Monster im Canyon - Bereich

	Wld_InsertNpc	(Blattcrawler,	"FP_ROAM_CANYON_MONSTER_37");
	Wld_InsertNpc	(Blattcrawler,	"FP_ROAM_CANYON_MONSTER_40");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_36A");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_36");

	Wld_InsertNpc	(Orcbiter,	"FP_ROAM_CANYON_MONSTER_26");
	Wld_InsertNpc	(Orcbiter,	"FP_ROAM_CANYON_MONSTER_27");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_31");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_33");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_30");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_29");

	Wld_InsertNpc	(Orcbiter,	"FP_ROAM_CANYON_MONSTER_22");
	Wld_InsertNpc	(Orcbiter,	"FP_ROAM_CANYON_MONSTER_23");
	Wld_InsertNpc	(Razor,	"FP_ROAM_CANYON_MONSTER_24");

	Wld_InsertNpc	(Orcbiter,	"FP_ROAM_CANYON_MONSTER_21");
	Wld_InsertNpc	(Orcbiter,	"FP_ROAM_CANYON_MONSTER_20");
	Wld_InsertNpc	(Orcbiter,	"FP_ROAM_CANYON_MONSTER_19");

	Wld_InsertNpc	(Razor,	"FP_ROAM_CANYON_MONSTER_43B");
	Wld_InsertNpc	(Razor,	"FP_ROAM_CANYON_MONSTER_41");

	Wld_InsertNpc	(Orcbiter,	"FP_ROAM_CANYON_MONSTER_47");
	Wld_InsertNpc	(Orcbiter,	"FP_ROAM_CANYON_MONSTER_45");
	Wld_InsertNpc	(Razor,	"FP_ROAM_CANYON_MONSTER_46");

	Wld_InsertNpc	(Orcbiter,	"FP_ROAM_CANYON_MONSTER_50");
	Wld_InsertNpc	(Orcbiter,	"FP_ROAM_CANYON_MONSTER_48");

	Wld_InsertNpc	(Razor,	"FP_ROAM_CANYON_MONSTER_11");
	Wld_InsertNpc	(Razor,	"FP_ROAM_CANYON_MONSTER_12");

	Wld_InsertNpc	(Firegolem,	"FP_ROAM_CANYON_MONSTER_17");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_07");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_70");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_04");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_06");

	Wld_InsertNpc	(Orcbiter,	"FP_ROAM_CANYON_MONSTER_53");
	Wld_InsertNpc	(Orcbiter,	"FP_ROAM_CANYON_MONSTER_51");
	Wld_InsertNpc	(Razor,	"FP_ROAM_CANYON_MONSTER_52");

	Wld_InsertNpc	(Razor,	"FP_ROAM_CANYON_MONSTER_61");
	Wld_InsertNpc	(Razor,	"FP_ROAM_CANYON_MONSTER_60");

	Wld_InsertNpc	(Orcbiter,	"FP_ROAM_CANYON_MONSTER_54");
	Wld_InsertNpc	(Orcbiter,	"FP_ROAM_CANYON_MONSTER_56");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_57");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_59");

	// Monster in der ersten Mine

	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_ADW_CANYON_MINE1_12_02");

	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_ADW_CANYON_MINE1_14_01");
	Wld_InsertNpc	(Minecrawler,	"FP_ROAM_ADW_CANYON_MINE1_14_02");

	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_ADW_CANYON_MINE1_06_02");
	Wld_InsertNpc	(Minecrawler,	"FP_ROAM_ADW_CANYON_MINE1_06_03");

	// Monster in der zweiten Mine

	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_ADW_CANYON_MINE2_09_03");
	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_ADW_CANYON_MINE2_09_02");

	// Monster in der gro?en H?hle

	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_ADW_CANYONBANDITSCAVE_17");
	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_ADW_CANYONBANDITSCAVE_16");

	Wld_InsertNpc	(Stonegolem,	"FP_ROAM_ADW_CANYONBANDITSCAVE_10");

	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_ADW_CANYONBANDITSCAVE_14");
	Wld_InsertNpc	(Minecrawler,	"FP_ROAM_ADW_CANYONBANDITSCAVE_15");

	Wld_InsertNpc	(Minecrawler,	"FP_ROAM_ADW_CANYONBANDITSCAVE_06");
	Wld_InsertNpc	(Minecrawler,	"FP_ROAM_ADW_CANYONBANDITSCAVE_07");

	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_ADW_CANYONBANDITSCAVE_31");
	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_ADW_CANYONBANDITSCAVE_28");

	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_ADW_CANYONBANDITSCAVE_23");

	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_ADW_CANYONBANDITSCAVE_26");
	Wld_InsertNpc	(Minecrawler,	"FP_ROAM_ADW_CANYONBANDITSCAVE_24");

	// Orks im Lager

	Wld_InsertNpc	(Mod_10034_Orc_Schamane_AW,	"CANYONLIBRARY");
	Wld_InsertNpc	(Mod_10035_Orc_Warrior_AW,	"CANYONLIBRARY");
	Wld_InsertNpc	(Mod_10036_Orc_Warrior_AW,	"CANYONLIBRARY");
	Wld_InsertNpc	(Mod_10037_Orc_Scout_AW,	"CANYONLIBRARY");
	Wld_InsertNpc	(Mod_10038_Orc_Scout_AW,	"CANYONLIBRARY");
	
};
func void INIT_SUB_ADDON_PART_CANYON_01 ()
{

};
func void INIT_ADDON_PART_CANYON_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals (); 
	
	INIT_SUB_ADDON_PART_CANYON_01();
};
//------------------------------------------------------------
//		Addon World ENTRANCE
//------------------------------------------------------------
func void STARTUP_ADDON_PART_ENTRANCE_01 ()
{
	// Im Portaltempel

	Wld_InsertNpc	(Monster_11073_Leprechaun_AW,	"ADW_ENTRANCE_2_VALLEY_10");

	// Tempelvorplatz

	Wld_InsertNpc	(Blattcrawler,	"ADW_ENTRANCE_2_VALLEY_10");

	Wld_InsertNpc	(Blattcrawler,	"ADW_ENTRANCE_2_VALLEY_02A");

	Wld_InsertNpc	(Blattcrawler,	"ADW_ENTRANCE_2_VALLEY_05");
	Wld_InsertNpc	(Blattcrawler,	"ADW_ENTRANCE_2_VALLEY_06");

	Wld_InsertNpc	(Blattcrawler,	"ADW_ENTRANCE_2_VALLEY_08");
	Wld_InsertNpc	(Blattcrawler,	"ADW_ENTRANCE_2_VALLEY_08");

	Wld_InsertNpc	(Blattcrawler,	"ADW_ENTRANCE_2_VALLEY_02B");

	Wld_InsertNpc	(Blattcrawler,	"ADW_ENTRANCE_2_VALLEY_11");
	Wld_InsertNpc	(Blattcrawler,	"ADW_ENTRANCE_2_VALLEY_11");

	Wld_InsertNpc	(Blattcrawler,	"ADW_ENTRANCE_BEHINDAKROPOLIS_04");
	Wld_InsertNpc	(Blattcrawler,	"ADW_ENTRANCE_BEHINDAKROPOLIS_04");

	Wld_InsertNpc	(Waran,	"ADW_ENTRANCE_PATH2BANDITS_03");
	Wld_InsertNpc	(Waran,	"ADW_ENTRANCE_PATH2BANDITS_03");

	Wld_InsertNpc	(Blattcrawler,	"ADW_ENTRANCE_PATH2BANDITS_05P");
	Wld_InsertNpc	(Blattcrawler,	"ADW_ENTRANCE_PATH2BANDITS_05P");

	// Weg Richtung Piraten

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_ENTRANCE_2_PIRATECAMP_05");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_ENTRANCE_2_PIRATECAMP_05");

	Wld_InsertNpc	(Blattcrawler,	"ADW_ENTRANCE_2_PIRATECAMP_13");
	Wld_InsertNpc	(Blattcrawler,	"ADW_ENTRANCE_2_PIRATECAMP_13");

	Wld_InsertNpc	(Shadowbeast,	"ADW_ENTRANCE_2_PIRATECAMP_22");

	Wld_InsertNpc	(Gobbo_Warrior,	"ADW_ENTRANCE_2_PIRATECAMP_19");
	Wld_InsertNpc	(Gobbo_Warrior,	"ADW_ENTRANCE_2_PIRATECAMP_19");
	Wld_InsertNpc	(Gobbo_Warrior_Visir,	"ADW_ENTRANCE_2_PIRATECAMP_19");

	// Sumpfseite

	Wld_InsertNpc	(Waran,	"ADW_ENTRANCE_PATH2BANDITS_05");
	Wld_InsertNpc	(Waran,	"ADW_ENTRANCE_PATH2BANDITS_05");

	Wld_InsertNpc	(Waran,	"ADW_ENTRANCE_PATH2BANDITS_10");
	Wld_InsertNpc	(Waran,	"ADW_ENTRANCE_PATH2BANDITS_10");

	Wld_InsertNpc	(Shadowbeast_Skeleton,	"ADW_ENTRANCE_PATH2BANDITSCAVE1_05");

	Wld_InsertNpc	(Shadowbeast_Skeleton,	"ADW_ENTRANCE_PATH2BANDITSCAVE1_06");
};

func void INIT_SUB_ADDON_PART_ENTRANCE_01 ()
{
};

func void INIT_ADDON_PART_ENTRANCE_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals (); 
	
	INIT_SUB_ADDON_PART_ENTRANCE_01();
};
//------------------------------------------------------------
//		Addon World Banditenlager
//------------------------------------------------------------
FUNC VOID STARTUP_ADDON_PART_BANDITSCAMP_01()
{
	// Echsis

	Wld_InsertNpc	(Mod_12000_DRA_Wache_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12001_DRA_Wache_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12002_DRA_Patroullie_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12003_DRA_Albi_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12004_DRA_Wache_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12005_DRA_Wache_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12007_DRA_Wache_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12008_DRA_Wache_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12009_DRA_Echse_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12010_DRA_Echse_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12011_DRA_Echse_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12012_DRA_Echse_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12013_DRA_Echse_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12014_DRA_Echse_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12015_DRA_Echse_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12016_DRA_Echsenhaendler_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12017_DRA_Wache_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12018_DRA_Echse_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12019_DRA_Echse_AW, "BANDIT");
	Wld_InsertNpc	(Mod_12020_DRA_Wache_AW, "BANDIT");

	// Sumpfhai-Seite

	Wld_InsertNpc	(SwampDrone,	"FP_ROAM_SHARK_30");
	Wld_InsertNpc	(SwampDrone,	"FP_ROAM_SHARK_27");
	Wld_InsertNpc	(SwampDrone,	"FP_ROAM_SHARK_24");
	Wld_InsertNpc	(SwampDrone,	"FP_ROAM_SHARK_04");
	Wld_InsertNpc	(SwampDrone,	"FP_ROAM_DANGER_28");
	Wld_InsertNpc	(SwampRat,	"FP_ROAM_SHARK_SPECIAL_02");
	Wld_InsertNpc	(SwampRat,	"FP_STAND_LOGAN");
	Wld_InsertNpc	(SwampRat,	"FP_ROAM_BL_FLIES_07");

	// Golem-Seite

	Wld_InsertNpc	(SwampGolem,	"FP_ITEM_ECHSENEGG_11");
	Wld_InsertNpc	(SwampGolem,	"FP_ROAM_PFUETZE_02");
	Wld_InsertNpc	(SwampGolem,	"FP_ITEM_ECHSENEGG_13");
	Wld_InsertNpc	(SwampGolem,	"FP_ROAM_PFUETZE_17");
	Wld_InsertNpc	(SwampGolem,	"ADW_SWAMP_HILLS_DOWN_05");
	Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HILL_05");
	Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SENAT_09");
	Wld_InsertNpc	(SwampGolem,	"ADW_SENAT_ENTRANCE_01");
	Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SENAT_03");
	Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HILL_11");
	Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HOHLWEG_07");
	Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HOHLWEG_01");
	Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SHARK_14");
	Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SHARK_08");
	Wld_InsertNpc	(SwampGolem,	"FP_ITEM_BANDITSCAMP_10");
	Wld_InsertNpc	(SwampGolem,	"FP_STAND_VP1_02");
	Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SWAMP_04");
};



FUNC VOID INIT_SUB_ADDON_PART_BANDITSCAMP_01()
{	
		//Die portalräume im banditenlager
		Wld_AssignRoomToGuild("tavern01"  , GIL_DRACONIAN);
		Wld_AssignRoomToGuild("beds01"	  , GIL_DRACONIAN);
		Wld_AssignRoomToGuild("merchant01", GIL_NONE);
		Wld_AssignRoomToGuild("schmied01" , GIL_DRACONIAN);
		Wld_AssignRoomToGuild("zoll01"	  , GIL_NONE);
		Wld_AssignRoomToGuild("raven01"	  , GIL_DRACONIAN);
};
FUNC VOID INIT_ADDON_PART_BANDITSCAMP_01()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals (); 
	
	INIT_SUB_ADDON_PART_BANDITSCAMP_01();
};

//#############################################
//###										###
//###			Piratenlager				###
//###										###
//#############################################

FUNC VOID STARTUP_ADDON_PART_PIRATESCAMP_01 ()
{
	// Mod

	Wld_InsertNpc	(Mod_764_PIR_Greg_AW,	"STRAND");
	Wld_InsertNpc	(Mod_775_PIR_Skip_AW,	"STRAND");
	Wld_InsertNpc	(Mod_928_PIR_AlligatorJack_AW,	"STRAND");
	Wld_InsertNpc	(Mod_929_PIR_Bill_AW,	"STRAND");
	Wld_InsertNpc	(Mod_930_PIR_Bones_AW,	"STRAND");
	Wld_InsertNpc	(Mod_931_PIR_Brandon_AW,	"STRAND");
	Wld_InsertNpc	(Mod_932_PIR_Francis_AW,	"STRAND");
	Wld_InsertNpc	(Mod_933_PIR_Garett_AW,	"STRAND");
	Wld_InsertNpc	(Mod_934_PIR_Henry_AW,	"STRAND");
	Wld_InsertNpc	(Mod_935_PIR_Malcom_AW,	"STRAND");
	Wld_InsertNpc	(Mod_936_PIR_Matt_AW,	"STRAND");
	Wld_InsertNpc	(Mod_938_PIR_Morgan_AW,	"STRAND");
	Wld_InsertNpc	(Mod_939_PIR_Owen_AW,	"STRAND");
	Wld_InsertNpc	(Mod_940_PIR_Samuel_AW,	"STRAND");
	Wld_InsertNpc	(Mod_941_PIR_Angus_AW,	"STRAND");
	Wld_InsertNpc	(Mod_942_PIR_Hank_AW,	"STRAND");
	Wld_InsertNpc	(Mod_115_NONE_Eremit_AW,	"STRAND");


	// Namenlose NPC's

	Wld_InsertNpc	(Mod_1077_PIR_PIRAT_AW,	"STRAND");
	Wld_InsertNpc	(Mod_1078_PIR_PIRAT_AW,	"STRAND");
	Wld_InsertNpc	(Mod_1079_PIR_PIRAT_AW,	"STRAND");
	Wld_InsertNpc	(Mod_1080_PIR_PIRAT_AW,	"STRAND");

	// Monster im Talkessel

	Wld_InsertNpc	(Alligator,	"FP_ROAM_WATERHOLE_13");
	Wld_InsertNpc	(Alligator,	"FP_ROAM_WATERHOLE_05");
	Wld_InsertNpc	(Alligator,	"FP_ROAM_WATERHOLE_09");
	Wld_InsertNpc	(Alligator,	"FP_ROAM_WATERHOLE_04");

	Wld_InsertNpc	(Gobbo_Warrior,	"FP_ROAM_WATERHOLE_08");
	Wld_InsertNpc	(Gobbo_Warrior,	"FP_ROAM_WATERHOLE_03");

	Wld_InsertNpc	(Gobbo_Warrior,	"FP_ROAM_WATERHOLE_01");
	Wld_InsertNpc	(Gobbo_Warrior_Visir,	"FP_ROAM_WATERHOLE_02");

	Wld_InsertNpc	(Lurker,	"FP_ROAM_SECRETCAVE_03");
	Wld_InsertNpc	(Lurker,	"FP_ROAM_SECRETCAVE_02");

	// Monster auf dem Weg zum Piratenlager

	Wld_InsertNpc	(Blattcrawler,	"FP_ROAM_PIRATECAMP_WAY_01");
	Wld_InsertNpc	(Blattcrawler,	"FP_ROAM_PIRATECAMP_WAY_03");

	Wld_InsertNpc	(Rabbit,	"FP_ROAM_LUMBER_03");

	Wld_InsertNpc	(Gobbo_Warrior,	"FP_ROAM_PIRAT_001");
	Wld_InsertNpc	(Gobbo_Warrior_Visir,	"FP_ROAM_PIRAT_003");

	Wld_InsertNpc	(Blattcrawler,	"FP_ROAM_PIRAT_008");
	Wld_InsertNpc	(Blattcrawler,	"FP_ROAM_PIRAT_007");

	// Monster am s?dlichen Strand

	Wld_InsertNpc	(Waran,	"FP_ROAM_LONEBEACH_05");
	Wld_InsertNpc	(Waran,	"FP_ROAM_LONEBEACH_13");
	Wld_InsertNpc	(FireWaran,	"FP_ROAM_LONEBEACH_08");
	Wld_InsertNpc	(Waran,	"FP_ROAM_LONEBEACH_11");
	Wld_InsertNpc	(FireWaran,	"FP_ROAM_LONEBEACH_22");
	Wld_InsertNpc	(FireWaran,	"FP_ROAM_LONEBEACH_01");
	Wld_InsertNpc	(FireWaran,	"FP_ROAM_LONEBEACH_03");

	Wld_InsertNpc	(SkeletonWarrior,	"FP_ROAM_LONEBEACH_15");
	Wld_InsertNpc	(Skeleton,	"FP_ROAM_LONEBEACH_14");
	Wld_InsertNpc	(Skeleton,	"FP_ROAM_LONEBEACH_16");

	// Monster am n?rdlichen Strand

	Wld_InsertNpc	(Waran,	"FP_ROAM_BEACH_12");
	Wld_InsertNpc	(Waran,	"FP_ROAM_BEACH_10");
	Wld_InsertNpc	(Waran,	"FP_ROAM_BEACH_05");
	Wld_InsertNpc	(Waran,	"FP_ROAM_BEACH_01");

	// Questmonster

	Wld_InsertNpc	(BrandonWaran,		"ADW_PIRATECAMP_BEACH_27");
};

FUNC VOID INIT_SUB_ADDON_PART_PIRATESCAMP_01 ()
{
};

FUNC VOID INIT_ADDON_PART_PIRATESCAMP_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals (); 
	
	INIT_SUB_ADDON_PART_PIRATESCAMP_01();
};

//#############################################
//###										###
//###			Part VALLEY					###
//###										###
//#############################################

FUNC VOID STARTUP_ADDON_PART_VALLEY_01 ()
{
	Wld_InsertNpc	(Shadowbeast,	"ADW_VALLEY_PATH_058_CAVE_13");

	Wld_InsertNpc	(Snapper,	"ADW_VALLEY_PATH_058");
	Wld_InsertNpc	(Snapper,	"ADW_VALLEY_PATH_058");

	Wld_InsertNpc	(Snapper,	"ADW_VALLEY_PATH_062");
	Wld_InsertNpc	(Snapper,	"ADW_VALLEY_PATH_062");
	Wld_InsertNpc	(Snapper,	"ADW_VALLEY_PATH_062");
	Wld_InsertNpc	(Snapper,	"ADW_VALLEY_PATH_062");

	Wld_InsertNpc	(Snapper,	"ADW_VALLEY_PATH_064_A");
	Wld_InsertNpc	(Snapper,	"ADW_VALLEY_PATH_064_A");
	Wld_InsertNpc	(Snapper,	"ADW_VALLEY_PATH_064_A");

	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_073");
	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_073");
	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_072");
	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_072");
	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_072");
	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_072");

	Wld_InsertNpc	(Gobbo_Warrior,	"ADW_VALLEY_PATH_054_F");
	Wld_InsertNpc	(Gobbo_Warrior,	"ADW_VALLEY_PATH_054_F");
	Wld_InsertNpc	(Gobbo_Warrior_Visir,	"ADW_VALLEY_PATH_054_F");

	Wld_InsertNpc	(Gobbo_Warrior,	"ADW_VALLEY_PATH_054_B");
	Wld_InsertNpc	(Gobbo_Warrior_Visir,	"ADW_VALLEY_PATH_054_B");

	Wld_InsertNpc	(Snapper,	"ADW_VALLEY_PATH_047_G");
	Wld_InsertNpc	(Snapper,	"ADW_VALLEY_PATH_047_G");

	Wld_InsertNpc	(Snapper,	"ADW_VALLEY_PATH_047_D");
	Wld_InsertNpc	(Snapper,	"ADW_VALLEY_PATH_047_D");
	Wld_InsertNpc	(Snapper,	"ADW_VALLEY_PATH_047_D");

	Wld_InsertNpc	(DragonSnapper,	"ADW_VALLEY_PATH_047_D");
	Wld_InsertNpc	(DragonSnapper,	"ADW_VALLEY_PATH_047_D");

	Wld_InsertNpc	(Troll,	"ADW_VALLEY_PATH_048_A");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_045");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_045");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_045");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_043");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_043");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_043");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_038_J");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_038_J");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_038_E");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_038_E");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_038_E");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_032_G");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_032_G");

	Wld_InsertNpc	(Blattcrawler,	"ADW_VALLEY_PATH_102_A");
	Wld_InsertNpc	(Blattcrawler,	"ADW_VALLEY_PATH_102_A");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_110");

	Wld_InsertNpc	(Gobbo_Warrior,	"ADW_VALLEY_PATH_115_D");
	Wld_InsertNpc	(Gobbo_Warrior,	"ADW_VALLEY_PATH_115_D");
	Wld_InsertNpc	(Gobbo_Warrior_Visir,	"ADW_VALLEY_PATH_115_D");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_116_A");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_116_A");

	Wld_InsertNpc	(Blattcrawler,	"ADW_VALLEY_PATH_121_A");
	Wld_InsertNpc	(Blattcrawler,	"ADW_VALLEY_PATH_121_A");

	Wld_InsertNpc	(Blattcrawler,	"ADW_VALLEY_PATH_120_A");
	Wld_InsertNpc	(Blattcrawler,	"ADW_VALLEY_PATH_120_A");
	Wld_InsertNpc	(Blattcrawler,	"ADW_VALLEY_PATH_120_A");

	Wld_InsertNpc	(Blattcrawler,	"ADW_VALLEY_PATH_125");

	Wld_InsertNpc	(Blattcrawler,	"ADW_VALLEY_PATH_129_B");
	Wld_InsertNpc	(Blattcrawler,	"ADW_VALLEY_PATH_129_B");

	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_132");
	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_132");
	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_132");
	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_132");
	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_132");
	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_132");

	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_135");
	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_135");
	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_135");
	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_135");
	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_135");
	Wld_InsertNpc	(ZombieRandom,	"ADW_VALLEY_PATH_135");

	Wld_InsertNpc	(Blattcrawler,	"ADW_VALLEY_PATH_027");
	Wld_InsertNpc	(Blattcrawler,	"ADW_VALLEY_PATH_027");

	Wld_InsertNpc	(SkeletonWarrior,	"FP_ROAM_VALLEY_021");
	Wld_InsertNpc	(SkeletonWarrior,	"FP_ROAM_VALLEY_022");

	Wld_InsertNpc	(Blattcrawler,	"ADW_VALLEY_PATH_024_A");
	Wld_InsertNpc	(Blattcrawler,	"ADW_VALLEY_PATH_024_A");
	Wld_InsertNpc	(Blattcrawler,	"ADW_VALLEY_PATH_024_A");

	Wld_InsertNpc	(Snapper,	"ADW_VALLEY_PATH_017");
	Wld_InsertNpc	(Snapper,	"ADW_VALLEY_PATH_017");

	Wld_InsertNpc	(Harpie,	"ADW_VALLEY_BIGCAVE_15");
	Wld_InsertNpc	(Harpie,	"ADW_VALLEY_BIGCAVE_15");
	Wld_InsertNpc	(Harpie,	"ADW_VALLEY_BIGCAVE_15");

	Wld_InsertNpc	(Troll,	"ADW_VALLEY_BIGCAVE_08");
};

FUNC VOID INIT_SUB_ADDON_PART_VALLEY_01 ()
{
};

FUNC VOID INIT_ADDON_PART_VALLEY_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_ADDON_PART_VALLEY_01();
};

// *************
// Neue Oberwelt
// *************

// ------ CITY -------
func void STARTUP_NewWorld_Part_City_01()
{
	//Mod-Personen
	Wld_InsertNpc	(Mod_516_SNOV_Bodo_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_519_SNOV_Bartok_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_522_NONE_Vanja_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_530_NONE_Regis_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_529_NONE_Matteo_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_531_NONE_Bosper_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_523_KDF_Daron_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_524_KDW_Vatras_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_532_NONE_Constantino_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_535_NONE_Harad_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_536_NONE_Thorben_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_537_NONE_Lehmar_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_538_RDW_Diego_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_539_PAL_Lothar_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_540_PAL_Andre_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_546_NONE_Liselotte_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_543_MIL_Picasso_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_547_NONE_Alrik_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_550_NONE_Josef_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_558_NONE_Abuyin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_559_PAL_Albrecht_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_560_NONE_Alwin_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_561_NONE_Baltram_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_563_NONE_Borka_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_564_MIL_Boltan_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_565_NONE_Brahim_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_566_NONE_Brian_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_567_NONE_Bromor_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_548_NONE_Canthar_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_549_NONE_Carl_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_568_NONE_Cassia_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_569_RIT_Cedric_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_570_NONE_Coragon_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_571_NONE_Cornelius_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_572_NONE_Edda_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_573_NONE_Elvrich_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_574_NONE_Fellan_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_575_NONE_Fenia_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_576_NONE_Fernando_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_577_NONE_Garvell_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_578_NONE_Gerbrandt_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_579_RIT_Girion_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_580_NONE_Gritta_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_581_NONE_Hakon_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_582_NONE_Halvor_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_583_NONE_Hanna_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_584_NONE_Ignaz_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_585_RIT_Ingmar_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_586_NONE_Jack_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_587_NONE_Jesper_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_588_WNOV_Joe_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_589_NONE_Jora_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_590_NONE_Kardif_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_591_NONE_Larius_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_592_PAL_Hagen_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_593_NONE_Lucy_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_594_NONE_Lutero_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_595_MIL_Mario_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_596_MIL_Martin_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_597_NONE_Meldor_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_598_MIL_Mika_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_599_NONE_Moe_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_741_NONE_Monty_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_742_MIL_Mortis_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_743_NONE_Nagur_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_744_MIL_Pablo_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_745_MIL_Peck_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_746_NONE_Ramirez_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_747_MIL_Rangar_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_748_NONE_Rengaru_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_749_MIL_Ruga_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_750_NONE_Rupert_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_751_NONE_Salandril_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_752_NONE_Sonja_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_753_NOV_Ulf_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_754_NONE_Valentino_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_755_MIL_Wambo_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_757_NONE_Zuris_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_758_KDW_Cronos_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_759_NONE_Dragomir_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_760_NONE_Attila_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_762_NONE_Farim_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_765_NONE_Grimbald_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_768_KDW_Merdarion_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_769_KDW_Nefarius_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_771_KDW_Riordian_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_772_BAU_Rosi_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_773_NONE_Sagitta_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_774_KDW_Saturas_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_776_NONE_Orlan_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_777_NONE_Rukhar_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_783_BAU_Elena_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_785_BAU_Gunnar_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_786_BAU_Hodges_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_789_BAU_Maria_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_791_BAU_Onar_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_793_BAU_Pepe_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_799_BAU_Thekla_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_100_BAU_Wasili_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_101_BAU_Balthasar_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_102_BAU_Babera_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_103_BAU_Bronko_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_104_BAU_Rega_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_105_BAU_Sekob_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_107_BAU_Bengar_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_108_BAU_Pardos_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_109_MIL_Rick_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_118_MIL_Rumbold_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_900_BAU_Akil_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_902_BAU_Egill_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_903_BAU_Ehnim_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_905_BAU_Kati_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_906_BAU_Randolph_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_908_BAU_Telbor_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_909_BAU_Hilda_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_910_BAU_Lobart_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_911_BAU_Maleth_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_912_BAU_Vino_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_913_NOV_Agon_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_914_NOV_Babo_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_915_NOV_Dyrian_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_916_NOV_Garwig_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_917_KDF_Gorax_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_918_KDF_Hyglas_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_919_NOV_Igaraz_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_920_KDF_Isgaroth_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_921_KDF_Marduk_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_922_KDF_Neoras_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_923_NOV_Opolos_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_924_RIT_Sergio_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_925_KDF_Talamon_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_926_RDW_Lance_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_927_NONE_William_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_968_MIL_Bilgot_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_969_MIL_Den_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_971_RIT_Fajeth_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_980_MIL_Olav_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_978_RIT_Marcos_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7238_OUT_Herold_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_981_RIT_Tengron_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_500_PAL_Garond_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_501_RIT_Gerold_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_502_RIT_Keroloth_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_503_PAL_Oric_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_724_NOV_Mattheus_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_963_PIR_Malcom_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_185_NONE_Alvro_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1967_NONE_Maler_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_798_SLD_Wolf_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1175_MIL_Miliz_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1176_MIL_Miliz_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1177_MIL_Miliz_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1178_MIL_Jason_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1179_MIL_Torwache_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1180_MIL_Torwache_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1181_MIL_Tuerwache_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1182_MIL_Tuerwache_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1183_MIL_Kasernenwache_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1184_MIL_Miliz_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1185_MIL_Miliz_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1186_MIL_Miliz_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1189_MIL_Miliz_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1190_NOV_Katar_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1191_NOV_Novize_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1192_NOV_Novize_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1193_NOV_Novize_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1194_NOV_Novize_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1195_NOV_Novize_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1196_VLK_Buerger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1197_VLK_Valentine_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1198_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1199_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1200_SLD_Soeldner_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1201_SLD_Soeldner_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1202_SLD_Soeldner_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1203_SLD_Soeldner_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1204_SLD_Soeldner_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1205_SLD_Soeldner_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1206_SLD_Soeldner_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1207_SLD_Soeldner_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1208_SLD_Soeldner_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1236_RIT_Torwache_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1237_RIT_Torwache_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1238_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1239_RIT_Paladin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1240_RIT_Paladin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1241_RIT_Torwache_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1242_RIT_Torwache_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1243_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1244_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1245_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1246_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1247_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1248_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1249_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1250_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1251_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1252_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1253_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1254_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1255_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1256_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1257_PAL_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1258_RIT_RITTER_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1259_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1260_RIT_Neron_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1261_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1262_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1287_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1264_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1265_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1400_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1401_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1402_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1403_BAU_Baeuerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1404_BAU_Baeuerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1405_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1406_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1407_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1408_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1409_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1410_BAU_Bobo_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1411_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1412_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1414_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1415_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1416_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1417_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1418_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1419_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1420_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1421_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1422_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1423_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1424_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1425_BAU_Bauer_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1530_WKR_Everaldo_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1532_HTR_Ethan_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1533_WKR_Salvador_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1534_WKR_Wasserkrieger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1536_WKR_Roka_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1535_WKR_Wasserkrieger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1537_WKR_Vanas_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1538_WKR_Wasserkrieger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1539_WKR_Wasserkrieger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(PC_Friend_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1723_MIL_Gidan_NW,	"NW_CITY_ENTRANCE_01");

	if (Mod_Import_Dusty == LOG_SUCCESS)
	|| (Mod_Import_Dusty == -1)
	{
		Wld_InsertNpc	(Mod_1724_PSINOV_Dusty_NW,	"NW_CITY_ENTRANCE_01");
	};

	Wld_InsertNpc	(Mod_1932_FH_Kimon_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1937_JGR_Nandor_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_1969_BDT_Bandit_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_1970_BDT_Bandit_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_1971_BDT_Bandit_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_4026_NONE_Kuno_NW,		"BIGFARM");
	Wld_InsertNpc	(Mod_7199_ASS_Amir_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_7234_OUT_Giselle_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7363_VLK_LehmarWache_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7364_VLK_LehmarWache_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7495_NONE_Schlaeger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7496_NONE_Schlaeger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7675_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7676_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7677_RIT_Ritter_NW,	"NW_CITY_ENTRANCE_01");
	

	//---S?dtor--------------------
	Wld_InsertNpc (Mil_309_Stadtwache	,"NW_CITY_ENTRANCE_01");	//Stadttorwache
	Wld_InsertNpc (Mil_310_Stadtwache	,"NW_CITY_ENTRANCE_01");	//Stadttorwache Important
	
			
	//---Osttor------------------------
	Wld_InsertNpc (Mil_332_Stadtwache 	, "NW_CITY_ENTRANCE_01");	//Stadttorwache
	Wld_InsertNpc (Mil_333_Stadtwache 	, "NW_CITY_ENTRANCE_01");	//Stadttorwache Important

	Wld_InsertNpc (Mil_304_Torwache 	, "NW_CITY_ENTRANCE_01");	//Stadttorwache
	Wld_InsertNpc (Mil_305_Torwache 	, "NW_CITY_ENTRANCE_01");	//Stadttorwache Important


	//---Schiff--------------------
	Wld_InsertNpc (Pal_212_Schiffswache, "NW_CITY_ENTRANCE_01"); 	//GateGuard, 24h
	Wld_InsertNpc (Pal_213_Schiffswache, "NW_CITY_ENTRANCE_01"); 	//GateGuard, 24h 

	//Namenlose NPC's
	Wld_InsertNpc	(Mod_1032_VLK_Arbeiter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1033_VLK_Arbeiter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1034_VLK_Richter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1035_VLK_Gaertner_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1037_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1038_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1039_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1040_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1041_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1042_VLK_Arbeiter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1043_VLK_Arbeiter_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1044_VLK_Buerger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1045_VLK_Buerger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1047_VLK_Joerg_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_763_NONE_Gaan_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1048_VLK_Buerger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1049_VLK_Buerger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1051_VLK_Buerger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1052_VLK_Buerger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1053_VLK_Buerger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1054_VLK_Nimius_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1055_VLK_Buerger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1056_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1057_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1058_VLK_Buerger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1059_VLK_Buerger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1060_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1061_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1062_VLK_Bernd_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1064_VLK_Jana_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1065_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1066_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1067_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1068_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1069_VLK_Buerger_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1071_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1072_VLK_Buergerin_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1076_VLK_Wirt_NW,		"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_544_NONE_Wilfried_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_1938_Thilo_NONE_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_4030_VLK_Flora_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7115_NONE_Nadja_NW,	"NW_CITY_ENTRANCE_01");


	// Assassinen im Hauptlager

	Wld_InsertNpc	(Mod_7100_ASS_Zahit_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7101_ASS_Krieger_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7102_ASS_Zeki_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7103_ASS_Gauner_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7104_ASS_Shakir_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7105_ASS_Aabid_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7106_ASS_Ramsi_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7107_ASS_Gauner_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7108_ASS_Gauner_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7111_ASS_Yasin_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7113_ASS_Yussuf_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7116_ASS_Krieger_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7117_ASS_Krieger_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7118_ASS_Anwaerter_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7119_ASS_Masut_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7122_ASS_Maysara_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7123_ASS_Malik_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7124_ASS_Anwaerter_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7125_ASS_Karim_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7126_ASS_Krieger_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7127_ASS_Krieger_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7131_ASS_Krieger_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7133_ASS_Sinbad_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7134_ASS_Anwaerter_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7138_ASS_Azhar_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7140_ASS_Elite_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7141_ASS_Elite_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7142_ASS_Elite_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7145_ASS_Aadel_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7146_ASS_Mustafa_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7147_ASS_Naim_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7148_ASS_Norek_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7149_ASS_Mufid_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7150_ASS_Mahamad_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7152_ASS_Aiman_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7154_ASS_Malek_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7156_ASS_Mirza_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7157_ASS_Mourad_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7158_ASS_Novize_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7159_ASS_Novize_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7160_ASS_Novize_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7161_ASS_Novize_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7164_ASS_Kais_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7165_ASS_Adil_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7166_ASS_Novize_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7163_ASS_Kamal_NW, "HAFEN");

	// Jäger in Dragomirs Lager

	Wld_InsertNpc	(Mod_7413_JG_Wild_NW, "HAFEN");
	Wld_InsertNpc	(Mod_7414_JG_Bret_NW, "HAFEN");


	// Tiere in Stadt

	Wld_InsertNpc (Hammel			, "NW_CITY_SHEEP_SPAWN_02");	//Schaf
	Wld_InsertNpc (Sheep			, "NW_CITY_SHEEP_SPAWN_01");	//Schaf
	Wld_InsertNpc (Sheep			, "NW_CITY_SHEEP_SPAWN_01");	//Schaf

	Wld_InsertNpc (Rat,	"FP_ROAM_CITY_SHEEP_03");
	Wld_InsertNpc (Rat,	"FP_ROAM_CITY_RATS_03");
	Wld_InsertNpc (Rat,	"FP_ROAM_CITY_RAT_01");
	Wld_InsertNpc (Rat,	"FP_ROAM_CITY_RATS_01");
	Wld_InsertNpc (Rat,	"FP_STAND_CITY_30");

	Wld_InsertNpc (Rat,	"FP_ROAM_KANAL_RATTEN_04");
	Wld_InsertNpc (Rat,	"FP_ROAM_KANAL_RATTEN_05");

	Wld_InsertNpc	(Waran_William,	"FP_SHELLSPAWN_CITY_07");

	// Gardisten und Schatten in Talbins Lager

	Wld_InsertNpc	(Mod_7600_GRD_Scorpio_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7601_GRD_Gardist_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7602_GRD_Gardist_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7603_GRD_Gardist_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7604_STT_Schatten_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7605_STT_Schatten_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7606_STT_Schatten_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7607_STT_Schatten_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7608_STT_Schatten_NW,	"NW_CITY_ENTRANCE_01");
	Wld_InsertNpc	(Mod_7609_STT_Schatten_NW,	"NW_CITY_ENTRANCE_01");
};

	func void INIT_SUB_NewWorld_Part_City_01()
	{
		//---Laternen---
		Wld_SetMobRoutine (00,00, "FIREPLACE", 1);
		Wld_SetMobRoutine (20,00, "FIREPLACE", 1);
		Wld_SetMobRoutine (05,00, "FIREPLACE", 0);
		
		
		//---------------- PORTALR?UME ------------------------ 
		
		//Hafenviertel
		Wld_AssignRoomToGuild ("hafen01",		GIL_PUBLIC); //Vermisstenliste
		Wld_AssignRoomToGuild ("hafen02",		GIL_PAL);
		Wld_AssignRoomToGuild ("hafen03",		GIL_PAL);
		Wld_AssignRoomToGuild ("hafen04",		GIL_PUBLIC); //Lehmar
		Wld_AssignRoomToGuild ("hafen05",		GIL_PUBLIC); //Nimius
		Wld_AssignRoomToGuild ("hafen06",		GIL_PAL);
		Wld_AssignRoomToGuild ("hafen07",		GIL_PAL);
		
		Wld_AssignRoomToGuild ("hafen08",	GIL_NONE); //EDDA
		Wld_AssignRoomToGuild ("hafen09",		GIL_PUBLIC); //Ignaz
		Wld_AssignRoomToGuild ("hafen10",		GIL_NONE);
		Wld_AssignRoomToGuild ("hafen11",		GIL_PAL);
		Wld_AssignRoomToGuild ("fellan",		GIL_PAL);
		//Wld_AssignRoomToGuild ("boot",			GIL_PAL); - ist RAUS
		Wld_AssignRoomToGuild ("fisch",			GIL_PAL);
		Wld_AssignRoomToGuild ("lagerhaus",		GIL_NONE);
		Wld_AssignRoomToGuild ("karten",		GIL_PUBLIC);
		Wld_AssignRoomToGuild ("hafenkneipe",	GIL_NONE);
		Wld_AssignRoomToGuild ("puff",			GIL_NONE);
		
		//Handwerker und H?ndler
		if (Mod_LehrlingBei == 4)
		{
			Wld_AssignRoomToGuild ("bogner",		GIL_NONE);		// = Thorben und Gritta!
		}
		else
		{
			Wld_AssignRoomToGuild ("bogner",		GIL_PUBLIC);
		};
		if (Mod_LehrlingBei == 3)
		{
			Wld_AssignRoomToGuild ("matteo",		GIL_NONE);
		}
		else
		{
			Wld_AssignRoomToGuild ("matteo",		GIL_NONE);
		};
		Wld_AssignRoomToGuild ("hotel",			GIL_NONE);
		Wld_AssignRoomToGuild ("stadtkneipe",	GIL_PUBLIC);
		Wld_AssignRoomToGuild ("zuris",			GIL_PAL);
		
		if (Mod_LehrlingBei == 1)
		{
			Wld_AssignRoomToGuild ("alchemist",	GIL_NONE);
		}
		else
		{
			Wld_AssignRoomToGuild ("alchemist",	GIL_PUBLIC);
		};
		
		if (Mod_LehrlingBei == 2)
		{
			Wld_AssignRoomToGuild ("gritta",	GIL_NONE);		// = BOSPER!
		}
		else
		{
			Wld_AssignRoomToGuild ("gritta",	GIL_PUBLIC); 	// = BOSPER!
		};
		
		if (Mod_LehrlingBei == 5)
		{
			Wld_AssignRoomToGuild ("schmied",	GIL_NONE);
		}
		else
		{
			Wld_AssignRoomToGuild ("schmied",	GIL_PAL);
		};
		
		//T?rme
		Wld_AssignRoomToGuild ("turmsued01",	GIL_MIL);
		Wld_AssignRoomToGuild ("turmsued02",	GIL_MIL);
		Wld_AssignRoomToGuild ("turmost01",		GIL_MIL);
		Wld_AssignRoomToGuild ("turmost02",		GIL_MIL);
		Wld_AssignRoomToGuild ("turmschmied",	GIL_MIL);
		Wld_AssignRoomToGuild ("turmbogner",	GIL_MIL);
		
		//Kaserne 
		Wld_AssignRoomToGuild ("andre",			GIL_PUBLIC);
		Wld_AssignRoomToGuild ("waffenkammer",	GIL_PUBLIC);
		Wld_AssignRoomToGuild ("barracke",		GIL_MIL);
		
		//Oberes Viertel
		Wld_AssignRoomToGuild ("nwcityrich01", 	GIL_MIL);
		Wld_AssignRoomToGuild ("rathaus",		GIL_PUBLIC);
		Wld_AssignRoomToGuild ("reich01",		GIL_PAL);
		Wld_AssignRoomToGuild	("reich02", GIL_PUBLIC);
		Wld_AssignRoomToGuild ("reich03",		GIL_PUBLIC);
		if (Mod_Gilde == 1)
		|| (Mod_Gilde == 2)
		|| (Mod_Gilde == 3)
		{
			Wld_AssignRoomToGuild ("reich04",		GIL_NONE);
		}
		else
		{
			Wld_AssignRoomToGuild ("reich04",		GIL_PAL);
		};
		Wld_AssignRoomToGuild ("reich05",		GIL_PAL);
		Wld_AssignRoomToGuild ("reich06",		GIL_PUBLIC); //Salandril Alchemist -> Wegen Mission!!!
		Wld_AssignRoomToGuild ("richter",		GIL_PUBLIC); //wegen SLD Mission Kap.3 
		Wld_AssignRoomToGuild ("leomar",		GIL_PUBLIC);
	};

func void INIT_NewWorld_Part_City_01()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	INIT_SUB_NewWorld_Part_City_01();
};


// ------ Farm1 -------

func void STARTUP_NewWorld_Part_Farm_01()
{
	//Mod
	Wld_InsertNpc	(Mod_545_NONE_Gildo_NW,		"NW_FARM1_OUT_01");

	// Schafherde

	Wld_InsertNpc		(Hammel_Lobart_01, 	"NW_FARM1_PATH_CITY_SHEEP_07");
	Wld_InsertNpc		(Sheep_Lobart_01, 	"NW_FARM1_PATH_CITY_SHEEP_07");
	Wld_InsertNpc		(Sheep_Lobart_02, 	"NW_FARM1_PATH_CITY_SHEEP_07");
	Wld_InsertNpc		(Hammel_Lobart_02, 	"NW_FARM1_PATH_CITY_SHEEP_08");
	Wld_InsertNpc		(Sheep_Lobart_03, 	"NW_FARM1_PATH_CITY_SHEEP_08");
	Wld_InsertNpc		(Sheep_Lobart_04, 	"NW_FARM1_PATH_CITY_SHEEP_08");
	Wld_InsertNpc		(Sheep_Lobart_05, 	"NW_FARM1_PATH_CITY_SHEEP_09");
	Wld_InsertNpc		(Sheep_Lobart_06, 	"NW_FARM1_PATH_CITY_SHEEP_09");
	Wld_InsertNpc		(Sheep_Lobart_07, 	"NW_FARM1_PATH_CITY_SHEEP_09");
	
	// Schafe auf dem Hof

	Wld_InsertNpc		(Hammel_Lobart_03, 	"NW_FARM1_PATH_CITY_SHEEP_10");
	Wld_InsertNpc		(Sheep_Lobart_08, 	"NW_FARM1_PATH_CITY_SHEEP_10");
	Wld_InsertNpc		(Hammel_Lobart_04, 	"NW_FARM1_PATH_CITY_SHEEP_11");
	Wld_InsertNpc		(Sheep_Lobart_09, 	"NW_FARM1_PATH_CITY_SHEEP_11");
	Wld_InsertNpc		(Sheep_Lobart_10, 	"NW_FARM1_PATH_CITY_SHEEP_12");
	Wld_InsertNpc		(Sheep_Lobart_11, 	"NW_FARM1_PATH_CITY_SHEEP_12");
	Wld_InsertNpc		(Sheep_Lobart_12, 	"NW_FARM1_OUT_03");
	Wld_InsertNpc		(Sheep_Lobart_13, 	"NW_FARM1_OUT_03");
	
	// Schafe bei der Windm?hl

	Wld_InsertNpc		(Sheep_Lobart_14, 	"NW_FARM1_MILL_01");
	Wld_InsertNpc		(Sheep_Lobart_15, 	"NW_FARM1_MILL_01");
	Wld_InsertNpc		(Sheep_Lobart_16, 	"NW_FARM1_MILL_01");

	Wld_InsertNpc	(Schaeferhund_Maleth,	"NW_FARM1_PATH_CITY_SHEEP_09");
	Wld_InsertNpc	(Schaeferhund_Lobart_01,	"NW_FARM1_CITYWALL_FOREST_14");

	// Monster

	// Am Weg Richtung Stadt

	Wld_InsertNpc	(YFleischfly,	"FP_ROAM_NW_FARM1_PATH_SPAWN_02_02");
	Wld_InsertNpc	(YFleischfly,	"FP_ROAM_NW_FARM1_PATH_SPAWN_01_03");

	Wld_InsertNpc	(YGobbo_Green,	"FP_ROAM_NW_FARM1_PATH_SPAWN_07_04");
	Wld_InsertNpc	(YGobbo_Green,	"FP_ROAM_NW_FARM1_PATH_SPAWN_07_02");
	Wld_InsertNpc	(YGobbo_Green,	"FP_ROAM_NW_FARM1_PATH_SPAWN_07_03");

	Wld_InsertNpc	(Rabbit,	"FP_ROAM_NW_FARM1_PATH_SPAWN_05_03");

	Wld_InsertNpc	(YGiant_Bug,	"FP_ROAM_FARM1_WOLF_04");
	Wld_InsertNpc	(YGiant_Bug,	"FP_ROAM_FARM1_WOLF_02");

	Wld_InsertNpc	(YGiant_Bug,	"FP_ROAM_NW_FARM1_CITYWALL_RIGHT_04_02");
	Wld_InsertNpc	(YGiant_Bug,	"FP_ROAM_NW_FARM1_CITYWALL_RIGHT_04_01");

	Wld_InsertNpc	(Giant_Bug,	"FP_ROAM_NW_FARM1_CITYWALL_RIGHT_02");

	Wld_InsertNpc	(Giant_Bug,	"FP_ROAM_NW_FARM1_OUT_15_04");
	Wld_InsertNpc	(Giant_Bug,	"FP_ROAM_NW_FARM1_OUT_15_01");
	Wld_InsertNpc	(Giant_Bug,	"FP_STAND_PALADINGEIST_01");

	// Im Wald

	Wld_InsertNpc	(Wolf,	"FP_ROAM_FARM1_BLOODFLY_06");
	Wld_InsertNpc	(Wolf,	"FP_ROAM_FARM1_BLOODFLY_05");

	Wld_InsertNpc	(Fleischfly,	"FP_ROAM_FARM1_FORREST_WOLF_06");
	Wld_InsertNpc	(Fleischfly,	"FP_ROAM_FARM1_FORREST_WOLF_05");
	Wld_InsertNpc	(Fleischfly,	"FP_ROAM_FARM1_FORREST_WOLF_02");
	Wld_InsertNpc	(Fleischfly,	"FP_ROAM_FARM1_FORREST_WOLF_08");

	Wld_InsertNpc	(Shadowbeast,	"FP_ROAM_FARM1_FORREST_SHADOW_02");

	Wld_InsertNpc	(Wolf,	"FP_ROAM_FARM1_FORREST_BLOODFLY_01");
	Wld_InsertNpc	(Wolf,	"FP_ROAM_DEMONFROMRANDOLPH_09");
	Wld_InsertNpc	(Wolf,	"FP_ROAM_FARM1_FORREST_BLOODFLY_08");
	Wld_InsertNpc	(Wolf,	"FP_ROAM_FARM1_FORREST_BLOODFLY_09");

	// Feldr?ben bei Lobart spawnen

	Wld_InsertItem	(ItPl_Beet_Lobart_01, "FP_ITEM_RUEBE_LOBART_01");
	Wld_InsertItem	(ItPl_Beet_Lobart_02, "FP_ITEM_RUEBE_LOBART_02");
	Wld_InsertItem	(ItPl_Beet_Lobart_03, "FP_ITEM_RUEBE_LOBART_03");
	Wld_InsertItem	(ItPl_Beet_Lobart_04, "FP_ITEM_RUEBE_LOBART_04");
	Wld_InsertItem	(ItPl_Beet_Lobart_05, "FP_ITEM_RUEBE_LOBART_05");
	Wld_InsertItem	(ItPl_Beet_Lobart_06, "FP_ITEM_RUEBE_LOBART_06");
	Wld_InsertItem	(ItPl_Beet_Lobart_07, "FP_ITEM_RUEBE_LOBART_07");
	Wld_InsertItem	(ItPl_Beet_Lobart_08, "FP_ITEM_RUEBE_LOBART_08");
	Wld_InsertItem	(ItPl_Beet_Lobart_09, "FP_ITEM_RUEBE_LOBART_09");
	Wld_InsertItem	(ItPl_Beet_Lobart_10, "FP_ITEM_RUEBE_LOBART_10");
	Wld_InsertItem	(ItPl_Beet_Lobart_11, "FP_ITEM_RUEBE_LOBART_11");
	Wld_InsertItem	(ItPl_Beet_Lobart_12, "FP_ITEM_RUEBE_LOBART_12");
	Wld_InsertItem	(ItPl_Beet_Lobart_13, "FP_ITEM_RUEBE_LOBART_13");
	Wld_InsertItem	(ItPl_Beet_Lobart_14, "FP_ITEM_RUEBE_LOBART_14");
	Wld_InsertItem	(ItPl_Beet_Lobart_15, "FP_ITEM_RUEBE_LOBART_15");
	Wld_InsertItem	(ItPl_Beet_Lobart_16, "FP_ITEM_RUEBE_LOBART_16");
	Wld_InsertItem	(ItPl_Beet_Lobart_17, "FP_ITEM_RUEBE_LOBART_17");
	Wld_InsertItem	(ItPl_Beet_Lobart_18, "FP_ITEM_RUEBE_LOBART_18");
	Wld_InsertItem	(ItPl_Beet_Lobart_19, "FP_ITEM_RUEBE_LOBART_19");
	Wld_InsertItem	(ItPl_Beet_Lobart_20, "FP_ITEM_RUEBE_LOBART_20");
};

	func void INIT_SUB_NewWorld_Part_Farm_01()
	{
		Wld_AssignRoomToGuild ("farm01", GIL_PUBLIC);	// Hildas Raum
		Wld_AssignRoomToGuild ("farm02", GIL_PUBLIC);  	// Scheune 

		if (Lobart_Kleidung_Verkauft == TRUE)
		{
			Wld_AssignRoomToGuild ("farm03", GIL_NONE);  	// Schlafraum
		}
		else
		{		
			Wld_AssignRoomToGuild ("farm03", GIL_PUBLIC);  	// Schlafraum
		};
		
	};
	
func void INIT_NewWorld_Part_Farm_01()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_NewWorld_Part_Farm_01();
};


// ------ Xardas -------
func void STARTUP_NewWorld_Part_Xardas_01()
{
	// NPC's

	Wld_InsertNpc	(Mod_512_RDW_Cavalorn_NW,	"NW_XARDAS_START");
	Wld_InsertNpc	(Mod_513_DMB_Xardas_NW,		"NW_XARDAS_START");
	Wld_InsertNpc	(Mod_7036_NONE_Pilger_NW,		"NW_XARDAS_START");
	Wld_InsertNpc	(Mod_557_PSINOV_Lester_NW,	"NW_XARDAS_START");
	Wld_InsertNpc	(Mod_7772_BDT_Bandit_NW,	"NW_XARDAS_START");
	Wld_InsertNpc	(Mod_7773_BDT_Bandit_NW,	"NW_XARDAS_START");
	Wld_InsertNpc	(Mod_7774_BDT_Bandit_NW,	"NW_XARDAS_START");
	Wld_InsertNpc	(Mod_7775_BDT_Bandit_NW,	"NW_XARDAS_START");
	Wld_InsertNpc	(Mod_7776_BDT_Bandit_NW,	"NW_XARDAS_START");
	Wld_InsertNpc	(Mod_7777_BDT_Bandit_NW,	"NW_XARDAS_START");
	Wld_InsertNpc	(Mod_7778_BDT_Bandit_NW,	"NW_XARDAS_START");

	// Monster

	// Weg nach Khorinis

	Wld_InsertNpc	(Rabbit, "NW_XARDAS_TOWER_04");

	Wld_InsertNpc	(Rabbit, "NW_XARDAS_TOWER_WATERFALL_01");

	Wld_InsertNpc	(YWolf, "NW_XARDAS_PATH_FARM1_08_01");
	Wld_InsertNpc	(YWolf, "NW_XARDAS_PATH_FARM1_08_01");

	Wld_InsertNpc	(Wolf_Verletzt, "NW_XARDAS_PATH_FARM1_06");

	Wld_InsertNpc	(YGobbo_Green, "NW_XARDAS_PATH_FARM1_05");
	Wld_InsertNpc	(YGobbo_Green, "NW_XARDAS_PATH_FARM1_05");

	Wld_InsertNpc	(YGobbo_Green, "NW_XARDAS_MONSTER_INSERT_02");
	Wld_InsertNpc	(YGobbo_Green, "NW_XARDAS_MONSTER_INSERT_02");

	// H?hle ins Schwarzmagiertal

	Wld_InsertNpc	(YGobbo_Green, "FP_ROAM_XARDAS_CAVE_07");
	Wld_InsertNpc	(YGobbo_Green, "FP_ROAM_XARDAS_CAVE_05");
	Wld_InsertNpc	(Gobbo_Green, "FP_ROAM_XARDAS_CAVE_06");

	Wld_InsertNpc	(Gobbo_Green, "FP_ROAM_XARDAS_CAVE_02");
	Wld_InsertNpc	(Gobbo_Green, "FP_ROAM_XARDAS_CAVE_01");
	Wld_InsertNpc	(Gobbo_Green, "FP_ROAM_XARDAS_CAVE_03");
};

	func void INIT_SUB_NewWorld_Part_Xardas_01()
	{
	};

func void INIT_NewWorld_Part_Xardas_01()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();	
	
	INIT_SUB_NewWorld_Part_Xardas_01();
};


// KLOSTER 
FUNC VOID STARTUP_NewWorld_Part_Monastery_01 ()
{
	// NPC's

	Wld_InsertNpc	(Mod_534_KDF_Milten_NW,	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc	(Mod_551_KDF_Pyrokar_NW,	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc	(Mod_552_KDF_Serpentes_NW,	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc	(Mod_553_KDF_Ulthar_NW,	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc	(Mod_554_KDF_Parlan_NW,	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc	(Mod_556_NOV_Theodor_NW,	"NW_MONASTERY_ENTRY_01");

	// Schafe f?r Opolos

	Wld_InsertNpc 	(Sheep_Opolos_01, 			"FP_ROAM_MONASTERY_01");
	Wld_InsertNpc 	(Sheep_Opolos_02, 			"FP_ROAM_MONASTERY_02");
	Wld_InsertNpc 	(Sheep_Opolos_03, 			"FP_ROAM_MONASTERY_03");

	// Monster au?erhalb des Klosters

	Wld_InsertNpc	(Scavenger,	"FP_ROAM_NW_PATH_TO_MONASTER_AREA_11_01");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_NW_NW_PATH_TO_MONASTER_MONSTER22_02");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_NW_NW_PATH_TO_MONASTER_MONSTER22_04");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_NW_PATH_TO_MONASTER_AREA_11_03");

	Wld_InsertNpc	(Gobbo_Green,	"FP_ROAM_NW_PATH_TO_MONASTER_AREA_08_01");
	Wld_InsertNpc	(Gobbo_Green,	"FP_ROAM_NW_PATH_TO_MONASTER_AREA_08_03");
	Wld_InsertNpc	(Gobbo_Green,	"FP_ROAM_NW_PATH_TO_MONASTER_AREA_08_04");

	Wld_InsertNpc	(Wisp,	"FP_ROAM_NW_PATH_TO_MONASTER_AREA_10_03");

	Wld_InsertNpc	(Gobbo_Green,	"FP_ROAM_NW_PATH_TO_MONASTER_AREA_01_02");
	Wld_InsertNpc	(Gobbo_Green,	"FP_ROAM_NW_PATH_TO_MONASTER_AREA_01_01");
	Wld_InsertNpc	(Gobbo_Warrior,	"FP_ROAM_NW_PATH_TO_MONASTER_AREA_01_03");

	Wld_InsertNpc	(Rabbit,	"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc	(Rabbit,	"NW_TAVERNE_LARES_CONNECT");

	Wld_InsertNpc	(Blattcrawler,	"NW_SHRINE_MONSTER");

	Wld_InsertNpc	(Scavenger_Breed,	"FP_BREED_SCAVENGER_02");
};

	FUNC VOID INIT_SUB_NewWorld_Part_Monastery_01()
	{
		Wld_AssignRoomToGuild ("kloster01",GIL_PUBLIC); //Kirche
		Wld_AssignRoomToGuild ("kloster02",GIL_PUBLIC); //B?cherei
		Wld_AssignRoomToGuild ("kloster03",GIL_PUBLIC); //Kapelle 
		
		Wld_AssignRoomToGuild ("kloster11",GIL_PUBLIC); //Der Keller
		Wld_AssignRoomToGuild ("kloster13",GIL_PUBLIC); //Weinkelterei
		
		if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		{
			Wld_AssignRoomToGuild ("kloster04",GIL_PUBLIC); //Schlafraum Novizen
			Wld_AssignRoomToGuild ("kloster05",GIL_PUBLIC); //Schlafraum Novizen
			Wld_AssignRoomToGuild ("kloster10",GIL_PUBLIC); //Schlafraum Novizen
			Wld_AssignRoomToGuild ("kloster12",GIL_PUBLIC); //Schlafraum Novizen
		
			Wld_AssignRoomToGuild ("kloster06",GIL_PUBLIC); //Schlafraum Magier
			Wld_AssignRoomToGuild ("kloster07",GIL_PUBLIC); //Schlafraum Magier
			Wld_AssignRoomToGuild ("kloster08",GIL_PUBLIC); //Schlafraum Magier
			Wld_AssignRoomToGuild ("kloster09",GIL_PUBLIC); //Schlafraum Magier
		}
		else
		{
			Wld_AssignRoomToGuild ("kloster04",GIL_VLK); //Schlafraum Novizen
			Wld_AssignRoomToGuild ("kloster05",GIL_VLK); //Schlafraum Novizen
			Wld_AssignRoomToGuild ("kloster10",GIL_VLK); //Schlafraum Novizen
			Wld_AssignRoomToGuild ("kloster12",GIL_VLK); //Schlafraum Novizen
		
			Wld_AssignRoomToGuild ("kloster06",GIL_VLK); //Schlafraum Magier
			Wld_AssignRoomToGuild ("kloster07",GIL_VLK); //Schlafraum Magier
			Wld_AssignRoomToGuild ("kloster08",GIL_VLK); //Schlafraum Magier
			Wld_AssignRoomToGuild ("kloster09",GIL_VLK); //Schlafraum Magier
		};
	};

FUNC VOID INIT_NewWorld_Part_Monastery_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	INIT_SUB_NewWorld_Part_Monastery_01(); 
};


//---Der grosse Bauernhof--------


FUNC VOID STARTUP_NewWorld_Part_GreatPeasant_01 ()
{
	//Mod-Personen
	Wld_InsertNpc	(Mod_521_NONE_Erol_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_526_SLD_Lares_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_527_SLD_Torlof_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_528_SLD_Cord_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_533_SLD_Gorn_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_541_NONE_Till_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_562_NONE_Bennet_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_766_NONE_Grom_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_767_BAU_Malak_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_946_BDT_Edgor_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_952_BDT_Franco_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_963_BDT_Senyan_NW,	"BIGFARM");
	Wld_InsertNpc	(Mod_967_BDT_Tom_NW,	"BIGFARM");
	
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP1_01");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP1_01");
	Wld_InsertNpc 	(Hammel, 		"NW_BIGFARM_SHEEP1_01");

	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP1_02");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP1_02");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP1_02");

	Wld_InsertNpc 	(Hammel, 		"NW_BIGFARM_SHEEP1_03");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP1_03");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP1_03");

	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_NW_BIGFARM_SHEEP2_12");
	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_NW_BIGFARM_SHEEP2_13");
	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_NW_BIGFARM_SHEEP2_14");

	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_NW_BIGFARM_SHEEP2_07");
	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_NW_BIGFARM_SHEEP2_08");
	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_NW_BIGFARM_SHEEP2_09");

	Wld_InsertNpc 	(Hammel, 		"NW_BIGFARM_SHEEP2_02");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP2_02");

	Wld_InsertNpc 	(Hammel, 		"NW_BIGFARM_SHEEP2_03");
	Wld_InsertNpc 	(Hammel, 		"NW_BIGFARM_SHEEP2_03");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP2_03");

	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP2_04");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP2_04");


	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_KITCHEN_OUT_02");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_KITCHEN_OUT_02");
	Wld_InsertNpc 	(Hammel, 		"NW_BIGFARM_KITCHEN_OUT_02");
	
	Wld_InsertNpc 	(Sheep_Bengar_01, 		"FP_ROAM_NW_FARM3_OUT_05_01");
	Wld_InsertNpc 	(Sheep_Bengar_02, 		"FP_ROAM_NW_FARM3_OUT_05_02");
	Wld_InsertNpc 	(Hammel_Bengar_01, 		"FP_ROAM_NW_FARM3_OUT_05_03");
	Wld_InsertNpc 	(Sheep_Bengar_03, 		"FP_ROAM_NW_FARM3_OUT_05_04");

	Wld_InsertNpc 	(Sheep_Bengar_04, 			"NW_FARM3_MOUNTAINLAKE_05");
 	Wld_InsertNpc 	(Sheep_Bengar_05, 			"NW_FARM3_MOUNTAINLAKE_05");

	Wld_InsertNpc	(Schaeferhund_Pepe,	"NW_BIGFARM_SHEEP2_02");
	Wld_InsertNpc	(Schaeferhund_Malak,	"NW_FARM3_MALAK");
	Wld_InsertNpc	(Schaeferhund_Balthasar,	"NW_FARM4_BALTHASAR");

	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_FARM4_SHEEP_04");
	Wld_InsertNpc 	(Hammel, 		"FP_ROAM_FARM4_SHEEP_04");
	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_FARM4_SHEEP_04");

	// Mine hinter den D?monenrittern

	Wld_InsertNpc	(Minecrawler,	"FP_ROAM_CASTLEMINE2_01");
	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_CASTLEMINE2_12");
	Wld_InsertNpc	(Minecrawler,	"FP_ROAM_CASTLEMINE2_20");
	Wld_InsertNpc	(Minecrawler,	"FP_ROAM_CASTLEMINE2_05");
	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_CASTLEMINE2_11");
	Wld_InsertNpc	(Minecrawler,	"FP_ROAM_CASTLEMINE2_13");
	Wld_InsertNpc	(Minecrawler,	"FP_ROAM_CASTLEMINE2_16");
	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_CASTLEMINE2_07");
	Wld_InsertNpc	(Minecrawler,	"FP_ROAM_CASTLEMINE2_06");

	// Talkessel unter den D?monenrittern

	Wld_InsertNpc	(Troll,	"NW_CASTLEMINE_TROLL_08");
	Wld_InsertNpc	(Troll,	"NW_CASTLEMINE_TROLL_07");

	Wld_InsertNpc	(Snapper,	"NW_CASTLEMINE_TROLL_05");
	Wld_InsertNpc	(Snapper,	"NW_CASTLEMINE_TROLL_05");

	Wld_InsertNpc	(Snapper,	"NW_CASTLEMINE_TROLL_02");
	Wld_InsertNpc	(Snapper,	"NW_CASTLEMINE_TROLL_02");

	Wld_InsertNpc	(Gobbo_Warrior,	"NW_BIGMILL_MALAKSVERSTECK_05");
	Wld_InsertNpc	(Gobbo_Black,	"NW_BIGMILL_MALAKSVERSTECK_05");
	Wld_InsertNpc	(Gobbo_Black,	"NW_BIGMILL_MALAKSVERSTECK_06");
	Wld_InsertNpc	(Gobbo_Green,	"NW_BIGMILL_MALAKSVERSTECK_05");
	Wld_InsertNpc	(Gobbo_Green,	"NW_BIGMILL_MALAKSVERSTECK_06");
	Wld_InsertNpc	(Gobbo_Green,	"NW_BIGMILL_MALAKSVERSTECK_06");

	// Felder Grossbauer und Umgebung

	Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");

	Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_ALLEE_RIGHTFIELD04");

	Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_FELDREUBER");
	Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_FELDREUBER2");
	Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_FELDREUBER4");

	Wld_InsertNpc	(Giant_Bug,	"NW_BIGMILL_FIELD_MONSTER_04");

	Wld_InsertNpc	(Giant_Bug,	"NW_BIGMILL_FIELD_MONSTER_01");

	Wld_InsertNpc	(Giant_Bug,	"NW_BIGMILL_FIELD_MONSTER_02");
	Wld_InsertNpc	(Giant_Bug,	"NW_BIGMILL_FIELD_MONSTER_02");

	Wld_InsertNpc	(Giant_Bug,	"NW_BIGMILL_FIELD_MONSTER_03");

	Wld_InsertNpc	(Giant_Bug,	"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");

	Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_ALLEE_08_N_5");
	Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_ALLEE_08_N_5");

	Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_ALLEE_08_N_2");
	Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_ALLEE_08_N_2");

	Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_ALLEE_08_N");
	Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_ALLEE_08_N");

	Wld_InsertNpc	(Scavenger,	"NW_BIGFARM_LAKE_03_MOVEMENT");
	Wld_InsertNpc	(Scavenger,	"NW_BIGFARM_LAKE_03_MOVEMENT");

	Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_LAKE_03_MOVEMENT3");
	Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_LAKE_03_MOVEMENT3");

	Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_FIELD_MONSTER_01");
	Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_FIELD_MONSTER_01");

	Wld_InsertNpc	(Giant_Bug,	"NW_FARM4_WOOD_NEARPEASANT2_6_MONSTERMILL2");
	Wld_InsertNpc	(Giant_Bug,	"NW_FARM4_WOOD_NEARPEASANT2_6_MONSTERMILL2");

	Wld_InsertNpc	(Giant_Bug,	"NW_FARM4_WOOD_NEARPEASANT2_6_MONSTERMILL");
	Wld_InsertNpc	(Giant_Bug,	"NW_FARM4_WOOD_NEARPEASANT2_6_MONSTERMILL");

	// Weidenplateau bei Bengar

	Wld_InsertNpc	(Scavenger,	"NW_FARM3_PATH_12_MONSTER_01");
	Wld_InsertNpc	(Scavenger,	"NW_FARM3_PATH_12_MONSTER_01");
	Wld_InsertNpc	(Scavenger,	"NW_FARM3_PATH_12_MONSTER_01");

	Wld_InsertNpc	(Scavenger,	"NW_FARM3_PATH_12_MONSTER_02");
	Wld_InsertNpc	(Scavenger,	"NW_FARM3_PATH_12_MONSTER_02");

	Wld_InsertNpc	(Scavenger,	"NW_FARM3_PATH_12_MONSTER_03");
	Wld_InsertNpc	(Scavenger,	"NW_FARM3_PATH_12_MONSTER_03");

	Wld_InsertNpc	(Lurker_Wiese,	"NW_FARM3_PATH_11_SMALLRIVER_08");

	Wld_InsertNpc	(Lurker_Wiese,	"NW_FARM3_PATH_11_SMALLRIVER_10");

	Wld_InsertNpc	(Lurker_Wiese,	"NW_FARM3_PATH_11_SMALLRIVER_112");

	Wld_InsertNpc	(Lurker_Wiese,	"NW_FARM3_PATH_11_SMALLRIVER_11");

	Wld_InsertNpc	(Lurker_Wiese,	"NW_FARM3_PATH_11_SMALLRIVER_17");

	Wld_InsertNpc	(Lurker_Wiese,	"NW_FARM3_PATH_11_SMALLRIVER_02");

	Wld_InsertNpc	(Lurker_Wiese,	"NW_FARM3_PATH_11_SMALLRIVER_04");

	Wld_InsertNpc	(Lurker_Wiese,	"NW_FARM3_PATH_11_SMALLRIVERMID_03");

	Wld_InsertNpc	(Lurker_Wiese,	"NW_FARM3_PATH_11_SMALLRIVERMID_02");

	Wld_InsertNpc	(Bloodfly,	"NW_FARM3_PATH_11_SMALLRIVER_20");
	Wld_InsertNpc	(Bloodfly,	"NW_FARM3_PATH_11_SMALLRIVER_20");

	Wld_InsertNpc	(Rabbit,	"NW_FARM3_MOUNTAINLAKE_03");
	Wld_InsertNpc	(Rabbit,	"NW_FARM3_MOUNTAINLAKE_03");

	Wld_InsertNpc	(Scavenger,	"NW_FARM3_BIGWOOD_02");
	Wld_InsertNpc	(Scavenger,	"NW_FARM3_BIGWOOD_02");
	Wld_InsertNpc	(Scavenger_Demon,	"NW_FARM3_BIGWOOD_02");

	Wld_InsertNpc	(Scavenger,	"NW_FARM3_MOUNTAINLAKE_MONSTER_01");
	Wld_InsertNpc	(Scavenger,	"NW_FARM3_MOUNTAINLAKE_MONSTER_01");

	Wld_InsertNpc	(Keiler,	"NW_FARM3_BIGWOOD_03");
	Wld_InsertNpc	(Keiler,	"NW_FARM3_BIGWOOD_03");

	Wld_InsertNpc	(Rabbit,	"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc	(Rabbit,	"NW_BIGMILL_FARM3_BALTHASAR");

	Wld_InsertNpc	(Keiler,	"NW_FARM3_BIGWOOD_03_C");
	Wld_InsertNpc	(Keiler,	"NW_FARM3_BIGWOOD_03_C");

	//Wld_InsertNpc	(Dragonsnapper,	"NW_FARM3_BIGWOOD_04");

	// Talkessel in der N?he von Bengar

	Wld_InsertNpc	(Rabbit,	"NW_BIGMILL_FARM3_03");
	Wld_InsertNpc	(Rabbit,	"NW_BIGMILL_FARM3_03");

	Wld_InsertNpc	(Scavenger,	"NW_BIGMILL_05");
	Wld_InsertNpc	(Scavenger,	"NW_BIGMILL_05");

	// Zwischen Feldern und Taverne

	Wld_InsertNpc	(Lurker,	"NW_LAKE_GREG_TREASURE_01");

	Wld_InsertNpc	(Scavenger,	"NW_BIGFARM_LAKE_MONSTER_03_01");
	Wld_InsertNpc	(Scavenger,	"NW_BIGFARM_LAKE_MONSTER_03_01");

	Wld_InsertNpc	(Bloodfly,	"NW_BIGFARM_LAKE_MONSTER_BLOODFLY");
	Wld_InsertNpc	(Bloodfly,	"NW_BIGFARM_LAKE_MONSTER_BLOODFLY");

	Wld_InsertNpc	(Lurker,	"NW_BIGFARM_LAKE_MONSTER_02_01");

	Wld_InsertNpc	(Wolf,	"NW_BIGFARM_LAKE_MONSTER_01_01");
	Wld_InsertNpc	(Wolf,	"NW_BIGFARM_LAKE_MONSTER_01_01");
	Wld_InsertNpc	(Wolf,	"NW_BIGFARM_LAKE_MONSTER_01_01");

	Wld_InsertNpc	(Wolf,	"NW_BIGFARM_LAKE_CAVE_01");
	Wld_InsertNpc	(Wolf,	"NW_BIGFARM_LAKE_CAVE_01");

	Wld_InsertNpc	(Gobbo_Green,	"NW_BIGFARM_LAKE_CAVE_03");
	Wld_InsertNpc	(Gobbo_Green,	"NW_BIGFARM_LAKE_CAVE_03");

	Wld_InsertNpc	(Gobbo_Black,	"NW_BIGFARM_LAKE_CAVE_10");
	Wld_InsertNpc	(Gobbo_Green,	"NW_BIGFARM_LAKE_CAVE_10");
	Wld_InsertNpc	(Gobbo_Green,	"NW_BIGFARM_LAKE_CAVE_10");

	Wld_InsertNpc	(Gobbo_Black,	"NW_BIGFARM_LAKE_CAVE_05");
	Wld_InsertNpc	(Gobbo_Green,	"NW_BIGFARM_LAKE_CAVE_05");
	Wld_InsertNpc	(Gobbo_Green,	"NW_BIGFARM_LAKE_CAVE_05");

	Wld_InsertNpc	(Gobbo_Black,	"NW_BIGFARM_LAKE_CAVE_07");
	Wld_InsertNpc	(Gobbo_Black,	"NW_BIGFARM_LAKE_CAVE_07");
	Wld_InsertNpc	(Gobbo_Black,	"NW_BIGFARM_LAKE_CAVE_07");

	// Weg Richtung Ausgrabungsstelle

	Wld_InsertNpc	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01");

	Wld_InsertNpc	(Gobbo_Black,	"NW_TAVERNE_TROLLAREA_MONSTER_03_01");
	Wld_InsertNpc	(Gobbo_Green,	"NW_TAVERNE_TROLLAREA_MONSTER_03_01");
	Wld_InsertNpc	(Gobbo_Green,	"NW_TAVERNE_TROLLAREA_MONSTER_03_01");

	Wld_InsertNpc	(Gobbo_Black,	"NW_TAVERNE_TROLLAREA_MONSTER_03_01M1");
	Wld_InsertNpc	(Gobbo_Green,	"NW_TAVERNE_TROLLAREA_MONSTER_03_01M1");
	Wld_InsertNpc	(Gobbo_Green,	"NW_TAVERNE_TROLLAREA_MONSTER_03_01M1");

	// Wald

	Wld_InsertNpc	(Wolf,	"NW_TAVERNE_TROLLAREA_MONSTER_04_01");
	Wld_InsertNpc	(Wolf,	"NW_TAVERNE_TROLLAREA_MONSTER_04_01");

	Wld_InsertNpc	(Wolf,	"NW_TAVERNE_TROLLAREA_MONSTER_05_01");
	Wld_InsertNpc	(Wolf,	"NW_TAVERNE_TROLLAREA_MONSTER_05_01");
	Wld_InsertNpc	(Wolf,	"NW_TAVERNE_TROLLAREA_MONSTER_05_01");

	Wld_InsertNpc	(Wolf,	"NW_TAVERNE_TROLLAREA_MONSTER_05_01M1");
	Wld_InsertNpc	(Wolf,	"NW_TAVERNE_TROLLAREA_MONSTER_05_01M1");

	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_MONSTER_N_3");
	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_MONSTER_N_3");

	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_MONSTER_N_2");
	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_MONSTER_N_2");

	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_MONSTER_03");
	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_MONSTER_03");

	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_NEARPEASANT7");
	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_NEARPEASANT7");

	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_MONSTER_04");
	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_MONSTER_04");

	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_FARM4_WOOD_MONSTER_MORE_02");
	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_FARM4_WOOD_MONSTER_MORE_02");

	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_FARM4_WOOD_MONSTER_MORE_01");
	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_FARM4_WOOD_MONSTER_MORE_01");

	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_MONSTER_02");
	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_MONSTER_02");
	Wld_InsertNpc	(BlackWolf,	"NW_FARM4_WOOD_MONSTER_02");

	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_MONSTER_01");
	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_MONSTER_01");
	Wld_InsertNpc	(BlackWolf,	"NW_FARM4_WOOD_MONSTER_01");

	Wld_InsertNpc	(Shadowbeast,	"NW_FARM4_WOOD_MONSTER_06");

	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_MONSTER_05");
	Wld_InsertNpc	(BlackWolf,	"NW_FARM4_WOOD_MONSTER_05");

	Wld_InsertNpc	(Wolf,	"NW_SAGITTA_MOREMONSTER_01");
	Wld_InsertNpc	(Wolf,	"NW_SAGITTA_MOREMONSTER_01");
	Wld_InsertNpc	(BlackWolf,	"NW_SAGITTA_MOREMONSTER_01");

	Wld_InsertNpc	(Wolf,	"NW_SAGITTA_MOREMONSTER_03");
	Wld_InsertNpc	(Wolf,	"NW_SAGITTA_MOREMONSTER_03");

	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_MONSTER_07");
	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_MONSTER_07");

	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_NAVIGATION_09");
	Wld_InsertNpc	(Wolf,	"NW_FARM4_WOOD_NAVIGATION_09");

	Wld_InsertNpc	(Fleischfly,	"NW_FARM4_WOOD_MONSTER_10");
	Wld_InsertNpc	(Fleischfly,	"NW_FARM4_WOOD_MONSTER_10");

	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_FARM4_WOOD_NEARPEASANT2_12");
	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_FARM4_WOOD_NEARPEASANT2_12");

	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_FARM4_WOOD_NEARPEASANT2_14");
	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_FARM4_WOOD_NEARPEASANT2_14");

	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_CRYPT_MONSTER01");
	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_CRYPT_MONSTER01");

	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_CRYPT_MONSTER02");
	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_CRYPT_MONSTER02");

	Wld_InsertNpc	(Keiler,	"NW_CRYPT_MONSTER08");
	Wld_InsertNpc	(Keiler,	"NW_CRYPT_MONSTER08");

	Wld_InsertNpc	(Wolf,	"NW_CRYPT_MONSTER04");
	Wld_InsertNpc	(Wolf,	"NW_CRYPT_MONSTER04");
	Wld_InsertNpc	(Wolf,	"NW_CRYPT_MONSTER04");

	Wld_InsertNpc	(Wolf,	"NW_CRYPT_MONSTER06");
	Wld_InsertNpc	(Wolf,	"NW_CRYPT_MONSTER06");
	Wld_InsertNpc	(Wolf,	"NW_CRYPT_MONSTER06");

	Wld_InsertNpc	(Wolf,	"NW_BIGFARM_FOREST_03_NAVIGATION");
	Wld_InsertNpc	(Wolf,	"NW_BIGFARM_FOREST_03_NAVIGATION");
	Wld_InsertNpc	(Wolf,	"NW_BIGFARM_FOREST_03_NAVIGATION");

	Wld_InsertNpc	(Keiler,	"NW_BIGFARM_FOREST_02");
	Wld_InsertNpc	(Keiler,	"NW_BIGFARM_FOREST_02");

	// Br?tende Scavenger

	Wld_InsertNpc	(Scavenger_Breed,	"FP_BREED_SCAVENGER_01");
};

	FUNC VOID INIT_SUB_NewWorld_Part_GreatPeasant_01()
	{
		// ------- Sld-Vorposten -------
		Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
	
		
		// ------ Onars Hof ------
		Wld_AssignRoomToGuild ("grphaupthaus01",	GIL_PUBLIC);
		Wld_AssignRoomToGuild ("grpschmiede01",		GIL_NONE);
		Wld_AssignRoomToGuild ("grpscheune01",		GIL_PUBLIC);
		Wld_AssignRoomToGuild ("grpkapelle01",		GIL_NONE);
		
		// ------ abgelegene Gruft ------
		Wld_AssignRoomToGuild ("cementary01",		GIL_NONE);
				
		// ------ Sekobs Farm ------
		if (Sekob_RoomFree == FALSE)
		{
			Wld_AssignRoomToGuild ("grpbauer01",		GIL_PUBLIC);
		}
		else
		{
			Wld_AssignRoomToGuild ("grpbauer01",		GIL_NONE);
		};
		Wld_AssignRoomToGuild ("grpbauerscheune01",	GIL_PUBLIC);
		
		// ------ Bengars Farm ------
		Wld_AssignRoomToGuild ("grpbauer02",		GIL_PUBLIC);
		Wld_AssignRoomToGuild ("grpbauerscheune02",	GIL_PUBLIC);
		
		// ------ Abenteuerspielplatz -------
		Wld_AssignRoomToGuild ("grpturm02",			GIL_PUBLIC); //vorderer Turm
		Wld_AssignRoomToGuild ("grpturm01",			GIL_PUBLIC); //hinterer Turm
		Wld_AssignRoomToGuild ("grpwaldhuette02",	GIL_PUBLIC); //Banditenh?tte
	};

FUNC VOID INIT_NewWorld_Part_GreatPeasant_01 ()
{
	B_InitMonsterAttitudes (); 
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();	
	
	INIT_SUB_NewWorld_Part_GreatPeasant_01(); 
};
//--------------------------- PASS -------------------------------------------------------
FUNC VOID STARTUP_NewWorld_Part_Pass_To_OW_01 ()
{
	// Monster

	//Wld_InsertNpc	(Snapper, "FP_ROAM_PASS_WOLF_12");
	//Wld_InsertNpc	(Snapper, "FP_ROAM_PASS_WOLF_11");

	Wld_InsertNpc	(Gobbo_Black, "FP_ROAM_PASS_WOLF_15");
	Wld_InsertNpc	(Gobbo_Black, "FP_ROAM_PASS_WOLF_14");

	Wld_InsertNpc	(Gobbo_Black, "FP_ROAM_PASS_ORK_03");
	Wld_InsertNpc	(Gobbo_Black, "FP_ROAM_PASS_ORK_18");
	Wld_InsertNpc	(Gobbo_Black, "FP_ROAM_PASS_ORK_09");
	Wld_InsertNpc	(Gobbo_Black, "FP_ROAM_PASS_ORK_05");
	Wld_InsertNpc	(Gobbo_Black, "FP_ROAM_PASS_ORK_10");
	Wld_InsertNpc	(Gobbo_Black, "FP_ROAM_PASS_ORK_20");
	Wld_InsertNpc	(Gobbo_Warrior, "FP_ROAM_PASS_ORK_07");
	Wld_InsertNpc	(Gobbo_Warrior, "FP_CAMPFIRE_SHAMAN_02");

	Wld_InsertNpc	(Gobbo_Black, "FP_ROAM_PASS_GOBBO_03");
	Wld_InsertNpc	(Gobbo_Black, "FP_ROAM_PASS_GOBBO_01");
	Wld_InsertNpc	(Gobbo_Warrior, "FP_ROAM_PASS_GOBBO_05");

	Wld_InsertNpc	(Gobbo_Black, "FP_ROAM_WOLF_PASS_04");
	Wld_InsertNpc	(Gobbo_Black, "FP_ROAM_WOLF_PASS_03");
	Wld_InsertNpc	(Gobbo_Black, "FP_ROAM_WOLF_PASS_05");
	Wld_InsertNpc	(Gobbo_Warrior, "FP_ROAM_WOLF_PASS_06");
};
FUNC VOID INIT_SUB_NewWorld_Part_Pass_To_OW_01 ()
{

};
FUNC VOID INIT_NewWorld_Part_Pass_To_OW_01 ()
{
	B_InitMonsterAttitudes (); 
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();	
	
	INIT_SUB_NewWorld_Part_Pass_To_OW_01(); 
};
//---Medium Forest--------

FUNC VOID STARTUP_NewWorld_Part_Forest_01 ()
{
	Wld_InsertNpc 	(Sheep, 		"NW_FARM2_OUT_02");
	Wld_InsertNpc 	(Sheep, 		"NW_FARM2_OUT_02");

	// Unterhalb des Leuchtturms bis Stadttor

	Wld_InsertNpc 	(Fleischfly,	"FP_ROAM_CITY_TO_FOREST_08");
	Wld_InsertNpc 	(Fleischfly,	"FP_ROAM_CITY_TO_FOREST_09");

	Wld_InsertNpc 	(Scavenger,	"FP_ITEM_HERB_03");
	Wld_InsertNpc 	(Scavenger,	"FP_ROAM_CITY_TO_FOREST_14");
	Wld_InsertNpc 	(Scavenger,	"FP_ITEM_HERB_05");
	Wld_InsertNpc 	(Scavenger,	"FP_ROAM_CITY_TO_FOREST_13");

	Wld_InsertNpc 	(Meatbug,	"FP_ROAM_CITY_TO_FOREST_15");
	Wld_InsertNpc 	(Meatbug,	"FP_ROAM_CITY_TO_FOREST_11");
	Wld_InsertNpc 	(Meatbug,	"FP_ROAM_CITY_TO_FOREST_12");

	Wld_InsertNpc 	(Molerat,	"FP_ROAM_NW_CITY_SMFOREST_03_03");
	Wld_InsertNpc 	(Molerat,	"FP_ROAM_NW_CITY_SMFOREST_03_01");

	Wld_InsertNpc 	(Molerat,	"FP_ROAM_NW_CITY_SMFOREST_03_M_01");
	Wld_InsertNpc 	(Molerat,	"FP_ROAM_NW_CITY_SMFOREST_03_M_03");

	Wld_InsertNpc 	(Meatbug,	"FP_ROAM_NW_CITY_SMFOREST_06_03");
	Wld_InsertNpc 	(Meatbug,	"FP_ROAM_NW_CITY_SMFOREST_06_04");
	Wld_InsertNpc 	(Meatbug,	"FP_ROAM_NW_CITY_SMFOREST_06_02");

	Wld_InsertNpc 	(Meatbug,	"FP_ROAM_NW_CITY_SMFOREST_05_01");
	Wld_InsertNpc 	(Meatbug,	"FP_ROAM_NW_CITY_SMFOREST_05_02");

	Wld_InsertNpc 	(Meatbug,	"FP_ROAM_NW_CITY_SMFOREST_09_02");
	Wld_InsertNpc 	(Meatbug,	"FP_ROAM_NW_CITY_SMFOREST_09_04");

	// Waldgebiet mit Schattenl?uferh?hle

	Wld_InsertNpc 	(Keiler,	"FP_ROAM_CITYFOREST_KAP3_38");
	Wld_InsertNpc 	(Keiler,	"FP_ROAM_CITY_TO_FOREST_09");	

	Wld_InsertNpc 	(Wolf,	"FP_ROAM_CITYFOREST_KAP3_23");
	Wld_InsertNpc 	(Wolf,	"FP_ROAM_CITYFOREST_KAP3_24");	
	Wld_InsertNpc 	(Wolf,	"FP_ROAM_CITYFOREST_KAP3_27");	

	Wld_InsertNpc 	(Keiler,	"FP_ROAM_CITYFOREST_KAP3_34");
	Wld_InsertNpc 	(Keiler,	"FP_ROAM_CITYFOREST_KAP3_35");	

	Wld_InsertNpc 	(Wolf,	"FP_ROAM_CITYFOREST_KAP3_11");
	Wld_InsertNpc 	(Wolf,	"FP_ROAM_CITYFOREST_KAP3_10");	
	Wld_InsertNpc 	(Wolf,	"FP_ROAM_CITYFOREST_KAP3_09");

	Wld_InsertNpc 	(Wolf,	"FP_ROAM_CITYFOREST_KAP3_15");
	Wld_InsertNpc 	(Wolf,	"FP_ROAM_CITYFOREST_KAP3_17");	
	Wld_InsertNpc 	(Wolf,	"FP_ROAM_CITYFOREST_KAP3_14");	

	Wld_InsertNpc 	(Wolf,	"FP_ROAM_CITYFOREST_KAP3_01");
	Wld_InsertNpc 	(Wolf,	"FP_ROAM_CITYFOREST_KAP3_04");	
	Wld_InsertNpc 	(Warg,	"FP_ROAM_DEMONFROMRANDOLPH_22");

	Wld_InsertNpc 	(Shadowbeast,	"FP_ROAM_CITYFOREST_KAP3_05");	
	Wld_InsertNpc 	(Shadowbeast,	"FP_ROAM_NW_CITYFOREST_CAVE_A01_01");	
	Wld_InsertNpc 	(Shadowbeast,	"FP_ITEM_FOREST_STPLATE_01");	
	Wld_InsertNpc 	(Shadowbeast,	"FP_ROAM_NW_CITYFOREST_CAVE_04_02");	
	Wld_InsertNpc 	(Shadowbeast,	"FP_ROAM_NW_CITYFOREST_CAVE_06_04");	
	Wld_InsertNpc 	(Shadowbeast,	"FP_ROAM_NW_CITYFOREST_CAVE_06_02");	

	Wld_InsertNpc 	(Shadowbeast_Skeleton,	"FP_ROAM_NW_CITYFOREST_CAVE_A06_03");	

	// Weg Stadttor bis Taverne

	Wld_InsertNpc 	(Gobbo_Green,	"FP_ROAM_NW_CITY_TO_FOREST_04_01");
	Wld_InsertNpc 	(Gobbo_Green,	"FP_ROAM_NW_CITY_TO_FOREST_04_02");	

	Wld_InsertNpc 	(Gobbo_Green,	"FP_ROAM_CITY_TO_FOREST_21");
	Wld_InsertNpc 	(Gobbo_Green,	"FP_ROAM_CITY_TO_FOREST_24");

	Wld_InsertNpc 	(Rat,	"FP_ROAM_CITY_TO_FOREST_34");	
	Wld_InsertNpc 	(Rat,	"FP_ROAM_CITY_TO_FOREST_17");	

	Wld_InsertNpc 	(Meatbug,	"FP_ROAM_NW_CITY_TO_FOREST_04_05_2");
	Wld_InsertNpc 	(Meatbug,	"FP_ROAM_NW_CITY_TO_FOREST_04_05_3");
	Wld_InsertNpc 	(Meatbug,	"FP_ROAM_NW_CITY_TO_FOREST_04_05_9");
	Wld_InsertNpc 	(Meatbug,	"FP_ROAM_NW_CITY_TO_FOREST_04_05_7");

	Wld_InsertNpc 	(Gobbo_Green,	"NW_CITY_TO_FOREST_04_09");
	Wld_InsertNpc 	(Gobbo_Warrior_Visir,	"NW_CITY_TO_FOREST_04_08");

	Wld_InsertNpc 	(Molerat,	"FP_ROAM_CITY_TO_FOREST_41");
	Wld_InsertNpc 	(Molerat,	"FP_ROAM_CITY_TO_FOREST_39");

	Wld_InsertNpc 	(Molerat,	"FP_CAMPFIRE_JAEGER_BADONE_01");

	Wld_InsertNpc 	(Rabbit,	"FP_ROAM_RABBIT_06");
	Wld_InsertNpc 	(Rabbit,	"FP_ROAM_RABBIT_01");

	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_BIGFARM_MONSTER_01");

	// Leuchtturm ohne Waldgebiet

	Wld_InsertNpc 	(Scavenger,	"FP_ROAM_NW_CITY_TO_LIGHTHOUSE_13_MONSTER_03");
	Wld_InsertNpc 	(Scavenger,	"FP_ROAM_NW_CITY_TO_LIGHTHOUSE_13_MONSTER_02");

	Wld_InsertNpc 	(Scavenger,	"FP_ROAM_NW_FOREST_PATH_38_MONSTER_01");
	Wld_InsertNpc 	(Scavenger,	"FP_ROAM_NW_FOREST_PATH_38_MONSTER_04");

	Wld_InsertNpc 	(Wolf,	"FP_ROAM_NW_CITY_TO_LIGHTHOUSE_13_MONSTER8_02");
	Wld_InsertNpc 	(BlackWolf,	"FP_ROAM_NW_CITY_TO_LIGHTHOUSE_13_MONSTER8_04");

	Wld_InsertNpc 	(Shadowbeast,	"FP_ROAM_NW_FOREST_PATH_35_06_04");	

	// Kleiner Wald mit Gruft bei der Taverne

	Wld_InsertNpc 	(Molerat,	"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER5_01");
	Wld_InsertNpc 	(Molerat,	"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER5_02");

	Wld_InsertNpc 	(ZombieRandom,	"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_04");
	Wld_InsertNpc 	(ZombieRandom,	"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_02");
	Wld_InsertNpc 	(ZombieRandom,	"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_03");
	Wld_InsertNpc 	(ZombieRandom,	"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_01");

	Wld_InsertNpc 	(Gobbo_Skeleton,	"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_04");
	Wld_InsertNpc 	(Gobbo_Skeleton,	"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_03");
	Wld_InsertNpc 	(Gobbo_Skeleton,	"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_02");

	Wld_InsertNpc 	(Keiler,	"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER2_04");
	Wld_InsertNpc 	(Keiler,	"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER2_01");

	Wld_InsertNpc 	(Keiler,	"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER_03");
	Wld_InsertNpc 	(Keiler,	"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER_01");

	// Gro?er Wald

	Wld_InsertNpc 	(SwampRat,	"FP_ROAM_MEDIUMFOREST_KAP3_26");
	Wld_InsertNpc 	(SwampRat,	"FP_ROAM_MEDIUMFOREST_KAP3_25");

	Wld_InsertNpc 	(BlackWolf,	"FP_ROAM_MEDIUMFOREST_KAP3_23");
	Wld_InsertNpc 	(BlackWolf,	"FP_ROAM_MEDIUMFOREST_KAP3_24");

	Wld_InsertNpc 	(BlackWolf,	"FP_ROAM_NW_FOREST_PATH_18_MONSTER_03");
	Wld_InsertNpc 	(BlackWolf,	"FP_ROAM_NW_FOREST_PATH_18_MONSTER_04");

	Wld_InsertNpc 	(ZombieRandom,	"FP_ROAM_MEDIUMFOREST_KAP3_02");
	Wld_InsertNpc 	(ZombieRandom,	"FP_ROAM_MEDIUMFOREST_KAP3_01");
	Wld_InsertNpc 	(ZombieRandom,	"FP_ROAM_MEDIUMFOREST_KAP3_03");
	Wld_InsertNpc 	(ZombieRandom,	"FP_ROAM_MEDIUMFOREST_KAP3_06");

	Wld_InsertNpc 	(Keiler,	"FP_ROAM_MEDIUMFOREST_KAP2_16");
	Wld_InsertNpc 	(Keiler,	"FP_ROAM_MEDIUMFOREST_KAP2_15");
	Wld_InsertNpc 	(Keiler,	"FP_ROAM_MEDIUMFOREST_KAP2_13");

	Wld_InsertNpc 	(Scavenger,	"FP_ROAM_MEDIUMFOREST_KAP2_10");

	Wld_InsertNpc 	(Keiler,	"FP_ROAM_NW_FOREST_PATH_04_14_MONSTER_01");
	Wld_InsertNpc 	(Keiler,	"FP_ROAM_NW_FOREST_PATH_04_14_MONSTER_02");

	Wld_InsertNpc 	(Keiler,	"FP_ROAM_NW_FOREST_PATH_04_13_03");
	Wld_InsertNpc 	(Keiler,	"FP_ROAM_NW_FOREST_PATH_04_13_04");

	Wld_InsertNpc 	(BlackWolf,	"FP_ROAM_NW_FOREST_PATH_04_4_04");
	Wld_InsertNpc 	(BlackWolf,	"FP_ROAM_NW_FOREST_PATH_04_4_03");

	Wld_InsertNpc 	(Warg,	"FP_ROAM_NW_FOREST_PATH_04_5_04");
	Wld_InsertNpc 	(Warg,	"FP_ROAM_NW_FOREST_PATH_04_5_02");
	Wld_InsertNpc 	(Warg,	"FP_ROAM_MEDIUMFOREST_KAP2_04");

	Wld_InsertNpc 	(Warg,	"FP_ROAM_MEDIUMFOREST_KAP2_23");
	Wld_InsertNpc 	(Warg,	"FP_ROAM_MEDIUMFOREST_KAP2_21");

	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_04_16_MONSTER");
	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_04_16_MONSTER");
	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_04_16_MONSTER");

	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_04_16_MONSTER2");
	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_04_16_MONSTER2");

	Wld_InsertNpc 	(Warg,	"FP_ROAM_MEDIUMFOREST_KAP3_13");
	Wld_InsertNpc 	(Warg,	"FP_ROAM_MEDIUMFOREST_KAP3_09");
	Wld_InsertNpc 	(Warg,	"FP_ROAM_MEDIUMFOREST_KAP3_08");

	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_57");
	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_57");

	Wld_InsertNpc 	(Gobbo_Skeleton,	"FP_ROAM_NW_FOREST_PATH_62_M_04");
	Wld_InsertNpc 	(Gobbo_Skeleton,	"FP_ROAM_NW_FOREST_PATH_62_M_01");
	Wld_InsertNpc 	(Gobbo_Skeleton,	"FP_ROAM_NW_FOREST_PATH_62_M_03");

	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_66_MONSTER");
	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_66_MONSTER");

	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_66_M");
	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_66_M");

	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_62_02");
	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_62_02");

	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_62_05");
	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_62_05");

	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_62_06");
	Wld_InsertNpc 	(Warg,	"NW_FOREST_PATH_62_06");

	Wld_InsertNpc 	(BlackWolf,	"NW_FOREST_PATH_75_2_MONSTER");
	Wld_InsertNpc 	(BlackWolf,	"NW_FOREST_PATH_75_2_MONSTER");

	Wld_InsertNpc 	(BlackWolf,	"NW_FOREST_PATH_75_2");
	Wld_InsertNpc 	(BlackWolf,	"NW_FOREST_PATH_75_2");

	Wld_InsertNpc 	(Fleischfly,	"NW_FOREST_PATH_82_M");
	Wld_InsertNpc 	(Fleischfly,	"NW_FOREST_PATH_82_M");
	Wld_InsertNpc 	(Fleischfly,	"NW_FOREST_PATH_82_M");
	Wld_InsertNpc 	(Fleischfly,	"NW_FOREST_PATH_82_M");

	Wld_InsertNpc 	(BlackWolf,	"NW_FOREST_PATH_79");
	Wld_InsertNpc 	(BlackWolf,	"NW_FOREST_PATH_79");

	Wld_InsertNpc 	(Snapper,	"NW_FOREST_PATH_80_1");
	Wld_InsertNpc 	(Snapper,	"NW_FOREST_PATH_80_1");
	Wld_InsertNpc 	(Snapper,	"NW_FOREST_PATH_80_1");

	Wld_InsertNpc 	(Snapper,	"NW_FOREST_PATH_80_1_MOVEMENTF");
	Wld_InsertNpc 	(Snapper,	"NW_FOREST_PATH_80_1_MOVEMENTF");

	Wld_InsertNpc 	(Snapper,	"NW_FOREST_PATH_80_1_MOVEMENT6");
	Wld_InsertNpc 	(Snapper,	"NW_FOREST_PATH_80_1_MOVEMENT6");

	Wld_InsertNpc 	(Keiler,	"NW_FOREST_PATH_80_1_MOVEMENT8_M");
	Wld_InsertNpc 	(Keiler,	"NW_FOREST_PATH_80_1_MOVEMENT8_M");

	Wld_InsertNpc 	(Scavenger,	"NW_FOREST_PATH_80_1_MOVEMENT15");
	Wld_InsertNpc 	(Scavenger,	"NW_FOREST_PATH_80_1_MOVEMENT15");

	Wld_InsertNpc 	(Keiler,	"NW_FOREST_PATH_35_01");
	Wld_InsertNpc 	(Keiler,	"NW_FOREST_PATH_35_01");

	Wld_InsertNpc 	(Keiler,	"NW_FOREST_PATH_35_01_MONSTER");
	Wld_InsertNpc 	(Keiler,	"NW_FOREST_PATH_35_01_MONSTER");

	Wld_InsertNpc 	(Keiler,	"NW_FOREST_PATH_80_1_MOVEMENT8_M5");
	Wld_InsertNpc 	(Keiler,	"NW_FOREST_PATH_80_1_MOVEMENT8_M5");

	Wld_InsertNpc 	(Keiler,	"NW_FOREST_PATH_80_1_MOVEMENT8_M3");
	Wld_InsertNpc 	(Keiler,	"NW_FOREST_PATH_80_1_MOVEMENT8_M3");

	Wld_InsertNpc 	(BlackWolf,	"NW_FOREST_PATH_31_NAVIGATION_M");
	Wld_InsertNpc 	(BlackWolf,	"NW_FOREST_PATH_31_NAVIGATION_M");

	Wld_InsertNpc 	(BlackWolf,	"NW_FOREST_PATH_31_NAVIGATION3");
	Wld_InsertNpc 	(BlackWolf,	"NW_FOREST_PATH_31_NAVIGATION3");

	Wld_InsertNpc 	(BlackWolf,	"NW_FOREST_PATH_31_MONSTER");
	Wld_InsertNpc 	(BlackWolf,	"NW_FOREST_PATH_31_MONSTER");
};

	FUNC VOID INIT_SUB_NewWorld_Part_Forest_01()
	{
		Wld_AssignRoomToNpc	("forestherberge01",	Mod_776_NONE_Orlan_NW);
	};

FUNC VOID INIT_NewWorld_Part_Forest_01 ()
{
	B_InitMonsterAttitudes (); 
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();	
	
	INIT_SUB_NewWorld_Part_Forest_01(); 
};
	
//------- Troll Area ---------------------------
FUNC VOID STARTUP_NewWorld_Part_TrollArea_01 ()
{
	Wld_InsertNpc 	(Minecrawlerqueen, 			"FP_ROAM_MAGECAVE_20");

	// Stollen unter Sonnenkreis

	Wld_InsertNpc	(ZombieRandom,	"FP_ROAM_RITUALFOREST_CAVE_05");
	Wld_InsertNpc	(ZombieRandom,	"FP_ROAM_RITUALFOREST_CAVE_04");
	Wld_InsertNpc	(ZombieRandom,	"FP_ROAM_RITUALFOREST_CAVE_03");

	Wld_InsertNpc	(ZombieRandom,	"FP_ROAM_RITUALFOREST_CAVE_10");
	Wld_InsertNpc	(ZombieRandom,	"FP_ROAM_RITUALFOREST_CAVE_11");

	Wld_InsertNpc	(ZombieRandom,	"FP_ROAM_RITUALFOREST_CAVE_02");
	Wld_InsertNpc	(ZombieRandom,	"FP_ROAM_RITUALFOREST_CAVE_01");

	//Wld_InsertNpc	(ZombieRandom,	"NW_RITUALFOREST_CAVE_02");
	//Wld_InsertNpc	(ZombieRandom,	"NW_RITUALFOREST_CAVE_02");

	// Wald bei Sonnenkreis

	Wld_InsertNpc	(Fleischfly,	"NW_TROLLAREA_RITUALPATH_04");
	Wld_InsertNpc	(Fleischfly,	"NW_TROLLAREA_RITUALPATH_04");
	Wld_InsertNpc	(Fleischfly,	"NW_TROLLAREA_RITUALPATH_04");

	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_TROLLAREA_RITUALPATH_032");
	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_TROLLAREA_RITUALPATH_032");
	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_TROLLAREA_RITUALPATH_032");

	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_TROLLAREA_RITUAL_08");
	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_TROLLAREA_RITUAL_08");
	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_TROLLAREA_RITUAL_08");

	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_TROLLAREA_RITUAL_13");
	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_TROLLAREA_RITUAL_13");
	Wld_InsertNpc	(Gobbo_Skeleton,	"NW_TROLLAREA_RITUAL_13");

	// Zwischen Sonnenkreis und Troll

	Wld_InsertNpc	(Molerat,	"NW_TROLLAREA_RITUALFOREST_04_MONSTER");
	Wld_InsertNpc	(Molerat,	"NW_TROLLAREA_RITUALFOREST_04_MONSTER");

	Wld_InsertNpc	(Keiler,	"NW_TROLLAREA_RITUALFOREST_06_MONSTER");
	Wld_InsertNpc	(Keiler,	"NW_TROLLAREA_RITUALFOREST_06_MONSTER");

	// Grimbald -> Troll

	Wld_InsertNpc	(Snapper,	"NW_TROLLAREA_BRIGDE_01");
	Wld_InsertNpc	(Snapper,	"NW_TROLLAREA_BRIGDE_01");
	Wld_InsertNpc	(Snapper,	"NW_TROLLAREA_BRIGDE_01");

	Wld_InsertNpc	(Troll_Black,	"NW_TROLLAREA_PATH_84");

	// Um den See

	Wld_InsertNpc	(Lurker,	"NW_TROLLAREA_PATH_72");

	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PATH_71_MONSTER");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PATH_71_MONSTER");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PATH_71_MONSTER");

	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PATH_71_MONSTER2");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PATH_71_MONSTER2");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PATH_71_MONSTER2");

	Wld_InsertNpc	(Meatbug,	"NW_TROLLAREA_TROLLLAKECAVE_03A");
	Wld_InsertNpc	(Meatbug,	"NW_TROLLAREA_TROLLLAKECAVE_03A");
	Wld_InsertNpc	(Meatbug,	"NW_TROLLAREA_TROLLLAKECAVE_03A");

	Wld_InsertNpc	(ZombieRandom,	"NW_TROLLAREA_TROLLLAKECAVE_08");
	Wld_InsertNpc	(ZombieRandom,	"NW_TROLLAREA_TROLLLAKECAVE_08");
	Wld_InsertNpc	(ZombieRandom,	"NW_TROLLAREA_TROLLLAKECAVE_08");

	Wld_InsertNpc	(Bloodfly,	"NW_TROLLAREA_PATH_12");
	Wld_InsertNpc	(Bloodfly,	"NW_TROLLAREA_PATH_12");
	Wld_InsertNpc	(Bloodfly,	"NW_TROLLAREA_PATH_12");

	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PLANE_01");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PLANE_01");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PLANE_01");

	Wld_InsertNpc	(Waran,	"NW_TROLLAREA_PATH_08");
	Wld_InsertNpc	(Waran,	"NW_TROLLAREA_PATH_08");

	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PATH_15_MONSTER");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PATH_15_MONSTER");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PATH_15_MONSTER");

	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PATH_22_MONSTER");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PATH_22_MONSTER");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PATH_22_MONSTER");

	// H?hle vor Feuerpr?fung + H?hle

	Wld_InsertNpc	(Blattcrawler,	"NW_TROLLAREA_BRIGDE_05");
	Wld_InsertNpc	(Blattcrawler,	"NW_TROLLAREA_BRIGDE_05");

	Wld_InsertNpc	(MinecrawlerWarrior,	"NW_MAGECAVE_20");

	Wld_InsertNpc	(MinecrawlerWarrior,	"NW_MAGECAVE_23");
	Wld_InsertNpc	(Minecrawler,	"NW_MAGECAVE_23");

	Wld_InsertNpc	(MinecrawlerWarrior,	"NW_MAGECAVE_27");
	Wld_InsertNpc	(Minecrawler,	"NW_MAGECAVE_27");

	// Weg See bis kurz vor Dragomir

	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_RUINS_17");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_RUINS_17");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_RUINS_17");

	Wld_InsertNpc	(Fleischfly,	"NW_TROLLAREA_PLANE_04");
	Wld_InsertNpc	(Fleischfly,	"NW_TROLLAREA_PLANE_04");

	Wld_InsertNpc	(Fleischfly,	"NW_TROLLAREA_PATH_38_MONSTER");
	Wld_InsertNpc	(Fleischfly,	"NW_TROLLAREA_PATH_38_MONSTER");

	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PLANE_06");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PLANE_06");

	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PLANE_05");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PLANE_05");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PLANE_05");

	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_GOBBO_01");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_GOBBO_01");

	Wld_InsertNpc	(Blattcrawler,	"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc	(Blattcrawler,	"NW_TROLLAREA_RATS_01");

	Wld_InsertNpc	(Gobbo_Green,	"NW_TROLLAREA_PATH_56");
	Wld_InsertNpc	(Gobbo_Green,	"NW_TROLLAREA_PATH_56");
	Wld_InsertNpc	(Gobbo_Warrior,	"NW_TROLLAREA_PATH_56");

	Wld_InsertNpc	(Lurker,	"NW_TROLLAREA_RIVERSIDE_01");

	Wld_InsertNpc	(Shadowbeast,	"NW_TROLLAREA_RIVERSIDECAVE_02");

	Wld_InsertNpc	(Shadowbeast,	"NW_TROLLAREA_RIVERSIDECAVE_07");
	Wld_InsertNpc	(Shadowbeast,	"NW_TROLLAREA_RIVERSIDECAVE_07");

	Wld_InsertNpc	(Lurker,	"NW_TROLLAREA_NOVCHASE_01");

	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PLANE_07");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PLANE_07");

	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PLANE_11");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PLANE_11");

	Wld_InsertNpc	(Bloodfly,	"NW_TROLLAREA_RIVERSIDE_09");
	Wld_InsertNpc	(Bloodfly,	"NW_TROLLAREA_RIVERSIDE_09");
	Wld_InsertNpc	(Bloodfly,	"NW_TROLLAREA_RIVERSIDE_09");

	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PATH_66_MONSTER");
	Wld_InsertNpc	(Scavenger,	"NW_TROLLAREA_PATH_66_MONSTER");

	// Ausgrabungsstelle

	Wld_InsertNpc	(Snapper,	"NW_TROLLAREA_RUINS_32");
	Wld_InsertNpc	(Snapper,	"NW_TROLLAREA_RUINS_32");

	Wld_InsertNpc	(Snapper,	"NW_TROLLAREA_RUINS_30");
	Wld_InsertNpc	(Snapper,	"NW_TROLLAREA_RUINS_30");

	Wld_InsertNpc	(Waran,	"NW_TROLLAREA_RUINS_36");
	Wld_InsertNpc	(Waran,	"NW_TROLLAREA_RUINS_36");

	Wld_InsertNpc	(Snapper,	"NW_TROLLAREA_RUINS_38");
	Wld_InsertNpc	(Snapper,	"NW_TROLLAREA_RUINS_38");

	Wld_InsertNpc	(Waran,	"NW_TROLLAREA_RUINS_20");
	Wld_InsertNpc	(Waran,	"NW_TROLLAREA_RUINS_20");
	Wld_InsertNpc	(Waran,	"NW_TROLLAREA_RUINS_20");

	Wld_InsertNpc	(Snapper,	"NW_TROLLAREA_RUINS_14");
	Wld_InsertNpc	(Snapper,	"NW_TROLLAREA_RUINS_14");

	Wld_InsertNpc	(Gobbo_Warrior,	"NW_TROLLAREA_RUINS_CAVE_01");
	Wld_InsertNpc	(Gobbo_Warrior,	"NW_TROLLAREA_RUINS_CAVE_01");
	Wld_InsertNpc	(Gobbo_Warrior,	"NW_TROLLAREA_RUINS_CAVE_01");

	// Da wo ma der magische Golem wa

	Wld_InsertNpc	(YTroll,	"FP_MAGICGOLEM");

	Wld_InsertNpc	(Spider_01,	"NW_TROLLAREA_RUINS_CAVE_14");
	Wld_InsertNpc	(Spider_01,	"NW_TROLLAREA_RUINS_CAVE_11");
	Wld_InsertNpc	(Spider_01,	"NW_TROLLAREA_RUINS_CAVE_11");
	Wld_InsertNpc	(Spider_01,	"NW_TROLLAREA_RUINS_CAVE_17");
};

	FUNC VOID INIT_SUB_NewWorld_Part_TrollArea_01()
	{
	};

FUNC VOID INIT_NewWorld_Part_TrollArea_01 ()
{
	B_InitMonsterAttitudes (); 
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_NewWorld_Part_TrollArea_01();	 
};

// ------ World -------
FUNC VOID STARTUP_NewWorld()
{
	CurrentLevel3 = NEWWORLD_ZEN;

	NameAllFires();

	// Ratten in Sekobs Scheune

	Wld_InsertNpc	(Rat_Sekob_01, "FP_ROAM_SEKOBSRATTE_01");
	Wld_InsertNpc	(Rat_Sekob_02, "FP_ROAM_SEKOBSRATTE_04");
	Wld_InsertNpc	(Rat_Sekob_03, "FP_ROAM_SEKOBSRATTE_07");




	// Sonstiges

	

	// ------ StartUps der Unter-Parts ------ 
	STARTUP_NewWorld_Part_City_01();
	STARTUP_NewWorld_Part_Farm_01();
	STARTUP_NewWorld_Part_Xardas_01();
	STARTUP_NewWorld_Part_Monastery_01();
	STARTUP_NewWorld_Part_GreatPeasant_01();
	STARTUP_NewWorld_Part_TrollArea_01();
	STARTUP_NewWorld_Part_Forest_01();
	STARTUP_NewWorld_Part_Pass_To_OW_01();
	// ------ INTRO - muss ganz am Ende der Startup stehen ------
	Kapitel = 1; //Joly: Kann hier stehen bleiben!
	//PlayVideo ("INTRO_ALT.BIK");
	//PlayVideo ("GREATPRAYER.BIK");
	//PlayVideo ("OREHEAP.BIK");
	//PlayVideo ("EXTRO.BIK");
	//PlayVideo ("PLAYEROUT.BIK");
	//PlayVideo ("INTRO.BIK");
	//PlayVideo ("Addon_Title.BIK");
	
	//-----Addon Talent Goldhacken---------
	Hero_HackChance = 10;
};
FUNC VOID INIT_NewWorld()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	if (Mod_Cronos_Artefakt == 1)
	{
		Wld_InsertNpc	(Bloodhound_Untier, "FP_ROAM_UNTIER_01");
		Wld_InsertNpc	(Sheep, "FP_ROAM_UNTIER_02");

		Wld_InsertItem	(ItMi_AbsorbKristall, "FP_ITEM_ABSORBKRISTALL");

		Mod_Cronos_Artefakt = 2;
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_BurnedLager))
	{
		Wld_SendUntrigger	("DRAGOMIRSFEUER");
		Wld_SendUntrigger	("DRAGOMIRSMOKE");
	};

	if (Mod_ZweiteVerbesserung == TRUE)
	&& (Mod_Gilde == 13)
	&& (Mod_MyxirNachtmahr == 0)
	{
		Wld_InsertNpc	(Nightmare,	"FP_MAGICGOLEM");

		Mod_MyxirNachtmahr = 1;
	};

	if (Kapitel >= 2)
	&& (Mod_LobartsSchafeTot >= 2)
	&& (Mod_LobartAlwin == 0)
	{
		Mod_LobartAlwin = 1;

		B_StartOtherRoutine	(Mod_910_BAU_Lobart_NW, "LOBARTALWIN");
		B_StartOtherRoutine	(Mod_560_NONE_Alwin_NW, "LOBARTALWIN");
		B_StartOtherRoutine	(Mod_597_NONE_Meldor_NW, "LOBARTALWIN");
		B_StartOtherRoutine	(Mod_1041_VLK_Buergerin_NW, "LOBARTALWIN");
		B_StartOtherRoutine	(Mod_1039_VLK_Buergerin_NW, "LOBARTALWIN");
		B_StartOtherRoutine	(Mod_593_NONE_Lucy_NW, "LOBARTALWIN");
	};

	if (Mod_KG_Glenn == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Bramrad_Nahrungsversorgung))
	{
		Mod_KG_Glenn = 1;

		Wld_InsertNpc	(Mod_7493_OUT_Glenn_NW, "HAFEN");
	};

	if (Mod_LesterDabei == 1)
	{
		Mod_LesterDabei = 2;

		B_StartOtherRoutine	(Mod_557_PSINOV_Lester_NW, "SCHIFF");
	};

	if (Mod_MyxirDabei == 1)
	{
		Mod_MyxirDabei = 2;

		Wld_InsertNpc	(Mod_7447_KDS_Myxir_NW, "SHIP");
	};

	if (Mod_AngarDabei == 1)
	{
		Mod_AngarDabei = 2;

		Wld_InsertNpc	(Mod_7454_TPL_Angar_NW, "SHIP");
	};

	if (Mod_NamibDabei == 1)
	{
		Mod_NamibDabei = 2;

		Wld_InsertNpc	(Mod_7456_GUR_BaalNamib_NW, "SHIP");
	};

	if (Mod_BonesDabei == 1)
	{
		Mod_BonesDabei = 2;

		Wld_InsertNpc	(Mod_7466_PIR_Bones_NW, "SHIP");
	};

	if (Mod_JackDabei == 2)
	{
		Mod_JackDabei = 3;

		B_StartOtherRoutine	(Mod_586_NONE_Jack_NW, "START");
	};

	if (Mod_CedricDabei == 2)
	{
		Mod_CedricDabei = 3;

		B_StartOtherRoutine	(Mod_569_RIT_Cedric_NW, "START");
	};

	if (Mod_KerolothDabei == 2)
	{
		Mod_KerolothDabei = 3;

		B_StartOtherRoutine	(Mod_502_RIT_Keroloth_NW, "START");
	};

	if (Mod_MarcosDabei == 2)
	{
		Mod_MarcosDabei = 3;

		B_StartOtherRoutine	(Mod_978_RIT_Marcos_NW, "START");
	};

	if (Mod_GeroldDabei == 2)
	{
		Mod_GeroldDabei = 3;

		B_StartOtherRoutine	(Mod_501_RIT_Gerold_NW, "START");
	};

	if (Mod_TengronDabei == 2)
	{
		Mod_TengronDabei = 3;

		B_StartOtherRoutine	(Mod_981_RIT_Tengron_NW, "START");
	};

	if (Mod_CassiaDabei == 2)
	{
		Mod_CassiaDabei = 3;

		B_StartOtherRoutine	(Mod_568_NONE_Cassia_NW, "START");
	};

	if (Mod_BennetDabei == 3)
	{
		Mod_BennetDabei = 4;

		B_StartOtherRoutine	(Mod_562_NONE_Bennet_NW, "START");
	};

	if (Mod_CordDabei == 2)
	{
		Mod_CordDabei = 3;

		B_StartOtherRoutine	(Mod_528_SLD_Cord_NW, "START");
	};

	if (Mod_VatrasDabei == 2)
	{
		Mod_VatrasDabei = 3;

		B_StartOtherRoutine	(Mod_524_KDW_Vatras_NW, "START");
	};

	if (Mod_EthanDabei == 2)
	{
		Mod_EthanDabei = 3;

		B_StartOtherRoutine	(Mod_1532_HTR_Ethan_NW, "START");
	};

	if (Mod_SagittaDabei == 2)
	{
		Mod_SagittaDabei = 3;

		B_StartOtherRoutine	(Mod_773_NONE_Sagitta_NW, "START");
	};

	if (Mod_RavenDabei == 3)
	{
		Mod_RavenDabei = 4;

	// ToDo

		//B_RemoveNpc	(Mod_520_DMR_Raven_NW);
	};

	if (Mod_GornDabei == 2)
	{
		Mod_GornDabei = 3;

		B_StartOtherRoutine	(Mod_533_SLD_Gorn_NW, "START");
	};

	if (Mod_DiegoDabei == 2)
	{
		Mod_DiegoDabei = 3;

		B_StartOtherRoutine	(Mod_538_RDW_Diego_NW, "START");
	};

	if (Mod_RandolphDabei == 2)
	{
		Mod_RandolphDabei = 3;

		B_StartOtherRoutine	(Mod_906_BAU_Randolph_NW, "START");
	};

	if (Mod_MiltenDabei == 2)
	{
		Mod_MiltenDabei = 3;

		B_StartOtherRoutine	(Mod_534_KDF_Milten_NW, "START");
	};

	if (Mod_AngarDabei == 3)
	{
		Mod_AngarDabei = 4;

		B_RemoveNpc	(Mod_7454_TPL_Angar_NW);
	};

	if (Mod_NamibDabei == 3)
	{
		Mod_NamibDabei = 4;

		B_RemoveNpc	(Mod_7456_GUR_BaalNamib_NW);
	};

	if (Mod_LesterDabei == 3)
	{
		Mod_LesterDabei = 4;

		B_StartOtherRoutine	(Mod_557_PSINoV_Lester_NW, "TOT");
	};

	if (Mod_MyxirDabei == 3)
	{
		Mod_MyxirDabei = 4;

		B_RemoveNpc	(Mod_7447_KDS_Myxir_NW);
	};

	if (Mod_BonesDabei == 3)
	{
		Mod_BonesDabei = 4;

		B_RemoveNpc	(Mod_7466_PIR_Bones_NW);
	};

	if (Mod_UrielaDabei == 2)
	{
		Mod_UrielaDabei = 3;

		B_StartOtherRoutine	(Mod_7167_HEX_Uriela_NW, "START");
	};

	if (Mod_VelayaDabei == 2)
	{
		Mod_VelayaDabei = 3;

		B_StartOtherRoutine	(Mod_7416_BAU_Velaya_NW, "START");
	};
	
	if (Kapitel == 3)
	&& (Npc_KnowsInfo(hero, Info_Mod_Xeres_Beliar))
	{
		B_Kapitelwechsel	(4, NEWWORLD_ZEN);
		B_Chapter4_OneTime = TRUE;

		if (hero.guild == GIL_NOV)
		{
			Mod_WM_Rasend_Day = Wld_GetDay();
		};
	};

	// Rasend

	if (Mod_WM_Rasend == 0)
	&& (Mod_Irdorath == 1)
	&& (hero.guild == GIL_NOV)
	{
		Mod_WM_Rasend = 1;

		B_StartOtherRoutine	(Mod_1255_RIT_Ritter_NW, "RASEND");
		B_StartOtherRoutine	(Mod_1244_RIT_Ritter_NW, "RASEND");
		B_StartOtherRoutine	(Mod_1245_RIT_Ritter_NW, "RASEND");
		B_StartOtherRoutine	(Mod_1256_RIT_Ritter_NW, "RASEND");

		B_KillNpc	(Mod_1255_RIT_Ritter_NW);
		B_KillNpc	(Mod_1244_RIT_Ritter_NW);
		B_KillNpc	(Mod_1245_RIT_Ritter_NW);
		B_KillNpc	(Mod_1256_RIT_Ritter_NW);
		B_KillNpc	(Mod_1069_VLK_Buerger_NW);
		B_KillNpc	(Mod_1057_VLK_Buergerin_NW);
		B_KillNpc	(Mod_1059_VLK_Buerger_NW);
		B_KillNpc	(Mod_1055_VLK_Buerger_NW);
		
		B_StartOtherRoutine	(Mod_596_MIL_Martin_NW, "RASEND");
	};

	if (Kapitel >= 2)
	&& (Mod_REL_Dichter == 2)
	&& (Mod_REL_DichterInKhorinis == 0)
	{
		Mod_REL_DichterInKhorinis = 1;

		Wld_InsertNpc	(Mod_7398_OUT_Dichter_NW, "BIGFARM");
	};

	if (Kapitel == 3)
	&& (Xardas3IstWeg == FALSE)
	{
		B_StartOtherRoutine (Mod_513_DMB_Xardas_NW, "TOT");

		Xardas3IstWeg = TRUE;
	};

	if (Xardas3IstWeg == TRUE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Xeres_Beliar))
	{
		B_StartOtherRoutine (Mod_513_DMB_Xardas_NW, "START");

		Xardas3IstWeg = 2;
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Fanatiker))
	&& (Mod_FanatikerDa == FALSE)
	{
		Mod_FanatikerDa = TRUE;
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_WasTunAlsErzbaron))
	&& (Mod_AL_InsertWhistler == FALSE)
	{
		Wld_InsertNpc	(Mod_1926_BDT_Esteban_NW, "HAFEN");
		Wld_InsertNpc	(Mod_1927_STT_Whistler_NW, "HAFEN");
		Wld_InsertNpc	(Mod_1928_BDT_Morgahard_NW, "HAFEN");

		Mod_AL_InsertWhistler = TRUE;
	};

	if (Mod_NL_Grimbald == 5)
	{
		Mod_NL_Grimbald = 6;

		B_StartOtherRoutine	(Mod_765_NONE_Grimbald_NW, "START");

		Mod_765_NONE_Grimbald_NW.aivar[AIV_PARTYMEMBER] = FALSE;
	};

	if (Kapitel >= 3)
	&& (Mod_Telbor_GoingToHof == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Telbor_AllZombies))
	{
		Mod_Telbor_GoingToHof = TRUE;
		B_StartOtherRoutine	(Mod_908_BAU_Telbor_NW, "WANTINGBACK");
	};

	if (Kapitel == 5)
	&& ((Npc_HasItems(hero, Uriziel_1H) == 1)
	|| (Npc_HasItems(hero, Uriziel_2H) == 1)
	|| (Npc_HasItems(hero, ItRu_MassDeath) == 1))
	{
		B_Kapitelwechsel	(6, NEWWORLD_ZEN);
	};

	if (Kapitel == 4)
	&& (Mod_MoeDontTalk == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Moe_AllievoTot))
	{
		Mod_MoeDontTalk = TRUE;
		Wld_InsertNpc	(Mod_7192_VLK_Buergerin_NW, "TAVERNE");
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_06))
	&& (Mod_Novi_Drin == FALSE)
	{
		Mod_Novi_Drin = TRUE;

		Wld_InsertNpc	(Mod_7193_NOV_Novize_NW, "BIGFARM");
	};

	if (Mod_WM_Hexeninfos > 0)
	{
		B_StartOtherRoutine	(Mod_7198_HEX_AttraktiveFrau_NW, "TOT");
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_25))
	&& (Mod_WM_CronosAttack == 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_26))
	{
		Mod_WM_CronosAttack = 1;

		B_StartOtherRoutine	(Mod_1538_WKR_Wasserkrieger_NW, "SAMMELN");
		B_StartOtherRoutine	(Mod_1530_WKR_Everaldo_NW, "SAMMELN");
		B_StartOtherRoutine	(Mod_1539_WKR_Wasserkrieger_NW, "SAMMELN");
		B_StartOtherRoutine	(Mod_1533_WKR_Salvador_NW, "SAMMELN");
		B_StartOtherRoutine	(Mod_1537_WKR_Vanas_NW, "SAMMELN");
		B_StartOtherRoutine	(Mod_1536_WKR_Roka_NW, "SAMMELN");
		B_StartOtherRoutine	(Mod_1535_WKR_Wasserkrieger_NW, "SAMMELN");
		B_StartOtherRoutine	(Mod_1534_WKR_Wasserkrieger_NW, "SAMMELN");
		B_StartOtherRoutine	(Mod_1532_HTR_Ethan_NW, "SAMMELN");
		B_StartOtherRoutine	(Mod_758_KDW_Cronos_NW, "SAMMELN");
	};

	if (Kapitel >= 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Moe_Zettel))
	&& (!Npc_IsDead(Mod_599_NONE_Moe_NW))
	&& (Mod_CantharQuest_Last == 0)
	{
		B_StartOtherRoutine	(Mod_599_NONE_Moe_NW, "LAGERHAUS");
		B_KillNpc	(Mod_599_NONE_Moe_NW);

		CreateInvItems	(Mod_599_NONE_Moe_NW, ItWr_MoeNotiz_Dead, 1);

		Mod_CantharQuest_Last = 1;
	};

	if (FokusBlockade == TRUE)
	&& (FokiEingesetzt == 4)
	&& (Mod_HagenStellDichEin == FALSE)
	{
		Mod_HagenStellDichEin = TRUE;

		B_StartOtherRoutine	(Mod_592_PAL_Hagen_NW, "SURPRISE");
		B_StartOtherRoutine	(Mod_1056_VLK_Buergerin_NW, "SURPRISE");

		AI_UnequipArmor	(Mod_592_PAL_Hagen_NW);
		AI_UnequipArmor	(Mod_1056_VLK_Buergerin_NW);
	};

	if (Mod_NL_DrachenjaegerOnar == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Lee_Gormgniez))
	{
		Mod_NL_DrachenjaegerOnar = 1;

		Wld_InsertNpc	(Mod_7296_DJG_Drachenjaeger_NW, "BIGFARM");
		Wld_InsertNpc	(Mod_7297_DJG_Drachenjaeger_NW, "BIGFARM");
		Wld_InsertNpc	(Mod_7298_DJG_Butch_NW, "BIGFARM");
	};
	
	// ------ INITS der Unter-Parts ------ 
	INIT_SUB_NewWorld_Part_City_01();
	INIT_SUB_NewWorld_Part_Farm_01();
	INIT_SUB_NewWorld_Part_Xardas_01();
	INIT_SUB_NewWorld_Part_Monastery_01();
	INIT_SUB_NewWorld_Part_GreatPeasant_01();
	INIT_SUB_NewWorld_Part_TrollArea_01();
	INIT_SUB_NewWorld_Part_Forest_01();
	INIT_SUB_NewWorld_Part_Pass_To_OW_01();
	
	if (Mod_Gilde == 4)
	&& (Mod_ErsteVerbesserung == TRUE)
	&& (Mod_Orcdog_Insert == FALSE)
	{
		Wld_InsertNpc	(Orcdog_Big,	"NW_PASS_06");

		Mod_Orcdog_Insert = TRUE;
	};

	if (Mod_Gilde == 19)
	&& (Mod_ZweiteVerbesserung == TRUE)
	&& (Mod_Wyver_Insert == FALSE)
	{
		Wld_InsertNpc	(Wyver,	"FP_MAGICGOLEM");

		Mod_Wyver_Insert = TRUE;
	};

	if (Kapitel >= 4)
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest6))
	&& (Mod_Thorben_KO == 0)
	{
		Mod_Thorben_KO = 1;

		B_StartOtherRoutine	(Mod_536_NONE_Thorben_NW, "KO");
	};

	if (Mod_Enter_NewWorld_02 == FALSE)
	&& (Kapitel >= 2)
	{
		B_StartOtherRoutine	(Mod_771_KDW_Riordian_NW, "TOT");
		B_StartOtherRoutine	(Mod_769_KDW_Nefarius_NW, "TOT");
		B_StartOtherRoutine	(Mod_768_KDW_Merdarion_NW, "TOT");
		B_StartOtherRoutine	(Mod_774_KDW_Saturas_NW, "TOT");
		B_StartOtherRoutine	(Mod_758_KDW_Cronos_NW, "TOT");
		B_StartOtherRoutine	(Mod_512_RDW_Cavalorn_NW, "MAGIERWEG");
		B_StartOtherRoutine	(Mod_766_NONE_Grom_NW, "ATLAGER");

		Mod_Cavalorn_Banditen = 1;

		if (Npc_KnowsInfo(hero, Info_Mod_Cavalorn_Banditen3))
		{
			B_SetTopicStatus	(TOPIC_MOD_CAVALORN_BANDITEN, LOG_FAILED);
		};

		B_StartOtherRoutine	(Mod_1723_MIL_Gidan_NW, "ANDRE");
		B_StartOtherRoutine	(PC_Friend_NW, "TOT");

		// Feldr?uber in H?hle spawnen, wenn man Eimer ausgeleert hat

		if (Mod_EimerAusgeleert == 1)
		{
			Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_FELDREUBER4");
			Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_FELDREUBER4");
		};

		B_RemoveNpc	(Mod_963_PIR_Malcom_NW);

		if (hero.guild == GIL_VLK)
		{
			B_StartOtherRoutine	(Mod_918_KDF_Hyglas_NW, "ATPYROKAR");
		};

		Mod_Enter_NewWorld_02 = True;
	};
	
	if (Mod_Enter_NewWorld_03 == FALSE)
	&& (Kapitel >= 3)
	{

		// Feldr?uber in H?hle spawnen, wenn man Eimer ausgeleert hat

		if (Mod_EimerAusgeleert == 1)
		{
			Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_FELDREUBER4");
			Wld_InsertNpc	(Giant_Bug,	"NW_BIGFARM_FELDREUBER4");
		};

		// Sonstiges

		B_StartOtherRoutine	(Mod_538_RDW_Diego_NW, "ATMIKA");
		B_StartOtherRoutine	(Mod_588_WNOV_Joe_NW, "DIEGO");
		B_StartOtherRoutine	(PC_Friend_NW, "START");

		B_StartOtherRoutine	(Mod_912_BAU_Vino_NW,	"BRENNEREI");
		B_StartOtherRoutine	(Mod_1937_JGR_Nandor_NW,	"BRENNEREI");

		Wld_SendTrigger	("EVT_VINOKELLEREI_MOVER");

		Wld_InsertNpc	(Spider_Mini_01,	"FP_ROAM_MINISPINNE_01");
		Wld_InsertNpc	(Spider_Mini_02,	"FP_ROAM_MINISPINNE_02");
		Wld_InsertNpc	(Spider_Mini_03,	"FP_ROAM_MINISPINNE_03");
		Wld_InsertNpc	(Spider_Mini_04,	"FP_ROAM_MINISPINNE_04");
		Wld_InsertNpc	(Spider_Mini_05,	"FP_ROAM_MINISPINNE_05");
		Wld_InsertNpc	(Spider_Mini_06,	"FP_ROAM_MINISPINNE_06");
		Wld_InsertNpc	(Spider_Mini_07,	"FP_ROAM_MINISPINNE_07");
		Wld_InsertNpc	(Spider_Mini_08,	"FP_ROAM_MINISPINNE_08");
		Wld_InsertNpc	(Spider_Mini_09,	"FP_ROAM_MINISPINNE_09");
		Wld_InsertNpc	(Spider_Mini_10,	"FP_ROAM_MINISPINNE_10");
		Wld_InsertNpc	(Spider_Mini_11,	"FP_ROAM_MINISPINNE_11");
		Wld_InsertNpc	(Spider_Mini_12,	"FP_ROAM_MINISPINNE_12");
		Wld_InsertNpc	(Spider_Mini_13,	"FP_ROAM_MINISPINNE_13");
		Wld_InsertNpc	(Spider_Mini_14,	"FP_ROAM_MINISPINNE_14");
		Wld_InsertNpc	(Spider_Mini_15,	"FP_ROAM_MINISPINNE_15");
		Wld_InsertNpc	(Spider_Mini_16,	"FP_ROAM_MINISPINNE_16");

		Mod_Enter_NewWorld_03 = True;
	};
	
	if (Mod_Enter_NewWorld_04 == FALSE)
	&& (Kapitel >= 4)
	{
		Mod_Enter_NewWorld_04 = True;

		if (hero.guild != GIL_PAL)
		{
			Wld_InsertNpc	(Mod_7682_STT_Fisk_NW,		"NW_BIGMILL_FARM3_07");
			Wld_InsertNpc	(Mod_7683_BUD_Buddler_NW,	"NW_BIGMILL_FARM3_07");
			Wld_InsertNpc	(Mod_7684_STT_Schatten_NW,	"NW_BIGMILL_FARM3_07");
			Wld_InsertNpc	(Mod_7685_BUD_Buddler_NW,	"NW_BIGMILL_FARM3_07");
		};

		Wld_InsertItem	(ItKe_SekobScheune, "FP_ITEM_SEKOBSSCHEUNE_KEY");
	};
	
	if (Mod_Enter_NewWorld_05 == FALSE)
	&& (Kapitel >= 5)
	{
		if (hero.guild == GIL_MIL)
		{
			B_StartOtherRoutine	(Mod_590_NONE_Kardif_NW, "TEUTONICA");
			B_StartOtherRoutine	(Mod_595_MIL_Mario_NW, "TEUTONICA");
		};

		B_RemoveNpc	(Mod_7296_DJG_Drachenjaeger_NW);
		B_RemoveNpc	(Mod_7297_DJG_Drachenjaeger_NW);
		B_RemoveNpc	(Mod_7298_DJG_Butch_NW);

		Mod_Enter_NewWorld_05 = True;
	};
	
	if (Mod_Enter_NewWorld_06 == FALSE)
	&& (Kapitel >= 6)
	{
		Mod_Enter_NewWorld_06 = True;
	};

	if (Mod_Kap4_KGOrks == 2)
	{
		Wld_InsertNpc	(Mod_7699_KGD_Typ_NW, "MARKT");

		Mod_Kap4_KGOrks = 3;
	};

	OldLevel(NEWWORLD_ZEN);
};


// ------ AddonWorld -------
FUNC VOID STARTUP_AddonWorld ()
{
	CurrentLevel3 = ADDONWORLD_ZEN;

	NameAllFires();
	
	STARTUP_ADDON_PART_BANDITSCAMP_01 ();
	STARTUP_ADDON_PART_PIRATESCAMP_01 ();
	STARTUP_ADDON_PART_ENTRANCE_01 ();
	STARTUP_ADDON_PART_GOLDMINE_01 ();
	STARTUP_ADDON_PART_CANYON_01 ();
	STARTUP_ADDON_PART_VALLEY_01 ();
	STARTUP_ADDON_PART_ADANOSTEMPLE_01 ();
		
	// ------ StartUps der Unter-Parts ------ 
	ENTERED_ADDONWORLD = TRUE;
	//OldLevel(ADDONWORLD_ZEN);	 
	//Wld_SetTime	(60,00);//Joly: KDW sind schon 2 Tag da. SC hat ein bisschen l?nger gebraucht.
};

FUNC VOID INIT_AddonWorld ()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_XeresLebt))
	&& (Mod_HS_XardasRat == 1)
	&& (SaturasNichtInJharki == FALSE)
	{
		B_StartOtherRoutine	(Mod_9000_KDW_Saturas_AW, "TOT");

		SaturasNichtInJharki = TRUE;
	};

	if (Mod_NL_Teutonica == 1)
	{
		Mod_NL_Teutonica = 2;

		Wld_InsertNpc	(Seeungeheuer_Teutonica, "FP_SPAWN_SEEUNGEHEUER_TEUTONICA");
	};

	if (Kapitel >= 4)
	&& (Mod_Adanostempel_Door == 0)
	&& (Mod_Echsis == 1)
	{
		Mod_Adanostempel_Door = 1;

		Wld_SendTrigger	("EVT_ADANOSTEMPEL_EINGANGSTUER");
	};

	if (Mod_WM_Boeden >= 11)
	&& (SaturasNichtInJharki == FALSE)
	{
		B_StartOtherRoutine	(Mod_9000_KDW_Saturas_AW, "TOT");

		SaturasNichtInJharki = TRUE;
	};

	if (Mod_ASS_Blutkelch3 == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Kais_Blutkelch))
	{
		Wld_InsertItem	(ItMi_GreenNugget, "FP_ITEM_GREENNUGGET_01");

		Mod_ASS_Blutkelch3 = 1;
	};

	if (Mod_BonesDabei == 4)
	{
		Mod_BonesDabei = 5;

		B_StartOtherRoutine	(Mod_930_PIR_Bones_AW, "START");
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Danae_Hi))
	&& (Mod_Josephina_In == FALSE)
	{
		Wld_InsertNpc	(GardeInnos_4099_Josephina,	"ADW_PORTALTEMPEL_03");

		Mod_Josephina_In = TRUE;

		B_StartOtherRoutine	(Mod_939_PIR_Owen_AW, "KIDNAPPED");
		B_StartOtherRoutine	(Mod_928_PIR_AlligatorJack_AW, "GEKILLT");

		B_StartOtherRoutine	(Mod_934_PIR_Henry_AW, "BELAGERT");
		B_StartOtherRoutine	(Mod_1077_PIR_PIRAT_AW, "BELAGERT");
		B_StartOtherRoutine	(Mod_1078_PIR_PIRAT_AW, "BELAGERT");
		B_StartOtherRoutine	(Mod_942_PIR_Hank_AW, "BELAGERT");
		B_StartOtherRoutine	(Mod_941_PIR_Angus_AW, "BELAGERT");
		B_StartOtherRoutine	(Mod_935_PIR_Malcom_AW, "BELAGERT");

		Wld_InsertNpc	(Mod_7300_Artefakt_AW, "ADW_PIRATECAMP_WAY_06");
		Wld_InsertNpc	(Mod_7301_UntoterMagier_AW, "ADW_PIRATECAMP_WAY_06");
		Wld_InsertNpc	(Mod_7302_UntoterMagier_AW, "ADW_PIRATECAMP_WAY_06");
		Wld_InsertNpc	(Mod_7303_UntoterMagier_AW, "ADW_PIRATECAMP_WAY_06");
		Wld_InsertNpc	(Mod_7304_HoherUntoterMagier_NW, "ADW_PIRATECAMP_WAY_06");
		Wld_InsertNpc	(Mod_7305_UntoterEliteNovize_AW, "ADW_PIRATECAMP_WAY_06");
		Wld_InsertNpc	(Mod_7306_UntoterKrieger_AW, "ADW_PIRATECAMP_WAY_06");
		Wld_InsertNpc	(Mod_7307_UntoterNovize_AW, "ADW_PIRATECAMP_WAY_06");
		Wld_InsertNpc	(Mod_7308_UntoterEliteNovize_AW, "ADW_PIRATECAMP_WAY_06");
		Wld_InsertNpc	(Mod_7309_UntoterKrieger_AW, "ADW_PIRATECAMP_WAY_06");
		Wld_InsertNpc	(Mod_7310_UntoterNovize_AW, "ADW_PIRATECAMP_WAY_06");
		Wld_InsertNpc	(Mod_7311_UntoterNovize_AW, "ADW_PIRATECAMP_WAY_06");
		Wld_InsertNpc	(Mod_7312_UntoterNovize_AW, "ADW_PIRATECAMP_WAY_06");
		Wld_InsertNpc	(Mod_7313_HoherUntoterMagier_AW, "ADW_PIRATECAMP_WAY_06");

		Wld_InsertNpc	(MayaZombie04_TotenW, "ADW_VALLEY_PATH_072");

		Wld_SendTrigger	("EVT_AW_BEL_BARRIERE");
		Wld_SendTrigger	("EVT_PIRATENTOR");

		B_KillNpc	(Mod_928_PIR_AlligatorJack_AW);

		// Bewachen Owen

		Wld_InsertNpc	(Mod_7317_UntoterNovize_AW, "WP_UNDEAD_07");
		Wld_InsertNpc	(Mod_7318_UntoterNovize_AW, "WP_UNDEAD_07");
		Wld_InsertNpc	(Mod_7319_UntoterNovize_AW, "WP_UNDEAD_07");
		Wld_InsertNpc	(Mod_7320_UntoterKrieger_AW, "WP_UNDEAD_07");
		Wld_InsertNpc	(Mod_7321_HoherUntoterMagier_AW, "WP_UNDEAD_07");
		Wld_InsertNpc	(Mod_7313_HoherUntoterMagier_AW, "WP_UNDEAD_07");
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Drachen))
	&& (Mod_NL_Jharkendar_DrachenSpawn == 0)
	{
		Mod_NL_Jharkendar_DrachenSpawn = 1;

		Wld_InsertNpc	(Giftdrache_11004_NW, "ADW_SWAMP_LOCH_03");

		Wld_InsertItem	(ItAt_DragonEgg_Giftdrache, "FP_ITEM_DRAGONEGG_01");
		Wld_InsertItem	(ItAt_DragonEgg_Giftdrache, "FP_ITEM_DRAGONEGG_02");
		Wld_InsertItem	(ItAt_DragonEgg_Giftdrache, "FP_ITEM_DRAGONEGG_03");
		Wld_InsertItem	(ItAt_DragonEgg_Giftdrache, "FP_ITEM_DRAGONEGG_04");
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Goetterschwerter))
	&& (INSERT_FAKE_HERO_ONETIME == FALSE)
	{
		Wld_InsertNpc	(Fake_Hero,		"STRAND");
		Wld_SendTrigger	("KAPFAKEHERO");

		INSERT_FAKE_HERO_ONETIME = TRUE;
	}; 
	
	INIT_SUB_ADDON_PART_BANDITSCAMP_01 ();
	INIT_SUB_ADDON_PART_PIRATESCAMP_01 ();
 	INIT_SUB_ADDON_PART_ENTRANCE_01 ();
   	INIT_SUB_ADDON_PART_GOLDMINE_01 ();
   	INIT_SUB_ADDON_PART_CANYON_01 ();
   	INIT_SUB_ADDON_PART_VALLEY_01 ();
   	INIT_SUB_ADDON_PART_ADANOSTEMPLE_01 ();
   
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	

	if (Mod_Schwierigkeit > 0)
	&& (Mod_Enter_Addon_01 == FALSE)
	{
		// Leer, da Kapitel 1 kommt man noch gar nicht hier her

		Mod_Enter_Addon_01 = TRUE;
	};

	if (Kapitel >= 2)
	&& (Mod_Enter_Addon_02 == FALSE)
	{
		// Leer, da Startkapitel f?r die Welt

		Mod_Enter_Addon_02 = True;
	};

	if (Kapitel >= 3)
	&& (Mod_Enter_Addon_03 == FALSE)
	{
		// Sumpfhai-Seite

		Wld_InsertNpc	(Swampshark,	"FP_ROAM_SHARK_30");
		Wld_InsertNpc	(Swampshark,	"FP_ROAM_SHARK_27");
		Wld_InsertNpc	(Swampshark,	"FP_ROAM_SHARK_24");
		Wld_InsertNpc	(Swampshark,	"FP_ROAM_SHARK_04");
		Wld_InsertNpc	(Swampshark,	"FP_ROAM_DANGER_28");
		Wld_InsertNpc	(Swampshark,	"FP_ROAM_SHARK_SPECIAL_02");
		Wld_InsertNpc	(Swampshark,	"FP_STAND_LOGAN");
		Wld_InsertNpc	(Swampshark,	"FP_ROAM_BL_FLIES_07");

		// Golem-Seite

		if (Mod_Echsis == 1)
		{
			Wld_InsertNpc	(SwampGolem,	"FP_ITEM_ECHSENEGG_11");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_PFUETZE_02");
			Wld_InsertNpc	(SwampGolem,	"FP_ITEM_ECHSENEGG_13");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_PFUETZE_17");
			Wld_InsertNpc	(SwampGolem,	"ADW_SWAMP_HILLS_DOWN_05");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HILL_05");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SENAT_09");
			Wld_InsertNpc	(SwampGolem,	"ADW_SENAT_ENTRANCE_01");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SENAT_03");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HILL_11");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HOHLWEG_07");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HOHLWEG_01");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SHARK_14");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SHARK_08");
			Wld_InsertNpc	(SwampGolem,	"FP_ITEM_BANDITSCAMP_10");
			Wld_InsertNpc	(SwampGolem,	"FP_STAND_VP1_02");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SWAMP_04");
		};

		Wld_InsertNpc	(SwampGolem,	"FP_ITEM_ECHSENEGG_11");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_PFUETZE_02");
		Wld_InsertNpc	(SwampGolem,	"FP_ITEM_ECHSENEGG_13");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_PFUETZE_17");
		Wld_InsertNpc	(SwampGolem,	"ADW_SWAMP_HILLS_DOWN_05");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HILL_05");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SENAT_09");
		Wld_InsertNpc	(SwampGolem,	"ADW_SENAT_ENTRANCE_01");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SENAT_03");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HILL_11");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HOHLWEG_07");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HOHLWEG_01");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SHARK_14");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SHARK_08");
		Wld_InsertNpc	(SwampGolem,	"FP_ITEM_BANDITSCAMP_10");
		Wld_InsertNpc	(SwampGolem,	"FP_STAND_VP1_02");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SWAMP_04");

		Wld_InsertNpc	(Alraune,	"FP_ITEM_ECHSENEGG_12");
		Wld_InsertNpc	(Alraune,	"FP_ITEM_BANDITSCAMP_06");
		Wld_InsertNpc	(Alraune,	"FP_ROAM_HILL_13");
		Wld_InsertNpc	(Alraune,	"FP_ROAM_BF_04");
		Wld_InsertNpc	(Alraune,	"FP_ROAM_SHARK_08");

		// Canyon - W?stenpirat

		Wld_InsertNpc	(Mod_7293_OUT_Brody_AW, "CANYONLIBRARY");

		Mod_Enter_Addon_03 = True;
	};

	if (Kapitel >= 4)
	&& (Mod_Enter_Addon_04 == FALSE)
	{
		B_StartOtherRoutine	(PC_Friend_AW,		"TEMPEL");

		Mod_Enter_Addon_04 = True;
	};

	if (Kapitel >= 5)
	&& (Mod_Enter_Addon_05 == FALSE)
	{
		// Sumpfhai-Seite

		Wld_InsertNpc	(Swampshark,	"FP_ROAM_SHARK_30");
		Wld_InsertNpc	(Swampshark,	"FP_ROAM_SHARK_27");
		Wld_InsertNpc	(Swampshark,	"FP_ROAM_SHARK_24");
		Wld_InsertNpc	(Swampshark,	"FP_ROAM_SHARK_04");
		Wld_InsertNpc	(Swampshark,	"FP_ROAM_DANGER_28");
		Wld_InsertNpc	(Swampshark,	"FP_ROAM_SHARK_SPECIAL_02");
		Wld_InsertNpc	(Swampshark,	"FP_STAND_LOGAN");
		Wld_InsertNpc	(Swampshark,	"FP_ROAM_BL_FLIES_07");

		// Golem-Seite

		if (Mod_Echsis == 1)
		{
			Wld_InsertNpc	(SwampGolem,	"FP_ITEM_ECHSENEGG_11");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_PFUETZE_02");
			Wld_InsertNpc	(SwampGolem,	"FP_ITEM_ECHSENEGG_13");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_PFUETZE_17");
			Wld_InsertNpc	(SwampGolem,	"ADW_SWAMP_HILLS_DOWN_05");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HILL_05");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SENAT_09");
			Wld_InsertNpc	(SwampGolem,	"ADW_SENAT_ENTRANCE_01");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SENAT_03");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HILL_11");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HOHLWEG_07");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HOHLWEG_01");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SHARK_14");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SHARK_08");
			Wld_InsertNpc	(SwampGolem,	"FP_ITEM_BANDITSCAMP_10");
			Wld_InsertNpc	(SwampGolem,	"FP_STAND_VP1_02");
			Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SWAMP_04");
		};

		Wld_InsertNpc	(SwampGolem,	"FP_ITEM_ECHSENEGG_11");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_PFUETZE_02");
		Wld_InsertNpc	(SwampGolem,	"FP_ITEM_ECHSENEGG_13");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_PFUETZE_17");
		Wld_InsertNpc	(SwampGolem,	"ADW_SWAMP_HILLS_DOWN_05");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HILL_05");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SENAT_09");
		Wld_InsertNpc	(SwampGolem,	"ADW_SENAT_ENTRANCE_01");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SENAT_03");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HILL_11");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HOHLWEG_07");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_HOHLWEG_01");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SHARK_14");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SHARK_08");
		Wld_InsertNpc	(SwampGolem,	"FP_ITEM_BANDITSCAMP_10");
		Wld_InsertNpc	(SwampGolem,	"FP_STAND_VP1_02");
		Wld_InsertNpc	(SwampGolem,	"FP_ROAM_SWAMP_04");

		Mod_Enter_Addon_05 = True;
	};

	if (Kapitel >= 6)
	&& (Mod_Enter_Addon_06 == FALSE)
	{
		Mod_Enter_Addon_06 = True;
	};

	if (Kapitel == 1)
	{
		B_Kapitelwechsel (2, ADDONWORLD_ZEN);
		B_StartOtherRoutine	(Mod_1723_MIL_Gidan_NW, "ANDRE");
	};
	// ------ INITS der Unter-Parts ------ 

	OldLevel(ADDONWORLD_ZEN);
};

FUNC VOID STARTUP_MinentalNewCamp ()
{	
        Wld_InsertNpc	(Mod_525_SLD_Lee_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_781_SLD_Cipher_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_787_SLD_Jarvis_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_779_SLD_Bullco_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_780_SLD_Buster_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_782_SLD_Dar_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_784_SLD_Fester_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_788_SLD_Khaled_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_792_SLD_Patrick_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_794_SLD_Raoul_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_795_SLD_Rod_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_796_SLD_Sentenza_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_797_SLD_Sylvio_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_904_SLD_Engardo_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_2002_BAU_Ricelord_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_2001_BAU_Horatio_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1081_BAU_Pock_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1082_BAU_Rufus_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1083_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1084_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1085_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1086_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1087_BAU_Jeremiah_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1088_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1089_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1090_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1091_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1092_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1093_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1094_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1095_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1096_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1097_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1098_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1099_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1100_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1101_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1102_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1103_BAU_Bauer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1104_BAU_Homer_MT,		"NC_DAM2");
	Wld_InsertNpc	(Mod_1117_PSINOV_BaalKagan_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1118_PSINOV_BaalIsidro_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1122_SLD_Mordrag_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1266_SLD_Orik_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1267_SLD_Soeldner_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1268_SLD_Soeldner_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1269_SLD_Blade_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1270_SLD_Soeldner_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1271_SLD_Soeldner_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1273_SLD_Soeldner_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1274_SLD_Soeldner_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1275_SLD_Nodrak_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1276_SLD_Soeldner_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1277_SLD_Soeldner_MT,	"NC_DAM2");
	//Wld_InsertNpc	(Mod_1278_SLD_Soeldner_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1279_SLD_Soeldner_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1280_SLD_Soeldner_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1281_SLD_Soeldner_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1282_SLD_Soeldner_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1283_SLD_Soeldner_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1284_SLD_Soeldner_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1288_SLD_Butch_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1289_SLD_Bruce_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1290_SLD_Roscoe_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1291_SLD_Silas_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1292_SLD_Shrike_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1293_SLD_Sharky_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1294_SLD_Lefty_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1295_SLD_Schlaeger_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1296_SLD_Schlaeger_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1298_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1299_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1300_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1301_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1302_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1303_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1304_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1305_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1306_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1307_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1308_SLD_Rath_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1309_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1310_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1321_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1312_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1313_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1314_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1315_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1316_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1317_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1318_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1319_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1320_SLD_Organisator_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1508_SLD_Soeldner_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_7220_SLD_Thofeistos_MT,	"NC_DAM2");
};

FUNC VOID INIT_MinentalNewCamp ()
{
	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_01",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_01",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_01",0);
	
	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_02",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_02",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_02",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_03",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_03",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_03",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_04",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_04",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_04",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_05",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_05",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_05",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_06",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_06",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_06",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_07",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_07",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_07",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_08",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_08",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_08",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_09",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_09",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_09",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_10",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_10",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_10",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_11",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_11",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_11",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_12",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_12",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_12",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_13",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_13",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_13",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_14",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_14",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_14",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_15",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_15",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_15",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_16",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_16",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_16",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_17",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_17",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_17",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_18",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_18",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_18",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_19",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_19",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_19",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_20",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_20",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_20",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_21",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_21",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_21",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_22",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_22",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_22",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_23",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_23",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_23",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_24",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_24",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_24",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_25",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_25",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_25",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_26",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_26",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_26",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_27",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_27",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_27",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_28",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_28",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_28",0);

	Wld_SetObjectRoutine (00,00,"FIREPLACE_HIGH2_29",1);
	Wld_SetObjectRoutine (20,00,"FIREPLACE_HIGH2_29",1);
	Wld_SetObjectRoutine (05,00,"FIREPLACE_HIGH2_29",0);

	Wld_SetObjectRoutine (00,00,"NC_FIREPLACE_STONE_01",1);
	Wld_SetObjectRoutine (20,00,"NC_FIREPLACE_STONE_01",1);
	Wld_SetObjectRoutine (05,00,"NC_FIREPLACE_STONE_01",0);

	Wld_SetObjectRoutine (00,00,"NC_FIREPLACE_STONE_02",1);
	Wld_SetObjectRoutine (20,00,"NC_FIREPLACE_STONE_02",1);
	Wld_SetObjectRoutine (05,00,"NC_FIREPLACE_STONE_02",0);
	
	Wld_SetObjectRoutine (00,00,"NC_FIREPLACE_GROUND",1);
	Wld_SetObjectRoutine (20,00,"NC_FIREPLACE_GROUND",1);
	Wld_SetObjectRoutine (05,00,"NC_FIREPLACE_GROUND",0);

	Wld_AssignRoomToGuild("NLHU25",GIL_MIL);	// Waypoint NC_HUT01 (SC-H?tte)
	Wld_AssignRoomToGuild("NLOBERM",GIL_PUBLIC);	// Lee's H?hle

	Wld_AssignRoomToGuild("NLHU26",GIL_MIL);	// Waypoint NC_HUT02
	Wld_AssignRoomToGuild("NLHU27",GIL_MIL);	// Waypoint NC_HUT03
	Wld_AssignRoomToGuild("NLHU31",GIL_MIL);	// Waypoint NC_HUT04
	Wld_AssignRoomToGuild("NLHU32",GIL_MIL);	// Waypoint NC_HUT05
	Wld_AssignRoomToGuild("NLHU23",GIL_MIL);	// Waypoint NC_HUT06
	Wld_AssignRoomToGuild("NLHU24",GIL_MIL);	// Waypoint NC_HUT07
	Wld_AssignRoomToGuild("NLHU30",GIL_MIL);	// Waypoint NC_HUT08
	Wld_AssignRoomToGuild("NLHU29",GIL_MIL);	// Waypoint NC_HUT09
	Wld_AssignRoomToGuild("NLHU28",GIL_MIL);	// Waypoint NC_HUT10

	Wld_AssignRoomToGuild("NLHU22",GIL_MIL);	// Waypoint NC_HUT11
	Wld_AssignRoomToGuild("NLHU03",GIL_MIL);	// Waypoint NC_HUT12
	Wld_AssignRoomToGuild("NLHU05",GIL_MIL);	// Waypoint NC_HUT13
	Wld_AssignRoomToGuild("NLHU06",GIL_MIL);	// Waypoint NC_HUT14
	Wld_AssignRoomToGuild("NLHU21",GIL_MIL);	// Waypoint NC_HUT15
	Wld_AssignRoomToGuild("NLHU20",GIL_MIL);	// Waypoint NC_HUT16
	Wld_AssignRoomToGuild("NLHU19",GIL_MIL);	// Waypoint NC_HUT17
	Wld_AssignRoomToGuild("NLHU18",GIL_MIL);	// Waypoint NC_HUT18
	Wld_AssignRoomToGuild("NLHU17",GIL_MIL);	// Waypoint NC_HUT19
	Wld_AssignRoomToGuild("NLHU16",GIL_MIL);	// Waypoint NC_HUT20
	Wld_AssignRoomToGuild("NLHU15",GIL_MIL);	// Waypoint NC_HUT21
	Wld_AssignRoomToGuild("NLHU14",GIL_PUBLIC);	// Waypoint NC_HUT22 (Lares' H?tte)
	Wld_AssignRoomToGuild("NLHU13",GIL_MIL);	// Waypoint NC_HUT23
	Wld_AssignRoomToGuild("NLHU12",GIL_MIL);	// Waypoint NC_HUT24
	Wld_AssignRoomToGuild("NLHU11",GIL_MIL);	// Waypoint NC_HUT25
	Wld_AssignRoomToGuild("NLHU10",GIL_MIL);	// Waypoint NC_HUT26
	Wld_AssignRoomToGuild("NLHU09",GIL_MIL);	// Waypoint NC_HUT27
	Wld_AssignRoomToGuild("NLHU08",GIL_MIL);	// Waypoint NC_HUT28
	Wld_AssignRoomToGuild("NLHU07",GIL_MIL);	// Waypoint NC_HUT29
	Wld_AssignRoomToGuild("NLHU04",GIL_MIL);	// Waypoint NC_HUT30
	Wld_AssignRoomToGuild("NLHU02",GIL_MIL);	// Waypoint NC_HUT31
	Wld_AssignRoomToGuild("NLHU01",GIL_MIL);	// Waypoint NC_HUT32

	Wld_AssignRoomToGuild("MAGE01",GIL_PUBLIC);	//NC_KDW01_IN
	Wld_AssignRoomToGuild("MAGE02",GIL_PUBLIC);	//Alchemielabor frei zug?nglich!
	Wld_AssignRoomToGuild("MAGE03",GIL_PUBLIC);	//NC_KDW05_IN
	Wld_AssignRoomToGuild("MAGE04",GIL_PUBLIC);	//Bibliothek frei zug?nglich!
	Wld_AssignRoomToGuild("MAGE05",GIL_PUBLIC);	//NC_KDW03_IN
	Wld_AssignRoomToGuild("MAGE06",GIL_PUBLIC);	//NC_KDW02_IN
	Wld_AssignRoomToGuild("MAGHO4",GIL_PUBLIC);	//Pentagrammh?hle frei zug?nglich
	
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
};

FUNC VOID STARTUP_MinentalFreeMineCamp ()
{	
	Wld_InsertNpc	(Mod_1550_SFB_Schuerfer_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1551_SFB_Schuerfer_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1568_SFB_Schuerfer_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1553_SFB_Schuerfer_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1554_SFB_Schuerfer_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1555_SFB_Schuerfer_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1556_SFB_Schuerfer_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1557_SFB_Schuerfer_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1558_SFB_Schuerfer_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1559_SFB_Schuerfer_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1560_SFB_Schuerfer_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1561_SFB_Schuerfer_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1562_SFB_Schuerfer_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1563_SFB_Schuerfer_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1564_SFB_Schuerfer_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1569_SLD_Soeldner_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1570_SLD_Soeldner_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1571_SLD_Soeldner_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1572_SLD_Soeldner_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1573_SLD_Soeldner_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1574_SLD_Soeldner_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1575_SLD_Soeldner_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1576_SLD_Soeldner_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1577_SLD_Soeldner_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1578_SLD_Soeldner_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1579_SLD_Soeldner_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1580_SLD_Soeldner_MT,	"FMC_ENTRANCE");
	Wld_InsertNpc	(Mod_1581_SLD_Soeldner_MT,	"FMC_ENTRANCE");	
};

FUNC VOID INIT_MinentalFreeMineCamp ()
{
/*	Wld_SetMobRoutine			(00,00, "FIREPLACE", 1);
	Wld_SetMobRoutine			(22,00, "FIREPLACE", 1);
	Wld_SetMobRoutine			(05,00, "FIREPLACE", 0);
*/
	Wld_AssignRoomToGuild("FMC01",GIL_MIL);     
	Wld_AssignRoomToGuild("FMC03",GIL_MIL); 
	Wld_AssignRoomToGuild("FMC04",GIL_MIL);
	Wld_AssignRoomToGuild("FMC05",GIL_MIL);
	Wld_AssignRoomToGuild("FMC06",GIL_MIL); 
	Wld_AssignRoomToGuild("FMC07",GIL_MIL);
	Wld_AssignRoomToGuild("FMC08",GIL_MIL);
	Wld_AssignRoomToGuild("FMC09",GIL_MIL);
	Wld_AssignRoomToGuild("FMC10",GIL_MIL);
	Wld_AssignRoomToGuild("FMC11",GIL_MIL);
	Wld_AssignRoomToGuild("FMC12",GIL_MIL);
	Wld_AssignRoomToGuild("FMC13",GIL_MIL);
	Wld_AssignRoomToGuild("FMC14",GIL_MIL);
	Wld_AssignRoomToGuild("FMC15",GIL_MIL);
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
};

FUNC VOID STARTUP_MinentalOldCamp ()
{
	Wld_InsertNpc	(Mod_943_GRD_Bloodwyn_MT,		"OC1");
	Wld_InsertNpc	(Mod_950_STT_Fisk_MT,			"OC1");
	Wld_InsertNpc	(Mod_954_STT_Huno_MT,			"OC1");
	Wld_InsertNpc	(Mod_962_STT_Scatty_MT,			"OC1");
	Wld_InsertNpc	(Mod_965_STT_Snaf_MT,			"OC1");
	Wld_InsertNpc	(Mod_801_STT_Sly_MT,			"OC1");
	Wld_InsertNpc	(Mod_802_STT_Herek_MT,			"OC1");
	Wld_InsertNpc	(Mod_803_STT_Mud_MT,			"OC1");
	Wld_InsertNpc	(Mod_966_GRD_Thorus_MT,			"OC1");
	Wld_InsertNpc	(Mod_1105_EBR_Arto_MT,			"OC1");
	Wld_InsertNpc	(Mod_1106_EBR_Bartholo_MT,		"OC1");
	Wld_InsertNpc	(Mod_1107_GRD_Jackal_MT,		"OC1");
	Wld_InsertNpc	(Mod_1108_GRD_Bullit_MT,		"OC1");
	//Wld_InsertNpc	(Mod_1109_GRD_Scorpio_MT,		"OC1");
	Wld_InsertNpc	(Mod_1110_GRD_Cutter_MT,		"OC1");
	Wld_InsertNpc	(Mod_1113_GRD_Fletcher_MT,		"OC1");
	Wld_InsertNpc	(Mod_1120_BDT_Ratford_MT,		"OC1");
	Wld_InsertNpc	(Mod_1121_BDT_Drax_MT,		"OC1");
	Wld_InsertNpc	(Mod_1124_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1125_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1126_GRD_Torwache_MT,	"OC1");
	Wld_InsertNpc	(Mod_1127_GRD_Torwache_MT,	"OC1");
	Wld_InsertNpc	(Mod_1128_GRD_Torwache_MT,	"OC1");
	Wld_InsertNpc	(Mod_1129_GRD_Torwache_MT,	"OC1");
	Wld_InsertNpc	(Mod_1130_GRD_Torwache_MT,	"OC1");
	Wld_InsertNpc	(Mod_1131_GRD_Torwache_MT,	"OC1");
	Wld_InsertNpc	(Mod_1132_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1135_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1136_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1137_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1138_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1139_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1140_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1141_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1142_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1143_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1145_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1146_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1147_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1153_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1156_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1157_GRD_Gardist_MT,	"OC1");
	Wld_InsertNpc	(Mod_1160_STT_Schatten_MT,	"OC1");
	Wld_InsertNpc	(Mod_1161_STT_Whistler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1162_STT_Schatten_MT,	"OC1");
	Wld_InsertNpc	(Mod_1163_STT_Schatten_MT,	"OC1");
	Wld_InsertNpc	(Mod_1164_STT_Schatten_MT,	"OC1");
	Wld_InsertNpc	(Mod_1165_STT_Schatten_MT,	"OC1");
	Wld_InsertNpc	(Mod_1166_STT_Schatten_MT,	"OC1");
	Wld_InsertNpc	(Mod_1167_STT_Schatten_MT,	"OC1");
	Wld_InsertNpc	(Mod_1168_STT_Schatten_MT,	"OC1");
	Wld_InsertNpc	(Mod_1169_STT_Schatten_MT,	"OC1");
	Wld_InsertNpc	(Mod_1170_STT_Schatten_MT,	"OC1");
	//Wld_InsertNpc	(Mod_1171_STT_Balam_MT,		"OC1");
	Wld_InsertNpc	(Mod_1172_STT_Omid_MT,		"OC1");
	Wld_InsertNpc	(Mod_1871_TPL_GorKaranto_MT,	"OC1");
	Wld_InsertNpc	(Mod_1173_STT_Fingers_MT,	"OC1");
	Wld_InsertNpc	(Mod_1426_BUD_Grim_MT,	"OC1");
	Wld_InsertNpc	(Mod_1427_BUD_Guy_MT,	"OC1");
	Wld_InsertNpc	(Mod_1428_BUD_Kyle_MT,	"OC1");
	Wld_InsertNpc	(Mod_1506_BUD_Jesse_MT,	"OC1");
	Wld_InsertNpc	(Mod_1430_BUD_Gravo_MT,	"OC1");
	Wld_InsertNpc	(Mod_1431_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1432_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1434_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1435_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1437_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1438_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1439_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1440_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1441_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1442_BUD_Costa_MT,	"OC1");
	Wld_InsertNpc	(Mod_1443_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1444_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1446_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1447_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1448_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1449_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1450_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1451_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1452_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1453_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1454_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1455_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1456_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1459_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1461_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1462_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1463_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1464_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1466_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1467_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1468_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1469_BUD_Graham_MT,	"OC1");
	Wld_InsertNpc	(Mod_1471_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1472_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1473_BUD_Buddler_MT,	"OC1");
	Wld_InsertNpc	(Mod_1622_EBR_Seraphia_MT,	"OC1");
	Wld_InsertNpc	(Mod_1624_GUR_Natalia_MT,	"OC1");
	Wld_InsertNpc	(Mod_1621_EBR_Velaya_MT,	"OC1");
	Wld_InsertNpc	(Mod_1870_EBR_Alissandro_MT,	"OC1");
	Wld_InsertNpc	(Mod_1872_NONE_Unbekannt_MT,	"OC1");
	Wld_InsertNpc	(Mod_7384_OUT_Dragan_MT,	"OC1");
	Wld_InsertNpc	(Charlotte,	"OC1");
	Wld_InsertNpc	(IEFan1,	"OC1");
	Wld_InsertNpc	(IEFan2,	"OC1");
	Wld_InsertNpc	(IEFan3,	"OC1");
	Wld_InsertNpc	(IEFan4,	"OC1");
	Wld_InsertNpc	(Mod_1902_STT_Ian_MT,	"OC1");
	Wld_InsertNpc	(Mod_4074_BDT_Bandit_MT,	"OC1");
	Wld_InsertNpc	(Mod_4072_BDT_Bandit_MT,	"OC1");
	Wld_InsertNpc	(Mod_4073_BDT_Bandit_MT,	"OC1");
	Wld_InsertNpc	(Mod_4075_BDT_Bandit_MT,	"OC1");
	
	// Waldl?uferlager

	Wld_InsertNpc	(Mod_7431_JG_Baldur_MT, "OC1");
	Wld_InsertNpc	(Mod_7432_JG_Sonor_MT, "OC1");
	Wld_InsertNpc	(Mod_7433_JG_Zelar_MT, "OC1");
};

FUNC VOID INIT_MinentalOldCamp ()
{
	Wld_SetMobRoutine			(00,00, "FIREPLACE", 1);
	Wld_SetMobRoutine			(22,00, "FIREPLACE", 1);
	Wld_SetMobRoutine			(05,00, "FIREPLACE", 0);
	//------------------------------------------
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_01",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_01",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_01",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_02",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_02",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_02",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_03",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_03",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_03",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_04",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_04",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_04",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_05",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_05",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_05",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_06",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_06",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_06",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_07",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_07",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_07",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_08",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_08",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_08",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH_09",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH_09",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH_09",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_01",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_01",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_01",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_02",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_02",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_02",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_03",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_03",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_03",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_04",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_04",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_04",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_05",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_05",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_05",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_06",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_06",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_06",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_07",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_07",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_07",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_08",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_08",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_08",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_09",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_09",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_09",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_10",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_10",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_10",0);
	
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_11",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_11",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_11",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_12",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_12",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_12",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_13",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_13",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_13",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_14",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_14",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_14",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_15",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_15",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_15",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_16",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_16",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_16",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_17",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_17",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_17",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_18",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_18",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_18",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_19",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_19",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_19",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_20",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_20",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_20",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_21",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_21",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_21",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_HIGH2_22",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_HIGH2_22",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_HIGH2_22",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_MIDDLE_01",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_MIDDLE_01",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_MIDDLE_01",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_MIDDLE_01",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_MIDDLE_01",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_MIDDLE_01",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_MIDDLE_02",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_MIDDLE_02",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_MIDDLE_02",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_MIDDLE_03",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_MIDDLE_03",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_MIDDLE_03",0);
	
	Wld_SetObjectRoutine (00,00,"OC_FIREPLACE_MIDDLE_04",1);
	Wld_SetObjectRoutine (20,00,"OC_FIREPLACE_MIDDLE_04",1);
	Wld_SetObjectRoutine (05,00,"OC_FIREPLACE_MIDDLE_04",0);

	Wld_AssignRoomToGuild("KI1",GIL_PUBLIC); 	// Portalraum KDF
	Wld_AssignRoomToGuild("HH8",GIL_PUBLIC);	// Portalraum EBR-Bedroom
	Wld_AssignRoomToGuild("HH5",GIL_PUBLIC);	// Portalraum EBR-Bedroom
	Wld_AssignRoomToGuild("HH4",GIL_PUBLIC);	// Portalraum EBR-Bedroom
	Wld_AssignRoomToGuild("HH7",GIL_PUBLIC);	// Portalraum EBR-Bedroom
	
	Wld_AssignRoomToGuild("ocgateb",GIL_OUT);	//Wachraum am Haupteingang
	Wld_AssignRoomToGuild("h?tte1",GIL_OUT); //Diegos H?tte
	Wld_AssignRoomToGuild("h?tte2",GIL_OUT); 
	Wld_AssignRoomToGuild("h?tte3",GIL_OUT); 
	Wld_AssignRoomToGuild("h?tte4",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte5",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte6",GIL_OUT); 
	Wld_AssignRoomToGuild("h?tte7",GIL_OUT); 
	Wld_AssignRoomToGuild("h?tte8",GIL_OUT); 
	Wld_AssignRoomToGuild("h?tte9",GIL_OUT); 
	Wld_AssignRoomToGuild("h?tte10",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte11",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte12",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte13",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte14",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte15",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte16",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte17",GIL_PUBLIC); //Durchgangsh?tte, wird nicht auf jedes Betreten ?berwacht
	Wld_AssignRoomToGuild("h?tte18",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte19",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte20",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte21",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte22",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte23",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte24",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte25",GIL_OUT);
	//Wld_AssignRoomToGuild("h?tte26",GIL_VLK); //PLAYER H?tte
	Wld_AssignRoomToGuild("h?tte27",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte28",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte29",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte30",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte31",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte32",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte33",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte34",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte35",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte36",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte37",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte38",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte39",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte40",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte41",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte42",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte43",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte44",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte45",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte46",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte47",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte48",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte49",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte50",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte51",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte52",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte53",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte54",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte55",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte56",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte57",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte58",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte59",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte60",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte61",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte62",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte63",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte64",GIL_PUBLIC); //Durchgangsh?tte, wird nicht auf jedes Betreten ?berwacht
	Wld_AssignRoomToGuild("h?tte65",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte66",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte67",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte68",GIL_PUBLIC); //Durchgangsh?tte, wird nicht auf jedes Betreten ?berwacht
	Wld_AssignRoomToGuild("h?tte69",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte70",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte71",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte72",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte73",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte74",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte75",GIL_OUT);
	Wld_AssignRoomToGuild("h?tte76",GIL_OUT);	//Grahams H?tte, abgesprochen mit Mike
	Wld_AssignRoomToGuild("h?tte77",GIL_OUT);

	Wld_AssignRoomToGuild("HHMH1", GIL_PUBLIC);	// Portalraum EBR-Bedroom

	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
};

FUNC VOID STARTUP_MinentalPsiCamp ()
{	
	//Novizen
	Wld_InsertNpc	(Mod_951_PSINOV_Fortuno_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_2008_PSINOV_Ghorim_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_2012_PSINOV_Talas_MT,	"NC_DAM2");	
	Wld_InsertNpc	(Mod_2013_PSINOV_Joru_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_2014_PSINOV_Darrion_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_3001_PSINOV_Balor_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1116_PSINOV_Caine_MT,	"PSI_START");
	//Wld_InsertNpc	(Mod_1119_PSINOV_Shrat_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1364_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1322_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1324_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1325_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1326_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1327_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1328_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1329_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1330_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1331_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1332_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1333_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1334_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1335_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1336_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1337_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1338_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1339_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1340_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1365_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1342_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1343_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1344_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1345_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1346_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1347_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1348_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1349_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1350_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1351_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1352_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1353_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1354_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1355_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1356_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1357_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1358_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1359_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1360_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1361_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1362_PSINOV_Novize_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1363_PSINOV_Novize_MT,	"PSI_START");

	//Gurus
	Wld_InsertNpc	(Mod_2003_GUR_BaalTondral_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_2004_GUR_BaalNamib_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_2005_GUR_CorCadar_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_2006_GUR_BaalTyon_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_2007_GUR_BaalOrun_MT,	"NC_DAM2");
	
	//Templer
	Wld_InsertNpc	(Mod_106_TPL_Angar_MT,		"NC_DAM2");	
	Wld_InsertNpc	(Mod_2009_TPL_GorNaRan_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_2010_TPL_GorNaToth_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_2011_TPL_GorNaDrak_MT,	"NC_DAM2");
	Wld_InsertNpc	(Mod_1210_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1211_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1212_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1213_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1214_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1215_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1216_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1217_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1218_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1219_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1220_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1221_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1222_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1223_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1224_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1225_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1226_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1227_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1228_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1229_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1230_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1231_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1232_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1233_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1286_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1235_TPL_Templer_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1873_TPL_GorNaKosh_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1924_TPL_GorNaMon_MT,	"PSI_START");
	Wld_InsertNpc	(Mod_1925_TPL_GorNaKar_MT,	"PSI_START");
};

FUNC VOID INIT_MinentalPsiCamp ()
{
	/**************************************************************
	**                STARTUP_LIGHTS IN PSICAMP                  **
	**************************************************************/
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_01",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_01",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_01",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_02",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_02",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_02",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_03",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_03",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_03",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_04",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_04",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_04",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_05",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_05",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_05",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_06",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_06",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_06",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_07",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_07",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_07",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_08",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_08",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_08",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_09",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_09",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_09",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_10",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_10",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_10",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_11",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_11",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_11",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_12",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_12",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_12",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_13",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_13",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_13",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_14",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_14",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_14",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_15",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_15",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_15",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_16",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_16",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_16",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_17",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_17",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_17",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_18",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_18",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_18",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_19",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_19",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_19",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_20",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_20",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_20",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_21",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_21",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_21",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_22",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_22",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_22",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_23",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_23",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_23",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_24",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_24",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_24",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_25",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_25",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_25",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_26",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_26",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_26",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_27",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_27",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_27",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_28",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_28",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_28",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_29",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_29",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_29",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_30",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_30",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_30",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_31",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_31",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_31",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_32",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_32",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_32",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_33",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_33",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_33",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_34",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_34",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_34",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_35",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_35",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_35",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_36",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_36",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_36",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_37",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_37",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_37",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_38",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_38",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_38",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_39",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_39",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_39",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_40",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_40",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_40",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_41",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_41",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_41",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_42",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_42",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_42",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_43",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_43",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_43",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_44",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_44",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_44",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_45",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_45",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_45",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_46",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_46",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_46",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_47",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_47",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_47",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_48",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_48",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_48",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_49",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_49",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_49",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_50",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_50",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_50",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_51",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_51",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_51",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_52",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_52",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_52",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_53",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_53",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_53",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_54",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_54",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_54",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_55",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_55",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_55",0);
	
	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_56",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_56",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_56",0);

	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_57",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_57",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_57",0);

	Wld_SetObjectRoutine (00,00,"PC_CRYSTALLIGHT_58",1);
	Wld_SetObjectRoutine (20,00,"PC_CRYSTALLIGHT_58",1);
	Wld_SetObjectRoutine (05,00,"PC_CRYSTALLIGHT_58",0);

	Wld_AssignRoomToGuild("PSIH01",GIL_PUBLIC); //OK				nlhu01 - nlhu32                
	Wld_AssignRoomToGuild("PSIH02",GIL_OUT); //defekt       
	Wld_AssignRoomToGuild("PSIH03",GIL_OUT); //defekt
	Wld_AssignRoomToGuild("PSIH04",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH05",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH06",GIL_OUT); //defekt
	Wld_AssignRoomToGuild("PSIH07",GIL_OUT); //defekt
	Wld_AssignRoomToGuild("PSIH08",GIL_OUT); //defekt
	Wld_AssignRoomToGuild("PSIH09",GIL_OUT); //defekt
	Wld_AssignRoomToGuild("PSIH10",GIL_OUT);//defekt
	Wld_AssignRoomToGuild("PSIH11",GIL_OUT);//defekt
	Wld_AssignRoomToGuild("PSIH12",GIL_OUT);//defekt
	Wld_AssignRoomToGuild("PSIH13",GIL_OUT);//defekt
	Wld_AssignRoomToGuild("PSIH14",GIL_OUT);//defekt
	Wld_AssignRoomToGuild("PSIH15",GIL_OUT);//defekt
	Wld_AssignRoomToGuild("PSIH16",GIL_OUT);//defekt
	Wld_AssignRoomToGuild("PSIH17",GIL_OUT);//defekt
	Wld_AssignRoomToGuild("PSIH18",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH19",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH20",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH21",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH22",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH23",GIL_OUT); //Harloks H?tte, Hut 31
	Wld_AssignRoomToGuild("PSIH24",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH25",GIL_PUBLIC); //Alchemielabor soll frei zug?nglich sein!
	Wld_AssignRoomToGuild("PSIH26",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH27",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH28",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH29",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH30",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH31",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH32",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH33",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH34",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH35",GIL_OUT);
	Wld_AssignRoomToGuild("PSIH36",GIL_OUT);

	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
};

FUNC VOID STARTUP_MinentalDemontower ()
{	
	
};

FUNC VOID INIT_MinentalDemontower ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
};

FUNC VOID STARTUP_MinentalSurface ()
{	
	// Banditen im Banditenlager

	Wld_InsertNpc	(Mod_964_BDT_Skinner_MT,	"OC1");
	Wld_InsertNpc	(Mod_761_BDT_Dexter_MT,		"OC1");
	Wld_InsertNpc	(Mod_790_BDT_Morgahard_MT,	"OC1");
	Wld_InsertNpc	(Mod_948_BDT_Esteban_MT,	"OC1");
	Wld_InsertNpc	(Mod_955_BDT_Juan_MT,		"OC1");
	Wld_InsertNpc	(Mod_957_BDT_Logan_MT,		"OC1");
	Wld_InsertNpc	(Mod_958_BDT_Miguel_MT,		"OC1");
	Wld_InsertNpc	(Mod_961_BDT_Sancho_MT,		"OC1");
	Wld_InsertNpc	(Mod_7022_BDT_Oschust_MT,	"OC1");
	Wld_InsertNpc	(Mod_7023_BDT_Quentin_MT,	"OC1");

	// Königliche Garde in ihrem Lager
	
	Wld_InsertNpc	(Mod_1011_KGD_Ole_MT,		"OC1");
	Wld_InsertNpc	(Mod_1012_KGD_Bernd_MT,		"OC1");
	Wld_InsertNpc	(Mod_1013_KGD_Hrungir_MT,	"OC1");
	Wld_InsertNpc	(Mod_1014_KGD_Leibwache_MT,	"OC1");
	Wld_InsertNpc	(Mod_1015_KGD_Leibwache_MT,	"OC1");
	Wld_InsertNpc	(Mod_1016_KGD_Hymir_MT,		"OC1");
	Wld_InsertNpc	(Mod_1017_KGD_Granmar_MT,	"OC1");
	Wld_InsertNpc	(Mod_1018_KGD_Berdin_MT,	"OC1");
	Wld_InsertNpc	(Mod_1019_KGD_Bamrad_MT,	"OC1");
	Wld_InsertNpc	(Mod_1020_KGD_Heidrek_MT,	"OC1");
	Wld_InsertNpc	(Mod_1021_KGD_Turmwache_MT,	"OC1");
	Wld_InsertNpc	(Mod_1022_KGD_Turmwache_MT,	"OC1");
	Wld_InsertNpc	(Mod_1023_KGD_Turmwache_MT,	"OC1");
	Wld_InsertNpc	(Mod_1024_KGD_Melcador_MT,	"OC1");
	Wld_InsertNpc	(Mod_1025_KGD_Cathran_MT,	"OC1");
	Wld_InsertNpc	(Mod_7536_KG_Jerry_MT,		"OC1");
	Wld_InsertNpc	(Mod_7537_KG_Minenwache_MT,	"OC1");

	// Ritter und Sträflinge in neuer Erzmine

	Wld_InsertNpc	(Mod_1731_RIT_Ritter_MT,	"OC1");
	Wld_InsertNpc	(Mod_1732_RIT_Ritter_MT,	"OC1");
	Wld_InsertNpc	(Mod_1733_STRF_Straefling_MT,	"OC1");
	Wld_InsertNpc	(Mod_1734_STRF_Straefling_MT,	"OC1");
	Wld_InsertNpc	(Mod_1735_STRF_Straefling_MT,	"OC1");
	Wld_InsertNpc	(Mod_1736_STRF_Straefling_MT,	"OC1");

	// Magier in Kloster

	Wld_InsertNpc	(Mod_1627_VMG_Ken_MT,	"OC1");
	Wld_InsertNpc	(Mod_1628_VMG_Anor_MT,	"OC1");
	Wld_InsertNpc	(Mod_1630_VMG_Ferco_MT,	"OC1");
	Wld_InsertNpc	(Mod_1625_VMG_Neol_MT,	"OC1");
	Wld_InsertNpc	(Mod_1626_VMG_Furt_MT,	"OC1");
	Wld_InsertNpc	(Mod_1955_VMG_Turendil_MT, "OC1");
	Wld_InsertNpc	(Mod_1956_VMK_Struk_MT, "OC1");
	Wld_InsertNpc	(Mod_1957_VMG_Thorge_MT, "OC1");
	Wld_InsertNpc	(Mod_1958_VMG_Albert_MT, "OC1");
	Wld_InsertNpc	(Mod_4019_VMG_Faice_MT,	"OC1");
	Wld_InsertNpc	(Mod_4020_VMG_Hermy_MT,	"OC1");
	
	// Jäger

	Wld_InsertNpc	(Mod_1963_JG_Torgan_MT, "OC1");
	Wld_InsertNpc	(Mod_1964_JG_Jaeger_MT, "OC1");
	Wld_InsertNpc	(Mod_1965_JG_Jaeger_MT, "OC1");
	Wld_InsertNpc	(Mod_7469_OUT_Turmwache_MT, "OC1");

	// Orks in Felsenfestung

	Wld_InsertNpc	(Mod_10000_Orc_Tarrok_MT,	"OC1");
	Wld_InsertNpc	(Mod_10001_Orc_UrShak_MT,	"OC1");
	Wld_InsertNpc	(Mod_10006_Orc_Ranad_MT,	"OC1");
	Wld_InsertNpc	(Mod_4021_Orc_Gobshak_MT,	"OC1");
	Wld_InsertNpc	(Mod_4022_Orc_Grubuz_MT,	"OC1");

	// Mensch in Stollen in Felsenfestung

	Wld_InsertNpc	(Mod_4025_NONE_Emerin_MT,	"OC1");

	// Orks in Orkstadt

	//Wld_InsertNpc	(Mod_10002_Orc_HoshPak_MT,	"OC1");
	Wld_InsertNpc	(Mod_10003_Orc_Masshak_MT,	"OC1");
	Wld_InsertNpc	(Mod_10004_Orc_Ashrak_MT,	"OC1");

	// Bergfestung der Beliar-Anhänger

	Wld_InsertNpc	(Mod_1027_SMK_Eduard_MT,	"OC1");
	Wld_InsertNpc	(Mod_1029_SMK_Fahim_MT,	"OC1");
	Wld_InsertNpc	(Mod_518_SMK_Scar_MT,	"OC1");
	Wld_InsertNpc	(Mod_515_KDS_Myxir_MT,	"OC1");
	Wld_InsertNpc	(Mod_7504_KDS_Torran_MT,	"OC1");
	Wld_InsertNpc	(Mod_7503_KDS_Hinax_MT,	"OC1");
	Wld_InsertNpc	(Mod_7501_DMB_Netux_MT,	"OC1");
	Wld_InsertNpc	(Mod_473_DMB_Andokai_MT,	"OC1");
	Wld_InsertNpc	(Mod_7500_DMB_Olof_MT,	"OC1");
	Wld_InsertNpc	(Mod_514_DMB_Karras_MT,	"OC1");
	Wld_InsertNpc	(Mod_520_DMR_Raven_MT,	"OC1");
	Wld_InsertNpc	(Mod_517_DMR_Gomez_MT,	"OC1");
	Wld_InsertNpc	(Mod_1518_SNOV_Novize_MT,	"OC1");
	Wld_InsertNpc	(Mod_1515_SNOV_Novize_MT,	"OC1");
	Wld_InsertNpc	(Mod_1519_SNOV_Novize_MT,	"OC1");
	Wld_InsertNpc	(Mod_1514_SNOV_Novize_MT,	"OC1");
	Wld_InsertNpc	(Mod_1517_SNOV_Novize_MT,	"OC1");
	Wld_InsertNpc	(Mod_1030_SNOV_Abdi_MT,	"OC1");
	Wld_InsertNpc	(Mod_7358_DMR_Daemonenritter_MT, "OC1");
	Wld_InsertNpc	(Mod_7784_SNOV_Novize_MT, "OC1");

	// Monster in Stollen in Felsenfestung

	Wld_InsertNpc	(DungeonHarpie, "FP_ROAM_DUNGEONHARPY_STOLLEN_01");
	Wld_InsertNpc	(DungeonHarpie, "FP_ROAM_DUNGEONHARPY_STOLLEN_02");
	Wld_InsertNpc	(DungeonHarpie, "FP_ROAM_DUNGEONHARPY_STOLLEN_03");
	Wld_InsertNpc	(DungeonHarpie, "FP_ROAM_DUNGEONHARPY_STOLLEN_04");
	Wld_InsertNpc	(DungeonHarpie, "FP_ROAM_DUNGEONHARPY_STOLLEN_05");
	Wld_InsertNpc	(DungeonHarpie, "FP_ROAM_DUNGEONHARPY_STOLLEN_06");
	Wld_InsertNpc	(DungeonHarpie, "FP_ROAM_DUNGEONHARPY_STOLLEN_07");
	Wld_InsertNpc	(DungeonHarpie, "FP_ROAM_DUNGEONHARPY_STOLLEN_08");
	Wld_InsertNpc	(DungeonHarpie, "FP_ROAM_DUNGEONHARPY_STOLLEN_09");
	Wld_InsertNpc	(DungeonHarpie, "FP_ROAM_DUNGEONHARPY_STOLLEN_10");
	Wld_InsertNpc	(DungeonHarpie, "FP_ROAM_DUNGEONHARPY_STOLLEN_11");
	Wld_InsertNpc	(DungeonHarpie, "FP_ROAM_DUNGEONHARPY_STOLLEN_12");
	Wld_InsertNpc	(DungeonHarpie, "FP_ROAM_DUNGEONHARPY_STOLLEN_13");

	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_01");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_02");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_03");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_04");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_05");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_06");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_07");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_08");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_09");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_10");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_11");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_12");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_13");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_14");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_15");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_16");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_17");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_18");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_19");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_20");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_21");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_22");
	Wld_InsertNpc	(ZombieRandom, "FP_ROAM_ZOMBIE_STOLLEN_23");

	// Monster - All in One ?ugly

	// Austauschstelle bis Ratford und Drax

	Wld_InsertNpc	(Meatbug,	"SPAWN_OW_MEATBUG_01_01");
	Wld_InsertNpc	(Meatbug,	"SPAWN_OW_MEATBUG_01_01");

	Wld_InsertNpc	(Meatbug,	"OW_PATH_1_16");
	Wld_InsertNpc	(Meatbug,	"OW_PATH_1_16");
	Wld_InsertNpc	(Meatbug,	"OW_PATH_1_17");
	Wld_InsertNpc	(Meatbug,	"OW_PATH_1_16");

	Wld_InsertNpc	(Molerat,	"SPAWN_MOLERAT02_SPAWN01");
	Wld_InsertNpc	(Molerat,	"SPAWN_MOLERAT02_SPAWN01");

	Wld_InsertNpc	(Scavenger,	"FP_ROAM_TOTURIAL_CHICKEN_2_2");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_TOTURIAL_CHICKEN_2");

	Wld_InsertNpc	(Scavenger,	"OW_PATH_1_5_4");
	Wld_InsertNpc	(Scavenger,	"OW_PATH_1_5_4");

	// Ratford und Drax bis Wald

	Wld_InsertNpc	(Lurker,	"FP_ROAM_OW_RIVER_BLOODFLY_01");

	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_STARTSCAVNGERBO_01_02");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_STARTSCAVNGERBO_01_02");

	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_STARTSCAVENGER_02_01");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_STARTSCAVENGER_02_01");

	Wld_InsertNpc	(Scavenger,	"FP_ROAM_OW_SCAVENGER_01_05");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_OW_SCAVENGER_01_06");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_OW_SCAVENGER_01_07");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_OW_SCAVENGER_01_04");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_OW_SCAVENGER_01_01");
	Wld_InsertNpc	(Scavenger,	"FP_SLEEP_OW_SCAVENGER_01_01");

	// Trollschlucht

	Wld_InsertNpc	(Snapper,	"WP_MT_OSCHUST_WAITINGFORESTEBANUNDCO");
	Wld_InsertNpc	(Snapper,	"WP_MT_OSCHUST_WAITINGFORESTEBANUNDCO");
	Wld_InsertNpc	(Snapper,	"WP_MT_OSCHUST_WAITINGFORESTEBANUNDCO");

	Wld_InsertNpc	(Snapper,	"SPAWN_OW_SCA_01_BADITS2");
	Wld_InsertNpc	(Snapper,	"SPAWN_OW_SCA_01_BADITS2");

	Wld_InsertNpc	(Snapper,	"SPAWN_OW_SCA_01_BADITS7");
	Wld_InsertNpc	(Snapper,	"SPAWN_OW_SCA_01_BADITS7");

	Wld_InsertNpc	(Snapper,	"SPAWN_OW_WARAN_01_BADITS6");
	Wld_InsertNpc	(Snapper,	"SPAWN_OW_WARAN_01_BADITS6");

	Wld_InsertNpc	(Snapper,	"OW_PATH_190");
	Wld_InsertNpc	(Snapper,	"OW_PATH_190");

	Wld_InsertNpc	(Gobbo_Black,	"LOCATION_12_01");
	Wld_InsertNpc	(Gobbo_Black,	"LOCATION_12_01");
	Wld_InsertNpc	(Gobbo_Black,	"LOCATION_12_01");
	Wld_InsertNpc	(Gobbo_Black,	"LOCATION_12_01");

	Wld_InsertNpc	(Troll,	"LOCATION_12_14");

	Wld_InsertNpc	(Gobbo_Black,	"LOCATION_12_14");
	Wld_InsertNpc	(Gobbo_Black,	"LOCATION_12_14");
	Wld_InsertNpc	(Gobbo_Black,	"LOCATION_12_14");
	Wld_InsertNpc	(Gobbo_Black,	"LOCATION_12_14");

	Wld_InsertNpc	(Gobbo_Black,	"SPAWN_BLACKGOBBO_SHRINKSCROLL");
	Wld_InsertNpc	(Gobbo_Black,	"SPAWN_BLACKGOBBO_SHRINKSCROLL");
	Wld_InsertNpc	(Gobbo_Black,	"SPAWN_BLACKGOBBO_SHRINKSCROLL");
	Wld_InsertNpc	(Gobbo_Black,	"SPAWN_BLACKGOBBO_SHRINKSCROLL");

	Wld_InsertNpc	(Harpie,	"LOCATION_12_09");
	Wld_InsertNpc	(Harpie,	"LOCATION_12_09");
	Wld_InsertNpc	(Harpie,	"LOCATION_12_09");
	Wld_InsertNpc	(Harpie,	"LOCATION_12_09");

	// Wald richtung Alte Mine

	Wld_InsertNpc	(Molerat,	"OW_PATH_WOLF08_SPAWN01");
	Wld_InsertNpc	(Molerat,	"OW_PATH_WOLF08_SPAWN01");

	Wld_InsertNpc	(Molerat,	"WP_ORKPATROULLIE");
	Wld_InsertNpc	(Molerat,	"WP_ORKPATROULLIE");

	Wld_InsertNpc	(Wolf,	"SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_SCAVENGER_WOOD10_04");

	Wld_InsertNpc	(Shadowbeast,	"WP_ORKBEIAMULETT");

	Wld_InsertNpc	(Keiler,	"SPAWN_OW_MOLERATS_WOOD_OM");
	Wld_InsertNpc	(Keiler,	"SPAWN_OW_MOLERATS_WOOD_OM");
	Wld_InsertNpc	(Keiler,	"SPAWN_OW_MOLERATS_WOOD_OM");

	Wld_InsertNpc	(Wisp,	"SPAWN_OW_MOLERAT_WOODOLDMINE2");

	Wld_InsertNpc	(Wolf,	"SPAWN_OW_BLOODFLY_WOOD05_01");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_BLOODFLY_WOOD05_01");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_BLOODFLY_WOOD05_01");

	Wld_InsertNpc	(Wolf,	"SPAWN_OW_WOLF_WOOD05_02");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_WOLF_WOOD05_02");

	Wld_InsertNpc	(Molerat,	"SPAWN_OW_MOLERAT_OCWOOD_OLDMINE3");
	Wld_InsertNpc	(Molerat,	"SPAWN_OW_MOLERAT_OCWOOD_OLDMINE3");

	Wld_InsertNpc	(Keiler,	"SPAWN_OW_SCAVENGER_OLDWOOD_C3");
	Wld_InsertNpc	(Keiler,	"SPAWN_OW_SCAVENGER_OLDWOOD_C3");

	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_MOLERAT_OCWOOD_OC2");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_MOLERAT_OCWOOD_OC2");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_MOLERAT_OCWOOD_OC2");

	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_OCWOOD1");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_OCWOOD1");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_OCWOOD1");

	Wld_InsertNpc	(Wisp,	"SPAWN_OW_MOLERAT_OLDWOOD1_M");

	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCA_05_01");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCA_05_01");

	Wld_InsertNpc	(Bloodfly,	"SPAWN_OW_BLOODFLY_06_01");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_OW_BLOODFLY_06_01");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_OW_BLOODFLY_06_01");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_OW_BLOODFLY_06_01");

	Wld_InsertNpc	(Lurker,	"FP_ROAM_OW_RIVER_LURKER_02");

	// Alte Mine zu Neues Lager

	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_OCWOODEND2");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_OCWOODEND2");

	Wld_InsertNpc	(Bloodfly,	"SPAWN_OW_BLOODFLY_C3");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_OW_BLOODFLY_C3");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_OW_BLOODFLY_C3");

	Wld_InsertNpc	(Bloodfly,	"SPAWN_OW_GOBBO_WATERFALLCAVE_2");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_OW_GOBBO_WATERFALLCAVE_2");

	Wld_InsertNpc	(Scavenger,	"OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc	(Scavenger,	"OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc	(Scavenger,	"OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc	(Scavenger_Demon,	"OW_PATH_SCAVENGER12_SPAWN01");

	Wld_InsertNpc	(Molerat,	"SPAWN_OW_MOLERAT_A_6_NC4");
	Wld_InsertNpc	(Molerat,	"SPAWN_OW_MOLERAT_A_6_NC4");

	Wld_InsertNpc	(Molerat,	"FP_ROAM_NEW_390");
	Wld_InsertNpc	(Molerat,	"FP_ROAM_NEW_388");

	Wld_InsertNpc	(Bloodfly,	"SPAWN_OW_BLOODFLYS_152");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_OW_BLOODFLYS_152");
	Wld_InsertNpc	(Bloodfly,	"MOVEMENT_OW_BLOODFLYS_152");

	Wld_InsertNpc	(Scavenger,	"OW_PATH_SCAVENGER13_SPAWN01");
	Wld_InsertNpc	(Scavenger,	"OW_PATH_SCAVENGER13_SPAWN01");
	Wld_InsertNpc	(Scavenger,	"OW_PATH_SCAVENGER13_SPAWN01");
	Wld_InsertNpc	(Scavenger_Demon,	"OW_PATH_SCAVENGER13_SPAWN01");

	// Am Strand beim Wasserfall in der N?he des NL

	Wld_InsertNpc	(Waran,	"SPAWN_OW_NEARBGOBBO_LURKER_A1");
	Wld_InsertNpc	(Waran,	"SPAWN_OW_NEARBGOBBO_LURKER_A1");
	Wld_InsertNpc	(Waran,	"SPAWN_OW_NEARBGOBBO_LURKER_A1");

	Wld_InsertNpc	(Waran,	"SPAWN_OW_WARAN_CAVE1_1");

	Wld_InsertNpc	(FireWaran,	"SPAWN_OW_BLACKGOBBO_A1");

	Wld_InsertNpc	(Waran,	"SPAWN_OW_BLACKGOBBO_A2");
	Wld_InsertNpc	(Waran,	"SPAWN_OW_BLACKGOBBO_A2");

	// Gebiet vor NL - H?tte usw.

	Wld_InsertNpc	(Bloodfly,	"OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc	(Bloodfly,	"OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc	(Bloodfly,	"OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc	(Bloodfly,	"OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc	(Bloodfly,	"OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc	(Bloodfly,	"OW_BLOODFLY_NEW_COAST_SPAWN");

	Wld_InsertNpc	(Scavenger,	"FP_ROAM_OW_SCAVENGER_09_01");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_OW_SCAVENGER_09_01");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_OW_SCAVENGER_09_01");

	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_WARAN_NC_03");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_WARAN_NC_03");

	Wld_InsertNpc	(Molerat,	"SPAWN_OW_MOLERAT_03_04");
	Wld_InsertNpc	(Molerat,	"SPAWN_OW_MOLERAT_03_04");

	// Weg NL zu Stonehenge

	Wld_InsertNpc	(Snapper,	"OW_PATH_07_15");
	Wld_InsertNpc	(Snapper,	"OW_PATH_07_15");
	Wld_InsertNpc	(Snapper,	"OW_PATH_07_15");

	Wld_InsertNpc	(Bloodhound,	"OW_PATH_07_15_CAVE3");

	// Stonehenge-Area

	Wld_InsertNpc	(Bloodhound,	"OW_PATH_274_RIGHT3");

	Wld_InsertNpc	(Shadowbeast_Skeleton,	"OW_PATH_033_TO_CAVE5");

	Wld_InsertNpc	(Dragonsnapper,	"SPAWN_OW_SHADOWBEAST_10_03");
	Wld_InsertNpc	(Dragonsnapper,	"SPAWN_OW_SHADOWBEAST_10_03");
	Wld_InsertNpc	(Dragonsnapper,	"SPAWN_OW_SHADOWBEAST_10_03");

	Wld_InsertNpc	(Dragonsnapper,	"SPAWN_OW_WOLF_NEAR_SHADOW3");
	Wld_InsertNpc	(Dragonsnapper,	"SPAWN_OW_WOLF_NEAR_SHADOW3");

	Wld_InsertNpc	(Dragonsnapper,	"SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
	Wld_InsertNpc	(Dragonsnapper,	"SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
	Wld_InsertNpc	(Dragonsnapper,	"SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");

	// Stonehenge Richtung Cavalorns H?tte

	Wld_InsertNpc	(Razor,	"OW_DEADWOOD_WOLF_SPAWN01");
	Wld_InsertNpc	(Razor,	"OW_DEADWOOD_WOLF_SPAWN01");
	Wld_InsertNpc	(Razor,	"OW_DEADWOOD_WOLF_SPAWN01");

	Wld_InsertNpc	(Razor,	"OW_PATH_WARAN06_SPAWN01");
	Wld_InsertNpc	(Razor,	"OW_PATH_WARAN06_SPAWN01");
	Wld_InsertNpc	(Razor,	"OW_PATH_WARAN06_SPAWN01");

	Wld_InsertNpc	(Bloodfly,	"OW_LAKE_NC_BLOODFLY_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_LAKE_NC_BLOODFLY_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_LAKE_NC_BLOODFLY_SPAWN01");

	Wld_InsertNpc	(Lurker,	"OW_LAKE_NC_LURKER_SPAWN01");
	Wld_InsertNpc	(Lurker,	"OW_LAKE_NC_LURKER_SPAWN01");

	// Orkgebiet

	// NL zu Cavalorn (ab der kleinen Br?cke)

	Wld_InsertNpc	(Gobbo_Green,	"OW_PATH_056");
	Wld_InsertNpc	(Gobbo_Green,	"OW_PATH_056");

	Wld_InsertNpc	(Gobbo_Green,	"OW_GOBBO_PLACE_SPAWN");
	Wld_InsertNpc	(Gobbo_Green,	"OW_GOBBO_PLACE_SPAWN");
	Wld_InsertNpc	(Gobbo_Green,	"OW_GOBBO_PLACE_SPAWN");
	Wld_InsertNpc	(Gobbo_Warrior,	"OW_GOBBO_PLACE_SPAWN");

	Wld_InsertNpc	(Scavenger,	"OW_WOODRUIN_FOR_WOLF_SPAWN");
	Wld_InsertNpc	(Scavenger,	"OW_WOODRUIN_FOR_WOLF_SPAWN");

	Wld_InsertNpc	(Scavenger,	"OW_SCAVENGER_CAVE3_SPAWN");
	Wld_InsertNpc	(Scavenger,	"OW_SCAVENGER_CAVE3_SPAWN");
	Wld_InsertNpc	(Scavenger_Demon,	"OW_SCAVENGER_CAVE3_SPAWN");

	Wld_InsertNpc	(Scavenger,	"OW_SCAVENGER_TREE_SPAWN");
	Wld_InsertNpc	(Scavenger,	"OW_SCAVENGER_TREE_SPAWN");

	Wld_InsertNpc	(Molerat,	"OW_MOLERAT_CAVE_SPAWN");
	Wld_InsertNpc	(Molerat,	"OW_MOLERAT_CAVE_SPAWN");
	Wld_InsertNpc	(Molerat,	"OW_MOLERAT_CAVE_SPAWN");
	Wld_InsertNpc	(Molerat,	"OW_MOLERAT_CAVE_SPAWN");

	// Cavalorns H?tte

	Wld_InsertNpc	(Meatbug,	"OW_SAWHUT_GREENGOBBO_SPAWN");
	Wld_InsertNpc	(Meatbug,	"OW_SAWHUT_GREENGOBBO_SPAWN");
	Wld_InsertNpc	(Meatbug,	"OW_SAWHUT_GREENGOBBO_SPAWN");
	Wld_InsertNpc	(Meatbug,	"OW_SAWHUT_GREENGOBBO_SPAWN");

	Wld_InsertNpc	(Molerat,	"OW_SAWHUT_MOLERAT_MOVEMENT");
	Wld_InsertNpc	(Molerat,	"OW_SAWHUT_MOLERAT_MOVEMENT");

	Wld_InsertNpc	(Scavenger,	"OW_SCAVENGER_AL_NL_SPAWN");
	Wld_InsertNpc	(Scavenger,	"OW_SCAVENGER_AL_NL_SPAWN");

	// Cavalorn zu Orkarena

	Wld_InsertNpc	(Bloodhound,	"OW_CAVE2_SNAPPER_MOVEMENT2");

	Wld_InsertNpc	(Razor,	"OW_CAVE2_SNAPPER_SPAWN");
	Wld_InsertNpc	(Razor,	"OW_CAVE2_SNAPPER_SPAWN");

	Wld_InsertNpc	(Alligator,	"SPAWN_OW_LURKER_BEACH_02");
	Wld_InsertNpc	(Alligator,	"SPAWN_OW_LURKER_BEACH_02");
	Wld_InsertNpc	(Alligator,	"SPAWN_OW_LURKER_BEACH_02");

	Wld_InsertNpc	(Alligator,	"SPAWN_OW_FIREWARAN_BEACH_01");
	Wld_InsertNpc	(Alligator,	"SPAWN_OW_FIREWARAN_BEACH_01");
	Wld_InsertNpc	(Alligator,	"SPAWN_OW_FIREWARAN_BEACH_01");

	// Um das alte Lager herum (kein Wald, nur Wiesenbereich)

	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_AL_ORC");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_AL_ORC");

	Wld_InsertNpc	(Molerat,	"MOVEMENT_MOLERAT_06_CAVE_GUARD3");
	Wld_InsertNpc	(Molerat,	"MOVEMENT_MOLERAT_06_CAVE_GUARD3");

	Wld_InsertNpc	(Molerat,	"SPAWN_OW_MOLERAT_06_CAVE_GUARD3");
	Wld_InsertNpc	(Molerat,	"SPAWN_OW_MOLERAT_06_CAVE_GUARD3");

	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_06_04");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_06_04");

	Wld_InsertNpc	(Molerat,	"SPAWN_OW_SMALLCAVE01_MOLERAT");
	Wld_InsertNpc	(Molerat,	"SPAWN_OW_SMALLCAVE01_MOLERAT");

	Wld_InsertNpc	(Meatbug,	"FP_ROAM_NEW_108");
	Wld_InsertNpc	(Meatbug,	"FP_ROAM_NEW_108");
	Wld_InsertNpc	(Meatbug,	"FP_ROAM_NEW_108");
	Wld_InsertNpc	(Meatbug,	"FP_ROAM_NEW_108");

	Wld_InsertNpc	(Molerat,	"LOCATION_15_IN_2");
	Wld_InsertNpc	(Molerat,	"LOCATION_15_IN_2");

	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");

	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_WARAN_OC_PSI3");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_WARAN_OC_PSI3");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_WARAN_OC_PSI3");

	Wld_InsertNpc	(Scavenger,	"SPAWN_O_SCAVENGER_OCWOODL2");
	Wld_InsertNpc	(Scavenger,	"SPAWN_O_SCAVENGER_OCWOODL2");

	Wld_InsertNpc	(Bloodfly,	"OW_PATH_OW_PATH_WARAN05_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_OW_PATH_WARAN05_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_OW_PATH_WARAN05_SPAWN01");

	Wld_InsertNpc	(Waran,	"FP_ROAM_NEW_53");
	Wld_InsertNpc	(Waran,	"FP_ROAM_NEW_53");
	Wld_InsertNpc	(Waran,	"FP_ROAM_NEW_53");

	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_OW_BLOODFLY_OC_WOOD03");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_OW_BLOODFLY_OC_WOOD03");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_OW_BLOODFLY_OC_WOOD03");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_OW_BLOODFLY_OC_WOOD03");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_OW_BLOODFLY_OC_WOOD03");

	Wld_InsertNpc	(Scavenger,	"OW_SCAVENGER_SPAWN_TREE");
	Wld_InsertNpc	(Scavenger,	"OW_SCAVENGER_SPAWN_TREE");

	Wld_InsertNpc	(Scavenger,	"OC_ROUND_20");
	Wld_InsertNpc	(Scavenger,	"OC_ROUND_20");
	Wld_InsertNpc	(Scavenger_Demon,	"OC_ROUND_20");

	Wld_InsertNpc	(Meatbug,	"SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc	(Meatbug,	"SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc	(Meatbug,	"SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc	(Meatbug,	"SPAWN_OW_MOLERAT_CAVE1_OC");

	// Insel zwischen AL und Austauschstelle

	Wld_InsertNpc	(Bloodfly,	"SPAWN_OW_BLOODFLY_E_3");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_OW_BLOODFLY_E_3");

	Wld_InsertNpc	(Bloodfly,	"OW_PATH_WARAN05_SPAWN02");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_WARAN05_SPAWN02");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_WARAN05_SPAWN02");

	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY01_SPAWN01");

	Wld_InsertNpc	(Lurker,	"SPAWN_OW_LURKER_RIVER2_BEACH3");
	Wld_InsertNpc	(Lurker,	"SPAWN_OW_LURKER_RIVER2_BEACH3");
	Wld_InsertNpc	(Lurker,	"SPAWN_OW_LURKER_RIVER2_BEACH3");

	Wld_InsertNpc	(Lurker,	"SPAWN_OW_LURKER_RIVER2_BEACH3_2");
	Wld_InsertNpc	(Lurker,	"SPAWN_OW_LURKER_RIVER2_BEACH3_2");

	// Am Fluss bei AL nach Molerath?hle in der N?he von Cavalorn

	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_BANDIT_02");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_BANDIT_02");

	Wld_InsertNpc	(Lurker,	"SPAWN_OW_BLOODFLY_12");
	Wld_InsertNpc	(Lurker,	"SPAWN_OW_BLOODFLY_12");

	// Kastell

	// Bergfestung

	// Weg Kastell -> Bergfestung

	Wld_InsertNpc	(Bloodhound,	"PLATEAU_ROUND03");
	Wld_InsertNpc	(Bloodhound,	"PLATEAU_ROUND03");

	Wld_InsertNpc	(Bloodhound,	"PLATEAU_ROUND02_CAVE");
	Wld_InsertNpc	(Bloodhound,	"PLATEAU_ROUND02_CAVE");

	Wld_InsertNpc	(Bloodhound,	"PLATEAU_ROUND02_CAVE_MOVE");

	Wld_InsertNpc	(Bloodhound,	"PLATEAU_ROUND01");

	Wld_InsertNpc	(Bloodhound,	"PATH_TO_PLATEAU04_BRIDGE");
	Wld_InsertNpc	(Bloodhound,	"PATH_TO_PLATEAU04_BRIDGE");

	Wld_InsertNpc	(Bloodhound,	"PATH_TO_PLATEAU04_RIGHT");
	Wld_InsertNpc	(Bloodhound,	"PATH_TO_PLATEAU04_RIGHT");

	// Wiese Bergfestung <-> Orkfriedhof

	Wld_InsertNpc	(Snapper,	"SPAWN_OW_WARAN_EBENE_02_05");
	Wld_InsertNpc	(Snapper,	"SPAWN_OW_WARAN_EBENE_02_05");
	Wld_InsertNpc	(Snapper,	"SPAWN_OW_WARAN_EBENE_02_05");
	Wld_InsertNpc	(Snapper,	"SPAWN_OW_WARAN_EBENE_02_05");

	Wld_InsertNpc	(Snapper,	"SPAWN_OW_WARAN_EBENE2_02_05");
	Wld_InsertNpc	(Snapper,	"SPAWN_OW_WARAN_EBENE2_02_05");

	Wld_InsertNpc	(Snapper,	"PATH_TO_PLATEAU01");
	Wld_InsertNpc	(Snapper,	"PATH_TO_PLATEAU01");
	Wld_InsertNpc	(Snapper,	"PATH_TO_PLATEAU01");

	// Orkfriedhof-Vorplatz

	Wld_InsertNpc	(Orcbiter,	"OW_PATH_198_ORCGRAVEYARD4");
	Wld_InsertNpc	(Orcbiter,	"OW_PATH_198_ORCGRAVEYARD4");
	Wld_InsertNpc	(Orcbiter,	"OW_PATH_198_ORCGRAVEYARD4");

	Wld_InsertNpc	(Orcbiter,	"OW_PATH_198_ORCGRAVEYARD6");
	Wld_InsertNpc	(Orcbiter,	"OW_PATH_198_ORCGRAVEYARD6");
	Wld_InsertNpc	(Orcbiter,	"OW_PATH_198_ORCGRAVEYARD6");
	Wld_InsertNpc	(Orcbiter,	"OW_PATH_198_ORCGRAVEYARD6");

	Wld_InsertNpc	(Orcbiter,	"OW_PATH_198_ORCGRAVEYARD8");
	Wld_InsertNpc	(Orcbiter,	"OW_PATH_198_ORCGRAVEYARD8");

	// Strand vor Gobbo-H?hle

	Wld_InsertNpc	(Waran,	"MOVEMENT_OW_WARAN_OC_PSI_GOBBOCAVE_01");
	Wld_InsertNpc	(Waran,	"MOVEMENT_OW_WARAN_OC_PSI_GOBBOCAVE_01");
	Wld_InsertNpc	(Waran,	"MOVEMENT_OW_WARAN_OC_PSI_GOBBOCAVE_01");

	Wld_InsertNpc	(Waran,	"LOCATION_29_02");
	Wld_InsertNpc	(Waran,	"LOCATION_29_02");
	Wld_InsertNpc	(Waran,	"LOCATION_29_02");

	// Gobbo-H?hle

	Wld_InsertNpc	(Gobbo_Skeleton,	"MOVEMENT_GOBBO_LOCATION_29_01");
	Wld_InsertNpc	(Gobbo_Skeleton,	"MOVEMENT_GOBBO_LOCATION_29_01");
	Wld_InsertNpc	(Gobbo_Skeleton,	"GOBBO_MASTERCAVE4");
	Wld_InsertNpc	(Gobbo_Skeleton,	"GOBBO_MASTERCAVE5");
	Wld_InsertNpc	(Gobbo_Skeleton,	"GOBBO_MASTERCAVE8");
	Wld_InsertNpc	(Gobbo_Skeleton,	"GOBBO_MASTERCAVE8");
	Wld_InsertNpc	(Gobbo_Skeleton,	"SPAWN_OW_GOBBO_CAVE03INDOOR_05");
	Wld_InsertNpc	(Gobbo_Skeleton,	"SPAWN_OW_GOBBO_CAVE03INDOOR_05");
	Wld_InsertNpc	(Gobbo_Skeleton,	"GOBBO_MASTERCAVE9");
	Wld_InsertNpc	(Gobbo_Skeleton,	"GOBBO_MASTERCAVE10");
	Wld_InsertNpc	(Gobbo_Skeleton,	"GOBBO_MASTERCAVE10");
	Wld_InsertNpc	(Gobbo_Skeleton,	"GOBBO_MASTERCAVE10");
	Wld_InsertNpc	(Gobbo_Skeleton,	"SPAWN_OW_GOBBO_CAVE03INDOOR_02");
	Wld_InsertNpc	(Gobbo_Skeleton,	"SPAWN_OW_GOBBO_CAVE03INDOOR_02");

	// Wiese zwischen Gobbo-Strand und Steg Richtung AL

	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_GOBBOCAVE_03_01");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_GOBBOCAVE_03_01");

	Wld_InsertNpc	(Bloodfly,	"SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_BLOODFLY_LOCATION_29_01");

	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_OW_WOLF_OC_PSI3");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_OW_WOLF_OC_PSI3");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_OW_WOLF_OC_PSI3");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_OW_WOLF_OC_PSI3");

	Wld_InsertNpc	(Lurker,	"SPAWN_OW_BLOODFLY_OC_PSI");

	Wld_InsertNpc	(Bloodfly,	"SPAWN_SCAVENGER_PATH_OC_PSI_02");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_SCAVENGER_PATH_OC_PSI_02");
	Wld_InsertNpc	(Bloodfly,	"SPAWN_SCAVENGER_PATH_OC_PSI_02");

	Wld_InsertNpc	(Scavenger,	"SPAWN_SCAVENGER_PATH_OC_PSI_03");
	Wld_InsertNpc	(Scavenger,	"SPAWN_SCAVENGER_PATH_OC_PSI_03");

	// Weg Gobbo-Strand zu SL

	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_OCWALD_PSI_PATH2");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_OCWALD_PSI_PATH2");

	Wld_InsertNpc	(Scavenger,	"FP_ROAM_OW_WARAN_OCWALD_PSI_PATH4");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_OW_WARAN_OCWALD_PSI_PATH4");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_OW_WARAN_OCWALD_PSI_PATH4");
	Wld_InsertNpc	(Scavenger_Demon,	"FP_ROAM_OW_WARAN_OCWALD_PSI_PATH4");

	Wld_InsertNpc	(Fleischfly,	"SPAWN_SCAVENGERPATH_OC_PSI_14");
	Wld_InsertNpc	(Fleischfly,	"SPAWN_SCAVENGERPATH_OC_PSI_14");
	Wld_InsertNpc	(Fleischfly,	"SPAWN_SCAVENGERPATH_OC_PSI_14");

	Wld_InsertNpc	(Molerat,	"SPAWN_BLOODFLYPATH_OC_PSI_14");
	Wld_InsertNpc	(Molerat,	"SPAWN_BLOODFLYPATH_OC_PSI_14");

	Wld_InsertNpc	(Molerat,	"SPAWN_OW_MOLERAT_PSI_PATH7");
	Wld_InsertNpc	(Molerat,	"SPAWN_OW_MOLERAT_PSI_PATH7");

	Wld_InsertNpc	(Molerat,	"SPAWN_OW_MOLERAT_PSI_PATH7_MOVEMENT");
	Wld_InsertNpc	(Molerat,	"SPAWN_OW_MOLERAT_PSI_PATH7_MOVEMENT");

	Wld_InsertNpc	(Molerat,	"SPAWN_OW_MOLERAT_PSI_PATH7_MOVEMENT2");
	Wld_InsertNpc	(Molerat,	"SPAWN_OW_MOLERAT_PSI_PATH7_MOVEMENT2");

	// Sumpf

	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI10");
	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI10");

	//Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI16");

	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI11");
	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI11");

	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI12");
	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI12");

	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI17");

	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI13");

	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI19");

	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI21");
	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI21");

	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI20");

	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI15");

	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI14");

	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_NEW_215");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_NEW_215");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_NEW_215");

	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_OW_BLOODFLY_12_01");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_OW_BLOODFLY_12_01");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_OW_BLOODFLY_12_01");

	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY11_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY11_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY11_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY11_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY11_SPAWN01");

	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY09_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY09_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY09_SPAWN01");

	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY12_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY12_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY12_SPAWN01");

	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY08_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY08_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY08_SPAWN01");

	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_NEW_294");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_NEW_294");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_NEW_294");

	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_NEW_317");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_NEW_317");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_NEW_317");

	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY13_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY13_SPAWN01");

	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_NEW_369");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_NEW_369");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_NEW_369");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_NEW_369");
	Wld_InsertNpc	(Bloodfly,	"FP_ROAM_NEW_369");

	// Wald auf Nebelturmseite

	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_04_02_1");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_04_02_1");
	Wld_InsertNpc	(Scavenger,	"SPAWN_OW_SCAVENGER_04_02_1");
	Wld_InsertNpc	(Scavenger_Demon,	"SPAWN_OW_SCAVENGER_04_02_1");

	Wld_InsertNpc	(Scavenger,	"SPAWN_SCAVENGEROW_PATH_280");
	Wld_InsertNpc	(Scavenger,	"SPAWN_SCAVENGEROW_PATH_280");

	Wld_InsertNpc	(Puma,	"SPAWN_OW_BLOODHOUND_01");

	Wld_InsertNpc	(Wolf,	"SPAWN_OW_WOLFK__PSIWOOD_OUT3");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_WOLFK__PSIWOOD_OUT3");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_WOLFK__PSIWOOD_OUT3");

	Wld_InsertNpc	(Wolf,	"SPAWN_OW_NWOLF_04_PSIWOOD5");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_NWOLF_04_PSIWOOD5");
	Wld_InsertNpc	(BlackWolf,	"SPAWN_OW_NWOLF_04_PSIWOOD5");

	Wld_InsertNpc	(Keiler,	"SPAWN_OW_ENTRANCE_SCAVENGER_OC1_02");
	Wld_InsertNpc	(Keiler,	"SPAWN_OW_ENTRANCE_SCAVENGER_OC1_02");

	Wld_InsertNpc	(Wolf,	"SPAWN_OW_WOLF_NEARSHADOW_PSIWOOD_02");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_WOLF_NEARSHADOW_PSIWOOD_02");
	Wld_InsertNpc	(BlackWolf,	"SPAWN_OW_WOLF_NEARSHADOW_PSIWOOD_02");

	Wld_InsertNpc	(Warg,	"SPAWN_OW_SHADOWBEAST1_PSIWOOD_02");
	Wld_InsertNpc	(Warg,	"SPAWN_OW_SHADOWBEAST1_PSIWOOD_02");

	Wld_InsertNpc	(Wolf,	"SPAWN_OW_WOLF_04_PSI5");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_WOLF_04_PSI5");
	Wld_InsertNpc	(BlackWolf,	"SPAWN_OW_WOLF_04_PSI5");

	Wld_InsertNpc	(Warg,	"FP_ROAM_OW_MOLERAT_04_PSI");
	Wld_InsertNpc	(Warg,	"FP_ROAM_OW_MOLERAT_04_PSI");

	Wld_InsertNpc	(Wolf,	"SPAWN_OW_SCAVNEGER_04_PSI3");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_SCAVNEGER_04_PSI3");

	Wld_InsertNpc	(Keiler,	"OW_PATH_WOLF04_SPAWN01");
	Wld_InsertNpc	(Keiler,	"OW_PATH_WOLF04_SPAWN01");

	Wld_InsertNpc	(Shadowbeast,	"SPAWN_OW_SCAVENGER_NEARSHADOW_PSIWOOD_01");

	Wld_InsertNpc	(BlackWolf,	"SPAWN_OW_PATH_WOLF_WOOD");
	Wld_InsertNpc	(BlackWolf,	"SPAWN_OW_PATH_WOLF_WOOD");
	Wld_InsertNpc	(Warg,	"SPAWN_OW_PATH_WOLF_WOOD");

	Wld_InsertNpc	(Alligator,	"SPAWN_OW_BLOODFLY_01_OCWOOD1_OCW5");
	Wld_InsertNpc	(Alligator,	"SPAWN_OW_BLOODFLY_01_OCWOOD1_OCW5");

	Wld_InsertNpc	(Warg,	"SPAWN_OW_NSCAVENGER_04_PSIWOOD4");
	Wld_InsertNpc	(Warg,	"SPAWN_OW_NSCAVENGER_04_PSIWOOD4");

	Wld_InsertNpc	(Warg,	"SPAWN_OW_MOLERATN_PSIWOOD_1");
	Wld_InsertNpc	(Warg,	"SPAWN_OW_MOLERATN_PSIWOOD_1");

	Wld_InsertNpc	(Wolf,	"SPAWN_OW_WOLF_PSIWOOD_5");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_WOLF_PSIWOOD_5");
	Wld_InsertNpc	(BlackWolf,	"SPAWN_OW_WOLF_PSIWOOD_5");

	Wld_InsertNpc	(Wolf,	"SPAWN_OW_BLOODFLYS_PSIWOOD_4");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_BLOODFLYS_PSIWOOD_4");
	Wld_InsertNpc	(BlackWolf,	"SPAWN_OW_BLOODFLYS_PSIWOOD_4");

	Wld_InsertNpc	(Keiler,	"SPAWN_OW_SCAVENGER_PSIWOOD2");
	Wld_InsertNpc	(Keiler,	"SPAWN_OW_SCAVENGER_PSIWOOD2");

	Wld_InsertNpc	(Wolf,	"SPAWN_OW_WOLFL__PSIWOOD_OUT4");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_WOLFL__PSIWOOD_OUT4");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_WOLFL__PSIWOOD_OUT4");

	Wld_InsertNpc	(Wolf,	"SPAWN_OW_MOLERATL__PSIWOOD_01");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_MOLERATL__PSIWOOD_01");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_MOLERATL__PSIWOOD_01");

	Wld_InsertNpc	(Wolf,	"SPAWN_OW_BLOODFLY_PSIWOOD_02");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_BLOODFLY_PSIWOOD_02");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_BLOODFLY_PSIWOOD_02");

	Wld_InsertNpc	(Wolf,	"SPAWN_OW_SHADOWBEAST2_PSIWOOD_02");
	Wld_InsertNpc	(Wolf,	"SPAWN_OW_SHADOWBEAST2_PSIWOOD_02");

	Wld_InsertNpc	(Keiler,	"OW_PSIWOOD_MOVEMENT1");
	Wld_InsertNpc	(Keiler,	"OW_PSIWOOD_MOVEMENT1");
	Wld_InsertNpc	(Keiler,	"OW_PSIWOOD_MOVEMENT1");

	Wld_InsertNpc	(Keiler,	"SPAWN_OW_MOLERATT_04_PSI1");
	Wld_InsertNpc	(Keiler,	"SPAWN_OW_MOLERATT_04_PSI1");
	Wld_InsertNpc	(Keiler,	"SPAWN_OW_MOLERATT_04_PSI1");

	Wld_InsertNpc	(Shadowbeast,	"OW_PATH_227");

	// Nebelturm

	//Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_09");
	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_09");

	//Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_11");
	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_11");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_15");

	//Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_16");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_17");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_22");

	//Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_24");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_23");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_18");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_20");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_25");

	//Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_31");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_32");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_30");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_28");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_26");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_34");

	//Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_33");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_36_MOVEMENT");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_36_MOVEMENT2");

	Wld_InsertNpc	(SkeletonMage,	"OW_FOGDUNGEON_37");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_38");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_39");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_40");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_41");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_42");

	//Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_44");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_45");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_17");

	//Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_17");

	//Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_17");

	Wld_InsertNpc	(Lesser_Skeleton,	"OW_FOGDUNGEON_17");

	// Strand bei Nebelturm

	Wld_InsertNpc	(FireWaran,	"OW_COAST_SHIPWRECK_WARAN");
	Wld_InsertNpc	(FireWaran,	"OW_COAST_SHIPWRECK_WARAN");

	Wld_InsertNpc	(FireWaran,	"OW_COAST_SHIPWRECK_WARAN_2");
	Wld_InsertNpc	(FireWaran,	"OW_COAST_SHIPWRECK_WARAN_2");

	// Wiese bei Wald bei Nebelturm

	Wld_InsertNpc	(Troll,	"OW_PATH_WOLF05_SPAWN02");

	// Wald auf AL-Seite des Flusses

	Wld_InsertNpc	(Alligator,	"SPAWN_OW_SNAPPER_OCWOOD1_05_02");
	Wld_InsertNpc	(Alligator,	"SPAWN_OW_SNAPPER_OCWOOD1_05_02");
	Wld_InsertNpc	(Alligator,	"SPAWN_OW_SNAPPER_OCWOOD1_05_02");

	Wld_InsertNpc	(Keiler,	"SPAWN_OW_SCAVENGER_INWALD_OC2");
	Wld_InsertNpc	(Keiler,	"SPAWN_OW_SCAVENGER_INWALD_OC2");

	Wld_InsertNpc	(Gobbo_Skeleton,	"PATH_WALD_OC_WOLFSPAWN");
	Wld_InsertNpc	(Gobbo_Skeleton,	"PATH_WALD_OC_WOLFSPAWN");
	Wld_InsertNpc	(Gobbo_Skeleton,	"PATH_WALD_OC_WOLFSPAWN");
	Wld_InsertNpc	(Gobbo_Skeleton,	"PATH_WALD_OC_WOLFSPAWN");

	Wld_InsertNpc	(Wisp,	"PATH_WALD_OC_MOLERATSPAWN");

	Wld_InsertNpc	(Warg,	"OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc	(Warg,	"OW_PATH_SCAVENGER03_SPAWN01");

	Wld_InsertNpc	(Wisp,	"SPAWN_WALD_OC_BLOODFLY01");

	Wld_InsertNpc	(Gobbo_Skeleton,	"SPAWN_OW_WOLF2_WALD_OC3");
	Wld_InsertNpc	(Gobbo_Skeleton,	"SPAWN_OW_WOLF2_WALD_OC3");
	Wld_InsertNpc	(Gobbo_Skeleton,	"SPAWN_OW_WOLF2_WALD_OC3");
	Wld_InsertNpc	(Gobbo_Skeleton,	"SPAWN_OW_WOLF2_WALD_OC3");

	Wld_InsertNpc	(Gobbo_Skeleton,	"SPAWN_OW_MOLERAT2_WALD_OC1");
	Wld_InsertNpc	(Gobbo_Skeleton,	"SPAWN_OW_MOLERAT2_WALD_OC1");
	Wld_InsertNpc	(Gobbo_Skeleton,	"SPAWN_OW_MOLERAT2_WALD_OC1");
	Wld_InsertNpc	(Gobbo_Skeleton,	"SPAWN_OW_MOLERAT2_WALD_OC1");

	Wld_InsertNpc	(Warg,	"SPAWN_OW_WOLF2_WALD_OC2");
	Wld_InsertNpc	(Warg,	"SPAWN_OW_WOLF2_WALD_OC2");

	// Strand vor Klosterruine

	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY02_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY02_SPAWN01");
	Wld_InsertNpc	(Bloodfly,	"OW_PATH_BLOODFLY02_SPAWN01");

	Wld_InsertNpc	(Alligator,	"SPAWN_ROAM_OW_WARAN_RUIN");
	Wld_InsertNpc	(Alligator,	"SPAWN_ROAM_OW_WARAN_RUIN");
	Wld_InsertNpc	(Alligator,	"SPAWN_ROAM_OW_WARAN_RUIN");

	Wld_InsertNpc	(Waran,	"OW_PATH_ABYSS_4");
	Wld_InsertNpc	(Waran,	"OW_PATH_ABYSS_4");

	// Wiese vor Klosterruine

	Wld_InsertNpc	(Snapper,	"OW_MONSTER_NAVIGATE");
	Wld_InsertNpc	(Snapper,	"OW_MONSTER_NAVIGATE");

	Wld_InsertNpc	(Snapper,	"OW_MONSTER_NAVIGATE_02");
	Wld_InsertNpc	(Snapper,	"OW_MONSTER_NAVIGATE_02");

	// Höhle unter Klosterruine

	Wld_InsertNpc	(Waran,	"OW_ABYSS_SPAWN_WARAN");
	Wld_InsertNpc	(Waran,	"OW_ABYSS_SPAWN_WARAN");

	Wld_InsertNpc	(Waran,	"SPAWN_ABYSS_TO_CAVE_MOVE");
	Wld_InsertNpc	(Waran,	"SPAWN_ABYSS_TO_CAVE_MOVE");

	// Xardas' versunkener Turm

	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_STAIRS");
	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_STAIRS");

	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_COR");
	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_COR");

	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_SAT");
	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_SAT");

	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_02_MOVEMENT_2");
	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_02_MOVEMENT_2");

	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_02_MOVEMENT");
	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_02_MOVEMENT");

	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_X");
	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_X");
	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_X");
	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_X");
	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_X");
	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_X");

	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_06");
	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_06");
	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_06");
	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_06");
	Wld_InsertNpc	(ZombieRandom,	"MAGICTOWER_06");

	// H?hle bei alter Mine (Waldläufer-Story)

	Wld_InsertNpc	(Skeleton, "WP_OM_HOEHLE_07");
	Wld_InsertNpc	(Skeleton, "WP_OM_HOEHLE_05");

	Wld_InsertNpc	(Gobbo_Skeleton, "WP_OM_HOEHLE_08");
	Wld_InsertNpc	(Gobbo_Skeleton, "WP_OM_HOEHLE_08");
	Wld_InsertNpc	(Gobbo_Skeleton, "WP_OM_HOEHLE_10");
	Wld_InsertNpc	(Gobbo_Skeleton, "WP_OM_HOEHLE_11");
};

FUNC VOID INIT_MinentalSurface ()
{
	if (GehtErstesMalInsMinental == 0)
	&& (Kapitel == 2)
	{

		GehtErstesMalInsMinental = 1;
	}; 

	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_AW_Hi))
	&& (Hölle_First	==	0)
	{
		Wld_InsertNpc	(Schattenlord_877_Urnol,	"OC1");
		Wld_InsertNpc	(Xeres_01,			"OC1");


		Hölle_First	=	1;
	};

	if (Urnol_InOT == TRUE)
	{
		B_RemoveNpc	(Schattenlord_877_Urnol);

		Urnol_InOT = 2;
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Daemonisch3))
	&& (UrnolWeg == 1)
	{
		UrnolWeg = 2;

		Wld_InsertNpc	(Schattenlord_999_Urnol, "OC1");
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Erfahrung))
	&& (Mod_Palamine_Leer == FALSE)
	{
		Mod_Palamine_Leer = TRUE;
		
		B_KillNpc	(Mod_1731_RIT_Ritter_MT);
		B_KillNpc	(Mod_1732_RIT_Ritter_MT);
		B_KillNpc	(Mod_1733_STRF_Straefling_MT);
		B_KillNpc	(Mod_1734_STRF_Straefling_MT);
		B_KillNpc	(Mod_1735_STRF_Straefling_MT);
		B_KillNpc	(Mod_1736_STRF_Straefling_MT);

		Wld_InsertNpc	(Mod_1741_PSITPL_Templer_MT,	"OC1");
		Wld_InsertNpc	(Mod_1742_PSITPL_Templer_MT,	"OC1");
		Wld_InsertNpc	(Mod_1743_PSITPL_Templer_MT,	"OC1");
		Wld_InsertNpc	(Mod_1744_PSITPL_Templer_MT,	"OC1");
	};

	

	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_GROUND2_01",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_GROUND2_01",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_GROUND2_01",0);
	
	Wld_SetMobRoutine			(00,00, "FIREPLACE", 1);
	Wld_SetMobRoutine			(22,00, "FIREPLACE", 1);
	Wld_SetMobRoutine			(05,00, "FIREPLACE", 0);
	
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH_01",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH_01",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH_01",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH_02",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH_02",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH_02",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH_03",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH_03",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH_03",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_01",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_01",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_01",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_02",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_02",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_02",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_03",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_03",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_03",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_04",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_04",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_04",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_05",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_05",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_05",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_06",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_06",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_06",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_07",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_07",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_07",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_08",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_08",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_08",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_09",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_09",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_09",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_10",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_10",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_10",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_11",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_11",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_11",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_12",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_12",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_12",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_13",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_13",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_13",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_14",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_14",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_14",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_15",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_15",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_15",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_16",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_16",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_16",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_17",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_17",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_17",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_18",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_18",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_18",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_19",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_19",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_19",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_20",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_20",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_20",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_21",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_21",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_21",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_22",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_22",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_22",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_23",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_23",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_23",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_24",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_24",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_24",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_25",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_25",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_25",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_26",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_26",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_26",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_27",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_27",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_27",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_28",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_28",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_28",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_29",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_29",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_29",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_HIGH2_30",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_HIGH2_30",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_HIGH2_30",0);
		
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_PCHIGH2_01",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_PCHIGH2_01",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_PCHIGH2_01",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_PCHIGH2_02",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_PCHIGH2_02",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_PCHIGH2_02",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_PCHIGH2_03",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_PCHIGH2_03",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_PCHIGH2_03",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_PCHIGH2_04",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_PCHIGH2_04",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_PCHIGH2_04",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_PCHIGH2_05",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_PCHIGH2_05",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_PCHIGH2_05",0);
	
	Wld_SetObjectRoutine (00,00,"OW_FIREPLACE_PCHIGH2_06",1);
	Wld_SetObjectRoutine (20,00,"OW_FIREPLACE_PCHIGH2_06",1);
	Wld_SetObjectRoutine (05,00,"OW_FIREPLACE_PCHIGH2_06",0);
	
	// aus Orc-City
	Wld_SetMobRoutine	(00,00, "FIREPLACE", 1);

	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
};

FUNC VOID STARTUP_Minental ()
{
	CurrentLevel3 = MINENTAL_ZEN;

	NameAllFires();

	// Orks - Orks kriegen alle nen TA, ist dann cooler

	


	// NPC's



	// Sonstiges

	STARTUP_MinentalSurface ();
	STARTUP_MinentalOldCamp ();
	STARTUP_MinentalPsiCamp ();
	STARTUP_MinentalNewCamp ();
	STARTUP_MinentalFreeMineCamp ();
	STARTUP_MinentalDemontower ();
	
		
};

FUNC VOID INIT_Minental ()
{
	// Morgens

	Wld_SetMobRoutine(05, 10, "LIGHTSPAWNERONE", 1);
	Wld_SetMobRoutine(06, 10, "LIGHTSPAWNERONE", 0);
	Wld_SetMobRoutine(06, 10, "LIGHTSPAWNERTWO", 1);
	Wld_SetMobRoutine(07, 10, "LIGHTSPAWNERTWO", 0);
	Wld_SetMobRoutine(07, 10, "LIGHTSPAWNERTHREE", 1);
	Wld_SetMobRoutine(08, 10, "LIGHTSPAWNERTHREE", 0);

	// Mittags

	Wld_SetMobRoutine(08, 10, "LIGHTSPAWNERFOUR", 1);
	Wld_SetMobRoutine(09, 10, "LIGHTSPAWNERFOUR", 0);
	Wld_SetMobRoutine(09, 10, "LIGHTSPAWNERFIVE", 1);
	Wld_SetMobRoutine(15, 10, "LIGHTSPAWNERFIVE", 0);
	Wld_SetMobRoutine(15, 10, "LIGHTSPAWNERSIX", 1);
	Wld_SetMobRoutine(16, 10, "LIGHTSPAWNERSIX", 0);

	// Nachmittags

	Wld_SetMobRoutine(16, 10, "LIGHTSPAWNERSEVEN", 1);
	Wld_SetMobRoutine(17, 10, "LIGHTSPAWNERSEVEN", 0);
	Wld_SetMobRoutine(17, 10, "LIGHTSPAWNEREIGHT", 1);
	Wld_SetMobRoutine(18, 10, "LIGHTSPAWNEREIGHT", 0);

	// Abends

	Wld_SetMobRoutine(18, 10, "LIGHTSPAWNERNINE", 1);
	Wld_SetMobRoutine(18, 50, "LIGHTSPAWNERNINE", 0);
	Wld_SetMobRoutine(18, 50, "LIGHTSPAWNERTEN", 1);
	Wld_SetMobRoutine(19, 30, "LIGHTSPAWNERTEN", 0);
	Wld_SetMobRoutine(19, 30, "LIGHTSPAWNERELEVEN", 1);
	Wld_SetMobRoutine(20, 10, "LIGHTSPAWNERELEVEN", 0);

	if (Kapitel == 2)
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_AW_Hi))
	{
		B_Kapitelwechsel	(3, MINENTAL_ZEN);
	};

	if (Mod_MinentalTor == 0)
	&& ((Mod_WM_KurganAlarm < 4)
	|| (Mod_WM_ElvrichImSumpf >= 1))
	{
		// Tor der alten Mine schlie?en

		Wld_SendTrigger	("EVT_AM_LOB_GATE_BIG");

		Mod_MinentalTor = 1;
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Lich))
	&& (Mod_BK_BookSpawn == 0)
	{
		Mod_BK_BookSpawn = 1;

		Wld_InsertItem	(ItWr_MagicSecretsBand5,	"FP_ITEM_MAGICSECRETSBAND5");
		Wld_InsertItem	(ItWr_MagicMonsterBand7,	"FP_ITEM_MAGICMONSTERBAND7");
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Moorhexe))
	&& (Mod_BK_BookSpawn == 1)
	{
		Mod_BK_BookSpawn = 2;

		Wld_InsertItem	(ItWr_MagicSecretsBand6,	"FP_ITEM_MAGICSECRETSBAND6");
	};

	// Wenn man sich f?r den Hofstaat entschieden hat, dann werden mal die meisten Sumpfis entfernt :)

	if (Mod_SL_Meer == 1)
	&& (Mod_SumpfisWeg == 0)
	{
		Mod_SumpfisWeg = 1;

		B_RemoveNpc	(Mod_2006_GUR_BaalTyon_MT);
		B_RemoveNpc	(Mod_1329_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1116_PSINOV_Caine_MT);
		B_RemoveNpc	(Mod_1322_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1324_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1325_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1326_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1327_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1328_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1340_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1330_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1331_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1332_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1333_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1334_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1335_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1336_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1337_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1338_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1339_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1342_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1351_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1343_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1344_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1345_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1346_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1347_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1348_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1349_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1350_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1352_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1360_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1353_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1354_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1355_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1356_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1357_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1358_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1359_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1365_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1361_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1362_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1363_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_1364_PSINOV_Novize_MT);
		B_RemoveNpc	(Mod_3001_PSINOV_Balor_MT);
		B_RemoveNpc	(Mod_2008_PSINOV_Ghorim_MT);
		B_RemoveNpc	(Mod_2013_PSINOV_Joru_MT);
		B_RemoveNpc	(Mod_1217_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1210_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1212_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1211_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1214_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1213_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1215_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1216_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1218_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1219_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1224_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1220_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1221_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1223_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1225_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1231_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1226_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1228_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1227_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1229_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1230_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1286_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1232_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1233_TPL_Templer_MT);
		B_RemoveNpc	(Mod_1235_TPL_Templer_MT);
	};

	// Tugettso Teleportplattform deaktivieren nach Laden	

	Wld_SendUnTrigger	("STAENDER_VMG_PFX");
	Wld_SendUnTrigger	("PLATTFORM_VMG_PFX");

	if (Struk_Abgeliefert == 1)
	{
		Struk_Abgeliefert = 2;

		B_StartOtherRoutine	(Mod_1956_VMK_Struk_MT, "TOT");
		AI_Teleport (Mod_1956_VMK_Struk_MT, "TOT");
		Mod_1956_VMK_Struk_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	};

	if (Thorge_Abgeliefert == 1)
	{
		Thorge_Abgeliefert = 2;

		B_StartOtherRoutine	(Mod_1957_VMG_Thorge_MT, "TOT");
		AI_Teleport (Mod_1957_VMG_Thorge_MT, "TOT");
		Mod_1957_VMG_Thorge_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	};

	if (Mod_KG_Glenn == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Glenn_Nahrungsversorgung2))
	{
		Mod_KG_Glenn = 2;

		Wld_InsertNpc	(Mod_7494_OUT_Glenn_MT, "OW_PATH_1_17");
	};	

	if (Mod_NamibDabei == 4)
	{
		Mod_NamibDabei = 5;

		B_StartOtherRoutine	(Mod_2004_GUR_BaalNamib_MT, "START");
	};

	if (Mod_AngarDabei == 4)
	{
		Mod_AngarDabei = 5;

		B_StartOtherRoutine	(Mod_106_TPL_Angar_MT, "START");
	};

	if (Mod_LesterDabei == 4)
	{
		Mod_LesterDabei = 5;

		if (!Npc_IsDead(Mod_7268_PSINOV_Lester_MT))
		{
			B_StartOtherRoutine	(Mod_7268_PSINOV_Lester_MT, "START");
		}
		else
		{
			Wld_InsertNpc	(Mod_7268_PSINOV_Lester_MT, "PSI_START");
		};
	};

	if (Mod_NL_JeremiahHasEier == 1)
	&& (Wld_GetDay()-10 >= Mod_NL_JeremiahHasEier_Day)
	&& (Kapitel >= 3)
	{
		Mod_NL_JeremiahHasEier = 2;

		Wld_InsertNpc	(RedCrab,	"NC_PATH_PEASANT_OUTSIDE8_WASH");
		Wld_InsertNpc	(RedCrab,	"NC_PATH_PEASANT_OUTSIDE8_WASH");
		Wld_InsertNpc	(RedCrab,	"NC_PATH_PEASANT_OUTSIDE8_WASH");
		Wld_InsertNpc	(Wurm,	"NC_PATH_PEASANT_OUTSIDE8_WASH");
		Wld_InsertNpc	(Wurm,	"NC_PATH_PEASANT_OUTSIDE8_WASH");
		Wld_InsertNpc	(Wurm,	"NC_PATH_PEASANT_OUTSIDE8_WASH");

		Wld_InsertNpc	(RedCrab,	"NC_PATH_PEASANT5");
		Wld_InsertNpc	(RedCrab,	"NC_PATH_PEASANT5");
		Wld_InsertNpc	(RedCrab,	"NC_PATH_PEASANT5");
		Wld_InsertNpc	(Wurm,	"NC_PATH_PEASANT5");
		Wld_InsertNpc	(Wurm,	"NC_PATH_PEASANT5");
		Wld_InsertNpc	(Wurm,	"NC_PATH_PEASANT5");

		Wld_InsertNpc	(RedCrab,	"NC_SPAWN_DAM_LURKER2");
		Wld_InsertNpc	(RedCrab,	"NC_SPAWN_DAM_LURKER2");
		Wld_InsertNpc	(RedCrab,	"NC_SPAWN_DAM_LURKER2");
		Wld_InsertNpc	(Wurm,	"NC_SPAWN_DAM_LURKER2");
		Wld_InsertNpc	(Wurm,	"NC_SPAWN_DAM_LURKER2");
		Wld_InsertNpc	(Wurm,	"NC_SPAWN_DAM_LURKER2");

		Wld_InsertNpc	(RedCrab,	"NC_WASH_03");
		Wld_InsertNpc	(RedCrab,	"NC_WASH_03");
		Wld_InsertNpc	(RedCrab,	"NC_WASH_03");
		Wld_InsertNpc	(Wurm,	"NC_WASH_03");
		Wld_InsertNpc	(Wurm,	"NC_WASH_03");
		Wld_InsertNpc	(Wurm,	"NC_WASH_03");

		Wld_InsertNpc	(RedCrab,	"NC_WATERFALL_BOTTOM");
		Wld_InsertNpc	(RedCrab,	"NC_WATERFALL_BOTTOM");
		Wld_InsertNpc	(RedCrab,	"NC_WATERFALL_BOTTOM");
		Wld_InsertNpc	(Wurm,	"NC_WATERFALL_BOTTOM");
		Wld_InsertNpc	(Wurm,	"NC_WATERFALL_BOTTOM");
		Wld_InsertNpc	(Wurm,	"NC_WATERFALL_BOTTOM");

		Wld_InsertNpc	(RedCrab,	"NC_PATH46");
		Wld_InsertNpc	(RedCrab,	"NC_PATH46");
		Wld_InsertNpc	(RedCrab,	"NC_PATH46");
		Wld_InsertNpc	(Wurm,	"NC_PATH46");
		Wld_InsertNpc	(Wurm,	"NC_PATH46");
		Wld_InsertNpc	(Wurm,	"NC_PATH46");
	};

	if (Mod_AlbertTransforms == 5)
	{
		Mod_AlbertTransforms = 6;

		if (Mod_OC_Esteban == 0)
		{
			B_StartOtherRoutine	(Mod_948_BDT_Esteban_MT, "SURVIVOR");
		};
		if (Mod_OC_Miguel == 0)
		{
			B_StartOtherRoutine	(Mod_958_BDT_Miguel_MT, "SURVIVOR");
		};
		if (Mod_OC_Juan == 0)
		{
			B_StartOtherRoutine	(Mod_955_BDT_Juan_MT, "SURVIVOR");
		};
		if (Mod_OC_Logan == 0)
		{
			B_StartOtherRoutine	(Mod_957_BDT_Logan_MT, "SURVIVOR");
		};
		if (Mod_OC_Skinner == 0)
		{
			B_StartOtherRoutine	(Mod_964_BDT_Skinner_MT, "SURVIVOR");
		};
		if (Mod_OC_Morgahard == 0)
		{
			B_StartOtherRoutine	(Mod_790_BDT_Morgahard_MT, "SURVIVOR");
		};
		if (Mod_OC_Bandit_01 == 0)
		{
			B_StartOtherRoutine	(Mod_4074_BDT_Bandit_MT, "SURVIVOR");
		};
		if (Mod_OC_Bandit_02 == 0)
		{
			B_StartOtherRoutine	(Mod_4075_BDT_Bandit_MT, "SURVIVOR");
		};
	};

	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatKoenig_Loch))
	&& (Mod_SL_KingAtSwamp == 0)
	{
		Mod_SL_KingAtSwamp = 1;

		Wld_InsertNpc	(Mod_7331_HS_Koenig_MT, "PSI_START");
	};

	if (Mod_WM_KurganAlarm == 4)
	&& (Mod_WM_ElvrichImSumpf == 0)
	{
		if (Mod_MinentalTor == 1)
		{
			Wld_SendTrigger	("EVT_AM_LOB_GATE_BIG");
		};

		Mod_WM_ElvrichImSumpf = 1;

		Wld_InsertNpc	(Mod_7403_SMK_SchwarzerKrieger_MT, "PSI_START");
		Wld_InsertNpc	(Mod_7404_NONE_Elvrich_MT, "PSI_START");
	};

	INIT_MinentalSurface ();
	INIT_MinentalOldCamp ();
	INIT_MinentalPsiCamp ();
	INIT_MinentalNewCamp ();
	INIT_MinentalFreeMineCamp ();
	INIT_MinentalDemontower ();
	
	OldLevel(MINENTAL_ZEN);
   
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	if (Npc_KnowsInfo(hero, Info_Mod_Morgahard_NW_Hi))
	&& (Mod_AL_Esteban_Back == FALSE)
	{
		B_StartOtherRoutine	(Mod_948_BDT_Esteban_MT, "START");

		Mod_AL_Esteban_Back = TRUE;
	};

	if (Mod_BodoInMT == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Hagen_Alissandro))
	{
		Wld_InsertNpc	(Mod_1941_SNOV_Bodo_NW, "OC1");

		Mod_BodoInMT = TRUE;
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Sterling_Buddler2))
	&& (Mod_KG_Sterling == 0)
	{
		Mod_KG_Sterling = 1;

		Wld_InsertNpc	(Mod_7508_BUD_Sterling_MT, "OC1");
	};
	
	if (Mod_Enter_Minental_01 == FALSE)
	&& (Mod_Schwierigkeit > 0)
	{
		// Leer, da Kapitel 1 schon Grundspawn

		Mod_Enter_Minental_01 = TRUE;
	};

	if (Kapitel >= 2)
	&& (Mod_Enter_Minental_02 == FALSE)
	{
		// Urs spawnen

		Wld_InsertNpc	(Mod_7649_OUT_Urs_MT,	"OC1");

		B_StartOtherRoutine	(Mod_1120_BDT_Ratford_MT, "FOKUS");
		B_StartOtherRoutine	(Mod_1121_BDT_Drax_MT, "TOT");

		Wld_InsertNpc	(Warg_RatfordDrax_01, "FP_WARGLEICHE_FOKUS_01");
		Wld_InsertNpc	(Warg_RatfordDrax_02, "FP_WARGLEICHE_FOKUS_02");
		Wld_InsertNpc	(Warg_RatfordDrax_03, "FP_WARGLEICHE_FOKUS_03");
		Wld_InsertNpc	(Warg_RatfordDrax_04, "FP_WARGLEICHE_FOKUS_04");
		Wld_InsertNpc	(Warg_RatfordDrax_05, "FP_WARGLEICHE_FOKUS_05");
		Wld_InsertNpc	(Warg_RatfordDrax_06, "FP_WARGLEICHE_FOKUS_06");
		Wld_InsertNpc	(Warg_RatfordDrax_07, "FP_WARGLEICHE_FOKUS_07");
		Wld_InsertNpc	(Warg_RatfordDrax_08, "FP_WARGLEICHE_FOKUS_08");

		B_KillNpc	(Warg_RatfordDrax_01);
		B_KillNpc	(Warg_RatfordDrax_02);
		B_KillNpc	(Warg_RatfordDrax_03);
		B_KillNpc	(Warg_RatfordDrax_04);
		B_KillNpc	(Warg_RatfordDrax_05);
		B_KillNpc	(Warg_RatfordDrax_06);
		B_KillNpc	(Warg_RatfordDrax_07);
		B_KillNpc	(Warg_RatfordDrax_08);

		Mod_Enter_Minental_02 = True;
	};

	if (Daemonenritter_AL == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Whistler_NW_Daemonen))
	{
		Daemonenritter_AL = TRUE;

		Wld_InsertNpc	(Mod_1935_DMR_Daemonenritter_MT,	"OC1");
		Wld_InsertNpc	(Mod_1936_DMR_Daemonenritter_MT,	"OC1");
	};

	if (Kapitel >= 3)
	&& (Mod_Enter_Minental_03 == FALSE)
	{
		// Story-Kram

		if (Jäger_Dabei == TRUE)
		{
			B_StartOtherRoutine	(Mod_7433_JG_Zelar_MT, "KAPTHREE");
			B_StartOtherRoutine	(Mod_7431_JG_Baldur_MT, "KAPTHREE");
		};

		Mod_Enter_Minental_03 = True;
	};

	PrintDebug	("LOADMIN: Vor Kapitel 4 Spawns");

	if (Kapitel >= 4)
	&& (Mod_Enter_Minental_04 == FALSE)
	{
		// Orks in altes Lager

		Wld_InsertNpc	(Orcelite_Roam,	"OCC_WELL_RIGHT_MOVEMENT");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCC_WELL_RIGHT_MOVEMENT");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCC_WELL_RIGHT_MOVEMENT");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCC_WELL_RIGHT_MOVEMENT");

		Wld_InsertNpc	(Orcelite_Roam,	"OCC_STABLE_ENTRANCE");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCC_STABLE_ENTRANCE");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCC_STABLE_ENTRANCE");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCC_STABLE_ENTRANCE");

		Wld_InsertNpc	(Orcelite_Roam,	"OCC_SHADOWS_CORNER_MOVEMENT3");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCC_SHADOWS_CORNER_MOVEMENT3");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCC_SHADOWS_CORNER_MOVEMENT3");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCC_SHADOWS_CORNER_MOVEMENT3");

		Wld_InsertNpc	(Orcelite_Roam,	"OCC_MERCS_ENTRANCE_1");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCC_MERCS_ENTRANCE_1");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCC_MERCS_ENTRANCE_1");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCC_MERCS_ENTRANCE_1");

		Wld_InsertNpc	(Orcelite_Roam,	"OCC_CENTER_4_TRAIN2");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCC_CENTER_4_TRAIN2");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCC_CENTER_4_TRAIN2");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCC_CENTER_4_TRAIN2");

		Wld_InsertNpc	(Orcelite_Roam,	"OCC_CONVOY_01");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCC_CONVOY_01");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCC_CONVOY_01");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCC_CONVOY_01");

		Wld_InsertNpc	(Orcelite_Roam,	"OCC_BARONS_HALLWAY_FRONT");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCC_BARONS_HALLWAY_FRONT");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCC_BARONS_HALLWAY_FRONT");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCC_BARONS_HALLWAY_FRONT");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_GATE_SQUARE");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_GATE_SQUARE");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_GATE_SQUARE");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_GATE_SQUARE");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_TO_MAINGATE");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_TO_MAINGATE");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_TO_MAINGATE");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_TO_MAINGATE");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_OUTSIDE_HUT_4");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_OUTSIDE_HUT_4");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_4");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_4");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_OUTSIDE_HUT_77_INSERT");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_OUTSIDE_HUT_77_INSERT");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_77_INSERT");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_77_INSERT");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_MAINGATE_INSIDE");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_MAINGATE_INSIDE");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_MAINGATE_INSIDE");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_MAINGATE_INSIDE");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_OUTSIDE_HUT_73");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_OUTSIDE_HUT_73");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_73");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_73");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_OUTSIDE_CAMPFIRE_D_2");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_OUTSIDE_CAMPFIRE_D_2");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_CAMPFIRE_D_2");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_CAMPFIRE_D_2");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_OUTSIDE_HUT_68_BENCH");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_OUTSIDE_HUT_68_BENCH");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_68_BENCH");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_68_BENCH");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_CAMPFIRE_E_2_MOVEMENT");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_CAMPFIRE_E_2_MOVEMENT");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_CAMPFIRE_E_2_MOVEMENT");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_CAMPFIRE_E_2_MOVEMENT");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_OUTSIDE_HUT_65_MOVEMENT");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_OUTSIDE_HUT_65_MOVEMENT");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_65_MOVEMENT");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_65_MOVEMENT");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_CAMPFIRE_F_1");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_CAMPFIRE_F_1");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_CAMPFIRE_F_1");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_CAMPFIRE_F_1");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_OUTSIDE_HUT_57");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_OUTSIDE_HUT_57");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_57");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_57");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_OUTSIDE_HUT_53");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_OUTSIDE_HUT_53");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_53");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_53");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_MARKETPLACE_HANGAROUND");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_MARKETPLACE_HANGAROUND");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_MARKETPLACE_HANGAROUND");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_MARKETPLACE_HANGAROUND");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_OUTSIDE_HUT_47_SMALT2");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_OUTSIDE_HUT_47_SMALT2");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_47_SMALT2");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_47_SMALT2");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_OUTSIDE_HUT_43B");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_OUTSIDE_HUT_43B");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_43B");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_43B");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_NORTHGATE");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_NORTHGATE");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_NORTHGATE");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_NORTHGATE");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_HUT_Z5");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_HUT_Z5");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_HUT_Z5");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_HUT_Z5");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_SMALLTALK_A_OC_ARENA");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_SMALLTALK_A_OC_ARENA");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_SMALLTALK_A_OC_ARENA");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_SMALLTALK_A_OC_ARENA");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_TO_HUT_17");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_TO_HUT_17");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_TO_HUT_17");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_TO_HUT_17");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_TO_HUT_22");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_TO_HUT_22");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_TO_HUT_22");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_TO_HUT_22");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_OUTSIDE_HUT_24");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_OUTSIDE_HUT_24");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_24");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_24");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_ARENA_TO_SMITH");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_ARENA_TO_SMITH");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_ARENA_TO_SMITH");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_ARENA_TO_SMITH");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_ARENA_TO_SMITH");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_OUTSIDE_HUT_30");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_30");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_30");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_TO_LADDER_TOP_01");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_TO_LADDER_TOP_01");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_TO_LADDER_TOP_01");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_TO_LADDER_TOP_01");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_CAULDRON_2");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_CAULDRON_2");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_CAULDRON_2");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_CAULDRON_2");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_OUTSIDE_HUT_15");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_OUTSIDE_HUT_15");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_15");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_15");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_OUTSIDE_HUT_9");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_OUTSIDE_HUT_9");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_9");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_9");

		Wld_InsertNpc	(Orcelite_Roam,	"OCR_OUTSIDE_HUT_7");
		Wld_InsertNpc	(OrcShaman_Sit,	"OCR_OUTSIDE_HUT_7");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_7");
		Wld_InsertNpc	(OrcWarrior_Roam,	"OCR_OUTSIDE_HUT_7");

		PrintDebug	("LOADMIN: Nach Orkspawns");

		// Bewohner des alten Lagers killen

		B_KillNpc	(Mod_943_GRD_Bloodwyn_MT);
		B_KillNpc	(Mod_966_GRD_Thorus_MT);
		B_KillNpc	(Mod_1110_GRD_Cutter_MT);
		B_KillNpc	(Mod_1105_EBR_Arto_MT);
		B_KillNpc	(Mod_1106_EBR_Bartholo_MT);
		B_KillNpc	(Mod_1876_EBR_Bloodwyn_MT);
		B_KillNpc	(Mod_1870_EBR_Alissandro_MT);
		B_KillNpc	(Charlotte);
		B_KillNpc	(PIR_1390_Addon_InExtremo_DrPymonte);
		B_KillNpc	(PIR_1391_Addon_InExtremo_TheFlail);
		B_KillNpc	(PIR_1392_Addon_InExtremo_ThomasTheForger);
		B_KillNpc	(PIR_1393_Addon_InExtremo_Unicorn);
		B_KillNpc	(PIR_1394_Addon_InExtremo_YellowPfeiffer);
		B_KillNpc	(PIR_1395_Addon_InExtremo_Lutter);
		B_KillNpc	(PIR_1396_Addon_InExtremo_Flex);
		B_KillNpc	(Mod_800_GRD_Stone_MT);
		B_KillNpc	(Mod_1107_GRD_Jackal_MT);
		B_KillNpc	(Mod_1108_GRD_Bullit_MT);
		B_KillNpc	(Mod_1109_GRD_Scorpio_MT);
		B_KillNpc	(Mod_1110_GRD_Cutter_MT);
		B_KillNpc	(Mod_1113_GRD_Fletcher_MT);
		B_KillNpc	(Mod_801_STT_Sly_MT);
		B_KillNpc	(Mod_802_STT_Herek_MT);
		B_RemoveNpc	(Mod_950_STT_Fisk_MT);
		B_KillNpc	(Mod_954_STT_Huno_MT);
		B_KillNpc	(Mod_965_STT_Snaf_MT);
		B_KillNpc	(Mod_1161_STT_Whistler_MT);
		B_KillNpc	(Mod_1171_STT_Balam_MT);
		B_KillNpc	(Mod_1172_STT_Omid_MT);
		B_RemoveNpc	(Mod_1426_BUD_Grim_MT);
		B_KillNpc	(Mod_1427_BUD_Guy_MT);
		B_KillNpc	(Mod_1428_BUD_Kyle_MT);
		B_KillNpc	(Mod_1430_BUD_Gravo_MT);
		B_KillNpc	(Mod_1442_BUD_Costa_MT);
		B_KillNpc	(Mod_1506_BUD_Jesse_MT);
		B_KillNpc	(Mod_1902_STT_Ian_MT);
		B_KillNpc	(Mod_1126_GRD_Torwache_MT);
		B_KillNpc	(Mod_1127_GRD_Torwache_MT);
		B_KillNpc	(Mod_1128_GRD_Torwache_MT);
		B_KillNpc	(Mod_1129_GRD_Torwache_MT);
		B_KillNpc	(Mod_1130_GRD_Torwache_MT);
		B_KillNpc	(Mod_1131_GRD_Torwache_MT);
		B_KillNpc	(Mod_1622_EBR_Seraphia_MT);

		B_StartOtherRoutine	(Mod_962_STT_Scatty_MT, "SUMPFLAGER");
		B_StartOtherRoutine	(Mod_1173_STT_Fingers_MT, "SUMPFLAGER");
		B_StartOtherRoutine	(Mod_803_STT_Mud_MT, "SAFETY");

		AI_UnequipArmor (Mod_962_STT_Scatty_MT);

		CreateInvItems	(Mod_962_STT_Scatty_MT, TPL_ARMOR_M, 1);

		AI_EquipArmor	(Mod_962_STT_Scatty_MT, TPL_ARMOR_M);

		Wld_SetTime	(22,00);

		PlayVideo	("OrcAttack.bik");

		Wld_SendUnTrigger	("INEXTREMO_MUSIK");

		Mod_Enter_Minental_04 = True;
	};

	PrintDebug	("LOADMIN: Nach Kapitel 4 Spawns");

	if (Kapitel >= 5)
	&& (Mod_Enter_Minental_05 == FALSE)
	{
		// Story-Kram

		if (Jäger_Dabei == TRUE)
		{
			B_StartOtherRoutine	(Mod_7433_JG_Zelar_MT, "START");
			B_StartOtherRoutine	(Mod_7431_JG_Baldur_MT, "START");
		};
		

		Mod_Enter_Minental_05 = True;
	};

	if (Kapitel >= 6)
	&& (Mod_Enter_Minental_06 == FALSE)
	{
		Wld_SendTrigger	("XERES");

		B_StartOtherRoutine	(Xeres_01,	"FLIEHT");

		Mod_Enter_Minental_06 = True;
	}; 

	if (Mod_HoshPakInOC == 1)
	{
		Mod_HoshPakInOC = 2;

		B_StartOtherRoutine	(Mod_10002_Orc_HoshPak_MT, "FRIEDHOF");
		B_StartOtherRoutine	(Mod_10006_Orc_Ranad_MT, "TOT");
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Drachen))
	&& (Mod_NL_Wasserdrache == 0)
	{
		Wld_InsertNpc	(Wasserdrache_11003_MT, "OC1");

		Mod_NL_Wasserdrache = 1;
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Granmar_VM_AtNager))
	&& (Mod_KG_MineSpawn == TRUE)
	{
		Mod_KG_MineSpawn = 2;

		B_RemoveNpc	(Mod_7494_OUT_Glenn_MT);
		B_RemoveNpc	(Mod_7508_BUD_Sterling_MT);
		B_RemoveNpc	(Mod_1442_BUD_Costa_MT);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Trent))
	&& (Mod_KG_TrentInMT == 0)
	{
		Mod_KG_TrentInMT = 1;

		Wld_InsertNpc	(Mod_7528_RIT_Trent_MT,	"OC1");
		Wld_InsertNpc	(Mod_7635_MIL_Miliz_MT,	"OC1");
		Wld_InsertNpc	(Mod_7636_MIL_Miliz_MT,	"OC1");

		Wld_InsertNpc	(Mod_10041_Orc_Schamane_MT,	"CASTLE_37");

		Wld_InsertNpc	(OrcElite_Roam,	"CASTLE_35");
		Wld_InsertNpc	(OrcElite_Roam,	"CASTLE_33");
		Wld_InsertNpc	(OrcWarrior_Roam,	"CASTLE_33");
		Wld_InsertNpc	(OrcWarrior_Roam,	"CASTLE_35");
		Wld_InsertNpc	(OrcWarrior_CB,	"OW_PATH_012");
		Wld_InsertNpc	(OrcWarrior_CB,	"OW_PATH_012");
	};

	if (Mod_Kap4_KGOrks == 0)
	{
		if (Kapitel >= 4)
		{
			if (hero.guild != GIL_PAL)
			|| (Npc_KnowsInfo(hero, Info_Mod_Hagen_AndreVermaechtnis11))
			{
				Mod_Kap4_KGOrks = 1;

				Wld_InsertNpc	(OrcWarrior_Roam, "OW_PATH_1_17_1");
				Wld_InsertNpc	(OrcWarrior_Roam, "OW_PATH_1_17_1");
				Wld_InsertNpc	(OrcWarrior_Roam, "OW_PATH_1_17_1");
			};
		};
	};

	if (Mod_Kap4_KGOrks == 3)
	{
		Wld_InsertNpc	(Mod_7700_PAL_Paladin_MT, "OW_PATH_1_17_1");
		Wld_InsertNpc	(Mod_7701_PAL_Paladin_MT, "OW_PATH_1_17_1");

		B_StartOtherRoutine	(Mod_1016_KGD_Hymir_MT, "START");

		Mod_Kap4_KGOrks = 4;
	};

	PrintDebug	("LOADMIN: Ende Init");
};

FUNC VOID STARTUP_OrcTempel ()
{
	CurrentLevel3 = ORCTEMPEL_ZEN;

	NameAllFires();

	Wld_InsertNpc	(Mod_7021_GUR_CorKalom_OT,	"TPL_386");

	Wld_InsertNpc	(Minecrawler,	"FP_ROAM_MINECRAWLER_08");
	Wld_InsertNpc	(Minecrawler,	"FP_ROAM_MINECRAWLER_06");

	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_MINECRAWLER_01");
	Wld_InsertNpc	(MinecrawlerWarrior,	"FP_ROAM_MINECRAWLER_03");

	Wld_InsertNpc	(Zombie_OT,	"FP_ROAM_ZOMBIE_01");
	Wld_InsertNpc	(Zombie_OT,	"FP_ROAM_ZOMBIE_02");
	Wld_InsertNpc	(Zombie_OT,	"FP_ROAM_ZOMBIE_03");
	Wld_InsertNpc	(Zombie_OT,	"FP_ROAM_ZOMBIE_04");
	Wld_InsertNpc	(Zombie_OT,	"FP_ROAM_ZOMBIE_05");
	Wld_InsertNpc	(Zombie_OT,	"FP_ROAM_ZOMBIE_06");
	Wld_InsertNpc	(Zombie_OT,	"FP_ROAM_ZOMBIE_07");
	Wld_InsertNpc	(Zombie_OT,	"FP_ROAM_ZOMBIE_08");
	Wld_InsertNpc	(Zombie_OT,	"FP_ROAM_ZOMBIE_09");
	Wld_InsertNpc	(Zombie_OT,	"FP_ROAM_ZOMBIE_10");
	Wld_InsertNpc	(Zombie_OT,	"FP_ROAM_ZOMBIE_11");
	Wld_InsertNpc	(Zombie_OT,	"FP_ROAM_ZOMBIE_12");
	Wld_InsertNpc	(Zombie_OT,	"FP_ROAM_ZOMBIE_13");
	Wld_InsertNpc	(Zombie_OT,	"FP_ROAM_ZOMBIE_14");
	Wld_InsertNpc	(Zombie_OT,	"FP_ROAM_ZOMBIE_15");

	Wld_InsertNpc	(Monster_11055_Skelett_OT, "TPL_386");
	Wld_InsertNpc	(Monster_11056_Skelett_OT, "TPL_386");

	Wld_InsertNpc	(Mod_7797_PSINOV_Novize_OT, "TPL_386");

	B_KillNpc	(Mod_7797_PSINOV_Novize_OT);
};

FUNC VOID INIT_OrcTempel ()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Rat_Ende))
	&& (UrnolWeg == 0)
	{
		UrnolWeg = 1;

		Wld_InsertNpc	(Mod_10039_ORC_UndeadShamane_OT, "TPL_331");
	};

	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	OldLevel(ORCTEMPEL_ZEN);

	if (Mod_Schwierigkeit > 0)
	&& (Mod_Enter_Orktempel_01 == FALSE)
	{	
		Mod_Enter_Orktempel_01 = TRUE;
	};

	if (Kapitel >= 4)
	&& (Mod_Enter_Orktempel_04 == FALSE)
	{	                                    
		Mod_Enter_Orktempel_04 = TRUE;
	}; 
	
};

FUNC VOID STARTUP_AbandonedMine ()
{
	CurrentLevel3 = ABANDONEDMINE_ZEN;

	NameAllFires();
	
	Wld_InsertNpc	(Lurker_Höhle,	"FP_ROAM_MONSTER_01");
	Wld_InsertNpc	(Lurker_Höhle,	"FP_ROAM_MONSTER_02");

	Wld_InsertNpc	(Erzguardian,	"FP_ROAM_VM_LURKER_01");

	Wld_InsertNpc	(Erzguardian,	"FP_ROAM_MONSTER_05");
	Wld_InsertNpc	(Erzguardian,	"FP_ROAM_MONSTER_06");

	Wld_InsertNpc	(Erzguardian,	"FP_ROAM_MONSTER_07");
	Wld_InsertNpc	(Erzguardian,	"FP_ROAM_MONSTER_08");

	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_09");
	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_10");
	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_11");
	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_12");
	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_13");

	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_16");
	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_17");

	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_21");
	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_23");

	Wld_InsertNpc	(Erzguardian_Special_01,	"FP_ROAM_VM_LURKER_08");

	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_26");
	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_27");
	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_28");
	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_29");

	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_34");
	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_35");
	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_36");

	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_42");
	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_43");
	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_44");
	Wld_InsertNpc	(Erznager,	"FP_ROAM_MONSTER_45");
	Wld_InsertNpc	(ErznagerQueen,	"FP_ROAM_MONSTER_41");
			
};

FUNC VOID INIT_AbandonedMine ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	OldLevel(ABANDONEDMINE_ZEN);

	if (Mod_KG_MineSpawn == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Hymir_Hi))
	{
		Mod_KG_MineSpawn = TRUE;

		Wld_InsertNpc	(Mod_7625_KGD_Granmar_VM,	"MINE_GO_07");
	};

	var int Hero_Fackeln;

	Hero_Fackeln = Npc_HasItems(hero, ItLsTorch);
	Npc_RemoveInvItems	(hero, ItLsTorch, Hero_Fackeln);
	CreateInvItems	(hero, ItLsTorch, Hero_Fackeln);

	if (Mod_KG_TrentInMine == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Trent_Shadowbeast))
	{
		Mod_KG_TrentInMine = TRUE;

		Wld_InsertNpc	(Mod_7630_RIT_Trent_VM,	"MINE_GO_07");

		B_StartOtherRoutine	(Mod_7625_KGD_Granmar_VM,	"TRENT");
	};
};

FUNC VOID STARTUP_OldMine ()
{
	CurrentLevel3 = OLDMINE_ZEN;

	NameAllFires();

      	Wld_InsertNpc	(Mod_1031_DMR_Kurgan_OM,	"OM_ENTRANCE");
      	Wld_InsertNpc	(Mod_7798_SMK_Drake_OM,	"OM_ENTRANCE");
      	Wld_InsertNpc	(Mod_7799_SMK_Brandick_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1497_BUD_Aleph_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_7800_SMK_Alberto_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_7801_TPL_GorNaBar_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_7802_TPL_Templer_OM,	"OM_ENTRANCE");

	B_KillNpc	(Mod_1497_BUD_Aleph_OM);
	B_KillNpc	(Mod_7801_TPL_GorNaBar_OM);
	B_KillNpc	(Mod_7802_TPL_Templer_OM);
	
	Wld_InsertNpc	(Mod_1474_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1475_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1476_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1479_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1480_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1481_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1482_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1483_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1484_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1485_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1486_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1487_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1488_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1489_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1490_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1491_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1507_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1493_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1495_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1498_BUD_Grimes_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1500_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1501_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1502_BUD_Buddler_OM,	"OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1505_BUD_Buddler_OM,	"OM_ENTRANCE");

	Wld_InsertNpc	(Mod_1903_SMK_SchwarzerKrieger_OM, "OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1904_SMK_SchwarzerKrieger_OM, "OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1905_SMK_SchwarzerKrieger_OM, "OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1906_SMK_SchwarzerKrieger_OM, "OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1907_SMK_SchwarzerKrieger_OM, "OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1908_SMK_SchwarzerKrieger_OM, "OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1909_SMK_SchwarzerKrieger_OM, "OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1910_SMK_SchwarzerKrieger_OM, "OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1911_SMK_SchwarzerKrieger_OM, "OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1912_SMK_SchwarzerKrieger_OM, "OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1913_SMK_SchwarzerKrieger_OM, "OM_ENTRANCE");
	Wld_InsertNpc	(Mod_1914_SMK_SchwarzerKrieger_OM, "OM_ENTRANCE");
	Wld_InsertNpc	(Mod_7399_DMR_Daemonenritter_OM, "OM_ENTRANCE");

	Wld_InsertNpc	(Orc_Stomper,		"OM_CAVE3_15");
	Wld_InsertNpc	(Orc_Stonemill,		"OM_CAVE1_BELLOWS");

	Wld_InsertNpc	(Minecrawler,		"OM_037");
	Wld_InsertNpc	(Minecrawler,		"OM_033");
	Wld_InsertNpc	(Minecrawler,		"FP_ROAM_CRAWLER04_02");

	Wld_InsertNpc	(Minecrawler,		"OM_030");
	Wld_InsertNpc	(Minecrawler,		"OM_133");
	Wld_InsertNpc	(Minecrawler,		"OM_133");

};

FUNC VOID INIT_OldMine ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	OldLevel(OLDMINE_ZEN);

	if (Mod_Schwierigkeit > 0)
	&& (Mod_Enter_AM_01 == FALSE)
	{
		Mod_Enter_AM_01 = TRUE;
	}; 

	if (Mod_WM_KurganAlarm == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Vatras_Fertig))
	{
		Mod_WM_KurganAlarm = 1;

		B_StartOtherRoutine	(Mod_7399_DMR_Daemonenritter_OM, "ALARM");
		B_StartOtherRoutine	(Mod_1031_DMR_Kurgan_OM, "ALARM");
	};

	if (Mod_AL_Oric == 4)
	{
		Wld_InsertNpc	(Mod_7046_RIT_Ritter_OM, "OM_122");
		Wld_InsertNpc	(Mod_7047_RIT_Ritter_OM, "OM_122");
		Wld_InsertNpc	(Mod_7048_RIT_Ritter_OM, "OM_122");
		Wld_InsertNpc	(Mod_7049_RIT_Ritter_OM, "OM_122");

		Mod_AL_Oric = 5;
	};

	if (Mod_AL_Oric > 5)
	{
		B_RemoveNpc	(Mod_7046_RIT_Ritter_OM);
		B_RemoveNpc	(Mod_7047_RIT_Ritter_OM);
		B_RemoveNpc	(Mod_7048_RIT_Ritter_OM);
		B_RemoveNpc	(Mod_7049_RIT_Ritter_OM);
	};

	B_OM_ARBEIT();
};

FUNC VOID STARTUP_OrcGraveyard()
{
	CurrentLevel3 = ORCGRAVEYARD_ZEN;

	NameAllFires();

	// Zombie-Orkjäger einf?gen

	Wld_InsertNpc	(Zombie_OGY_Orchunter_01,	"GRYD_018");
	Wld_InsertNpc	(Zombie_OGY_Orchunter_02,	"GRYD_024A");
	Wld_InsertNpc	(Zombie_OGY_Orchunter_03,	"GRYD_024");

	// Tote Zombies und untote Orks einf?gen im ersten Raum

	Wld_InsertNpc	(Zombie_OGY_01,	"GRYD_006");
	Wld_InsertNpc	(Zombie_OGY_02,	"GRYD_005");
	Wld_InsertNpc	(Zombie_OGY_03,	"GRYD_013");
	Wld_InsertNpc	(Zombie_OGY_04,	"GRYD_086");
	Wld_InsertNpc	(Zombie_OGY_05,	"GRYD_014");
	Wld_InsertNpc	(Zombie_OGY_06,	"GRYD_016");

	Wld_InsertNpc	(UndeadOrc_OGY_01,	"GRYD_017");
	Wld_InsertNpc	(UndeadOrc_OGY_02,	"GRYD_015");
	Wld_InsertNpc	(UndeadOrc_OGY_03,	"GRYD_012");
	Wld_InsertNpc	(UndeadOrc_OGY_04,	"GRYD_009");

	B_KillNpc	(Zombie_OGY_01);
	B_KillNpc	(Zombie_OGY_02);
	B_KillNpc	(Zombie_OGY_03);
	B_KillNpc	(Zombie_OGY_04);
	B_KillNpc	(Zombie_OGY_05);
	B_KillNpc	(Zombie_OGY_06);

	B_KillNpc	(UndeadOrc_OGY_01);
	B_KillNpc	(UndeadOrc_OGY_02);
	B_KillNpc	(UndeadOrc_OGY_03);
	B_KillNpc	(UndeadOrc_OGY_04);

	// Zombies, untote Orks und den Shamanen im zweiten Raum

	Wld_InsertNpc	(Mod_10033_ORC_UndeadShamane_OGY, "GRYD_020");

	Wld_InsertNpc	(Zombie_OGY_Templer_01, "GRYD_019");	
	Wld_InsertNpc	(Zombie_OGY_01, "GRYD_019");	
	Wld_InsertNpc	(Zombie_OGY_02, "GRYD_019");	

	Wld_InsertNpc	(Zombie_OGY_Templer_01, "GRYD_019");
	Wld_InsertNpc	(Zombie_OGY_Templer_02, "GRYD_019");	

	Wld_InsertNpc	(UndeadOrcWarrior, "GRYD_019");
	Wld_InsertNpc	(UndeadOrcWarrior, "GRYD_019");

	// Zombies und untote Orks im vierten Raum

	Wld_InsertNpc	(Zombie_OGY_Templer_01, "GRYD_025");
	Wld_InsertNpc	(Zombie_OGY_Templer_03, "GRYD_025");
	Wld_InsertNpc	(Zombie_OGY_Templer_04, "GRYD_025");	

	Wld_InsertNpc	(UndeadOrcWarrior, "GRYD_025");
	Wld_InsertNpc	(UndeadOrcWarrior, "GRYD_025");
	Wld_InsertNpc	(UndeadOrcWarrior, "GRYD_025");

	// In der rechten unteren Kammer

	Wld_InsertNpc	(Mod_7258_TPL_Templer_OGY,	"GRYD_034");
	Wld_InsertNpc	(Mod_7259_SLD_Orkjaeger_OGY,	"GRYD_034");
	Wld_InsertNpc	(Mod_7260_SLD_Orkjaeger_OGY,	"GRYD_034");
	Wld_InsertNpc	(Mod_7533_SLD_Rod_OGY,	"GRYD_034");
	Wld_InsertNpc	(UndeadOrcWarrior,	"GRYD_034");

	// In der linken unteren Kammer

	Wld_InsertNpc	(UndeadOrcWarrior,	"GRYD_046");
	Wld_InsertNpc	(UndeadOrcWarrior,	"GRYD_047");

	Wld_InsertNpc	(Skeleton,	"GRYD_046");
	Wld_InsertNpc	(Skeleton,	"GRYD_047");
	Wld_InsertNpc	(Skeleton,	"GRYD_047");

	// Große Kammer mit Barriere

	Wld_InsertNpc	(Mod_7261_PSINOV_Novize_OGY,	"GRYD_054");
	Wld_InsertNpc	(Mod_7262_PSINOV_Novize_OGY,	"GRYD_054");
	Wld_InsertNpc	(Mod_7263_PSINOV_Novize_OGY,	"GRYD_054");
	Wld_InsertNpc	(Mod_7264_PSINOV_Novize_OGY,	"GRYD_054");
	Wld_InsertNpc	(Mod_7265_GUR_BaalTavor_OGY,	"GRYD_054");

	Wld_InsertNpc	(UndeadOrcWarrior_Geiselwache_01,	"GRYD_054");
	Wld_InsertNpc	(UndeadOrcWarrior_Geiselwache_02,	"GRYD_054");
	Wld_InsertNpc	(UndeadOrcWarrior_Geiselwache_03,	"GRYD_054");
	Wld_InsertNpc	(UndeadOrcWarrior_Geiselwache_04,	"GRYD_054");
	Wld_InsertNpc	(UndeadOrcWarrior_Geiselwache_05,	"GRYD_054");
	Wld_InsertNpc	(UndeadOrcWarrior_Geiselwache_06,	"GRYD_054");

	// Kammer von Baal Lukor

	Wld_InsertNpc	(Mod_7266_GUR_BaalLukor_OGY,	"GRYD_082");

	// Irgendwo vorher

	Wld_InsertNpc	(Mod_7770_PSINOV_Nyras_OGY,	"GRYD_054");
};

FUNC VOID INIT_OrcGraveyard ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	OldLevel(ORCGRAVEYARD_ZEN);

	if (Mod_Schwierigkeit > 0)
	&& (Mod_Enter_Orkfriedhof_01 == FALSE)
	{
		Mod_Enter_Orkfriedhof_01 = TRUE;
	}; 
};

FUNC VOID STARTUP_FreeMine()
{
	CurrentLevel3 = FREEMINE_ZEN;

	NameAllFires();

	// S?ldner und Sch?rfer

     	Wld_InsertNpc	(Mod_1565_SLD_Soeldner_FM,	"FM_RESCUE");	
	Wld_InsertNpc	(Mod_1566_SLD_Soeldner_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1567_SLD_Soeldner_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1582_SFB_Bert_FM,	"FM_RESCUE");

	Wld_InsertNpc	(Mod_1585_SFB_Schuerfer_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1586_SFB_Schuerfer_FM,	"FM_RESCUE");

	Wld_InsertNpc	(Mod_1587_SFB_Schuerfer_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1588_SFB_Schuerfer_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1589_SLD_Soeldner_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1590_SLD_Endolf_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1591_SLD_Soeldner_FM,	"FM_RESCUE");

	Wld_InsertNpc	(Mod_1592_SLD_Soeldner_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1593_SLD_Soeldner_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1594_SLD_Soeldner_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1595_SLD_Soeldner_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1596_SLD_Soeldner_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1597_SLD_Soeldner_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1598_SLD_Soeldner_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1599_SLD_Soeldner_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1600_SLD_Soeldner_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1601_SLD_Soeldner_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1602_SLD_Soeldner_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1603_SLD_Soeldner_FM,	"FM_RESCUE");
	Wld_InsertNpc	(Mod_1604_SLD_Soeldner_FM,	"FM_RESCUE");

	// Crawler

	Wld_InsertNpc	(MinecrawlerWarrior_Undead, "FP_ROAM_CRAWLER_01");
	Wld_InsertNpc	(MinecrawlerWarrior_Undead, "FP_ROAM_CRAWLER_04");
	Wld_InsertNpc	(MinecrawlerWarrior_Undead, "FP_ROAM_CRAWLER_05");
	Wld_InsertNpc	(MinecrawlerWarrior_Undead, "FP_ROAM_CRAWLER_06");
	Wld_InsertNpc	(MinecrawlerWarrior_Undead, "FP_ROAM_CRAWLER_09");
	Wld_InsertNpc	(MinecrawlerWarrior_Undead, "FP_ROAM_CRAWLER_14");
	Wld_InsertNpc	(MinecrawlerWarrior_Undead, "FP_ROAM_CRAWLER_17");
	Wld_InsertNpc	(MinecrawlerWarrior_Undead, "FP_ROAM_CRAWLER_29");
	Wld_InsertNpc	(MinecrawlerWarrior_Undead, "FP_ROAM_CRAWLER_28");
	Wld_InsertNpc	(MinecrawlerWarrior_Undead, "FP_ROAM_CRAWLER_32");
	Wld_InsertNpc	(MinecrawlerWarrior_Undead, "FP_ROAM_CRAWLER_34");

	// Kobold

	Wld_InsertNpc	(Gormgniez_11007_FM,	"FM_RESCUE");

	// Zombie - Sch?rfer

	Wld_InsertNpc	(Zombie_11015_FM, "FM_182");
	Wld_InsertNpc	(Zombie_11016_FM, "FM_182");
	Wld_InsertNpc	(Zombie_11017_FM, "FM_182");
	Wld_InsertNpc	(Zombie_11018_FM, "FM_182");
};

FUNC VOID INIT_FreeMine()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();

	OldLevel(FREEMINE_ZEN);

	B_FM_ARBEIT();
};

FUNC VOID STARTUP_GdG_World()
{
	CurrentLevel3 = GDG_WORLD_ZEN;

	NameAllFires();

        Wld_InsertNpc	(Mod_7538_OUT_Trimedron_GDG, "WIL_LICHTUNG01_04");

	// Wasserorks

	Wld_InsertNpc	(WaterOrc,	"WIL_LAGEREINGANG_04");
	Wld_InsertNpc	(WaterOrc,	"WIL_AUSSEN_07");
	Wld_InsertNpc	(WaterOrc,	"WIL_ZUMSTRAND_02_11");
	Wld_InsertNpc	(WaterOrc,	"WIL_ZULAGERERN_07");

	// Wei?e Tiger

	Wld_InsertNpc	(Tiger_Weiß,	"WIL_AUSSEN_04");
	Wld_InsertNpc	(Tiger_Weiß,	"WIL_AUSSEN_01");
	Wld_InsertNpc	(Tiger_Weiß,	"WIL_NACHRICHT_04");
	Wld_InsertNpc	(Tiger_Weiß,	"WIL_SCAVANGER_09");

	// Silbertrolle

	Wld_InsertNpc	(Troll_Silber,	"WIL_ZUMSTRAND_02_01");
	Wld_InsertNpc	(Troll_Silber,	"WIL_NACHRICHT_06");
	Wld_InsertNpc	(Troll_Silber,	"WIL_WALD_03");
	Wld_InsertNpc	(Troll_Silber,	"WIL_LICHTUNG_02_SPAWN_01");

	// Lindw?rmer

	Wld_InsertNpc	(Lindwurm,	"WIL_LURKER_12");
	Wld_InsertNpc	(Lindwurm,	"WIL_GUERTEL_02");
	Wld_InsertNpc	(Lindwurm,	"WIL_LURKER_07");
	Wld_InsertNpc	(Lindwurm,	"WIL_FISCH_03");
};

var int Monster_GDG_Spawned;

FUNC VOID INIT_GdG_World()
{
	if (Monster_GDG_Spawned == FALSE)
	{
		Monster_GDG_Spawned = TRUE;
	};

	if (AUFSUCHENACHSEELENSTEINE == 2)
	{
		AUFSUCHENACHSEELENSTEINE = 3;

		Wld_InsertNpc		(Mod_843_DMB_Xardas_GDG,		"LGR_EINGANG_01");
		Wld_InsertNpc		(Mod_6000_DMR_Gomez_GDG,		"LGR_EINGANG_01");
		Wld_InsertNpc		(Mod_6001_DMR_Raven_GDG,		"LGR_EINGANG_01");
		Wld_InsertNpc		(Mod_6002_KDF_Pyrokar_GDG,		"LGR_EINGANG_01");
		Wld_InsertNpc		(Mod_6003_KDW_Saturas_GDG,		"LGR_EINGANG_01");
		Wld_InsertNpc		(Mod_6005_PAL_Hagen_GDG,		"LGR_EINGANG_01");
		Wld_InsertNpc		(Mod_6006_SLD_Lee_GDG,			"LGR_EINGANG_01");
		Wld_InsertNpc		(Mod_7442_SLD_Torlof_GDG,		"LGR_EINGANG_01");	
		Wld_InsertNpc		(Mod_6007_DMB_Andokai_GDG,		"LGR_EINGANG_01");
		Wld_InsertNpc		(Mod_6008_DMB_Karras_GDG,		"LGR_EINGANG_01");
		Wld_InsertNpc		(Mod_6010_KDW_Vatras_GDG,		"LGR_EINGANG_01");
		Wld_InsertNpc		(Mod_6009_KDF_Ulthar_GDG,		"LGR_EINGANG_01");
		Wld_InsertNpc		(Mod_6011_KDF_Serpentes_GDG,		"LGR_EINGANG_01");
	};

	OldLevel(GDG_WORLD_ZEN);

	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();	
};

FUNC VOID STARTUP_DieInsel()
{
	CurrentLevel3 = DIEINSEL_ZEN;

	NameAllFires();

        // Piraten

	Wld_InsertNpc	(Mod_1540_PIR_Skip_DI,		"WP_DI_SKIP_WAITFORPLAYER");
	Wld_InsertNpc	(Mod_1541_PIR_Greg_DI,		"WP_DI_SKIP_WAITFORPLAYER");
	Wld_InsertNpc	(Mod_1542_PIR_AlligatorJack_DI,		"WP_DI_SKIP_WAITFORPLAYER");
	Wld_InsertNpc	(Mod_1543_PIR_Garett_DI,		"WP_DI_SKIP_WAITFORPLAYER");
	Wld_InsertNpc	(Mod_1544_PIR_Bones_DI,		"WP_DI_SKIP_WAITFORPLAYER");
	Wld_InsertNpc	(Mod_1545_PIR_Brandon_DI,		"WP_DI_SKIP_WAITFORPLAYER");
	Wld_InsertNpc	(Mod_1546_PIR_Francis_DI,		"WP_DI_SKIP_WAITFORPLAYER");
	Wld_InsertNpc	(Mod_1547_PIR_Henry_DI,		"WP_DI_SKIP_WAITFORPLAYER");
	Wld_InsertNpc	(Mod_1548_PIR_Samuel_DI,		"WP_DI_SKIP_WAITFORPLAYER");
	Wld_InsertNpc	(Mod_1549_PIR_Malcom_DI,		"WP_DI_SKIP_WAITFORPLAYER");
	Wld_InsertNpc	(Mod_1550_PIR_Matt_DI,		"WP_DI_SKIP_WAITFORPLAYER");
	Wld_InsertNpc	(Mod_1551_PIR_Morgan_DI,		"WP_DI_SKIP_WAITFORPLAYER");

	// Zombies

	Wld_InsertNpc	(Mod_1552_SKE_Skelett_DI,	"FP_STAND_DI_SKELETON_DEMENTOR");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_01_ZOMBIE_01");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_01_ZOMBIE_03");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_01_ZOMBIE_04");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_01_ZOMBIE_06");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_01_ZOMBIE_07");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_01_ZOMBIE_08");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_01_ZOMBIE_10");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_01_ZOMBIE_11");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_01_ZOMBIE_12");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_01_ZOMBIE_14");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_01_ZOMBIE_15");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_01_ZOMBIE_16");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_02_ZOMBIE_01");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_02_ZOMBIE_02");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_02_ZOMBIE_03");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_02_ZOMBIE_05");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_02_ZOMBIE_06");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_02_ZOMBIE_07");
	Wld_InsertNpc	(Zombie_Pirat,		"FP_ROAM_DI_HOEHLE_02_ZOMBIE_09");
};

FUNC VOID INIT_DieInsel()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();

	OldLevel(DIEINSEL_ZEN);

	if (Mod_Schwierigkeit > 0)
	&& (Mod_Enter_Schatzinsel_01 == FALSE)
	{
		Mod_Enter_Schatzinsel_01 = TRUE;
	};
};

FUNC VOID STARTUP_OrcCity()
{
	CurrentLevel3 = ORCCITY_ZEN;

	NameAllFires();
};

FUNC VOID INIT_OrcCity()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();

	if (Mod_HoshPakInOC == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Ranad_WasHier))
	{
		Mod_HoshPakInOC = 1;

		Wld_InsertNpc	(Mod_10005_Orc_HoshPak_OC,	"WP_OCC_01");
		Wld_InsertNpc	(Mod_10007_Orc_Ranad_OC,	"WP_OCC_35");
	};

	OldLevel(ORCCITY_ZEN); 

	if (Mod_AlbertTransforms == 1)
	{
		Wld_InsertNpc	(Mod_7178_VMG_Albert_OC, "WP_OCC_257");

		Mod_AlbertTransforms = 2;
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Albert_FluchtHappy))
	&& (Mod_BDT_OrcCity_Leer == 0)
	{
		Mod_BDT_OrcCity_Leer = 1;

		B_RemoveNpc	(Mod_7186_BDT_Morgahard_OC);
		B_RemoveNpc	(Mod_7179_BDT_Bandit_OC);
		B_RemoveNpc	(Mod_7180_BDT_Skinner_OC);
		B_RemoveNpc	(Mod_7183_BDT_Miguel_OC);
		B_RemoveNpc	(Mod_7182_BDT_Juan_OC);
		B_RemoveNpc	(Mod_7184_BDT_Esteban_OC);
		B_RemoveNpc	(Mod_7181_BDT_Logan_OC);
		B_RemoveNpc	(Mod_7185_BDT_Bandit_OC);
		B_RemoveNpc	(Mod_7178_VMG_Albert_OC);
	};
};

FUNC VOID STARTUP_Xeres_Endlevel()
{
	CurrentLevel3 = XERESWELT_ZEN;

	NameAllFires();

	Wld_InsertNpc	(PC_Friend_XW, "TOT");
	Wld_InsertNpc	(Monster_11075_Daemonenfuerst_XW, "TOT");
};

FUNC VOID INIT_Xeres_Endlevel()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();

	OldLevel(XERESWELT_ZEN);

	if (Mod_XW_Kap6 == 1)
	{
		Mod_XW_Kap6 = 2;

		Wld_InsertNpc	(Mod_7763_RDW_Diego_XW, "ARENA_01");
		Wld_InsertNpc	(Mod_7764_PSINOV_Lester_XW, "ARENA_01");
		Wld_InsertNpc	(Mod_7765_SLD_Gorn_XW, "ARENA_01");
		Wld_InsertNpc	(Mod_7766_KDF_Milten_XW, "ARENA_01");

		Wld_InsertNpc	(Hauertroll_XW_01,	"ARENA_04");
		Wld_InsertNpc	(Shadowbeast_XW_01,	"ARENA_04");
	};
};

FUNC VOID STARTUP_DragonIsland()
{
	CurrentLevel3 = DRAGONISLAND_ZEN;

	NameAllFires();

	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_45");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_03");
	Wld_InsertNpc	(Skeleton, "FP_ROAM_DI_ORK_04");
	Wld_InsertNpc	(Skeleton, "FP_ROAM_DI_ORK_44");
	Wld_InsertNpc	(Skeleton, "FP_ROAM_DI_ORK_02");
	Wld_InsertNpc	(SkeletonMage, "FP_ROAM_DI_ORK_01");
	Wld_InsertNpc	(SkeletonMage, "FP_ROAM_DI_ORK_05");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_40");
	Wld_InsertNpc	(Skeleton, "FP_ROAM_DI_ORK_41");
	Wld_InsertNpc	(Skeleton, "FP_ROAM_DI_ORK_06");
	Wld_InsertNpc	(Skeleton, "FP_ROAM_DI_ORK_07");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_ORK_09");
	Wld_InsertNpc	(Skeleton, "FP_ROAM_DI_ORK_11");
	Wld_InsertNpc	(SkeletonMage, "FP_ROAM_DI_ORK_10");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_39");
	Wld_InsertNpc	(Skeleton, "FP_ROAM_DI_ORK_08");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_25");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_37");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_34");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_35");
	Wld_InsertNpc	(SkeletonMage, "FP_ITEM_DI_ENTER_01");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_36");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_31");
	Wld_InsertNpc	(SkeletonMage, "FP_ROAM_DI_ORK_30");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_33");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_32");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_14");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_17");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_16");
	Wld_InsertNpc	(SkeletonMage, "FP_ROAM_DI_ORK_15");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_28A");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_ORK_28");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_ORK_28B");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_29A");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_29");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_20");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_21");
	Wld_InsertNpc	(SkeletonMage, "FP_ITEM_DI_ENTER_02");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_18");
	Wld_InsertNpc	(SkeletonMage, "FP_ROAM_DI_ORK_19");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_ORK_23");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_ORK_22");
	Wld_InsertNpc	(SkeletonMage, "FP_ROAM_DI_ORK_24");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_26");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ROAM_DI_ORK_27");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ITEM_DI_ENTER_06");
	Wld_InsertNpc	(Skeleton_Lord, "FP_CAMPFIRE_DI_ORK_01");
	Wld_InsertNpc	(SkeletonWarrior, "FP_ITEM_DI_ENTER_07");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_02");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_01");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_04");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_03");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_05");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_08");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_07");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_06");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_10");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ITEM_DI_ENTER_08");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_09");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_13");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_11");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ITEM_DI_ENTER_09");
	Wld_InsertNpc	(Skeleton_Lord, "FP_PICK_DI_FIREHORT_02");
	Wld_InsertNpc	(Skeleton_Lord, "FP_PICK_DI_FIREHORT_01");
	Wld_InsertNpc	(Skeleton_Lord, "FP_PICK_DI_FIREHORT_03");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_23");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_22");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_17");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ITEM_DI_ENTER_10");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_12");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_19");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_16");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_20");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_21");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_14");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_15");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_24");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_25");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_24");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_DRACONIAN_18");
	Wld_InsertNpc	(Dragon_Undead_Mini, "DI_DRACONIANAREA_17");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_SKELETTE_07");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_SKELETTE_08");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_SKELETTE_05");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_SKELETTE_03");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_SKELETTE_04");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_SKELETTE_01");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_SKELETTE_02");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_ARCHOL_SKELETON_06");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_ARCHOL_SKELETON_02");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_ARCHOL_SKELETON_01");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_ARCHOL");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_ARCHOL_SKELETON_04");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_ARCHOL_SKELETON_03");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_ARCHOL_SKELETON_05");
	Wld_InsertNpc	(Skeleton_Lord, "WP_DRAGONISLAND_UNDEAD_04_01");
	Wld_InsertNpc	(Skeleton_Lord, "WP_DRAGONISLAND_UNDEAD_04_02");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_MARIOSSKELETONS_01");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_MARIOSSKELETONS_02");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_MARIOSSKELETONS_04");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_DI_MARIOSSKELETONS_03");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_UNDEAD_SPAWN_POINT_02_01");
	Wld_InsertNpc	(Skeleton_Lord, "FP_SIT_UNDEAD_SPAWN_POINT_02_01");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_UNDEAD_SPAWN_POINT_02_01");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_UNDEAD_SPAWN_POINT_02_01");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_LEFT_UP_08");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_LEFT_UP_07");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_LEFT_UP_09");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_LEFT_UP_06");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_LEFT_UP_03");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_LEFT_UP_05");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_LEFT_UP_02");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_LEFT_UP_01");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_LEFT_UP_04");
	Wld_InsertNpc	(Skeleton_Lord, "WP_EVT_RIGHT_UP_02_SPAWN_SKEL_03");
	Wld_InsertNpc	(Skeleton_Lord, "WP_EVT_RIGHT_UP_02_SPAWN_SKEL_01");
	Wld_InsertNpc	(Skeleton_Lord, "WP_UNDEAD_RIGHT_UP_03");
	Wld_InsertNpc	(Skeleton_Lord, "WP_EVT_RIGHT_UP_02_SPAWN_SKEL_02");
	Wld_InsertNpc	(Skeleton_Lord, "WP_EVT_RIGHT_DOWN_01_SPAWN_SKEL_02");
	Wld_InsertNpc	(Skeleton_Lord, "WP_EVT_RIGHT_DOWN_01_SPAWN_SKEL_01");
	Wld_InsertNpc	(Skeleton_Lord, "WP_UNDEAD_RIGHT_DOWN_03");
	Wld_InsertNpc	(Skeleton_Lord, "WP_EVT_RIGHT_DOWN_01_SPAWN_SKEL_03");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_UNDEAD_SPAWN_POINT_01_02");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_UNDEAD_SPAWN_POINT_01_01");
	Wld_InsertNpc	(Skeleton_Lord, "WP_UNDEAD_SPAWN_POINT_01");
	Wld_InsertNpc	(Skeleton_Lord, "FP_ROAM_UNDEAD_SPAWN_POINT_01_03");
	Wld_InsertNpc	(Skeleton_Lord, "FP_STAND_DI_UNDEADDRAGONTEMPEL_01");
	Wld_InsertNpc	(Skeleton_Lord, "FP_STAND_DI_UNDEADDRAGONTEMPEL_02");
	Wld_InsertNpc	(Skeleton_Lord, "FP_STAND_DI_UNDEADDRAGONTEMPEL_04");
	Wld_InsertNpc	(Skeleton_Lord, "FP_STAND_DI_UNDEADDRAGONTEMPEL_03");
	Wld_InsertNpc	(Dragon_Undead_Mini, "FP_STAND_DI_UNDEADDRAGONTEMPEL_05");
	Wld_InsertNpc	(Skeleton_Lord, "FP_STAND_DI_UNDEADDRAGONTEMPEL_08");
	Wld_InsertNpc	(Skeleton_Lord, "FP_STAND_DI_UNDEADDRAGONTEMPEL_06");
	Wld_InsertNpc	(Skeleton_Lord, "FP_STAND_DI_UNDEADDRAGONTEMPEL_07");
	Wld_InsertNpc	(Skeleton_Lord, "FP_STAND_DI_UNDEADDRAGONTEMPEL_12");
	Wld_InsertNpc	(Skeleton_Lord, "FP_STAND_DI_UNDEADDRAGONTEMPEL_13");
	Wld_InsertNpc	(Skeleton_Lord, "FP_STAND_DI_UNDEADDRAGONTEMPEL_11");
	Wld_InsertNpc	(Skeleton_Lord, "FP_STAND_DI_UNDEADDRAGONTEMPEL_10");
	Wld_InsertNpc	(Skeleton_Lord, "FP_STAND_DI_UNDEADDRAGONTEMPEL_09");
	Wld_InsertNpc	(Skeleton_Lord_Ghost, "DI_UNDEADDRAGON_01");
	Wld_InsertNpc	(Skeleton_Lord_Ghost, "DI_UNDEADDRAGON_02");
	Wld_InsertNpc	(Skeleton_Lord_Ghost, "DI_UNDEADDRAGON_13");
	Wld_InsertNpc	(Skeleton_Lord_Ghost, "DI_UNDEADDRAGON_10");
	Wld_InsertNpc	(Skeleton_Lord_Ghost, "DI_UNDEADDRAGON_09");
	Wld_InsertNpc	(Skeleton_Lord_Ghost, "DI_UNDEADDRAGON_07");
	Wld_InsertNpc	(Skeleton_Lord_Ghost, "DI_UNDEADDRAGON_06");
	Wld_InsertNpc	(Skeleton_Lord_Ghost, "DI_UNDEADDRAGON_05");

	Wld_InsertNpc	(Dragon_Undead,		"DI_UNDEADDRAGON");
};

FUNC VOID INIT_DragonIsland()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();

	OldLevel(DRAGONISLAND_ZEN); 

	// Crew spawnen

	if (Mod_DiegoDabei == 1)
	{
		Wld_InsertNpc	(Mod_7442_RDW_Diego_IR, "SHIP");

		Mod_DiegoDabei = 2;
	};
	if (Mod_RandolphDabei == 1)
	{
		Wld_InsertNpc	(Mod_7527_BAU_Randolph_IR, "SHIP");

		Mod_RandolphDabei = 2;
	};
	if (Mod_MiltenDabei == 1)
	{
		Wld_InsertNpc	(Mod_7443_KDF_Milten_IR, "SHIP");

		Mod_MiltenDabei = 2;
	};
	if (Mod_GornDabei == 1)
	{
		Wld_InsertNpc	(Mod_7444_SLD_Gorn_IR, "SHIP");

		Mod_GornDabei = 2;
	};
	if (Mod_LesterDabei == 2)
	{
		Wld_InsertNpc	(Mod_7445_PSINOV_Lester_IR, "SHIP");

		Mod_LesterDabei = 3;
	};
	if (Mod_RavenDabei == 1)
	{
		Wld_InsertNpc	(Mod_7446_DMR_Raven_IR, "SHIP");

		Mod_RavenDabei = 2;
	};
	if (Mod_MyxirDabei == 2)
	{
		Wld_InsertNpc	(Mod_7448_KDS_Myxir_IR, "SHIP");

		Mod_MyxirDabei = 3;
	};
	if (Mod_VatrasDabei == 1)
	{
		Wld_InsertNpc	(Mod_7449_KDW_Vatras_IR, "SHIP");

		Mod_VatrasDabei = 2;
	};
	if (Mod_EthanDabei == 1)
	{
		Wld_InsertNpc	(Mod_7450_HTR_Ethan_IR, "SHIP");

		Mod_EthanDabei = 2;
	};
	if (Mod_TengronDabei == 1)
	{
		Wld_InsertNpc	(Mod_7451_RIT_Tengron_IR, "SHIP");

		Mod_TengronDabei = 2;
	};
	if (Mod_CordDabei == 1)
	{
		Wld_InsertNpc	(Mod_7452_SLD_Cord_IR, "SHIP");

		Mod_CordDabei = 2;
	};
	if (Mod_BennetDabei == 2)
	{
		Wld_InsertNpc	(Mod_7453_NONE_Bennet_IR, "SHIP");

		Mod_BennetDabei = 3;
	};
	if (Mod_AngarDabei == 2)
	{
		Wld_InsertNpc	(Mod_7455_TPL_Angar_IR, "SHIP");

		Mod_AngarDabei = 3;
	};
	if (Mod_NamibDabei == 2)
	{
		Wld_InsertNpc	(Mod_7457_GUR_BaalNamib_IR, "SHIP");

		Mod_NamibDabei = 3;
	};
	if (Mod_JackDabei == 1)
	{
		Wld_InsertNpc	(Mod_7458_NONE_Jack_IR, "SHIP");

		Mod_JackDabei = 2;
	};
	if (Mod_SagittaDabei == 1)
	{
		Wld_InsertNpc	(Mod_7459_NONE_Sagitta_IR, "SHIP");

		Mod_SagittaDabei = 2;
	};
	if (Mod_CedricDabei == 1)
	{
		Wld_InsertNpc	(Mod_7460_RIT_Cedric_IR, "SHIP");

		Mod_CedricDabei = 2;
	};
	if (Mod_KerolothDabei == 1)
	{
		Wld_InsertNpc	(Mod_7463_RIT_Keroloth_IR, "SHIP");

		Mod_KerolothDabei = 2;
	};
	if (Mod_MarcosDabei == 1)
	{
		Wld_InsertNpc	(Mod_7461_RIT_Marcos_IR, "SHIP");

		Mod_MarcosDabei = 2;
	};
	if (Mod_GeroldDabei == 1)
	{
		Wld_InsertNpc	(Mod_7462_RIT_Gerold_IR, "SHIP");

		Mod_GeroldDabei = 2;
	};
	if (Mod_BonesDabei == 2)
	{
		Wld_InsertNpc	(Mod_7464_PIR_Bones_IR, "SHIP");

		Mod_BonesDabei = 3;
	};
	if (Mod_CassiaDabei == 1)
	{
		Wld_InsertNpc	(Mod_7465_NONE_Cassia_IR, "SHIP");

		Mod_CassiaDabei = 2;
	};
	if (Mod_UrielaDabei == 1)
	{
		Wld_InsertNpc	(Mod_7467_HEX_Uriela_IR, "SHIP");

		Mod_UrielaDabei = 2;
	};
	if (Mod_VelayaDabei == 1)
	{
		Wld_InsertNpc	(Mod_7468_BAU_Velaya_IR, "SHIP");

		Mod_VelayaDabei = 2;
	};

	if (Mod_Irdorath == 0)
	{
		Mod_Irdorath = 1;

		Mod_IR_Light01_Pos = 3;
		Mod_IR_Light02_Pos = 6;

		Wld_InsertItem	(IR_RedLight_01, "FP_ITEM_LIGHT_01");
		Wld_InsertItem	(IR_RedLight_02, "FP_ITEM_LIGHT_02");
		Wld_InsertItem	(IR_BlueLight_03, "FP_ITEM_LIGHT_03");
		Wld_InsertItem	(IR_RedLight_04, "FP_ITEM_LIGHT_04");
		Wld_InsertItem	(IR_RedLight_05, "FP_ITEM_LIGHT_05");
		Wld_InsertItem	(IR_BlueLight_06, "FP_ITEM_LIGHT_06");
		Wld_InsertItem	(IR_RedLight_07, "FP_ITEM_LIGHT_07");
		Wld_InsertItem	(IR_RedLight_08, "FP_ITEM_LIGHT_08");
	};
};

FUNC VOID STARTUP_Schiffschlacht()
{
	CurrentLevel3 = SCHIFFSCHLACHT_ZEN;

	NameAllFires();

	// Piraten

	Wld_InsertNpc	(Mod_1620_PIR_Morgan_SS,	"WP_SS_START");
	Wld_InsertNpc	(Mod_1609_PIR_Skip_SS,	"WP_SS_START");
	Wld_InsertNpc	(Mod_1610_PIR_Greg_SS,	"WP_SS_START");
	Wld_InsertNpc	(Mod_1611_PIR_Henry_SS,	"WP_SS_START");
	Wld_InsertNpc	(Mod_1612_PIR_Matt_SS,	"WP_SS_START");
	Wld_InsertNpc	(Mod_1613_PIR_AlligatorJack_SS,	"WP_SS_START");
	Wld_InsertNpc	(Mod_1614_PIR_Garett_SS,	"WP_SS_START");
	Wld_InsertNpc	(Mod_1615_PIR_Bones_SS,	"WP_SS_START");
	Wld_InsertNpc	(Mod_1616_PIR_Francis_SS,	"WP_SS_START");
	Wld_InsertNpc	(Mod_1617_PIR_Brandon_SS,	"WP_SS_START");
	Wld_InsertNpc	(Mod_1618_PIR_Samuel_SS,	"WP_SS_START");
	Wld_InsertNpc	(Mod_1619_PIR_Malcom_SS,	"WP_SS_START");

	// Orkse

	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_01");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_02");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_03");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_04");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_07");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_08");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_09");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_10");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_11");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_12");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_13");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_14");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_15");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_16");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_19");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_20");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_21");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_22");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_23");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_24");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_26");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_27");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_28");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_29");
	Wld_InsertNpc	(SchiffOrk,		"FP_ROAM_SS_ORK_30");

	Wld_InsertNpc	(SchiffOrk_Berserker,	"FP_ROAM_SS_ORK_25");

	Wld_SetTime	(04,00);
};

FUNC VOID INIT_Schiffschlacht()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();

	OldLevel(SCHIFFSCHLACHT_ZEN);

	StartRain();
};

FUNC VOID STARTUP_FEUERMAGIER_SURFACE()
{
	CurrentLevel3 = PATHERION_ZEN;

	NameAllFires();

	// Monster
	Wld_InsertNpc	(Scavenger_Demon, "FP_ROAM_SCAV_01");
	Wld_InsertNpc	(Scavenger_Demon, "FP_ROAM_SCAV_02");
	Wld_InsertNpc	(Scavenger_Demon, "FP_ROAM_SCAV_03");
	Wld_InsertNpc	(Scavenger_Demon, "FP_ROAM_SCAV_04");
	Wld_InsertNpc	(Scavenger_Demon, "FP_ROAM_SCAV_05");
	Wld_InsertNpc	(Scavenger_Demon, "FP_ROAM_SCAV_06");
	Wld_InsertNpc	(Scavenger_Demon, "FP_ROAM_SCAV_10");
	Wld_InsertNpc	(Scavenger_Demon, "FP_ROAM_SCAV_11");
	Wld_InsertNpc	(Scavenger_Demon, "FP_ROAM_SCAV_12");
	Wld_InsertNpc	(Scavenger_Demon, "FP_ROAM_SCAV_13");
	Wld_InsertNpc	(Scavenger_Demon, "FP_ROAM_SCAV_14");
	Wld_InsertNpc	(Scavenger_Demon, "FP_ROAM_SCAV_16");
	Wld_InsertNpc	(Scavenger_Demon, "FP_ROAM_SCAV_17");

	Wld_InsertNpc	(Wisp,	"FP_ROAM_IRRLICHT_01");

	// Höhle
	Wld_InsertNpc	(Kristallminecrawler, "FP_ROAM_CRAWLER_24");
	Wld_InsertNpc	(Kristallminecrawler, "FP_ROAM_CRAWLER_07");
	Wld_InsertNpc	(Kristallminecrawler, "FP_ROAM_CRAWLER_06");
	Wld_InsertNpc	(Kristallminecrawler, "FP_ROAM_CRAWLER_04");
	Wld_InsertNpc	(Kristallminecrawler, "FP_ROAM_CRAWLER_02");
	Wld_InsertNpc	(Kristallminecrawler, "FP_ROAM_CRAWLER_09");
	Wld_InsertNpc	(Kristallminecrawler, "FP_ROAM_CRAWLER_11");
	Wld_InsertNpc	(Kristallminecrawler, "FP_ROAM_CRAWLER_13");
	Wld_InsertNpc	(Kristallminecrawler, "FP_ROAM_CRAWLER_16");
	Wld_InsertNpc	(Kristallminecrawler, "FP_ROAM_CRAWLER_22");
	Wld_InsertNpc	(Kristallminecrawler, "FP_ROAM_CRAWLER_21");
	Wld_InsertNpc	(Kristallminecrawler, "FP_ROAM_CRAWLER_17");

	// Fokuswächter
	Wld_InsertNpc	(Demon_PAT_01,		"FP_ROAM_DEMON_MUT_FOKUS");
	Wld_InsertNpc	(Demon_PAT_02,		"FP_ROAM_DEMON_MUT_FOKUS");
	Wld_InsertNpc	(Mod_7794_KDS_SchwarzerMagier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_7795_SNOV_Novize_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_7796_HEX_Hexe_PAT,	"WP_PAT_START");

	// Schwarzis
	Wld_InsertNpc	(Mod_1600_SMK_SchwarzerKrieger_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1601_SMK_Blackknight_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1602_SMK_Blackknight_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1603_SMK_SchwarzerKrieger_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1604_SMK_SchwarzerKrieger_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1700_SMK_SchwarzerKrieger_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1701_SMK_SchwarzerKrieger_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1703_KDS_SchwarzerMagier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1704_KDS_SchwarzerMagier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1705_SMK_SchwarzerKrieger_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1706_SMK_Blackknight_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1707_SMK_Blackknight_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1708_SMK_SchwarzerKrieger_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1709_SMK_SchwarzerKrieger_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1710_SMK_SchwarzerKrieger_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1711_KDS_SchwarzerMagier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1712_KDS_SchwarzerMagier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1713_KDS_SchwarzerMagier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1714_KDS_SchwarzerMagier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1715_KDS_SchwarzerMagier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1716_KDS_SchwarzerMagier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1717_KDS_SchwarzerMagier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1721_KDS_SchwarzerMagier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1719_KDS_SchwarzerMagier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1720_KDS_SchwarzerMagier_PAT,	"WP_PAT_START");

	// Foki platzieren

	Wld_InsertItem	(ItMi_Focus_Pat_01,	"FP_ITEM_FOKUS_01");
	Wld_InsertItem	(ItMi_Focus_Pat_02,	"FP_ITEM_FOKUS_02");
	Wld_InsertItem	(ItMi_Focus_Pat_03,	"FP_ITEM_FOKUS_03");
	Wld_InsertItem	(ItMi_Focus_Pat_04,	"FP_ITEM_FOKUS_04");
	Wld_InsertItem	(ItMi_Focus_Pat_05,	"FP_ITEM_FOKUS_05");
};

FUNC VOID INIT_FEUERMAGIER_SURFACE()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
};

FUNC VOID STARTUP_FEUERMAGIER_TEMPEL()
{
	//Ambient-NPC's
	Wld_InsertNpc	(Mod_1737_KDF_Feuermagier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1738_KDF_Velario_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1739_KDF_Ordenspriester_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1740_KDF_Ordenspriester_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1769_PAL_Paladin_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_7787_SFB_Schuerfer_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_7788_SFB_Schuerfer_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_7789_SFB_Schuerfer_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_7790_SFB_Schuerfer_PAT,	"WP_PAT_START");

	//Wichtige NPC's
	Wld_InsertNpc	(Mod_1746_KDF_Tojan_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1747_KDF_Furgas_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1773_KDF_Nagon_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1774_KDF_Orakel_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_7791_SFB_Flaemar_PAT,	"WP_PAT_START");

	//Mauer-NPC's
	Wld_InsertNpc	(Mod_1748_KDF_Magier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1749_KDF_Magier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1750_KDF_Magier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1751_KDF_Magier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1752_KDF_Magier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1753_KDF_Magier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1754_KDF_Magier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1755_KDF_Magier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1756_KDF_Magier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1757_KDF_Magier_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1758_PAL_Paladin_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1759_PAL_Paladin_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1760_PAL_Paladin_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1761_PAL_Paladin_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1762_PAL_Paladin_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1763_PAL_Paladin_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1764_PAL_Paladin_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1765_PAL_Paladin_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1766_PAL_Paladin_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1767_PAL_Paladin_PAT,	"WP_PAT_START");
	Wld_InsertNpc	(Mod_1768_KDF_Magier_PAT,	"WP_PAT_START");

	//Schafe
	Wld_InsertNpc	(Sheep,	"FP_PAT_ROAM_SHEEP_01");
	Wld_InsertNpc	(Sheep,	"FP_PAT_ROAM_SHEEP_02");
	Wld_InsertNpc	(Sheep,	"FP_PAT_ROAM_SHEEP_03");
	Wld_InsertNpc	(Sheep,	"FP_PAT_ROAM_SHEEP_04");
	Wld_InsertNpc	(Sheep,	"FP_PAT_ROAM_SHEEP_05");
	Wld_InsertNpc	(Sheep,	"FP_PAT_ROAM_SHEEP_06");
	Wld_InsertNpc	(Sheep,	"FP_PAT_ROAM_SHEEP_07");
	Wld_InsertNpc	(Hammel, "FP_PAT_ROAM_SHEEP_08");
	Wld_InsertNpc	(Hammel, "FP_PAT_ROAM_SHEEP_09");
	
};

FUNC VOID INIT_FEUERMAGIER_TEMPEL()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();

	Wld_AssignRoomToGuild("alchemie1"	  , GIL_PUBLIC);
	Wld_AssignRoomToGuild("alchemie2"	  , GIL_PUBLIC);
	Wld_AssignRoomToGuild("bibliothek"	  , GIL_NONE);
	Wld_AssignRoomToGuild("gang1"	  , GIL_NONE);
	Wld_AssignRoomToGuild("kloster01"	  , GIL_PUBLIC);
	Wld_AssignRoomToGuild("paladinraum"	  , GIL_PAL);
	Wld_AssignRoomToGuild("schlafhaus"	  , GIL_VLK);
	Wld_AssignRoomToGuild("training"	  , GIL_PUBLIC);
	Wld_AssignRoomToGuild("vorraum1"	  , GIL_NONE);
};

FUNC VOID STARTUP_FEUERMAGIER_UNTERGRUND()
{
	CurrentLevel3 = PATHERION_ZEN;

	NameAllFires();

	Wld_InsertNpc	(Mod_1770_KDF_Faros_PAT,	"WP_PAT_UNTERGRUND_06");
};

var int Mod_SchwarzerVerraeterInsert;
var int Mod_SchwarzerVerraeterInsert_02;

FUNC VOID INIT_FEUERMAGIER_UNTERGRUND()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	OldLevel(PATHERION_ZEN);

	if (Npc_HasItems(hero, ItMi_TeleportStein) == 0)
	{
		AI_PrintScreen	("Teleportstein erhalten!", -1, YPOS_GoldGiven, FONT_ScreenSmall, 5);

		CreateInvItems	(hero, ItMi_TeleportStein, 1);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Tojan_Magier))
	{
		B_StartOtherRoutine	(Mod_1915_KDF_Tojan_PAT_UG, "TOT");
	};

	if (Mod_SchwarzerVerraeterInsert == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Velario_Fake))
	{
		Wld_InsertNpc	(Mod_1916_KDF_Magier_PAT_UG, "WP_PAT_UNTERGRUND_06");
		
		Mod_SchwarzerVerraeterInsert = TRUE;
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Furgas_MangelQuest2))
	&& (Mod_Pat_FurgasFertig == 0)
	{
		Mod_Pat_FurgasFertig = 1;

		Wld_InsertNpc	(Mod_7787_SFB_Schuerfer_PAT, "TOT");
		Wld_InsertNpc	(Mod_7788_SFB_Schuerfer_PAT, "TOT");
		Wld_InsertNpc	(Mod_7789_SFB_Schuerfer_PAT, "TOT");
		Wld_InsertNpc	(Mod_7790_SFB_Schuerfer_PAT, "TOT");
		Wld_InsertNpc	(Mod_7791_SFB_Flaemar_PAT, "TOT");

		B_StartOtherRoutine	(Mod_7787_SFB_Schuerfer_PAT, "MINE");
		B_StartOtherRoutine	(Mod_7788_SFB_Schuerfer_PAT, "MINE");
		B_StartOtherRoutine	(Mod_7789_SFB_Schuerfer_PAT, "MINE");
		B_StartOtherRoutine	(Mod_7790_SFB_Schuerfer_PAT, "MINE");
		B_StartOtherRoutine	(Mod_7791_SFB_Flaemar_PAT, "MINE");
	};
};

FUNC VOID STARTUP_PATHERION()
{
	STARTUP_FEUERMAGIER_SURFACE();
	STARTUP_FEUERMAGIER_TEMPEL();
};

FUNC VOID INIT_PATHERION()
{
	INIT_FEUERMAGIER_SURFACE();
	INIT_FEUERMAGIER_TEMPEL();

	if (Mod_SchwarzerVerraeterInsert_02 == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Tojan_Magier))
	{
		Wld_InsertNpc	(Troll_s_Pat,	"FP_TROLL_BAD");
		Wld_InsertNpc	(Mod_1771_KDF_Aaron_PAT,	"WP_PAT_WEG_60");
		
		Mod_SchwarzerVerraeterInsert_02 = TRUE;
	};

	if (Mod_FM_Foki < 11)
	{
		Mod_1771_KDF_Aaron_PAT.name 		= "Aaron";
	}
	else
	{
		Mod_1771_KDF_Aaron_PAT.name		= "Garan";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Fuego_Unruhen))
	&& (Wld_GetDay() > Mod_REL_FuegoDay)
	&& (Mod_PAT_FuegoDa == 0)
	{
		Mod_PAT_FuegoDa = 1;

		Wld_InsertNpc	(Mod_7622_KDF_Elvira_PAT, "WP_PAT_START");
		Wld_InsertNpc	(Mod_7623_KDF_Fuego_PAT, "WP_PAT_START");
	};

	OldLevel(PATHERION_ZEN);

	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	Wld_SendTrigger ("SPECIALTRIGGER");

	if (Mod_Enter_PAT_First == FALSE)
	{
		Wld_SendTrigger	("EVT_PAT_BARRIERE");

		Mod_Enter_PAT_First = TRUE;
	}; 

	if (Npc_KnowsInfo(hero, Info_Mod_Talamon_Patherion))
	&& (Mod_Enter_PAT_Second == FALSE)
	{
		// Schwarzis ins Kloster verfrachten
		B_StartOtherRoutine	(Mod_1600_SMK_SchwarzerKrieger_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1601_SMK_Blackknight_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1602_SMK_Blackknight_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1603_SMK_SchwarzerKrieger_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1604_SMK_SchwarzerKrieger_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1700_SMK_SchwarzerKrieger_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1701_SMK_SchwarzerKrieger_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1703_KDS_SchwarzerMagier_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1704_KDS_SchwarzerMagier_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1705_SMK_SchwarzerKrieger_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1706_SMK_Blackknight_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1707_SMK_Blackknight_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1708_SMK_SchwarzerKrieger_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1709_SMK_SchwarzerKrieger_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1710_SMK_SchwarzerKrieger_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1711_KDS_SchwarzerMagier_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1712_KDS_SchwarzerMagier_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1713_KDS_SchwarzerMagier_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1714_KDS_SchwarzerMagier_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1715_KDS_SchwarzerMagier_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1716_KDS_SchwarzerMagier_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1717_KDS_SchwarzerMagier_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1721_KDS_SchwarzerMagier_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1719_KDS_SchwarzerMagier_PAT,	"PATHERION");
		B_StartOtherRoutine	(Mod_1720_KDS_SchwarzerMagier_PAT,	"PATHERION");

		// Hexen einf?gen
		Wld_InsertNpc	(Mod_1776_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1777_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1778_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1779_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1780_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1781_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1782_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1783_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1784_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1785_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1786_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1787_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1788_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1789_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1790_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1791_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1792_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1793_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1794_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1795_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1796_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1797_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1798_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1799_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1800_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1801_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1802_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1803_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1804_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1805_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1806_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1807_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1808_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1809_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1810_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1811_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1812_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1813_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1814_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1815_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1816_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1817_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1818_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1819_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1820_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1821_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1822_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1823_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1824_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1825_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1826_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1827_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1828_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1829_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1830_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1831_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1832_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1833_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1834_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1835_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1836_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1837_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1838_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1839_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1840_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1841_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1842_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1844_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1845_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1846_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1847_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1848_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1849_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1850_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1851_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1852_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1853_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1854_HEX_Hexe_PAT,	"WP_PAT_START");
		Wld_InsertNpc	(Mod_1859_HEX_Hexenqueen_PAT, "WP_PAT_START");

		Mod_Enter_PAT_Second = TRUE;
	};
};

FUNC VOID STARTUP_BeliarKloster()
{
	CurrentLevel3 = BELIARKLOSTER_ZEN;

	NameAllFires();

	// Schwarzmagier

	Wld_InsertNpc	(Mod_7502_KDS_Alax_BK,	"BK_001");

	// Schwarze Novizen
	
};

FUNC VOID INIT_BeliarKloster()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();

	OldLevel(BELIARKLOSTER_ZEN);

	Wld_AssignRoomToGuild("laden"  , GIL_PUBLIC);
	Wld_AssignRoomToGuild("kirche"  , GIL_PUBLIC);
	Wld_AssignRoomToGuild("folterkammer"  , GIL_PUBLIC);
	Wld_AssignRoomToGuild("myxir"  , GIL_PUBLIC);
	Wld_AssignRoomToGuild("restraum"  , GIL_PUBLIC);
};

FUNC VOID STARTUP_Bergwelt()
{
	CurrentLevel3 = BERGWELT_ZEN;

	NameAllFires();

        Wld_InsertNpc	(DragonSnapper_Bergwelt,	"FP_ROAM_DRAGONSNAPPER_01");
	Wld_InsertNpc	(DragonSnapper_Bergwelt,	"FP_ROAM_DRAGONSNAPPER_02");
	Wld_InsertNpc	(DragonSnapper_Bergwelt,	"FP_ROAM_DRAGONSNAPPER_03");
	Wld_InsertNpc	(DragonSnapper_Bergwelt,	"FP_ROAM_DRAGONSNAPPER_04");
	Wld_InsertNpc	(DragonSnapper_Bergwelt,	"FP_ROAM_DRAGONSNAPPER_05");
	Wld_InsertNpc	(DragonSnapper_Bergwelt,	"FP_ROAM_DRAGONSNAPPER_06");
	Wld_InsertNpc	(DragonSnapper_Bergwelt,	"FP_ROAM_DRAGONSNAPPER_07");
	Wld_InsertNpc	(DragonSnapper_Bergwelt,	"FP_ROAM_DRAGONSNAPPER_08");
	Wld_InsertNpc	(DragonSnapper_Bergwelt,	"FP_ROAM_DRAGONSNAPPER_09");
	Wld_InsertNpc	(DragonSnapper_Bergwelt,	"FP_ROAM_DRAGONSNAPPER_10");
};

FUNC VOID INIT_Bergwelt()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();

	OldLevel(BERGWELT_ZEN); 
};

FUNC VOID STARTUP_Tugettso()
{
	CurrentLevel3 = TUGETTSO_ZEN;

	NameAllFires();

	// Magier und Krieger
	Wld_InsertNpc	(Mod_1959_VMG_Genn_TUG,	"START_TUGETTSO");
	Wld_InsertNpc	(Mod_7353_VMG_Per_TUG, "START_TUGETTSO");
	Wld_InsertNpc	(Mod_7354_VMG_Dever_TUG, "START_TUGETTSO");
	Wld_InsertNpc	(Mod_7355_VMG_Asko_TUG, "START_TUGETTSO");
	Wld_InsertNpc	(Mod_7356_VMG_Fore_TUG, "START_TUGETTSO");
	Wld_InsertNpc	(Mod_7357_VMG_Dean_TUG, "START_TUGETTSO");

	// Sonstige Charaktere
	Wld_InsertNpc	(Mod_1962_OUT_Lorforn_TUG, "START_TUGETTSO");

	// Gobbos
	Wld_InsertNpc	(Gobbo_Matrone,	"FP_ROAM_01");
	Wld_InsertNpc	(Gobbo_Matrone,	"FP_ROAM_02");
	Wld_InsertNpc	(Gobbo_Matrone,	"FP_ROAM_03");
	Wld_InsertNpc	(Gobbo_Matrone,	"FP_ROAM_04");

	Wld_InsertNpc	(Gobbo_Tugettso01,	"FP_ROAM_05");
	Wld_InsertNpc	(Gobbo_Tugettso02,	"FP_ROAM_06");
	Wld_InsertNpc	(Gobbo_Tugettso01,	"FP_ROAM_07");
	Wld_InsertNpc	(Gobbo_Tugettso04,	"FP_ROAM_08");
	Wld_InsertNpc	(Gobbo_Tugettso03,	"FP_ROAM_09");
	Wld_InsertNpc	(Gobbo_Tugettso03,	"FP_ROAM_10");
	Wld_InsertNpc	(Gobbo_Tugettso02,	"FP_ROAM_11");
	Wld_InsertNpc	(Gobbo_Tugettso01,	"FP_ROAM_12");
	Wld_InsertNpc	(Gobbo_Tugettso04,	"FP_ROAM_13");
	Wld_InsertNpc	(Gobbo_Tugettso03,	"FP_ROAM_14");
	Wld_InsertNpc	(Gobbo_Tugettso01,	"FP_ROAM_15");
	Wld_InsertNpc	(Gobbo_Tugettso01,	"FP_ROAM_16");
	Wld_InsertNpc	(Gobbo_Tugettso02,	"FP_ROAM_17");
	Wld_InsertNpc	(Gobbo_Tugettso02,	"FP_ROAM_18");
	Wld_InsertNpc	(Gobbo_Tugettso01,	"FP_ROAM_19");
	Wld_InsertNpc	(Gobbo_Tugettso03,	"FP_ROAM_20");
	Wld_InsertNpc	(Gobbo_Tugettso03,	"FP_ROAM_21");
	Wld_InsertNpc	(Gobbo_Tugettso03,	"FP_ROAM_22");
	Wld_InsertNpc	(Gobbo_Tugettso01,	"FP_ROAM_23");
	Wld_InsertNpc	(Gobbo_Tugettso04,	"FP_ROAM_24");
	Wld_InsertNpc	(Gobbo_Tugettso04,	"FP_ROAM_25");
	Wld_InsertNpc	(Gobbo_Tugettso01,	"FP_ROAM_26");
	Wld_InsertNpc	(Gobbo_Tugettso02,	"FP_ROAM_27");
	Wld_InsertNpc	(Gobbo_Tugettso02,	"FP_ROAM_28");
	Wld_InsertNpc	(Gobbo_Tugettso01,	"FP_ROAM_29");
	Wld_InsertNpc	(Gobbo_Tugettso01,	"FP_ROAM_30");
	Wld_InsertNpc	(Gobbo_Tugettso01,	"FP_ROAM_31");
	Wld_InsertNpc	(Gobbo_Tugettso02,	"FP_ROAM_32");
	Wld_InsertNpc	(Gobbo_Tugettso03,	"FP_ROAM_33");
	Wld_InsertNpc	(Gobbo_Tugettso04,	"FP_ROAM_34");
	Wld_InsertNpc	(Gobbo_Tugettso01,	"FP_ROAM_35");
	Wld_InsertNpc	(Gobbo_Tugettso03,	"FP_ROAM_36");
	Wld_InsertNpc	(Gobbo_Tugettso01,	"FP_ROAM_37");
	
};

FUNC VOID INIT_Tugettso()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorge_KommMit))
	&& (Mod_Thorge_Dabei == FALSE)
	{
		Wld_InsertNpc	(Mod_1960_VMG_Thorge_TUG, "START_TUGETTSO");
		Mod_1960_VMG_Thorge_TUG.aivar[AIV_PARTYMEMBER] = TRUE;

		Mod_Thorge_Dabei = TRUE;
	};
	if (Npc_KnowsInfo(hero, Info_Mod_Struk_KommMit))
	&& (Mod_Struk_Dabei == FALSE)
	{
		Wld_InsertNpc	(Mod_1961_VMK_Struk_TUG, "START_TUGETTSO");
		Mod_1961_VMK_Struk_TUG.aivar[AIV_PARTYMEMBER] = TRUE;

		Mod_Struk_Dabei = TRUE;
	};

	if (Mod_VMG_FaiceGifty_Gift == 2)
	{
		Wld_InsertNpc	(Mod_7038_VMK_Soeren_TUG, "START_TUGETTSO");

		B_StartOtherRoutine (Mod_1959_VMG_Genn_TUG, "TALK");

		Mod_VMG_FaiceGifty_Gift = 3;
	};

	if (Mod_VMG_WSTrador == 1)
	{
		Mod_VMG_WSTrador = 2;

		B_StartOtherRoutine	(Mod_7352_OUT_Trador_TUG, "PORTAL");
	};

	Npc_RemoveInvItems	(hero, ItMi_TugettsoStein, 1);

	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();

	OldLevel(TUGETTSO_ZEN); 
};

FUNC VOID STARTUP_Eisgebiet()
{
	CurrentLevel3 = EISGEBIET_ZEN;

	NameAllFires();

	// Menschen im Dorf

	Wld_InsertNpc	(Mod_1953_EIS_Gellit_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_1954_EIS_Thys_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_1968_EIS_Dorfbewohner_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7407_OUT_Wirt_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7408_OUT_Burl_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7559_OUT_Serra_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7560_OUT_Malfama_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7561_OUT_Alvar_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7563_OUT_Brutus_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7564_OUT_Knatus_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7566_OUT_Pilar_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7567_OUT_Luis_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7644_OUT_Alfans_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7674_OUT_Aldaro_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7727_OUT_Wache_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7728_OUT_Willingham_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7752_OUT_Marcus_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7767_OUT_Veronica_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7768_OUT_Amorite_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_974_OUT_Gestath_EIS, "START_EISGEBIET");
	Wld_InsertNpc	(Mod_7792_OUT_Anglar_EIS, "START_EISGEBIET");

	// Menschen in der Umgebung

	Wld_InsertNpc	(Mod_4017_EIS_Rico_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_4018_EIS_Buck_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7568_OUT_Keith_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7572_OUT_Vigonza_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7643_HEX_Griselda_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7645_OUT_Halfmar_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7647_OUT_Strewak_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7729_OUT_Baro_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_10045_Orc_Garunh_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7733_BDT_Bandit_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7734_BDT_Bandit_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7735_BDT_Aslan_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7736_BDT_Bandit_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7737_BDT_Bandit_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7738_BDT_Bandit_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7739_BDT_Bandit_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7740_BDT_Bandit_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7741_BDT_Bandit_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7742_BDT_Bandit_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7743_BDT_Bandit_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Mod_7754_OUT_Melchior_EIS,	"START_EISGEBIET");

	// Bossmonster

	Wld_InsertNpc	(Monster_11067_Talos_EIS,	"START_EISGEBIET");
	Wld_InsertNpc	(Monster_11068_Eisriese_EIS,	"START_EISGEBIET");

	// Tempelchen f?r Quest

	Wld_InsertNpc	(Zombie_Eis_Schneegeister,	"EIS_TEMPELCHEN_005");
	Wld_InsertNpc	(Schneegeist,	"EIS_TEMPELCHEN_005");
	Wld_InsertNpc	(Schneegeist,	"EIS_TEMPELCHEN_005");
};

FUNC VOID INIT_Eisgebiet()
{
	//---Laternen---
	Wld_SetMobRoutine (00,00, "FIREPLACE", 1);
	Wld_SetMobRoutine (20,00, "FIREPLACE", 1);
	Wld_SetMobRoutine (07,00, "FIREPLACE", 0);

	// Morgens

	Wld_SetMobRoutine(05, 10, "LIGHTSPAWNERONE", 1);
	Wld_SetMobRoutine(06, 10, "LIGHTSPAWNERONE", 0);
	Wld_SetMobRoutine(06, 10, "LIGHTSPAWNERTWO", 1);
	Wld_SetMobRoutine(07, 10, "LIGHTSPAWNERTWO", 0);
	Wld_SetMobRoutine(07, 10, "LIGHTSPAWNERTHREE", 1);
	Wld_SetMobRoutine(08, 10, "LIGHTSPAWNERTHREE", 0);

	// Mittags

	Wld_SetMobRoutine(08, 10, "LIGHTSPAWNERFOUR", 1);
	Wld_SetMobRoutine(09, 10, "LIGHTSPAWNERFOUR", 0);
	Wld_SetMobRoutine(09, 10, "LIGHTSPAWNERFIVE", 1);
	Wld_SetMobRoutine( 15, 10, "LIGHTSPAWNERFIVE", 0);
	Wld_SetMobRoutine(15, 10, "LIGHTSPAWNERSIX", 1);
	Wld_SetMobRoutine( 16, 10, "LIGHTSPAWNERSIX", 0);

	// Nachmittags

	Wld_SetMobRoutine(16, 10, "LIGHTSPAWNERSEVEN", 1);
	Wld_SetMobRoutine(17, 10, "LIGHTSPAWNERSEVEN", 0);
	Wld_SetMobRoutine(17, 10, "LIGHTSPAWNEREIGHT", 1);
	Wld_SetMobRoutine(18, 10, "LIGHTSPAWNEREIGHT", 0);

	// Abends

	Wld_SetMobRoutine(18, 10, "LIGHTSPAWNERNINE", 1);
	Wld_SetMobRoutine(18, 50, "LIGHTSPAWNERNINE", 0);
	Wld_SetMobRoutine(18, 50, "LIGHTSPAWNERTEN", 1);
	Wld_SetMobRoutine(19, 30, "LIGHTSPAWNERTEN", 0);
	Wld_SetMobRoutine(19, 30, "LIGHTSPAWNERELEVEN", 1);
	Wld_SetMobRoutine(20, 10, "LIGHTSPAWNERELEVEN", 0);

	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();

	OldLevel(EISGEBIET_ZEN);

	if (Mod_RattenQuest == 3)
	{
		Mod_RattenQuest = 4;

		B_LogEntry	(TOPIC_MOD_RATTENQUEST, "Bisher ist das wohl das k?lteste Gebiet. Mal sehen ob hier irgend jemand was ?ber die Ratten wei?.");
	};
};

FUNC VOID STARTUP_FliegendeInsel()
{
	CurrentLevel3 = FLIEGENDEINSEL_ZEN;

	NameAllFires();

	// Festung
	Wld_InsertNpc	(Mod_1974_MIL_Gidan_FI, "FI_01");
	Wld_InsertNpc	(Mod_1981_Kolam_FI, "FI_01");
};

FUNC VOID INIT_FliegendeInsel()
{
	OldLevel(FLIEGENDEINSEL_ZEN);

	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
};

FUNC VOID STARTUP_Relendel()
{
	CurrentLevel3 = RELENDEL_ZEN;

	NameAllFires();

	// Khorata

	Wld_InsertNpc	(Mod_7241_OUT_Anselm_REL, "REL_001");
	Wld_InsertNpc	(Mod_7242_OUT_Robert_REL, "REL_001");
	Wld_InsertNpc	(Mod_7275_OUT_Buerger_REL, "REL_001");
	Wld_InsertNpc	(Mod_7276_OUT_Regina_REL, "REL_001");
	Wld_InsertNpc	(Mod_7277_OUT_Buerger_REL, "REL_001");
	Wld_InsertNpc	(Mod_7278_OUT_Bibliothekar_REL, "REL_001");
	Wld_InsertNpc	(Mod_7279_OUT_Buerger_REL, "REL_001");
	Wld_InsertNpc	(Mod_7280_OUT_Buerger_REL, "REL_001");
	Wld_InsertNpc	(Mod_7281_OUT_Felicita_REL, "REL_001");
	Wld_InsertNpc	(Mod_7282_OUT_Buerger_REL, "REL_001");
	Wld_InsertNpc	(Mod_7338_OUT_Lebensmittelhaendler_REL, "REL_001");
	Wld_InsertNpc	(Mod_7340_OUT_Buergerin_REL, "REL_001");
	Wld_InsertNpc	(Mod_7341_OUT_Buergerin_REL, "REL_001");
	Wld_InsertNpc	(Mod_7342_OUT_Buergerin_REL, "REL_001");
	Wld_InsertNpc	(Mod_7343_OUT_Buergerin_REL, "REL_001");
	Wld_InsertNpc	(Mod_7344_OUT_Buerger_REL, "REL_001");
	Wld_InsertNpc	(Mod_7345_OUT_Buerger_REL, "REL_001");
	Wld_InsertNpc	(Mod_7346_OUT_Dichter_REL, "REL_001");
	Wld_InsertNpc	(Mod_7347_OUT_Buerger_REL, "REL_001");
	Wld_InsertNpc	(Mod_7348_OUT_Buerger_REL, "REL_001");
	Wld_InsertNpc	(Mod_7349_OUT_Buerger_REL, "REL_001");
	Wld_InsertNpc	(Mod_7350_OUT_Buerger_REL, "REL_001");
	Wld_InsertNpc	(Mod_7351_OUT_Ranck_REL, "REL_001");
	Wld_InsertNpc	(Mod_7365_OUT_Margarethe_REL, "REL_001");
	Wld_InsertNpc	(Mod_7370_OUT_Ulrich_REL, "REL_001");
	Wld_InsertNpc	(Mod_7371_OUT_Richter_REL, "REL_001");
	Wld_InsertNpc	(Mod_7372_OUT_Schoeppe_REL, "REL_001");
	Wld_InsertNpc	(Mod_7373_OUT_Schoeppe_REL, "REL_001");
	Wld_InsertNpc	(Mod_7374_OUT_Gerichtswache_01, "REL_001");
	Wld_InsertNpc	(Mod_7375_OUT_Gerichtswache_02, "REL_001");
	Wld_InsertNpc	(Mod_7377_OUT_Hans_REL, "REL_001");
	Wld_InsertNpc	(Mod_7378_OUT_Daniel_REL, "REL_001");
	Wld_InsertNpc	(Mod_7380_OUT_Hubert_REL, "REL_001");
	Wld_InsertNpc	(Mod_7381_OUT_Erika_REL, "REL_001");
	Wld_InsertNpc	(Mod_7385_OUT_August_REL, "REL_001");
	Wld_InsertNpc	(Mod_7386_OUT_Peter_REL, "REL_001");
	Wld_InsertNpc	(Mod_7391_OUT_Henker_REL, "REL_001");
	Wld_InsertNpc	(Mod_7415_OUT_Axon_REL, "REL_001");
	Wld_InsertNpc	(Mod_7418_OUT_Ruprecht_REL, "REL_001");
	Wld_InsertNpc	(Mod_7419_OUT_Leonhard_REL, "REL_001");
	Wld_InsertNpc	(Mod_7423_OUT_Ursula_REL, "REL_001");
	Wld_InsertNpc	(Mod_7424_OUT_Narkomane_REL, "REL_001");
	Wld_InsertNpc	(Mod_7425_KDF_Fuego_REL, "REL_001");
	Wld_InsertNpc	(Mod_7476_OUT_Arzt_REL, "REL_001");
	Wld_InsertNpc	(Mod_7480_OUT_Wendel_REL, "REL_001");
	Wld_InsertNpc	(Mod_7481_OUT_Monteur_REL, "REL_001");
	Wld_InsertNpc	(Mod_7482_OUT_Juliana_REL, "REL_001");
	Wld_InsertNpc	(Mod_7491_OUT_Patient_REL, "REL_001");
	Wld_InsertNpc	(Mod_7498_WM_Idrico_REL, "REL_001");
	Wld_InsertNpc	(Mod_7499_KDF_Elvira_REL, "REL_001");
	Wld_InsertNpc	(Mod_7507_BUD_Sterling_REL, "REL_001");
	Wld_InsertNpc	(Mod_7509_OUT_Lehrling_REL, "REL_001");
	Wld_InsertNpc	(Mod_7513_OUT_Buergerin_REL, "REL_001");
	Wld_InsertNpc	(Mod_7514_OUT_Ivan_REL, "REL_001");
	Wld_InsertNpc	(Mod_7515_OUT_Dalton_REL, "REL_001");
	Wld_InsertNpc	(Mod_7516_OUT_Lukas_REL, "REL_001");
	Wld_InsertNpc	(Mod_7517_OUT_Friedel_REL, "REL_001");
	Wld_InsertNpc	(Mod_7518_OUT_Davon_REL, "REL_001");
	Wld_InsertNpc	(Mod_7519_OUT_Tyrus_REL, "REL_001");
	Wld_InsertNpc	(Mod_7535_OUT_Schneider_REL, "REL_001");
	Wld_InsertNpc	(Mod_7540_OUT_Penner_REL, "REL_001");
	Wld_InsertNpc	(Mod_7573_OUT_Baecker_REL, "REL_001");
	Wld_InsertNpc	(Mod_7574_OUT_Lehrling_REL, "REL_001");
	Wld_InsertNpc	(Mod_7575_OUT_Baeckerfrau_REL, "REL_001");
	Wld_InsertNpc	(Mod_7576_OUT_Metzger_REL, "REL_001");
	Wld_InsertNpc	(Mod_7577_OUT_Metzgerlehrling_REL, "REL_001");
	Wld_InsertNpc	(Mod_7578_OUT_Brauer_REL, "REL_001");
	Wld_InsertNpc	(Mod_7579_OUT_Lehrling_REL, "REL_001");
	Wld_InsertNpc	(Mod_7580_OUT_Brauerfrau_REL, "REL_001");
	Wld_InsertNpc	(Mod_7581_OUT_Morpheus_REL, "REL_001");
	Wld_InsertNpc	(Mod_7589_OUT_Will_REL, "REL_001");
	Wld_InsertNpc	(Mod_7590_OUT_Berti_REL, "REL_001");
	Wld_InsertNpc	(Mod_7591_OUT_Hannes_REL, "REL_001");
	Wld_InsertNpc	(Mod_10040_Orc_Jim_REL, "REL_001");
	Wld_InsertNpc	(Mod_7611_OUT_Lagerhauswache_REL, "REL_001");
	Wld_InsertNpc	(Mod_7620_OUT_Wache_REL, "REL_001");
	Wld_InsertNpc	(Mod_7621_OUT_Wache_REL, "REL_001");
	Wld_InsertNpc	(Mod_7680_OUT_Judith_REL, "REL_001");
	Wld_InsertNpc	(Mod_7706_OUT_Pendler_REL, "REL_001");
	Wld_InsertNpc	(Mod_7707_OUT_Pendler_REL, "REL_001");
	Wld_InsertNpc	(Monster_11071_Transportsnapper_REL, "REL_001");
	Wld_InsertNpc	(Monster_11072_Transportsnapper_REL, "REL_001");
	Wld_InsertNpc	(Mod_7710_OUT_Lagerhauswache_REL, "REL_001");
	Wld_InsertNpc	(Mod_7712_OUT_Gelehrter_REL, "REL_001");
	Wld_InsertNpc	(Mod_7711_OUT_Leibwache_REL, "REL_001");
	Wld_InsertNpc	(Mod_7722_OUT_Ditmar_REL, "REL_001");
	Wld_InsertNpc	(Mod_7723_OUT_Hedwig_REL, "REL_001");
	Wld_InsertNpc	(Mod_7724_OUT_Berta_REL, "REL_001");
	Wld_InsertNpc	(Mod_7725_OUT_Irmgard_REL, "REL_001");
	Wld_InsertNpc	(Mod_7726_OUT_Salmey_REL, "REL_001");
	Wld_InsertNpc	(Mod_7762_OUT_Ruediger_REL, "REL_001");

	// Hofstaat

	Wld_InsertNpc	(Mod_7011_HS_Alex_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7012_HS_Typ_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7014_HS_Wache_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7015_HS_Bauer_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7016_HS_Bauer_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7017_HS_Bauer_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7018_HS_Bauer_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7019_HS_Bauer_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7020_HS_Tuersteher_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7269_HS_Barde_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7270_OUT_Weiberheld_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7271_OUT_HFFrau_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7272_HS_Trunkenbold_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7273_HS_Haendler_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7274_HS_Haendler_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7283_HS_Arsch_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7284_HS_Raufbold_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7285_HS_Koenig_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7289_HS_Jaeger_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7287_HS_Gleichgewichtsminister_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7288_HS_Drogenminister_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7328_HS_Hofnarr_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7336_HS_Passantin_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7337_HS_Passantin_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7339_HS_Geliebte_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7596_HS_Bauer_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7597_HS_Hofstaatler_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7598_HS_Hofstaatler_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7599_HS_Hofstaatler_REL,	"REL_001");
	
	Wld_InsertNpc	(Mod_7013_HS_Fluffy_REL,	"REL_252");

	Wld_InsertNpc	(Scavenger,	"FP_ROAM_HOFSTAAT_035");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_HOFSTAAT_032");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_HOFSTAAT_030");

	Wld_InsertNpc	(Keiler,	"FP_ROAM_HOFSTAAT_028");
	Wld_InsertNpc	(Keiler,	"FP_ROAM_HOFSTAAT_023");

	Wld_InsertNpc	(Wolf,		"FP_ROAM_HOFSTAAT_021");
	Wld_InsertNpc	(Wolf,		"FP_ROAM_HOFSTAAT_017");

	Wld_InsertNpc	(Wolf,		"FP_ROAM_HOFSTAAT_012");
	Wld_InsertNpc	(Wolf,		"FP_ROAM_HOFSTAAT_009");
	Wld_InsertNpc	(Wolf,		"FP_ROAM_HOFSTAAT_010");

	Wld_InsertNpc	(Lurker,	"FP_ROAM_HOFSTAAT_006");
	Wld_InsertNpc	(Lurker,	"FP_ROAM_HOFSTAAT_004");

	// Umgebung

	Wld_InsertNpc	(Mod_7379_OUT_Vincent_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7382_OUT_Theodorus_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7383_OUT_Henrik_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7397_PSINOV_Turgor_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7411_BAU_Deppenhans_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7505_BDT_Melvin_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7506_OUT_Erhard_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7510_OUT_Raeuber_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7511_OUT_Raeuber_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7512_OUT_Raeuber_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7541_OUT_PennerVater_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7556_OUT_Rotkaeppchen_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7582_OUT_Buddler_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7583_OUT_Wache_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7584_OUT_Wache_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7637_OUT_Diana_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7638_OUT_Erntehelfer_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7639_OUT_Erntehelfer_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7703_OUT_Froppi_REL,	"REL_001");
	Wld_InsertNpc	(Mod_10042_Orc_Ork_REL,	"REL_001");

	// Moor

	Wld_InsertNpc	(Mod_7650_OUT_Botschek_REL,	"REL_001");
	Wld_InsertNpc	(Mod_2015_PSINOV_Harlok_REL,	"REL_001");
	Wld_InsertNpc	(Mod_3002_PSINOV_Viran_REL,	"REL_001");
	Wld_InsertNpc	(Mod_1623_OUT_Chani_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7655_OUT_Abenteurer_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7654_OUT_Alkor_REL,	"REL_001");
	Wld_InsertNpc	(Mod_1297_SLD_Wedge_REL,	"REL_001");
	Wld_InsertNpc	(Mod_504_PAL_Parcival_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7668_MIL_Miliz_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7669_MIL_Miliz_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7671_OUT_Lomar_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7672_OUT_Paul_REL,	"REL_001");
	Wld_InsertNpc	(Mod_7715_STT_Balam_REL,	"REL_001");

	Wld_InsertNpc	(Podest,	"REL_MOOR_205");

	// Monster

	Wld_InsertNpc	(Molerat_Henrik_01,	"REL_SURFACE_035");
	Wld_InsertNpc	(Molerat_Henrik_02,	"REL_SURFACE_035");
	Wld_InsertNpc	(Molerat_Henrik_03,	"REL_SURFACE_035");
	Wld_InsertNpc	(Molerat_Henrik_04,	"REL_SURFACE_035");

	Wld_InsertNpc	(Molerat_Henrik_05,	"REL_SURFACE_034");
	Wld_InsertNpc	(Molerat_Henrik_06,	"REL_SURFACE_034");
	Wld_InsertNpc	(Molerat_Henrik_07,	"REL_SURFACE_034");
	Wld_InsertNpc	(Molerat_Henrik_08,	"REL_SURFACE_034");

	Wld_InsertNpc	(Molerat_Henrik_09,	"REL_SURFACE_032");
	Wld_InsertNpc	(Molerat_Henrik_10,	"REL_SURFACE_032");
	Wld_InsertNpc	(Molerat_Henrik_11,	"REL_SURFACE_032");
	Wld_InsertNpc	(Molerat_Henrik_12,	"REL_SURFACE_032");

	// Moor

	Wld_InsertNpc	(SwampZombie_Moor_01,	"REL_MOOR_054");
	Wld_InsertNpc	(SwampZombie_Moor_02,	"REL_MOOR_041");
	Wld_InsertNpc	(SwampZombie_Moor_03,	"REL_MOOR_046");
	Wld_InsertNpc	(SwampZombie_Moor_04,	"REL_MOOR_026");
	Wld_InsertNpc	(SwampZombie_Moor_05,	"REL_MOOR_037");
	Wld_InsertNpc	(SwampZombie_Moor_06,	"REL_MOOR_059");
	Wld_InsertNpc	(SwampZombie_Moor_07,	"REL_MOOR_064");
	Wld_InsertNpc	(SwampZombie_Moor_08,	"REL_MOOR_068");
	Wld_InsertNpc	(SwampZombie_Moor_09,	"REL_MOOR_072");
	Wld_InsertNpc	(SwampZombie_Moor_10,	"REL_MOOR_077");
	Wld_InsertNpc	(SwampZombie_Moor_11,	"REL_MOOR_082");
	Wld_InsertNpc	(SwampZombie_Moor_12,	"REL_MOOR_117");
	Wld_InsertNpc	(SwampZombie_Moor_13,	"REL_MOOR_123");
	Wld_InsertNpc	(SwampZombie_Moor_14,	"REL_MOOR_127");
	Wld_InsertNpc	(SwampZombie_Moor_15,	"REL_MOOR_087");
	Wld_InsertNpc	(SwampZombie_Moor_16,	"REL_MOOR_091");
	Wld_InsertNpc	(SwampZombie_Moor_17,	"REL_MOOR_095");
	Wld_InsertNpc	(SwampZombie_Moor_18,	"REL_MOOR_057");
	Wld_InsertNpc	(SwampZombie_Moor_19,	"REL_MOOR_039");
	Wld_InsertNpc	(SwampZombie_Moor_20,	"REL_MOOR_085");
	Wld_InsertNpc	(SwampZombie_Moor_01,	"REL_MOOR_054");
	Wld_InsertNpc	(SwampZombie_Moor_02,	"REL_MOOR_041");
	Wld_InsertNpc	(SwampZombie_Moor_03,	"REL_MOOR_046");
	Wld_InsertNpc	(SwampZombie_Moor_04,	"REL_MOOR_026");
	Wld_InsertNpc	(SwampZombie_Moor_05,	"REL_MOOR_037");
	Wld_InsertNpc	(SwampZombie_Moor_06,	"REL_MOOR_059");
	Wld_InsertNpc	(SwampZombie_Moor_07,	"REL_MOOR_064");
	Wld_InsertNpc	(SwampZombie_Moor_08,	"REL_MOOR_068");
	Wld_InsertNpc	(SwampZombie_Moor_09,	"REL_MOOR_072");
	Wld_InsertNpc	(SwampZombie_Moor_10,	"REL_MOOR_077");
	Wld_InsertNpc	(SwampZombie_Moor_11,	"REL_MOOR_082");
	Wld_InsertNpc	(SwampZombie_Moor_12,	"REL_MOOR_117");
	Wld_InsertNpc	(SwampZombie_Moor_13,	"REL_MOOR_123");
	Wld_InsertNpc	(SwampZombie_Moor_14,	"REL_MOOR_127");
	Wld_InsertNpc	(SwampZombie_Moor_15,	"REL_MOOR_087");
	Wld_InsertNpc	(SwampZombie_Moor_16,	"REL_MOOR_091");
	Wld_InsertNpc	(SwampZombie_Moor_17,	"REL_MOOR_095");
	Wld_InsertNpc	(SwampZombie_Moor_18,	"REL_MOOR_057");
	Wld_InsertNpc	(SwampZombie_Moor_19,	"REL_MOOR_039");
	Wld_InsertNpc	(SwampZombie_Moor_20,	"REL_MOOR_085");

	Wld_InsertNpc	(WilderApfelbaum,	"FP_ROAM_MOOR_WILDERAPFELBAUM_01");
	Wld_InsertNpc	(WilderApfelbaum,	"FP_ROAM_MOOR_WILDERAPFELBAUM_02");
	Wld_InsertNpc	(WilderApfelbaum,	"FP_ROAM_MOOR_WILDERAPFELBAUM_03");
	Wld_InsertNpc	(WilderApfelbaum,	"FP_ROAM_MOOR_WILDERAPFELBAUM_04");
	Wld_InsertNpc	(WilderApfelbaum,	"FP_ROAM_MOOR_WILDERAPFELBAUM_05");
	Wld_InsertNpc	(WilderApfelbaum,	"FP_ROAM_MOOR_WILDERAPFELBAUM_06");
	Wld_InsertNpc	(WilderApfelbaum,	"FP_ROAM_MOOR_WILDERAPFELBAUM_07");

	Wld_InsertNpc	(Apfelbaum_Botschek_01,	"FP_ROAM_MOOR_BOTSCHEK_APFELBAUM_01");
	Wld_InsertNpc	(Apfelbaum_Botschek_02,	"FP_ROAM_MOOR_BOTSCHEK_APFELBAUM_02");

	Wld_InsertNpc	(Alraune_Botschek_01,	"FP_ROAM_MOOR_BOTSCHEK_ALRAUNE_01");
	Wld_InsertNpc	(Alraune_Botschek_02,	"FP_ROAM_MOOR_BOTSCHEK_ALRAUNE_02");

	Wld_InsertNpc	(Alraune_Moor,	"FP_ROAM_ALRAUNE_MOOR_01");
	Wld_InsertNpc	(Alraune_Moor,	"FP_ROAM_ALRAUNE_MOOR_03");
	Wld_InsertNpc	(Alraune_Moor,	"FP_ROAM_ALRAUNE_MOOR_05");
	Wld_InsertNpc	(Alraune_Moor,	"FP_ROAM_ALRAUNE_MOOR_07");
	Wld_InsertNpc	(Alraune_Moor,	"FP_ROAM_ALRAUNE_MOOR_09");
	Wld_InsertNpc	(Alraune_Moor,	"FP_ROAM_ALRAUNE_MOOR_11");

	Wld_InsertNpc	(Alraune_Moor,	"FP_ROAM_ALRAUNE_LOMAR_01");
	Wld_InsertNpc	(Alraune_Moor,	"FP_ROAM_ALRAUNE_LOMAR_02");
	Wld_InsertNpc	(Alraune_Moor,	"FP_ROAM_ALRAUNE_LOMAR_03");

	// Rechts vom Pass bis zum Durchgang zum Moor

	Wld_InsertNpc	(Keiler,	"FP_ROAM_001");
	Wld_InsertNpc	(Keiler,	"FP_ROAM_002");
	Wld_InsertNpc	(Keiler,	"FP_ROAM_003");

	Wld_InsertNpc	(Wolf,	"FP_ROAM_007");
	Wld_InsertNpc	(Wolf,	"FP_ROAM_008");
	Wld_InsertNpc	(Wolf,	"FP_ROAM_009");
	Wld_InsertNpc	(Wolf,	"FP_ROAM_022");
	Wld_InsertNpc	(Wolf,	"FP_ROAM_023");

	Wld_InsertNpc	(Scavenger,	"FP_ROAM_013");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_014");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_017");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_018");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_031");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_032");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_033");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_041");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_042");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_048");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_049");
	Wld_InsertNpc	(Scavenger,	"FP_ROAM_050");

	Wld_InsertNpc	(Shadowbeast,	"FP_ROAM_021");

	Wld_InsertNpc	(Snapper,	"FP_ROAM_026");
	Wld_InsertNpc	(Snapper,	"FP_ROAM_027");

	Wld_InsertNpc	(Bloodhound,	"FP_ROAM_045");
	Wld_InsertNpc	(Bloodhound,	"FP_ROAM_047");
	
};

FUNC VOID INIT_Relendel()
{
	// Laternen in der Stadt

	Wld_SetMobRoutine (00,00,"FIREPLACE",1);
	Wld_SetMobRoutine (20,00,"FIREPLACE",1);
	Wld_SetMobRoutine (06,00,"FIREPLACE",0);

	// Morgens

	Wld_SetMobRoutine(05, 10, "LIGHTSPAWNERONE", 1);
	Wld_SetMobRoutine(06, 10, "LIGHTSPAWNERONE", 0);
	Wld_SetMobRoutine(06, 10, "LIGHTSPAWNERTWO", 1);
	Wld_SetMobRoutine(07, 10, "LIGHTSPAWNERTWO", 0);
	Wld_SetMobRoutine(07, 10, "LIGHTSPAWNERTHREE", 1);
	Wld_SetMobRoutine(08, 10, "LIGHTSPAWNERTHREE", 0);

	// Mittags

	Wld_SetMobRoutine(08, 10, "LIGHTSPAWNERFOUR", 1);
	Wld_SetMobRoutine(09, 10, "LIGHTSPAWNERFOUR", 0);
	Wld_SetMobRoutine(09, 10, "LIGHTSPAWNERFIVE", 1);
	Wld_SetMobRoutine( 15, 10, "LIGHTSPAWNERFIVE", 0);
	Wld_SetMobRoutine(15, 10, "LIGHTSPAWNERSIX", 1);
	Wld_SetMobRoutine( 16, 10, "LIGHTSPAWNERSIX", 0);

	// Nachmittags

	Wld_SetMobRoutine(16, 10, "LIGHTSPAWNERSEVEN", 1);
	Wld_SetMobRoutine(17, 10, "LIGHTSPAWNERSEVEN", 0);
	Wld_SetMobRoutine(17, 10, "LIGHTSPAWNEREIGHT", 1);
	Wld_SetMobRoutine(18, 10, "LIGHTSPAWNEREIGHT", 0);

	// Abends

	Wld_SetMobRoutine(18, 10, "LIGHTSPAWNERNINE", 1);
	Wld_SetMobRoutine(18, 50, "LIGHTSPAWNERNINE", 0);
	Wld_SetMobRoutine(18, 50, "LIGHTSPAWNERTEN", 1);
	Wld_SetMobRoutine(19, 30, "LIGHTSPAWNERTEN", 0);
	Wld_SetMobRoutine(19, 30, "LIGHTSPAWNERELEVEN", 1);
	Wld_SetMobRoutine(20, 10, "LIGHTSPAWNERELEVEN", 0);

	// H?user zuweisen

	Wld_AssignRoomToGuild("haus1"  , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus2"  , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus3"  , GIL_OUT);
	Wld_AssignRoomToGuild("haus4"  , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus5"  , GIL_NONE); // Geisterhaus
	Wld_AssignRoomToGuild("haus6"  , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus7"  , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus8"  , GIL_OUT);
	Wld_AssignRoomToGuild("haus9"  , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus10" , GIL_OUT);
	Wld_AssignRoomToGuild("haus11" , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus12" , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus13" , GIL_OUT);
	Wld_AssignRoomToGuild("haus14" , GIL_OUT);
	Wld_AssignRoomToGuild("haus15" , GIL_OUT);
	Wld_AssignRoomToGuild("haus16" , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus17" , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus18" , GIL_OUT);
	Wld_AssignRoomToGuild("haus19" , GIL_NONE); // Bibliothek, damit der nicht meckert, wenn man B?cher mitnimmt
	Wld_AssignRoomToGuild("haus20" , GIL_OUT);
	Wld_AssignRoomToGuild("haus21" , GIL_OUT);
	Wld_AssignRoomToGuild("haus22" , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus23" , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus24" , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus25" , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus26" , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus27" , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus28" , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus29" , GIL_OUT);
	Wld_AssignRoomToGuild("haus30" , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus31" , GIL_PUBLIC);
	Wld_AssignRoomToGuild("haus32" , GIL_PUBLIC);
	Wld_AssignRoomToGuild("hauskeller"  , GIL_OUT);
	Wld_AssignRoomToGuild("hausfleisch" , GIL_PUBLIC);
	Wld_AssignRoomToGuild("hausbaken"   , GIL_PUBLIC);
	Wld_AssignRoomToGuild("brauerarbeit", GIL_PUBLIC);
	Wld_AssignRoomToGuild("brauerprivat", GIL_OUT);
	Wld_AssignRoomToGuild("rathaus"	    , GIL_PUBLIC);
	Wld_AssignRoomToGuild("theater"     , GIL_PUBLIC);
	Wld_AssignRoomToGuild("altefestung" , GIL_PUBLIC);

	OldLevel(RELENDEL_ZEN);

	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();

	if (Npc_KnowsInfo(hero, Info_Mod_Namib_NoDeal))
	&& (Mod_SabineInRelendel == 0)
	{
		Wld_InsertNpc	(Mod_7010_HS_Sabine_REL,	"REL_001");

		Mod_SabineInRelendel = 1;
	};

	if (Kapitel >= 3)
	&& (Mod_RattenQuest == 0)
	{
		Mod_RattenQuest = 1;

		Wld_InsertNpc	(Mod_7405_OUT_Cirio_REL, "REL_001");
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Kimon_HierIstDeinGold))
	&& (Mod_Kimon_REL == 0)
	&& (Kapitel >= 2)
	{
		Mod_Kimon_REL = 1;

		Wld_InsertNpc	(Mod_7771_FH_Kimon_REL, "TOT");
	};

	if (Mod_WM_UnheilFertig == 1)
	{
		Mod_WM_UnheilFertig = 2;

		Wld_InsertNpc	(Rabbit, "REL_SURFACE_107");
		Wld_InsertNpc	(Rabbit, "REL_SURFACE_107");
		Wld_InsertNpc	(Rabbit, "REL_SURFACE_107");
		Wld_InsertNpc	(Rabbit, "REL_SURFACE_107");
		Wld_InsertNpc	(Rabbit, "REL_SURFACE_108");
		Wld_InsertNpc	(Rabbit, "REL_SURFACE_108");
		Wld_InsertNpc	(Rabbit, "REL_SURFACE_108");
		Wld_InsertNpc	(Rabbit, "REL_SURFACE_109");
		Wld_InsertNpc	(Rabbit, "REL_SURFACE_109");
		Wld_InsertNpc	(Rabbit, "REL_SURFACE_109");

		Wld_InsertNpc	(Insekt_01, "REL_CITY_002");
		Wld_InsertNpc	(Insekt_01, "REL_CITY_002");
		Wld_InsertNpc	(Insekt_01, "REL_CITY_002");
		Wld_InsertNpc	(Insekt_01, "REL_CITY_002");
		Wld_InsertNpc	(Insekt_01, "REL_CITY_002");
		Wld_InsertNpc	(Insekt_02, "REL_CITY_002");
		Wld_InsertNpc	(Insekt_02, "REL_CITY_002");
		Wld_InsertNpc	(Insekt_02, "REL_CITY_002");
		Wld_InsertNpc	(Insekt_02, "REL_CITY_002");
		Wld_InsertNpc	(Insekt_03, "REL_CITY_002");
		Wld_InsertNpc	(Insekt_03, "REL_CITY_002");
		Wld_InsertNpc	(Insekt_03, "REL_CITY_002");
		Wld_InsertNpc	(Insekt_03, "REL_CITY_002");
	};

	if (Kapitel >= 2)
	&& (Mod_REL_Dichter == 1)
	&& (Mod_REL_DichterBeiMargarethe == 0)
	{
		Mod_REL_DichterBeiMargarethe = 1;

		B_StartOtherRoutine	(Mod_7346_OUT_Dichter_REL, "MARGARETHE");
	};

	if (Mod_NL_Grimbald == 1)
	{
		Wld_InsertNpc	(Mod_7294_OUT_Grimbald_REL, "REL_006");

		Mod_NL_Grimbald = 2;
	};

	if (Mod_SL_KingAtSwamp == 2)
	{
		Mod_SL_KingAtSwamp = 3;

		B_StartOtherRoutine	(Mod_7285_HS_Koenig_REL, "START");
	};

	if (Mod_SL_ListeSpawn == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Namib_Sporen))
	{
		Mod_SL_ListeSpawn = TRUE;

		B_StartOtherRoutine	(Mod_7283_HS_Arsch_REL, "ATKING");

		Wld_InsertItem	(ItWr_HofstaatListe, "FP_ITEM_LISTEHOFSTAAT");
	};

	if (Mod_NL_JeremiahHasEier == 3)
	{
		Wld_InsertItem	(ItMi_LurkerEgg_Mis, "FP_ITEM_LURKEREGG_MIS_01");
		Wld_InsertItem	(ItMi_LurkerEgg_Mis, "FP_ITEM_LURKEREGG_MIS_02");
		Wld_InsertItem	(ItMi_LurkerEgg_Mis, "FP_ITEM_LURKEREGG_MIS_03");

		Wld_InsertNpc	(Lurker,	"FP_ROAM_LURKER_EIWACHE_01");
		Wld_InsertNpc	(Lurker,	"FP_ROAM_LURKER_EIWACHE_02");

		Mod_NL_JeremiahHasEier = 4;
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_Sweetwater2))
	&& (Mod_JG_August == 0)
	{
		Mod_JG_August = 1;

		B_StartOtherRoutine	(Mod_7385_OUT_August_REL, "PRESTART");
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Frazer_Endres03))
	&& (Mod_Leonhard_Endres == 0)
	{
		Mod_Leonhard_Endres = 1;

		B_StartOtherRoutine	(Mod_7419_OUT_Leonhard_REL, "ENDRES");
	};

	// Lester f?r Ornamentsuche spawnen

	if (Npc_KnowsInfo(hero, Info_Mod_Nefarius_VierErbauer))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Lester_Treffen))
	|| (Npc_KnowsInfo(hero, Info_Mod_Gorn_Treffen)))
	&& (Mod_LesterInRelendel == FALSE)
	{
		Mod_LesterInRelendel = TRUE;

		Wld_InsertNpc	(Mod_7612_PSINOV_Lester_REL,	"REL_001");
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Namib_Aufnehmen))
	|| (Kapitel >= 4)
	&& (Mod_LesterInRelendel >= 1)
	{
		B_RemoveNpc	(Mod_7612_PSINOV_Lester_REL);
	};

	if (Kapitel >= 3)
	&& (Mod_Enter_Relendel_03 == FALSE)
	{
		// Unruhen in Khorata starten

		Wld_SendTrigger	("EVT_MINENPALISADE01");
		Wld_SendTrigger	("EVT_MINENPALISADE02");
		Wld_SendTrigger	("EVT_MINENPALISADE03");
		Wld_SendTrigger	("EVT_MINENPALISADE04");
		Wld_SendTrigger	("EVT_MINENPALISADE05");
		Wld_SendTrigger	("EVT_MINENPALISADE06");

		B_StartOtherRoutine	(Mod_7519_OUT_Tyrus_REL,	"ATMINE");
		B_StartOtherRoutine	(Mod_7515_OUT_Dalton_REL,	"ATMINE");

		B_KillNpc	(Mod_7519_OUT_Tyrus_REL);
		B_KillNpc	(Mod_7515_OUT_Dalton_REL);

		B_StartOtherRoutine	(Mod_7385_OUT_August_REL,	"PRESTART");

		if (Hlp_IsValidNpc(Mod_7492_OUT_Roman_REL))
		{
			B_StartOtherRoutine	(Mod_7492_OUT_Roman_REL, "ATMINE");
		}
		else
		{
			Wld_InsertNpc	(Mod_7492_OUT_Roman_REL, "REL_002");
			B_StartOtherRoutine	(Mod_7492_OUT_Roman_REL, "ATMINE");
		};

		Wld_InsertNpc	(Mod_7613_OUT_Schuerfer_REL,	"REL_002");
		Wld_InsertNpc	(Mod_7614_OUT_Schuerfer_REL,	"REL_002");
		Wld_InsertNpc	(Mod_7615_OUT_Schuerfer_REL,	"REL_002");
		Wld_InsertNpc	(Mod_7616_OUT_Schuerfer_REL,	"REL_002");
		Wld_InsertNpc	(Mod_7617_OUT_Schuerfer_REL,	"REL_002");
		Wld_InsertNpc	(Mod_7618_OUT_Norman_REL,	"REL_002");
		Wld_InsertNpc	(Mod_7619_OUT_Frazer_REL,	"REL_002");

		B_RemoveNpc	(Mod_7241_OUT_Anselm_REL);

		Mod_Enter_Relendel_03 = TRUE;
	};

	if (Kapitel >= 5)
	&& (Mod_Enter_Relendel_05 == FALSE)
	{
		Mod_Enter_Relendel_03 = TRUE;
	};

	if (Kapitel >= 4)
	&& (Mod_Mud_Lebt == 0)
	{
		Mod_Mud_Lebt = 2;

		Wld_InsertNpc	(Mod_7697_STT_Mud_REL, "REL_001");
	};
};

FUNC VOID STARTUP_Jaegerlager()
{
	CurrentLevel3 = JAEGERLAGER_ZEN;

	NameAllFires();

	// Druiden

	Wld_InsertNpc	(Mod_7417_JG_Cyrco_JL,		"JL_01");
	Wld_InsertNpc	(Mod_7436_JG_Wulfgar_MT,	"JL_01");

	// J?ger

	Wld_InsertNpc	(Mod_7520_JG_Ferd_JL,		"JL_01");
	Wld_InsertNpc	(Mod_7521_JG_Woron_JL,		"JL_01");
	Wld_InsertNpc	(Mod_7522_JG_Hungar_JL,		"JL_01");
	Wld_InsertNpc	(Mod_7523_JG_Ferros_JL,		"JL_01");
	Wld_InsertNpc	(Mod_7524_JG_Elsbeth_JL,	"JL_01");
	Wld_InsertNpc	(Mod_7555_JG_Klinger_JL,	"JL_01");
	Wld_InsertNpc	(Mod_7653_JG_Gandal_JL,		"JL_01");
	
};

FUNC VOID INIT_Jaegerlager()
{	
	Wld_SetMobRoutine (00,00,"FIREPLACE",1);
	Wld_SetMobRoutine (20,00,"FIREPLACE",1);
	Wld_SetMobRoutine (06,00,"FIREPLACE",0);

	OldLevel(JAEGERLAGER_ZEN);

	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();

	if (Kapitel >= 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Cyrco_Nahkampf))
	&& (Mod_JG_HockDa == 0)
	{
		Mod_JG_HockDa = 1;

		Wld_InsertNpc	(Mod_7539_SLD_Hock_JG, "JL_45");
	};

	if (Mod_JG_Khorgor == 1)
	{
		Mod_JG_Khorgor = 2;

		B_StartOtherRoutine	(Mod_7436_JG_Wulfgar_MT, "KHORGOR");
		B_StartOtherRoutine	(Mod_7417_JG_Cyrco_JL, "KHORGOR");
	};
};

FUNC VOID STARTUP_Wolkenwelt()
{
	CurrentLevel3 = WOLKENWELT_ZEN;

	NameAllFires();

	Wld_InsertNpc	(RosaHase_7187, "WW_01");

	Wld_InsertNpc	(Sheep, "WW_03");
	Wld_InsertNpc	(Sheep, "WW_03");
	Wld_InsertNpc	(Sheep, "WW_03");
	Wld_InsertNpc	(Sheep, "WW_03");
	Wld_InsertNpc	(Sheep, "WW_03");
	Wld_InsertNpc	(Hammel_WW, "WW_03");
	
};

FUNC VOID INIT_Wolkenwelt()
{
	OldLevel(WOLKENWELT_ZEN);

	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
};

FUNC VOID STARTUP_Halluzination()
{
	CurrentLevel3 = HALLUZINATION_ZEN;

	NameAllFires();

	// Story-Charaktere

	Wld_InsertNpc	(Mod_7329_HS_Raufbold_HAL, "HALU_02");
	Wld_InsertNpc	(Mod_7330_Meer_HAL, "HALU_03");

	// Ambient-Viecher

	Wld_InsertNpc	(Monster_11025_Wesen_HALU, "PSI_START");
	Wld_InsertNpc	(Monster_11026_Wesen_HALU, "PSI_START");
	Wld_InsertNpc	(Monster_11027_Wesen_HALU, "PSI_START");
	Wld_InsertNpc	(Monster_11028_Wesen_HALU, "PSI_START");
	Wld_InsertNpc	(Monster_11029_Wesen_HALU, "PSI_START");
	Wld_InsertNpc	(Monster_11030_Wesen_HALU, "PSI_START");
	Wld_InsertNpc	(Monster_11031_Wesen_HALU, "PSI_START");
	Wld_InsertNpc	(Monster_11032_Wesen_HALU, "PSI_START");
	Wld_InsertNpc	(Monster_11033_Wesen_HALU, "PSI_START");
	Wld_InsertNpc	(Monster_11034_Wesen_HALU, "PSI_START");
	Wld_InsertNpc	(Monster_11035_Wesen_HALU, "PSI_START");
	Wld_InsertNpc	(Monster_11036_Wesen_HALU, "PSI_START");
	Wld_InsertNpc	(Monster_11037_Wesen_HALU, "PSI_START");
	
};

FUNC VOID INIT_Halluzination()
{
	OldLevel(HALLUZINATION_ZEN);

	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
};

FUNC VOID STARTUP_Wald_Schlucht()
{
	CurrentLevel3 = WALDSCHLUCHT_ZEN;

	NameAllFires();

	// NPC's

	Wld_InsertNpc	(Mod_7360_OUT_Setta_WS, "WS_01");
	Wld_InsertNpc	(Mod_7359_OUT_Buff_WS, "WS_01");

	// Fleischwanzen in der H?hle

	Wld_InsertNpc	(Meatbug,	"FP_ROAM_MEATBUG_01");
	Wld_InsertNpc	(Meatbug,	"FP_ROAM_MEATBUG_03");
	Wld_InsertNpc	(Meatbug,	"FP_ROAM_MEATBUG_05");
	Wld_InsertNpc	(Meatbug,	"FP_ROAM_MEATBUG_07");
	Wld_InsertNpc	(Meatbug,	"FP_ROAM_MEATBUG_09");
	Wld_InsertNpc	(Meatbug,	"FP_ROAM_MEATBUG_11");
	Wld_InsertNpc	(Meatbug,	"FP_ROAM_MEATBUG_13");
	Wld_InsertNpc	(Meatbug,	"FP_ROAM_MEATBUG_15");
	Wld_InsertNpc	(Meatbug,	"FP_ROAM_MEATBUG_17");
	Wld_InsertNpc	(Meatbug,	"FP_ROAM_MEATBUG_19");
	Wld_InsertNpc	(Meatbug,	"FP_ROAM_MEATBUG_21");
	Wld_InsertNpc	(Meatbug,	"FP_ROAM_MEATBUG_23");

	// Drachensnapper & Razor zwischendrin

	Wld_InsertNpc	(Razor,	"FP_ROAM_MONSTER_01");	
	Wld_InsertNpc	(Dragonsnapper,	"FP_ROAM_MONSTER_02");	
	Wld_InsertNpc	(Razor,	"FP_ROAM_MONSTER_03");	
	Wld_InsertNpc	(Dragonsnapper,	"FP_ROAM_MONSTER_04");	
	Wld_InsertNpc	(Razor,	"FP_ROAM_MONSTER_05");	
};

FUNC VOID INIT_Wald_Schlucht()
{
	OldLevel(WALDSCHLUCHT_ZEN);

	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
};

FUNC VOID STARTUP_Drachental()
{
	CurrentLevel3 = DRACHENTAL_ZEN;

	NameAllFires();

	// Drache

	Wld_InsertNpc	(Wasserdrache_11054_DT, "DT_001");

	// Wachen

	Wld_InsertNpc	(Mod_7544_OUT_Wache_DT, "DT_001");
	Wld_InsertNpc	(Mod_7545_OUT_Wache_DT, "DT_001");
	Wld_InsertNpc	(Mod_7546_OUT_Wache_DT, "DT_001");
	Wld_InsertNpc	(Mod_7547_OUT_Wache_DT, "DT_001");
	Wld_InsertNpc	(Mod_7548_OUT_Wache_DT, "DT_001");
	Wld_InsertNpc	(Mod_7549_OUT_Wache_DT, "DT_001");
	Wld_InsertNpc	(Mod_7550_OUT_Wache_DT, "DT_001");
	Wld_InsertNpc	(Mod_7551_OUT_Wache_DT, "DT_001");
	Wld_InsertNpc	(Mod_7552_OUT_Wache_DT, "DT_001");
	Wld_InsertNpc	(Mod_7553_OUT_Wache_DT, "DT_001");

	// Khorgor

	Wld_InsertNpc	(Mod_7554_OUT_Khorgor_DT, "DT_001");
	
};

FUNC VOID INIT_Drachental()
{
	OldLevel(DRACHENTAL_ZEN);

	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();

	if (Npc_KnowsInfo(hero, Info_Mod_Drache_Drachendurst04))
	{
		Mdl_SetVisualBody		(Wasserdrache_11054_DT,	"Dragon_WATER_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	}
	else if (Npc_KnowsInfo(hero, Info_Mod_Drache_Drachendurst03))
	{
		Mdl_SetVisualBody		(Wasserdrache_11054_DT,	"Dragon_WATER04_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	}
	else if (Npc_KnowsInfo(hero, Info_Mod_Drache_Drachendurst02))
	{
		Mdl_SetVisualBody		(Wasserdrache_11054_DT,	"Dragon_WATER03_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	}
	else if (Npc_KnowsInfo(hero, Info_Mod_Drache_Drachendurst01))
	{
		Mdl_SetVisualBody		(Wasserdrache_11054_DT,	"Dragon_WATER02_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	}
	else
	{
		Mdl_SetVisualBody		(Wasserdrache_11054_DT,	"Dragon_WATER01_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	};
};

FUNC VOID STARTUP_Relendel_Mine()
{
	CurrentLevel3 = RELENDELMINE_ZEN;

	NameAllFires();

	Wld_InsertNpc	(Mod_7477_OUT_Norman_REL, "RM_01");
	Wld_InsertNpc	(Mod_7478_OUT_Roman_REL, "RM_01");
	Wld_InsertNpc	(Mod_7479_OUT_Frazer_REL, "RM_01");
	Wld_InsertNpc	(Mod_7484_OUT_Schuerfer_REL, "RM_01");
	Wld_InsertNpc	(Mod_7485_OUT_Schuerfer_REL, "RM_01");
	Wld_InsertNpc	(Mod_7486_OUT_Schuerfer_REL, "RM_01");
	Wld_InsertNpc	(Mod_7487_OUT_Schuerfer_REL, "RM_01");
	Wld_InsertNpc	(Mod_7488_OUT_Schuerfer_REL, "RM_01");
	Wld_InsertNpc	(Mod_7489_OUT_Wache_REL, "RM_01");
	Wld_InsertNpc	(Mod_7490_OUT_Wache_REL, "RM_01");
	
};

FUNC VOID INIT_Relendel_Mine()
{
	OldLevel(RELENDELMINE_ZEN);

	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
};