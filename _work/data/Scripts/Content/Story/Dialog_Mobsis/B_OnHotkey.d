////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
///
///		Script functions for HOTKEYS (called by the engine)
///
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
//
//	GAME_SCREEN_MAP
//

func int B_GetBestPlayerMap()
{
	if		(CurrentLevel == NEWWORLD_ZEN)
	{
		if		(Npc_HasItems(hero, ItWr_Map_NewWorld) >= 1)
		{
			return ItWr_Map_NewWorld;
		}
		else if (Npc_HasItems(hero, ItWr_Map_Shrine_MIS) >= 1)
		{
			return ItWr_Map_Shrine_MIS;
		}
		else if (Npc_HasItems(hero, ItWr_LageplanOrks) >= 1)
		{
			return ItWr_LageplanOrks;
		}
		else if	(Npc_HasItems(hero, ItWr_Map_Caves_MIS) >= 1)
		{
			return ItWr_Map_Caves_MIS;
		}
		else if (Npc_HasItems(hero, ItWr_Map_NewWorld_Ornaments_Addon) >= 1)
		{
			return ItWr_Map_NewWorld_Ornaments_Addon;
		}
		else if (Npc_HasItems(hero, ItWr_Map_NewWorld_Dexter) >= 1)
		{
			return ItWr_Map_NewWorld_Dexter;
		}
		else if (Npc_HasItems(hero, ItWr_ShatteredGolem_MIS) >= 1)
		{
			return ItWr_ShatteredGolem_MIS;
		}
		else if (Npc_HasItems(hero, ItWr_Map_Orcelite_MIS) >= 1)
		{
			return ItWr_Map_Orcelite_MIS;
		}
		else if (Npc_HasItems(hero, ItWr_Map_Perlenkram) >= 1)
		{
			return ItWr_Map_Perlenkram;
		}
		else if	(Npc_HasItems(hero, ItWr_Map_NewWorld_City) >= 1)
		{
			return ItWr_Map_NewWorld_City;
		};
	}
	else if (CurrentLevel == OLDWORLD_ZEN)
	{
		if		(Npc_HasItems(hero, ItWr_Map_OldWorld) >= 1)
		{
			return ItWr_Map_OldWorld;
		}
		else if	(Npc_HasItems(hero, ItWr_Map_OldWorld_Oremines_MIS) >= 1)
		{
			return ItWr_Map_OldWorld_Oremines_MIS;
		};
	}
	else if (CurrentLevel == EISGEBIET_ZEN)
	{
		if (Npc_HasItems(hero, ItWr_Map_Eisgebiet) >= 1)
		{
			return ItWr_Map_Eisgebiet;
		}
		else if (Npc_HasItems(hero, ItWr_Map_Eisgebiet_Richard) >= 1)
		{
			return ItWr_Map_Eisgebiet_Richard;
		};
	}
	else if (CurrentLevel == DRAGONISLAND_ZEN)
	{
		// none
	}
	else if (CurrentLevel == ADDONWORLD_ZEN)
	{
		if		(Npc_HasItems(hero, ItWr_Map_AddonWorld) >= 1)
		{
			return ItWr_Map_AddonWorld;
		}
		else if (Npc_HasItems(hero, ItWr_Addon_TreasureMap) >= 1)
		{
			return ItWr_Addon_TreasureMap;
		}
		else if (Npc_HasItems(hero, ItWr_Map_Eremit) >= 1)
		{
			return ItWr_Map_Eremit;
		};
	}
	else if (CurrentLevel == MINENTAL_ZEN)
	{
		if		(Npc_HasItems(hero, ItWrWorldMap_Orc) >= 1)
		{
			return ItWrWorldMap_Orc;
		}
		else if		(Npc_HasItems(hero, ItWrWorldMap) >= 1)
		{
			return ItWrWorldMap;
		}
		else if		(Npc_HasItems(hero, ItWrWorldMapZufluchten) >= 1)
		{
			return ItWrWorldMapZufluchten;
		}
		else if		(Npc_HasItems(hero, ItWr_EremitenCamp) >= 1)
		{
			return ItWr_EremitenCamp;
		}
		else if		(Npc_HasItems(hero, ItWrFociMap) >= 1)
		{
			return ItWrFociMap;
		}
		else if		(Npc_HasItems(hero, ItWr_NicksMap) >= 1)
		{
			return ItWr_NicksMap;
		}
		else if		(Npc_HasItems(hero, ItWrOCMap) >= 1)
		{
			return ItWrOCMap;
		}
		else if		(Npc_HasItems(hero, ItWrNCMap) >= 1)
		{
			return ItWrNCMap;
		}
		else if		(Npc_HasItems(hero, ItWrPSIMap) >= 1)
		{
			return ItWrPSIMap;
		};
	}
	else if (CurrentLevel == OLDMINE_ZEN)
	{
	}
	else if (CurrentLevel == FREEMINE_ZEN)
	{
	}
	else if (CurrentLevel == ABANDONEDMINE_ZEN)
	{
	}
	else if (CurrentLevel == ORCGRAVEYARD_ZEN)
	{
	}
	else if (CurrentLevel == ORCTEMPEL_ZEN)
	{
		if (Npc_HasItems(hero, ItWrTempleMap) >= 1)
		{
			return ItWrTempleMap;
		};
	}
	else if (CurrentLevel == ORCCITY_ZEN)
	{
	}
	else if (CurrentLevel == GDG_WORLD_ZEN)
	{
	}
	else if (CurrentLevel == DIEINSEL_ZEN)
	{
	}
	else if (CurrentLevel == XERESWELT_ZEN)
	{
	};
	
	return 0;
};

