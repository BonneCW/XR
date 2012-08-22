var int   RAKEPLACE[50]; 
const int Greg_FirstSecret	= 1 ;
const int RAKE_BUDDEL_DIST_MAX = 300;
const int RAKE_BUDDEL_DIST_MIN = 200;

func void RakeTreasureSuccess (var C_ITEM itm)
{
	Wld_PlayEffect("spellFX_ItemAusbuddeln",  itm, itm, 0, 0, 0, FALSE );
	B_Say_Overlay (self, self, "$FOUNDTREASURE");
	B_GivePlayerXP (50);
};

FUNC VOID B_SCUsesRake(var C_NPC slf)
{
	//alte Use-Item-Funktion
};

FUNC VOID B_SCGetTreasure_S1()
{
	if 	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))	//FixmeJoly:RAKEPLACE [1] nummerierung checken.
	{
	//NEWWORLD_ZEN
				if ((Npc_GetDistToWP(hero,					"NW_BIGFARM_LAKE_CAVE_07"	)< RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[Greg_FirstSecret]==FALSE))
				{
					Wld_InsertItem 		(ItSe_GoldPocket25, "NW_BIGFARM_LAKE_CAVE_07"	); 				 			 RAKEPLACE[Greg_FirstSecret]=TRUE;	//Joly: Auftrag von GREG_NW  RAKEPLACE[1] wird als Abfrage verwendet, nicht ändern.
					RakeTreasureSuccess (ItSe_GoldPocket25);
				}
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,				"NW_LAKE_GREG_TREASURE_01"	)< RAKE_BUDDEL_DIST_MIN) 		&&  (RAKEPLACE[2]==FALSE)){
				Wld_InsertItem 		(ItSe_GoldPocket100, 	"NW_LAKE_GREG_TREASURE_01"	); 							 		 RAKEPLACE[2]=TRUE;
				RakeTreasureSuccess (ItSe_GoldPocket100);}
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,				"NW_FARM3_GREGTREASURE_01"	)< RAKE_BUDDEL_DIST_MIN) 		&&  (RAKEPLACE[3]==FALSE)){
				Wld_InsertItem 		(ItMi_GoldCup, 			"NW_FARM3_GREGTREASURE_01"	); 									 RAKEPLACE[3]=TRUE;
				RakeTreasureSuccess (ItMi_GoldCup);}
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,				"NW_FARM3_MOUNTAINLAKE_MONSTER_01"	)< RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[4]==FALSE)){	
				Wld_InsertItem 		(ItMi_SilverChalice, 	"NW_FARM3_MOUNTAINLAKE_MONSTER_01"	); 							 RAKEPLACE[4]=TRUE;
				RakeTreasureSuccess (ItMi_SilverChalice);}
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,				"NW_BIGMILL_FARM3_01"	)< RAKE_BUDDEL_DIST_MIN) 			&& 	(RAKEPLACE[5]==FALSE)){
				Wld_InsertItem 		(ItAm_Prot_Point_01, 			"NW_BIGMILL_FARM3_01"	); 						 		 RAKEPLACE[5]=TRUE;
				RakeTreasureSuccess (ItAm_Prot_Point_01);}
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	//ADDONWORLD_ZEN
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//			ENTRANCE
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,						"ADW_ENTRANCE_RAKEPLACE_01"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[12]==FALSE)){
				Wld_InsertItem 		(ItWr_StonePlateCommon_Addon,	"ADW_ENTRANCE_RAKEPLACE_01"	); 							 			 RAKEPLACE[12]=TRUE;
				Wld_InsertItem 		(ItMi_SilverChalice, 			"ADW_ENTRANCE_RAKEPLACE_01"	); 							 			 
				RakeTreasureSuccess (ItMi_SilverChalice);}
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,					"ADW_ENTRANCE_RAKEPLACE_02"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[13]==FALSE)){
				Wld_InsertItem 		(ItWr_DexStonePlate1_Addon,	"ADW_ENTRANCE_RAKEPLACE_02"	); 							 			 RAKEPLACE[13]=TRUE;
				Wld_InsertItem 		(ItMi_GoldCup, 				"ADW_ENTRANCE_RAKEPLACE_02"	); 							 			 
				RakeTreasureSuccess (ItMi_GoldCup);}
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,					"ADW_ENTRANCE_RAKEPLACE_03"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[14]==FALSE)){
				Wld_InsertItem 		(ItPo_Perm_Health, 			"ADW_ENTRANCE_RAKEPLACE_03"	); 							 			 RAKEPLACE[14]=TRUE;
				Wld_InsertItem 		(ItSe_GoldPocket100, 		"ADW_ENTRANCE_RAKEPLACE_03"	); 							 			
				RakeTreasureSuccess (ItSe_GoldPocket100);}
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,					"ADW_ENTRANCE_RAKEPLACE_04"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[15]==FALSE)){
				Wld_InsertItem 		(ItMi_SilverRing, 			"ADW_ENTRANCE_RAKEPLACE_04"	); 							 			 RAKEPLACE[15]=TRUE;
				Wld_InsertItem 		(ItMw_Schwert4, 			"ADW_ENTRANCE_RAKEPLACE_04"	); 							 			
				RakeTreasureSuccess (ItMw_Schwert4);}
		
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//			VALLEY
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,					"ADW_VALLEY_GREGTREASURE_01"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[16]==FALSE)){
				Wld_InsertItem 		(ItSe_GoldPocket100, 		"ADW_VALLEY_GREGTREASURE_01"	); 							 			 RAKEPLACE[16]=TRUE;
				Wld_InsertItem 		(ItPo_Health_02, 			"ADW_VALLEY_GREGTREASURE_01"	); 							 			 
				Wld_InsertItem 		(ItPo_Mana_03, 				"ADW_VALLEY_GREGTREASURE_01"	); 							 			 
				RakeTreasureSuccess (ItPo_Mana_03);}
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,					"ADW_VALLEY_RAKEPLACE_01"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[17]==FALSE)){
				Wld_InsertItem 		(ItPo_Mana_Addon_04, 		"ADW_VALLEY_RAKEPLACE_01"	); 							 			 RAKEPLACE[17]=TRUE;
				Wld_InsertItem 		(ItPo_Speed, 				"ADW_VALLEY_RAKEPLACE_01"	); 							 			
				Wld_InsertItem 		(ItPo_Mana_02, 				"ADW_VALLEY_RAKEPLACE_01"	); 							 			
				RakeTreasureSuccess (ItPo_Mana_02);}
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,						"ADW_VALLEY_RAKEPLACE_02"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[18]==FALSE)){
				Wld_InsertItem 		(ItPo_Health_Addon_04, 			"ADW_VALLEY_RAKEPLACE_02"	); 							 			 RAKEPLACE[18]=TRUE;
				Wld_InsertItem 		(ItWr_StonePlateCommon_Addon, 	"ADW_VALLEY_RAKEPLACE_02"	); 							 			
				Wld_InsertItem 		(ItSe_LockpickFisch, 			"ADW_VALLEY_RAKEPLACE_02"	); 							 			
				RakeTreasureSuccess (ItSe_LockpickFisch);}
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,						"ADW_VALLEY_RAKEPLACE_03"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[19]==FALSE)){
				Wld_InsertItem 		(ItSc_Firerain, 				"ADW_VALLEY_RAKEPLACE_03"	); 							 			 RAKEPLACE[19]=TRUE;
				Wld_InsertItem 		(ItSe_GoldPocket50, 			"ADW_VALLEY_RAKEPLACE_03"	); 							 			 	
				Wld_InsertItem 		(ItWr_StonePlateCommon_Addon, 	"ADW_VALLEY_RAKEPLACE_03"	); 							 			 	
				RakeTreasureSuccess (ItSe_GoldPocket50);}
	
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//			BANDITSCAMP
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,						"ADW_BANDITSCAMP_RAKEPLACE_01"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[20]==FALSE)){
				Wld_InsertItem 		(ItMi_Honigtabak, 				"ADW_BANDITSCAMP_RAKEPLACE_01"	); 							 			 RAKEPLACE[20]=TRUE;
				Wld_InsertItem 		(ItWr_StonePlateCommon_Addon, 	"ADW_BANDITSCAMP_RAKEPLACE_01"	); 							 			 
				Wld_InsertItem 		(ItAm_Addon_MANA, 				"ADW_BANDITSCAMP_RAKEPLACE_01"	); 							 			 
				RakeTreasureSuccess (ItAm_Addon_MANA);}
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,					"ADW_BANDITSCAMP_RAKEPLACE_02"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[21]==FALSE)){
				Wld_InsertItem 		(ItSc_SumGobSkel, 			"ADW_BANDITSCAMP_RAKEPLACE_02"	); 							 			 RAKEPLACE[21]=TRUE;
				Wld_InsertItem 		(ItPo_Mana_03,	 			"ADW_BANDITSCAMP_RAKEPLACE_02"	); 							 			
				RakeTreasureSuccess (ItPo_Mana_03);}
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,					"ADW_BANDITSCAMP_RAKEPLACE_03"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[22]==FALSE)){
				Wld_InsertItem 		(ItSc_TrfShadowbeast, 		"ADW_BANDITSCAMP_RAKEPLACE_03"	); 							 			 RAKEPLACE[22]=TRUE;
				Wld_InsertItem 		(ItSc_LightHeal, 			"ADW_BANDITSCAMP_RAKEPLACE_03"	); 							 			
				RakeTreasureSuccess (ItSc_LightHeal);}
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,						"ADW_BANDITSCAMP_RAKEPLACE_04"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[23]==FALSE)){
				Wld_InsertItem 		(ItWr_StonePlateCommon_Addon,	"ADW_BANDITSCAMP_RAKEPLACE_04"	); 							 			 RAKEPLACE[23]=TRUE;
				Wld_InsertItem 		(ItRi_HP_01, 					"ADW_BANDITSCAMP_RAKEPLACE_04"	); 							 			
				RakeTreasureSuccess (ItRi_HP_01);}


			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//			CANYON
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,					"ADW_CANYON_MINE1_11"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[24]==FALSE)){
				Wld_InsertItem 		(ItSE_Addon_FrancisChest, 	"ADW_CANYON_MINE1_11"	); 							 			 RAKEPLACE[24]=TRUE;
				RakeTreasureSuccess (ItSE_Addon_FrancisChest);}
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,					"ADW_CANYON_RAKEPLACE_01"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[25]==FALSE)){
				Wld_InsertItem 		(ItMi_RuneBlank, 			"ADW_CANYON_RAKEPLACE_01"	); 							 			 RAKEPLACE[25]=TRUE;
				Wld_InsertItem 		(ItSe_GoldPocket25, 		"ADW_CANYON_RAKEPLACE_01"	); 							 			 
				RakeTreasureSuccess (ItSe_GoldPocket25);}
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,					"ADW_CANYON_RAKEPLACE_02"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[26]==FALSE)){
				Wld_InsertItem 		(ItMi_Nugget, 				"ADW_CANYON_RAKEPLACE_02"	); 							 			 RAKEPLACE[26]=TRUE;
				Wld_InsertItem 		(ItSc_LightningFlash, 		"ADW_CANYON_RAKEPLACE_02"	); 							 			
				Wld_InsertItem 		(ItSc_ChargeFireBall, 		"ADW_CANYON_RAKEPLACE_02"	); 							 			
				RakeTreasureSuccess (ItSc_ChargeFireBall);}
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,					"ADW_CANYON_RAKEPLACE_03"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[27]==FALSE)){
				Wld_InsertItem 		(ItSe_GoldPocket25, 		"ADW_CANYON_RAKEPLACE_03"	); 							 			 RAKEPLACE[27]=TRUE;
				Wld_InsertItem 		(ItWr_ManaStonePlate1_Addon,"ADW_CANYON_RAKEPLACE_03"	); 							 			 
				Wld_InsertItem 		(ItMi_Pitch, 				"ADW_CANYON_RAKEPLACE_03"	); 							 			 
				RakeTreasureSuccess (ItMi_Pitch);}
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,					"ADW_CANYON_RAKEPLACE_04"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[28]==FALSE)){
				Wld_InsertItem 		(ItMi_SilverRing, 			"ADW_CANYON_RAKEPLACE_04"	); 							 			 RAKEPLACE[28]=TRUE;
				Wld_InsertItem 		(ItMi_Sulfur, 				"ADW_CANYON_RAKEPLACE_04"	); 							 			
				//Wld_InsertItem 		(ItWr_TwoHStonePlate1_Addon,"ADW_CANYON_RAKEPLACE_04"	); 							 			
				//RakeTreasureSuccess (ItWr_TwoHStonePlate1_Addon);
				}
				////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,					"ADW_CANYON_RAKEPLACE_05"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[29]==FALSE)){
				Wld_InsertItem 		(ItMi_GoldRing, 			"ADW_CANYON_RAKEPLACE_05"	); 							 			 RAKEPLACE[29]=TRUE;
				Wld_InsertItem 		(ItAt_DragonBlood, 			"ADW_CANYON_RAKEPLACE_05"	); 							 			 
				RakeTreasureSuccess (ItAt_DragonBlood);}

			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//			PIRATECAMP
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				else if ((Npc_GetDistToWP(hero,					"ADW_PIRATECAMP_GREGTREASURE_KOMPASS"	)< RAKE_BUDDEL_DIST_MIN) 			&&  (RAKEPLACE[30]==FALSE)){
				Wld_InsertItem 		(ItMI_Addon_Kompass_Mis, 	"ADW_PIRATECAMP_GREGTREASURE_KOMPASS"	); 							 			 RAKEPLACE[30]=TRUE;
				RakeTreasureSuccess (ItMI_Addon_Kompass_Mis);};

	};	
};