func int B_GetAnyPlayerMap()
{
	if	(Npc_HasItems(hero, ItWr_Map_NewWorld) >= 1)
	{
		return ItWr_Map_NewWorld;
	}
	else if (Npc_HasItems(hero, ItWr_Map_Shrine_MIS) >= 1)
	{
		return ItWr_Map_Shrine_MIS;
	}
	else if (Npc_HasItems(hero, ItWr_Map_Perlenkram) >= 1)
	{
		return ItWr_Map_Perlenkram;
	}
	else if (Npc_HasItems(hero, ItWr_LageplanOrks) >= 1)
	{
		return ItWr_LageplanOrks;
	}
	else if	(Npc_HasItems(hero, ItWr_Map_Caves_MIS) >= 1)
	{
		return ItWr_Map_Caves_MIS;
	}
	else if (Npc_HasItems(hero, ItWr_Map_NewWorld_Ornaments_Addon) >= 1)
	{
		return ItWr_Map_NewWorld_Ornaments_Addon;
	}
	else if (Npc_HasItems(hero, ItWr_Map_NewWorld_Dexter) >= 1)
	{
		return ItWr_Map_NewWorld_Dexter;
	}
	else if (Npc_HasItems(hero, ItWr_ShatteredGolem_MIS) >= 1)
	{
		return ItWr_ShatteredGolem_MIS;
	}
	else if (Npc_HasItems(hero, ItWr_Map_Orcelite_MIS) >= 1)
	{
		return ItWr_Map_Orcelite_MIS;
	}
	else if	(Npc_HasItems(hero, ItWr_Map_NewWorld_City) >= 1)
	{
		return ItWr_Map_NewWorld_City;
	}
	else if	(Npc_HasItems(hero, ItWr_Map_OldWorld) >= 1)
	{
		return ItWr_Map_OldWorld;
	}
	else if	(Npc_HasItems(hero, ItWr_Map_OldWorld_Oremines_MIS) >= 1)
	{
		return ItWr_Map_OldWorld_Oremines_MIS;
	}
	else if	(Npc_HasItems(hero, ItWr_Map_AddonWorld) >= 1)
	{
		return ItWr_Map_AddonWorld;
	}
	else if (Npc_HasItems(hero, ItWr_Addon_TreasureMap) >= 1)
	{
		return ItWr_Addon_TreasureMap;
	}
	else if (Npc_HasItems(hero, ItWr_Map_Eremit) >= 1)
	{
		return ItWr_Map_Eremit;
	}
	else if (Npc_HasItems(hero, ItWr_EremitenCamp) >= 1)
	{
		return ItWr_EremitenCamp;
	}
	else if (Npc_HasItems(hero, ItWr_Map_Eisgebiet) >= 1)
	{
		return ItWr_Map_Eisgebiet;
	}
	else if (Npc_HasItems(hero, ItWr_Map_Eisgebiet_Richard) >= 1)
	{
		return ItWr_Map_Eisgebiet_Richard;
	};

	return 0;
};

func int PLAYER_HOTKEY_SCREEN_MAP()
{
	var int OldInstance;
	OldInstance = B_GetPlayerMap();
	
	////////////////////////////////////////////////////////////
	// Check if the current map is in the inventory

	if ((OldInstance > 0) && (Npc_HasItems(hero, OldInstance) < 1))
	{
		OldInstance = 0;
	};
	B_SetPlayerMap(OldInstance);

	var int NewInstance;
	NewInstance = OldInstance;

	////////////////////////////////////////////////////////////
	// Check if the current map is for another level

	if (CurrentLevel != NEWWORLD_ZEN)
	{
		if ((OldInstance == ItWr_Map_Caves_MIS)					||
			(OldInstance == ItWr_LageplanOrks)				||
			(OldInstance == ItWr_Map_NewWorld)					||
			(OldInstance == ItWr_Map_NewWorld_City)				||
			(OldInstance == ItWr_Map_NewWorld_Dexter)			||
			(OldInstance == ItWr_Map_NewWorld_Ornaments_Addon)	||
			(OldInstance == ItWr_Map_Orcelite_MIS)				||
			(OldInstance == ItWr_Map_Shrine_MIS)				||
			(OldInstance == ItWr_Map_Perlenkram)				||
			(OldInstance == ItWr_ShatteredGolem_MIS)			)
		{
			NewInstance = 0;
		};
	};
	if (CurrentLevel != OLDWORLD_ZEN)
	{
		if ((OldInstance == ItWr_Map_OldWorld)					||
			(OldInstance == ItWr_Map_OldWorld_Oremines_MIS)		)
		{
			NewInstance = 0;
		};
	};
	if (CurrentLevel != DRAGONISLAND_ZEN)
	{
		// none
	};
	if (CurrentLevel != ADDONWORLD_ZEN)
	{
		if ((OldInstance == ItWr_Map_AddonWorld)
		|| (OldInstance == ItWr_Addon_TreasureMap)
		|| (OldInstance == ItWr_Map_Eremit))
		{
			NewInstance = 0;
		};
	};
	
	////////////////////////////////////////////////////////////
	// Check for better maps

	if (NewInstance <= 0)
	{
		NewInstance = B_GetBestPlayerMap();
	};
	if ((NewInstance <= 0) && (OldInstance <= 0))
	{
		NewInstance = B_GetAnyPlayerMap();
	};

	////////////////////////////////////////////////////////////
	// Return the map to use

	if (NewInstance > 0)
	{
		B_SetPlayerMap(NewInstance);
		return NewInstance;
	}
	else
	{
		return OldInstance;
	};
};

////////////////////////////////////////////////////////////////////////////////
//
//	GAME_LAME_POTION / GAME_LAME_HEAL
//

func void B_LameSchlork ()
{
	Snd_Play ("DRINKBOTTLE");
};

// Hotkey P

instance test (zCMenu);

func void PLAYER_HOTKEY_LAME_POTION()
{
	if (BT_on == FALSE)
	&& (SlowMotion_Perk == TRUE)
	{
		if (Npc_IsPlayer(hero))
		{
			if (Slowmotiontime >= 0)
			{
				if (hero.level >=50)
				{
					Wld_PlayEffect("SLOW_MOTION_6", hero, hero, 0, 0, 0, FALSE);

					Slowmotionbonus = 1;
				}
				else if (hero.level >=40)
				{
					Wld_PlayEffect("SLOW_MOTION_5", hero, hero, 0, 0, 0, FALSE);
				}
				else if (hero.level >=30)
				{
					Wld_PlayEffect("SLOW_MOTION_4", hero, hero, 0, 0, 0, FALSE);
				}
				else if (hero.level >=20)
				{
					Wld_PlayEffect("SLOW_MOTION_3", hero, hero, 0, 0, 0, FALSE);
				}
				else if (hero.level >=10)
				{
					Wld_PlayEffect("SLOW_MOTION_2", hero, hero, 0, 0, 0, FALSE);
				}
				else if (hero.level >=0)
				{
					Wld_PlayEffect("SLOW_MOTION_1", hero, hero, 0, 0, 0, FALSE);
				};

				BT_on = TRUE;
			};
		};
	}
	else
	{
		Wld_StopEffect("SLOW_MOTION_1");
		Wld_StopEffect("SLOW_MOTION_2");
		Wld_StopEffect("SLOW_MOTION_3");
		Wld_StopEffect("SLOW_MOTION_4");
		Wld_StopEffect("SLOW_MOTION_5");
		Wld_StopEffect("SLOW_MOTION_6");

		Slowmotionbonus = 0;

		BT_on = FALSE;
	};
};

INSTANCE PC_AniLog_Anbeten (C_INFO)
{
	nr 		= 1;
	npc 		= PC_Hero;
	condition 	= PC_AniLog_Anbeten_Condition;
	information 	= PC_AniLog_Anbeten_Info;
	permanent 	= 1;
	important	= 0;
	description 	= "Anbeten"; 
};