FUNC VOID B_SAATBLUTKULT_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	&& (Npc_HasItems(hero, ItAt_ErzdemonTooth) == 1)
	{
		Npc_RemoveInvItems	(hero, ItAt_ErzdemonTooth, 1);

		Wld_SpawnNpcRange	(hero, Demon_BK, 1, 500);
		Wld_SpawnNpcRange	(hero, Zombie01, 1, 500);
		Wld_SpawnNpcRange	(hero, Zombie_Woman01, 1, 500);
		Wld_SpawnNpcRange	(hero, Zombie02, 1, 500);
		Wld_SpawnNpcRange	(hero, DemonEchse_BK, 1, 500);

		PrintScreen	("Zähne des Erzdämons gesät", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

FUNC VOID USEDUENGER_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		PrintScreen	("Dünger verteilt", -1, YPOS_XPGained, FONT_ScreenSmall, 2);

		Npc_RemoveInvItems	(hero, ItMi_DuengerPaket, 1);
	};
};

var int Schatz_Greg_01;

FUNC VOID B_Schatzgraben_01_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	&& (Schatz_Greg_01 == FALSE)
	{
		CreateInvItems(hero, ItMi_Sextant_Greg, 1);

		Schatz_Greg_01 = TRUE;

		PrintScreen	("Sextant gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

var int Schatz_Greg_02;

FUNC VOID B_Schatzgraben_02_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	&& (Schatz_Greg_02 == FALSE)
	{
		CreateInvItems(hero, ItMi_JeweleryChest_Greg, 1);

		Schatz_Greg_02 = TRUE;

		PrintScreen	("Juwelen Schatulle gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

var int Schatz_Greg_03;

FUNC VOID B_Schatzgraben_03_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	&& (Schatz_Greg_03 == FALSE)
	{
		CreateInvItems(hero, ItMi_DarkPearl_Greg, 1);

		Schatz_Greg_03 = TRUE;

		PrintScreen	("Schwarze Perle gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

var int Schatz_Greg_04;

FUNC VOID B_Schatzgraben_04_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	&& (Schatz_Greg_04 == FALSE)
	{
		CreateInvItems(hero, ItMw_Piratensaebel_Greg, 1);

		Schatz_Greg_04 = TRUE;

		PrintScreen	("Piratensäbel gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

var int Schatz_Greg_05;

FUNC VOID B_Schatzgraben_05_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	&& (Schatz_Greg_05 == FALSE)
	{
		CreateInvItems(hero, ItMi_RuneBlank_Greg, 1);

		Schatz_Greg_05 = TRUE;

		PrintScreen	("Runenstein gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

var int Schatz_Deppenhans;

FUNC VOID B_Schatzgraben_Deppenhans_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	&& (Schatz_Deppenhans == FALSE)
	{
		CreateInvItems(hero, ItMi_GoldNugget_Addon, 11);
		CreateInvItems(hero, ItMi_Nugget, 5);

		Schatz_Deppenhans = TRUE;

		PrintScreen	("11 Goldbrocken und 5 Erzbrocken gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

FUNC VOID B_Schatzgraben_OrkAmulett_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		CreateInvItems(hero, ItAm_MegaAmulett2, 1);

		PrintScreen	("Amulett gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);

		B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Endlich habe ich das richtige Amulett. Ich sollte jetzt damit zu Dexter gehen.");
	};
};

var int Schatz_GorNaKosh;

FUNC VOID B_Schatzgraben_GorNaKosh_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	&& (Schatz_GorNaKosh == FALSE)
	{
		CreateInvItems(hero, ItMi_GorNaKoshsBeutel2, 1);

		PrintScreen	("Gor Na Koshs Lederbeutel gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);

		B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Ich habe Gor Na Koshs Beutel.");
	};
};

FUNC VOID B_Grabraub_01_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		CreateInvItems(hero, ItMw_1h_MISC_Sword, 1);
		CreateInvItems(hero, ItMi_SilverRing, 1);

		PrintScreen	("Rostiges Schwert und Silberring gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

FUNC VOID B_Grabraub_02_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		CreateInvItems(hero, ItMw_1h_MISC_Sword, 1);
		CreateInvItems(hero, ItMi_OldCoin, 4);

		PrintScreen	("Rostiges Schwert und 4 alte Münzen gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

FUNC VOID B_Grabraub_03_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		CreateInvItems(hero, ItMw_1h_MISC_Sword, 1);
		CreateInvItems(hero, ItAt_SkeletonBone, 1);

		PrintScreen	("Rostiges Schwert und Knochen eines Skelettes gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

FUNC VOID B_Grabraub_04_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		CreateInvItems(hero, ItMw_1h_MISC_Sword, 1);
		CreateInvItems(hero, ItMi_SilverRing, 2);
		CreateInvItems(hero, ItMi_Gold, 14);

		PrintScreen	("Rostiges Schwert, 2 Silberringe und 14 Gold gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

FUNC VOID B_Grabraub_05_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		CreateInvItems(hero, ItMw_1h_MISC_Sword, 1);
		CreateInvItems(hero, ItAt_SkeletonBone, 2);

		PrintScreen	("Rostiges Schwert und 2 Knochen eines Skelettes gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

FUNC VOID B_Grabraub_06_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		CreateInvItems(hero, ItMw_1h_MISC_Sword, 1);
		CreateInvItems(hero, ItMi_Gold, 121);

		PrintScreen	("Rostiges Schwert und 121 Gold gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

FUNC VOID B_Grabraub_07_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		CreateInvItems(hero, ItMw_1h_MISC_Sword, 3);

		PrintScreen	("3 Rostige Schwerter gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

FUNC VOID B_Grabraub_08_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		CreateInvItems(hero, ItMi_GoldRing, 1);

		PrintScreen	("Goldring gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

FUNC VOID B_Grabraub_09_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		CreateInvItems(hero, ItMw_1h_MISC_Sword, 1);
		CreateInvItems(hero, ItMi_JeweleryChest, 1);
		CreateInvItems(hero, ItMi_OldCoin, 16);

		PrintScreen	("Rostiges Schwert, Juwelen Schatulle und 16 alte Münzen gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

FUNC VOID B_Grabraub_10_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		CreateInvItems(hero, ItMw_1h_MISC_Sword, 1);
		CreateInvItems(hero, ItMi_SilverRing, 1);

		PrintScreen	("Rostiges Schwert und Silberring gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

FUNC VOID B_Grabraub_11_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		CreateInvItems(hero, ItMw_1h_MISC_Sword, 1);
		CreateInvItems(hero, ItMi_Nugget, 1);

		PrintScreen	("Rostiges Schwert und Erz gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

FUNC VOID B_Grabraub_12_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		CreateInvItems(hero, ItMw_1h_MISC_Sword, 1);
		CreateInvItems(hero, ItMi_SilverPlate, 1);

		PrintScreen	("Rostiges Schwert und Silberteller gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

FUNC VOID B_Grabraub_13_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		CreateInvItems(hero, ItMw_1h_MISC_Sword, 1);
		CreateInvItems(hero, ItMi_InnosStatue, 1);

		PrintScreen	("Rostiges Schwert und Innos Statue gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

FUNC VOID B_Grabraub_14_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		CreateInvItems(hero, ItMw_1h_MISC_Sword, 2);
		CreateInvItems(hero, ItMi_SilverNecklace, 1);

		PrintScreen	("2 Rostige Schwerter und Silberkette gefunden", -1, YPOS_XPGained, FONT_ScreenSmall, 2);
	};
};

FUNC VOID B_GravosSchatz_S1()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	&& (Mod_Gravo_Schatz == 1)
	{
		Mod_Gravo_Schatz = 2;

		B_StartOtherRoutine	(Mod_1430_BUD_Gravo_MT, "PRESTART");

		AI_GotoNpc	(Mod_1430_BUD_Gravo_MT, hero);
	};
};