FUNC INT PC_AniLog_Anbeten_Condition()
{ 
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_AniLog))
	&& (Mod_AniLog_Status == 0)
	{ 
		return 1;
	};
};

FUNC VOID PC_AniLog_Anbeten_Info ()
{ 
	AI_PlayAni	(PC_Hero, "T_STAND_2_PRAY");	

	Mod_AniLog_Status = 3;

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_AniLog_Setzen (C_INFO)
{
	nr 		= 2;
	npc 		= PC_Hero;
	condition 	= PC_AniLog_Setzen_Condition;
	information 	= PC_AniLog_Setzen_Info;
	permanent 	= 1;
	important	= 0;
	description 	= "Hinsetzen"; 
};

FUNC INT PC_AniLog_Setzen_Condition()
{ 
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_AniLog))
	&& (Mod_AniLog_Status == 0)
	{ 
		return 1;
	};
};

FUNC VOID PC_AniLog_Setzen_Info ()
{ 
	AI_PlayAni	(PC_Hero, "T_STAND_2_SIT");	

	Mod_AniLog_Status = 1;

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_AniLog_Klatschen (C_INFO)
{
	nr 		= 3;
	npc 		= PC_Hero;
	condition 	= PC_AniLog_Klatschen_Condition;
	information 	= PC_AniLog_Klatschen_Info;
	permanent 	= 1;
	important	= 0;
	description 	= "Klatschen"; 
};

FUNC INT PC_AniLog_Klatschen_Condition()
{ 
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_AniLog))
	&& (Mod_AniLog_Status == 0)
	{ 
		return 1;
	};
};

FUNC VOID PC_AniLog_Klatschen_Info ()
{ 
	AI_PlayAni	(PC_Hero, "T_STAND_2_CLAPHANDS");	

	Mod_AniLog_Status = 2;

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_AniLog_Pinkeln (C_INFO)
{
	nr 		= 4;
	npc 		= PC_Hero;
	condition 	= PC_AniLog_Pinkeln_Condition;
	information 	= PC_AniLog_Pinkeln_Info;
	permanent 	= 1;
	important	= 0;
	description 	= "Pinkeln"; 
};

FUNC INT PC_AniLog_Pinkeln_Condition()
{ 
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_AniLog))
	&& (Mod_AniLog_Status == 0)
	{ 
		return 1;
	};
};

FUNC VOID PC_AniLog_Pinkeln_Info ()
{ 
	AI_PlayAni	(PC_Hero, "T_STAND_2_PEE");	

	Mod_AniLog_Status = 4;

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_AniLog_Tanzen (C_INFO)
{
	nr 		= 5;
	npc 		= PC_Hero;
	condition 	= PC_AniLog_Tanzen_Condition;
	information 	= PC_AniLog_Tanzen_Info;
	permanent 	= 1;
	important	= 0;
	description 	= "Tanzen"; 
};

FUNC INT PC_AniLog_Tanzen_Condition()
{ 
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_AniLog))
	&& (Mod_AniLog_Status == 0)
	{ 
		return 1;
	};
};

FUNC VOID PC_AniLog_Tanzen_Info ()
{ 
	var int danceStyle;
	danceStyle = Hlp_Random(9);

	if ( danceStyle == 0 )
	{
		AI_PlayAni(PC_Hero, "T_DANCE_01");
	};
	if ( danceStyle == 1 )
	{
		AI_PlayAni(PC_Hero, "T_DANCE_02");
	};
	if ( danceStyle == 2 )
	{
		AI_PlayAni(PC_Hero, "T_DANCE_03");
	};
	if ( danceStyle == 3 )
	{
		AI_PlayAni(PC_Hero, "T_DANCE_04");
	};
	if ( danceStyle == 4 )
	{
		AI_PlayAni(PC_Hero, "T_DANCE_05");
	};
	if ( danceStyle == 5 )
	{
		AI_PlayAni(PC_Hero, "T_DANCE_06");
	};
	if ( danceStyle == 6 )
	{
		AI_PlayAni(PC_Hero, "T_DANCE_07");
	};
	if ( danceStyle == 7 )
	{
		AI_PlayAni(PC_Hero, "T_DANCE_08");
	};
	if ( danceStyle == 8 )
	{
		AI_PlayAni(PC_Hero, "T_DANCE_09");
	};

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_AniLog_AnbetenStop (C_INFO)
{
	nr 		= 998;
	npc 		= PC_Hero;
	condition 	= PC_AniLog_AnbetenStop_Condition;
	information 	= PC_AniLog_AnbetenStop_Info;
	permanent 	= 1;
	important	= 0;
	description 	= "Aufstehen"; 
};

FUNC INT PC_AniLog_AnbetenStop_Condition()
{ 
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_AniLog))
	&& (Mod_AniLog_Status == 3)
	{ 
		return 1;
	};
};

FUNC VOID PC_AniLog_AnbetenStop_Info ()
{ 
	AI_PlayAni	(PC_Hero, "T_PRAY_2_STAND");		

	Mod_AniLog_Status = 0;

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_AniLog_SetzenStop (C_INFO)
{
	nr 		= 998;
	npc 		= PC_Hero;
	condition 	= PC_AniLog_SetzenStop_Condition;
	information 	= PC_AniLog_SetzenStop_Info;
	permanent 	= 1;
	important	= 0;
	description 	= "Aufstehen"; 
};

FUNC INT PC_AniLog_SetzenStop_Condition()
{ 
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_AniLog))
	&& (Mod_AniLog_Status == 1)
	{ 
		return 1;
	};
};

FUNC VOID PC_AniLog_SetzenStop_Info ()
{ 
	AI_PlayAni	(PC_Hero, "T_SIT_2_STAND");		

	Mod_AniLog_Status = 0;

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_AniLog_KlatschenStop (C_INFO)
{
	nr 		= 998;
	npc 		= PC_Hero;
	condition 	= PC_AniLog_KlatschenStop_Condition;
	information 	= PC_AniLog_KlatschenStop_Info;
	permanent 	= 1;
	important	= 0;
	description 	= "Aufhören zu Klatschen"; 
};

FUNC INT PC_AniLog_KlatschenStop_Condition()
{ 
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_AniLog))
	&& (Mod_AniLog_Status == 2)
	{ 
		return 1;
	};
};

FUNC VOID PC_AniLog_KlatschenStop_Info ()
{ 
	AI_PlayAni	(PC_Hero, "T_CLAPHANDS_2_STAND");	

	Mod_AniLog_Status = 0;

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_AniLog_PinkelnStop (C_INFO)
{
	nr 		= 998;
	npc 		= PC_Hero;
	condition 	= PC_AniLog_PinkelnStop_Condition;
	information 	= PC_AniLog_PinkelnStop_Info;
	permanent 	= 1;
	important	= 0;
	description 	= "Aufhören zu Pinkeln"; 
};

FUNC INT PC_AniLog_PinkelnStop_Condition()
{ 
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_AniLog))
	&& (Mod_AniLog_Status == 4)
	{ 
		return 1;
	};
};

FUNC VOID PC_AniLog_PinkelnStop_Info ()
{ 
	AI_PlayAni	(PC_Hero, "T_PEE_2_STAND");	

	Mod_AniLog_Status = 0;

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_AniLog_End (C_Info)
{
	npc 		= PC_Hero;
	nr 		= 999;
	condition 	= PC_AniLog_End_Condition;
	information 	= PC_AniLog_End_Info;
	permanent 	= 1;
	important	= 0;
	description 	= DIALOG_ENDE; 
};

FUNC INT PC_AniLog_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_AniLog) //Wenn AniLog-Mobsi aktiv
	{ 
		return 1;
	};
};

FUNC VOID PC_AniLog_End_Info()
{
	B_ENDPRODUCTIONDIALOG (); //Beendet das Dialogmenü
};

func void PLAYER_HOTKEY_LAME_HEAL ()
{
	if (LoreRelendel != 1)
	&& (LoreRelendel != 2)
	&& (LoreKhorinis != 1)
	&& (LoreKhorinis != 2)
	&& (LoreEisgebietMine01 != 1)
	&& (LoreEisgebietMine01 != 2)
	&& (LoreEisgebietMine01 != 4)
	&& (LoreEisgebietMine01 != 5)
	&& (LoreEisgebietSW01 != 1)
	&& (LoreEisgebietSW01 != 2)
	&& (LoreEisgebietSW01 != 4)
	&& (LoreEisgebietSW01 != 5)
	{
		var C_NPC her; her = Hlp_GetNpc(PC_Hero);

		B_SetAivar(her, AIV_INVINCIBLE, TRUE); //Gegner greifen nicht an, solange der Held im Auswahlmodus ist
		PLAYER_MOBSI_PRODUCTION = MOBSI_AniLog; //Der Mobsi AniLog ist aktiv
		AI_ProcessInfos (her); //Dialog wird gestartet
	};
};
