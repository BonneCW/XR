FUNC VOID POTIONALCHEMY_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_POTIONALCHEMY;
		Ai_ProcessInfos (her);
	};
};

// Perm. Trank aufmachen

INSTANCE PC_PotionAlchemy_PermHealth_Oeffnen (C_Info)
{
	npc			= PC_Hero;
	nr			= 1;
	condition		= PC_PotionAlchemy_PermHealth_Oeffnen_Condition;
	information		= PC_PotionAlchemy_PermHealth_Oeffnen_Info;
	permanent		= 1;
	description		= "Flasche öffnen und Pflanzenreste entfernen"; 
};

FUNC INT PC_PotionAlchemy_PermHealth_Oeffnen_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& ((Npc_HasItems(hero, ItPo_PermHealth_Gut) == 1)
	|| (Npc_HasItems(hero, ItPo_PermHealth_Schlecht) == 1))
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_PermHealth_Oeffnen_Info()
{
	if (Npc_HasItems(hero, ItPo_PermHealth_Gut) == 1)
	&& (Wld_GetDay()-3 == Mod_PermHealth_Day)
	&& (Wld_IsTime(Mod_PermHealth_Zeit-1,00,Mod_PermHealth_Zeit+1,00))
	{
		CreateInvItems	(hero, ItPo_Perm_Health, 1);
	}
	else
	{
		CreateInvItems	(hero, ItPo_PermHealth_Mist, 1);
	};

	Mod_Darf_PermHealth = TRUE;

	Mod_PermTrank_Tries += 1;

	Npc_RemoveInvItems	(hero, ItPo_PermHealth_Gut, 1);
	Npc_RemoveInvItems	(hero, ItPo_PermHealth_Schlecht, 1);
};

// Alkohol für Kakos vergiften

INSTANCE PC_PotionAlchemy_Kakos (C_Info)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_PotionAlchemy_Kakos_Condition;
	information		= PC_PotionAlchemy_Kakos_Info;
	permanent		= 0;
	description		= "Wacholder für Kakos vergiften"; 
};

FUNC INT PC_PotionAlchemy_Kakos_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (Mod_NL_Kakos == 1)
	&& (Npc_HasItems(hero, ItFo_Booze) >= 1)
	&& (Npc_HasItems(hero, ItPl_Mushroom_03) >= 3)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_Kakos_Info()
{
	Npc_RemoveInvItems	(hero, ItFo_Booze, 1);
	Npc_RemoveInvItems	(hero, ItPl_Mushroom_03, 3);

	CreateInvItems	(hero, ItFo_GiftBooze, 1);
};

// Heilung der Besessenheit herstellen

INSTANCE PC_PotionAlchemy_Daemonisch (C_Info)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_PotionAlchemy_Daemonisch_Condition;
	information		= PC_PotionAlchemy_Daemonisch_Info;
	permanent		= 0;
	description		= "Heilung der Besessenheit herstellen"; 
};

FUNC INT PC_PotionAlchemy_Daemonisch_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (Mod_HQ_Daemonisch >= 1)
	&& (Npc_HasItems(hero, ItMi_HolyWater) >= 3)
	&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_Daemonisch_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_HolyWater, 3);
	Npc_RemoveInvItems	(hero, ItPl_Temp_Herb, 1);

	CreateInvItems	(hero, ItPo_HealBesessenheit, 3);

	Print	("3x Heilung der Besessenheit hergestellt!");
};

// Pökelfleisch behandeln

INSTANCE PC_PotionAlchemy_CoragonDaemonisch (C_Info)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_PotionAlchemy_CoragonDaemonisch_Condition;
	information		= PC_PotionAlchemy_CoragonDaemonisch_Info;
	permanent		= 0;
	description		= "Pökelfleisch mit Klosterwein behandeln"; 
};

FUNC INT PC_PotionAlchemy_CoragonDaemonisch_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (Npc_KnowsInfo(hero, Info_Mod_Coragon_Daemonisch2))
	&& (Npc_HasItems(hero, ItFo_KWine) >= 1)
	&& (Npc_HasItems(hero, ItMi_CoragonDaemonisch) >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_CoragonDaemonisch_Info()
{
	Npc_RemoveInvItems	(hero, ItFo_KWine, 1);
	Npc_RemoveInvItems	(hero, ItMi_CoragonDaemonisch, 1);

	CreateInvItems	(hero, ItMi_CoragonDaemonisch2, 1);
};

INSTANCE PC_PotionAlchemy_CoragonDaemonisch2 (C_Info)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_PotionAlchemy_CoragonDaemonisch2_Condition;
	information		= PC_PotionAlchemy_CoragonDaemonisch2_Info;
	permanent		= 0;
	description		= "Pökelfleisch mit Trank 'Heilung der Besessenheit' behandeln"; 
};

FUNC INT PC_PotionAlchemy_CoragonDaemonisch2_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (Npc_KnowsInfo(hero, Info_Mod_Coragon_Daemonisch2))
	&& (Npc_HasItems(hero, ItPo_HealBesessenheit) >= 1)
	&& (Npc_HasItems(hero, ItMi_CoragonDaemonisch) >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_CoragonDaemonisch2_Info()
{
	Npc_RemoveInvItems	(hero, ItPo_HealBesessenheit, 1);
	Npc_RemoveInvItems	(hero, ItMi_CoragonDaemonisch, 1);

	CreateInvItems	(hero, ItMi_CoragonDaemonisch2, 1);
};

INSTANCE PC_PotionAlchemy_Tofu (C_Info)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_PotionAlchemy_Tofu_Condition;
	information		= PC_PotionAlchemy_Tofu_Info;
	permanent		= 0;
	description		= "To-Fu herstellen"; 
};

FUNC INT PC_PotionAlchemy_Tofu_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (Npc_KnowsInfo(hero, Info_Mod_UrShak_Biftek))
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_Tofu_Info()
{
	if (Npc_HasItems(hero, ItMi_SojaSchote) < 30) {
		Print("Dazu fehlen mir So-Ja-Schoten");
	} else if (Npc_HasItems(hero, ItMi_SalzNugget) == 0) {
		Print("Dazu fehlt mir Salz");
	} else {
		Npc_RemoveInvItems	(hero, ItMi_SojaSchote, 30);
		Npc_RemoveInvItems	(hero, ItMi_SalzNugget, 1);

		CreateInvItems	(hero, ItFo_Tofu, 1);
	};
};

// Spezialtrunken herstellen

INSTANCE PC_PotionAlchemy_Spezialtrunken (C_Info)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_PotionAlchemy_Spezialtrunken_Condition;
	information		= PC_PotionAlchemy_Spezialtrunken_Info;
	permanent		= 0;
	description		= "Spezialtrunken herstellen"; 
};

FUNC INT PC_PotionAlchemy_Spezialtrunken_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (Mod_SL_PartGeliebte == 3)
	&& (Npc_HasItems(hero, ItFo_Booze) >= 20)
	&& (Npc_HasItems(hero, ItPl_Melone) >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_Spezialtrunken_Info()
{
	Npc_RemoveInvItems	(hero, ItFo_Booze, 20);
	Npc_RemoveInvItems	(hero, ItPl_Melone, 1);

	CreateInvItems	(hero, ItFo_Spezialtrunken, 1);

	B_LogEntry	(TOPIC_MOD_SL_GELIEBTE, "Ich habe den Spezialtrunken und sollte jetzt zur königlichen Geliebten gehen und mein Glück versuchen.");

	Mod_SL_PartGeliebte = 4;
};

// Heiltränke

INSTANCE PC_PotionAlchemy_Health (C_Info)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_PotionAlchemy_Health_Condition;
	information		= PC_PotionAlchemy_Health_Info;
	permanent		= TRUE;
	description		= "Heiltränke brauen"; 
};

FUNC INT PC_PotionAlchemy_Health_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& ((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Health_07] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Health_06] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Health_05] == TRUE)
	|| (Mod_Ring_Alchemist == TRUE))
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_Health_Info()
{
	Info_ClearChoices	(PC_PotionAlchemy_Health);

	Info_AddChoice	(PC_PotionAlchemy_Health, DIALOG_BACK, PC_PotionAlchemy_Health_EXIT);

	if (PLAYER_TALENT_ALCHEMY[POTION_Health_04] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Health, "Heiltrunk (max. Menge)", PC_PotionAlchemy_Health_04_Alle);
		Info_AddChoice	(PC_PotionAlchemy_Health, "Heiltrunk (3 Essenzen der Heilung, 1 Feldknöterich)", PC_PotionAlchemy_Health_04);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Health, "Elixier der Heilung (max. Menge)", PC_PotionAlchemy_Health_03_Alle);
		Info_AddChoice	(PC_PotionAlchemy_Health, "Elixier der Heilung (2 Heilwurzeln, 1 Feldknöterich)", PC_PotionAlchemy_Health_03);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Health, "Extrakt der Heilung (max. Menge)", PC_PotionAlchemy_Health_02_Alle);
		Info_AddChoice	(PC_PotionAlchemy_Health, "Extrakt der Heilung (2 Heilkräuter, 1 Feldknöterich)", PC_PotionAlchemy_Health_02);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	|| (Mod_Ring_Alchemist == TRUE)
	{
		if (Mod_Darf_Health_01 == TRUE)
		|| (Mod_LehrlingBei != 1)
		{
			Info_AddChoice	(PC_PotionAlchemy_Health, "Essenz der Heilung (max. Menge)", PC_PotionAlchemy_Health_01_Alle);
		};
		Info_AddChoice	(PC_PotionAlchemy_Health, "Essenz der Heilung (2 Heilplanzen, 1 Feldknöterich)", PC_PotionAlchemy_Health_01);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Health_07] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Health, "Trank der leichten Heilung (max. Menge)", PC_PotionAlchemy_Health_07_Alle);
		Info_AddChoice	(PC_PotionAlchemy_Health, "Trank der leichten Heilung (2 Heilkräuter, 1 Wacholder)", PC_PotionAlchemy_Health_07);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Health_06] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Health, "Leichter Heiltrank (max. Menge)", PC_PotionAlchemy_Health_06_Alle);
		Info_AddChoice	(PC_PotionAlchemy_Health, "Leichter Heiltrank (4 Heilplanzen, 1 Wacholder)", PC_PotionAlchemy_Health_06);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Health_05] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Health, "Trank der schnellen Heilung (max. Menge)", PC_PotionAlchemy_Health_05_Alle);
		Info_AddChoice	(PC_PotionAlchemy_Health, "Trank der schnellen Heilung (3 Heilplanzen, 1 Wasser)", PC_PotionAlchemy_Health_05);
	};
};

FUNC VOID PC_PotionAlchemy_Health_04_Alle ()
{
	if (Npc_HasItems (hero, ItPo_Health_01) >= 3) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems(hero, ItMi_Flask) >= 1)
	{
		if (Npc_HasItems(hero, ItPo_Health_01)/3 >= Npc_HasItems(hero, ItPl_Temp_Herb))
		&& (Npc_HasItems(hero, ItPo_Health_01)/3 >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Temp_Herb);
			};
		}
		else if (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItPo_Health_01)/3)
		&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPo_Health_01)/3 >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPo_Health_01)/3;
			};
		}
		else
		{
			if (Npc_HasItems(hero, ItPo_Health_01)/3 >= Npc_HasItems(hero, ItPl_Temp_Herb))
			{
				MakePotion = Npc_HasItems(hero, ItPl_Temp_Herb);
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPo_Health_01)/3;
			};
		};

		Npc_RemoveInvItems (hero, ItPo_Health_01, 3*MakePotion);
		Npc_RemoveInvItems (hero, ItPl_Temp_Herb, MakePotion);
		Npc_RemoveInvItems (hero, ItMi_Flask, MakePotion-1);
		
		CreateInvItems	   (hero, ItPo_Health_Addon_04, MakePotion);  

		var string Meldung;

		Meldung = ConcatStrings(IntToString(MakePotion), "x ");
		Meldung = ConcatStrings(Meldung, ItPo_Health_Addon_04.description);
		Meldung = ConcatStrings(Meldung, " gebraut");

		Print (Meldung);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Health_04 ()
{
	if (Npc_HasItems (hero, ItPo_Health_01) >= 3) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) 	  	>= 1) 
	{
		Npc_RemoveInvItems (hero,ItPo_Health_01,3);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	  	,1);
		
		CreateInvItems	   (hero,ItPo_Health_Addon_04,1);  
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Health_03_Alle ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_03) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems(hero, ItMi_Flask) >= 1)
	{
		if (Npc_HasItems(hero, ItPl_Health_Herb_03)/2 >= Npc_HasItems(hero, ItPl_Temp_Herb))
		&& (Npc_HasItems(hero, ItPl_Health_Herb_03)/2 >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Temp_Herb);
			};
		}
		else if (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItPl_Health_Herb_03)/2)
		&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPo_Health_01)/3 >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Health_Herb_03)/2;
			};
		}
		else
		{
			if (Npc_HasItems(hero, ItPl_Health_Herb_03)/2 >= Npc_HasItems(hero, ItPl_Temp_Herb))
			{
				MakePotion = Npc_HasItems(hero, ItPl_Temp_Herb);
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Health_Herb_03)/2;
			};
		};

		Npc_RemoveInvItems (hero, ItPl_Health_Herb_03, 2*MakePotion);
		Npc_RemoveInvItems (hero, ItPl_Temp_Herb, MakePotion);
		Npc_RemoveInvItems (hero, ItMi_Flask, MakePotion-1);
		
		CreateInvItems	   (hero, ItPo_Health_03, MakePotion);  

		var string Meldung;

		Meldung = ConcatStrings(IntToString(MakePotion), "x ");
		Meldung = ConcatStrings(Meldung, ItPo_Health_03.description);
		Meldung = ConcatStrings(Meldung, " gebraut");

		Print (Meldung);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Health_03 ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_03) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) 	  	>= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Health_Herb_03,2);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	  	,1);
		
		CreateInvItems	   (hero,ItPo_Health_03,1);  
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Health_02_Alle ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_02) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems(hero, ItMi_Flask) >= 1)
	{
		if (Npc_HasItems(hero, ItPl_Health_Herb_02)/2 >= Npc_HasItems(hero, ItPl_Temp_Herb))
		&& (Npc_HasItems(hero, ItPl_Health_Herb_02)/2 >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Temp_Herb);
			};
		}
		else if (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItPl_Health_Herb_02)/2)
		&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPo_Health_01)/3 >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Health_Herb_02)/2;
			};
		}
		else
		{
			if (Npc_HasItems(hero, ItPl_Health_Herb_02)/2 >= Npc_HasItems(hero, ItPl_Temp_Herb))
			{
				MakePotion = Npc_HasItems(hero, ItPl_Temp_Herb);
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Health_Herb_02)/2;
			};
		};

		Npc_RemoveInvItems (hero, ItPl_Health_Herb_02, 2*MakePotion);
		Npc_RemoveInvItems (hero, ItPl_Temp_Herb, MakePotion);
		Npc_RemoveInvItems (hero, ItMi_Flask, MakePotion-1);
		
		CreateInvItems	   (hero, ItPo_Health_02, MakePotion);  

		var string Meldung;

		Meldung = ConcatStrings(IntToString(MakePotion), "x ");
		Meldung = ConcatStrings(Meldung, ItPo_Health_02.description);
		Meldung = ConcatStrings(Meldung, " gebraut");

		Print (Meldung);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Health_02 ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_02) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) 	 >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Health_Herb_02,2);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	  	,1);
		
		CreateInvItems	   (hero,ItPo_Health_02,1);  
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Health_01_Alle ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_01) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems(hero, ItMi_Flask) >= 1)
	{
		if (Npc_HasItems(hero, ItPl_Health_Herb_01)/2 >= Npc_HasItems(hero, ItPl_Temp_Herb))
		&& (Npc_HasItems(hero, ItPl_Health_Herb_01)/2 >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Temp_Herb);
			};
		}
		else if (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItPl_Health_Herb_01)/2)
		&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPo_Health_01)/3 >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Health_Herb_01)/2;
			};
		}
		else
		{
			if (Npc_HasItems(hero, ItPl_Health_Herb_01)/2 >= Npc_HasItems(hero, ItPl_Temp_Herb))
			{
				MakePotion = Npc_HasItems(hero, ItPl_Temp_Herb);
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Health_Herb_01)/2;
			};
		};

		Npc_RemoveInvItems (hero, ItPl_Health_Herb_01, 2*MakePotion);
		Npc_RemoveInvItems (hero, ItPl_Temp_Herb, MakePotion);
		Npc_RemoveInvItems (hero, ItMi_Flask, MakePotion-1);
		
		CreateInvItems	   (hero, ItPo_Health_01, MakePotion);

		Mod_Count_Health_01 += MakePotion;

		var string Meldung;

		Meldung = ConcatStrings(IntToString(MakePotion), "x ");
		Meldung = ConcatStrings(Meldung, ItPo_Health_01.description);
		Meldung = ConcatStrings(Meldung, " gebraut");

		Print (Meldung);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Health_01 ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_01) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) 	 >= 1) 
	{
		if (Mod_Darf_Health_01 == TRUE)
		|| (Mod_LehrlingBei != 1)
		{
			Npc_RemoveInvItems (hero, ItPl_Health_Herb_01, 2);
			Npc_RemoveInvItems (hero, ItPl_Temp_Herb, 1);
		
			CreateInvItem	   (hero,ItPo_Health_01);  
			Print (PRINT_AlchemySuccess);

			Mod_Count_Health_01 += 1;
	
			B_ENDPRODUCTIONDIALOG ();
		}
		else
		{
			Mod_TrankFirstStep = 0;
			Mod_TrankSecondStep = 0;

			Info_ClearChoices	(PC_PotionAlchemy_Health);

			Info_AddChoice	(PC_PotionAlchemy_Health, "Heilpflanze in den Mörser geben", PC_PotionAlchemy_Health_01_B);
			Info_AddChoice	(PC_PotionAlchemy_Health, "Feldknöterich in den Mörser geben", PC_PotionAlchemy_Health_01_A);
		};
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	
		B_ENDPRODUCTIONDIALOG ();
	};
};

FUNC VOID PC_PotionAlchemy_Health_01_B ()
{
	Npc_RemoveInvItems (hero, ItPl_Health_Herb_01, 2);

	if (Mod_TrankFirstStep > 0)
	{
		Mod_TrankSecondStep = TRUE;

		Info_ClearChoices	(PC_PotionAlchemy_Health);

		Info_AddChoice	(PC_PotionAlchemy_Health, "Im Wasser erhitzen", PC_PotionAlchemy_Health_01_C);
	}
	else
	{
		Mod_TrankFirstStep = 2;

		Info_ClearChoices	(PC_PotionAlchemy_Health);

		Info_AddChoice	(PC_PotionAlchemy_Health, "Feldknöterich in den Mörser geben", PC_PotionAlchemy_Health_01_A);
	};
};

FUNC VOID PC_PotionAlchemy_Health_01_A ()
{
	Npc_RemoveInvItems (hero, ItPl_Temp_Herb, 1);

	if (Mod_TrankFirstStep > 0)
	{
		Mod_TrankSecondStep = TRUE;

		Info_ClearChoices	(PC_PotionAlchemy_Health);

		Info_AddChoice	(PC_PotionAlchemy_Health, "Im Wasser erhitzen", PC_PotionAlchemy_Health_01_C);
	}
	else
	{
		Mod_TrankFirstStep = 1;

		Info_ClearChoices	(PC_PotionAlchemy_Health);

		Info_AddChoice	(PC_PotionAlchemy_Health, "Heilpflanze in den Mörser geben", PC_PotionAlchemy_Health_01_B);
	};
};

FUNC VOID PC_PotionAlchemy_Health_01_C ()
{
	Info_ClearChoices	(PC_PotionAlchemy_Health);

	Info_AddChoice	(PC_PotionAlchemy_Health, "In Laborwasserflasche abfüllen", PC_PotionAlchemy_Health_01_D);
};

FUNC VOID PC_PotionAlchemy_Health_01_D ()
{
	Info_ClearChoices	(PC_PotionAlchemy_Health);

	if (Mod_TrankFirstStep == 1)
	{		
		CreateInvItem	   (hero, ItPo_Health_01);  
		Print (PRINT_AlchemySuccess);

		Mod_Darf_Health_01 = TRUE;
		Mod_Darf_Mana_01 = TRUE;

		Mod_Count_Health_01 += 1;
	}
	else
	{		
		CreateInvItem	   (hero, ItFo_Tee);  
		Print (PRINT_AlchemySuccess);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Health_07_Alle ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_02) >= 2) 
	&& (Npc_HasItems (hero, ItFo_Booze) >= 1)
	&& (Npc_HasItems(hero, ItMi_Flask) >= 1)
	{
		if (Npc_HasItems(hero, ItPl_Health_Herb_02)/2 >= Npc_HasItems(hero, ItFo_Booze))
		&& (Npc_HasItems(hero, ItPl_Health_Herb_02)/2 >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItFo_Booze) >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItFo_Booze);
			};
		}
		else if (Npc_HasItems(hero, ItFo_Booze) >= Npc_HasItems(hero, ItPl_Health_Herb_02)/2)
		&& (Npc_HasItems(hero, ItFo_Booze) >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPo_Health_01)/3 >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Health_Herb_02)/2;
			};
		}
		else
		{
			if (Npc_HasItems(hero, ItPl_Health_Herb_02)/2 >= Npc_HasItems(hero, ItFo_Booze))
			{
				MakePotion = Npc_HasItems(hero, ItFo_Booze);
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Health_Herb_02)/2;
			};
		};

		Npc_RemoveInvItems (hero, ItPl_Health_Herb_02, 2*MakePotion);
		Npc_RemoveInvItems (hero, ItPl_Temp_Herb, MakePotion);
		Npc_RemoveInvItems (hero, ItMi_Flask, MakePotion-1);
		
		CreateInvItems	   (hero, ItPo_Health_07, MakePotion);  

		var string Meldung;

		Meldung = ConcatStrings(IntToString(MakePotion), "x ");
		Meldung = ConcatStrings(Meldung, ItPo_Health_07.description);
		Meldung = ConcatStrings(Meldung, " gebraut");

		Print (Meldung);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Health_07 ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_02) >= 2) 
	&& (Npc_HasItems (hero, ItFo_Booze) 	 >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Health_Herb_02, 2);
		Npc_RemoveInvItems (hero,ItFo_Booze, 1);
		
		CreateInvItem	   (hero,ItPo_Health_07);  
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Health_06_Alle ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_01) >= 4) 
	&& (Npc_HasItems (hero, ItFo_Booze) >= 1)
	&& (Npc_HasItems(hero, ItMi_Flask) >= 1)
	{
		if (Npc_HasItems(hero, ItPl_Health_Herb_01)/4 >= Npc_HasItems(hero, ItFo_Booze))
		&& (Npc_HasItems(hero, ItPl_Health_Herb_01)/4 >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItFo_Booze) >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItFo_Booze);
			};
		}
		else if (Npc_HasItems(hero, ItFo_Booze) >= Npc_HasItems(hero, ItPl_Health_Herb_01)/4)
		&& (Npc_HasItems(hero, ItFo_Booze) >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPl_Health_Herb_01)/4 >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Health_Herb_01)/4;
			};
		}
		else
		{
			if (Npc_HasItems(hero, ItPl_Health_Herb_01)/4 >= Npc_HasItems(hero, ItFo_Booze))
			{
				MakePotion = Npc_HasItems(hero, ItFo_Booze);
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Health_Herb_01)/4;
			};
		};

		Npc_RemoveInvItems (hero, ItPl_Health_Herb_01, 4*MakePotion);
		Npc_RemoveInvItems (hero, ItFo_Booze, MakePotion);
		Npc_RemoveInvItems (hero, ItMi_Flask, MakePotion-1);
		
		CreateInvItems	   (hero, ItPo_Health_06, MakePotion);  

		var string Meldung;

		Meldung = ConcatStrings(IntToString(MakePotion), "x ");
		Meldung = ConcatStrings(Meldung, ItPo_Health_06.description);
		Meldung = ConcatStrings(Meldung, " gebraut");

		Print (Meldung);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Health_06 ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_01) >= 4) 
	&& (Npc_HasItems (hero, ItFo_Booze) 	 >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Health_Herb_01, 4);
		Npc_RemoveInvItems (hero,ItFo_Booze, 1);
		
		CreateInvItem	   (hero,ItPo_Health_06);  
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Health_05_Alle ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_01) >= 3) 
	&& (Npc_HasItems (hero, ItFo_Water) >= 1)
	&& (Npc_HasItems(hero, ItMi_Flask) >= 1)
	{
		if (Npc_HasItems(hero, ItPl_Health_Herb_01)/3 >= Npc_HasItems(hero, ItFo_Water))
		&& (Npc_HasItems(hero, ItPl_Health_Herb_01)/3 >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItFo_Water) >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItFo_Water);
			};
		}
		else if (Npc_HasItems(hero, ItFo_Water) >= Npc_HasItems(hero, ItPl_Health_Herb_01)/3)
		&& (Npc_HasItems(hero, ItFo_Water) >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPl_Health_Herb_01)/3 >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Health_Herb_01)/3;
			};
		}
		else
		{
			if (Npc_HasItems(hero, ItPl_Health_Herb_01)/3 >= Npc_HasItems(hero, ItFo_Water))
			{
				MakePotion = Npc_HasItems(hero, ItFo_Water);
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Health_Herb_01)/3;
			};
		};

		Npc_RemoveInvItems (hero, ItPl_Health_Herb_01, 3*MakePotion);
		Npc_RemoveInvItems (hero, ItFo_Water, MakePotion);
		Npc_RemoveInvItems (hero, ItMi_Flask, MakePotion-1);
		
		CreateInvItems	   (hero, ItPo_Health_05, MakePotion);  

		var string Meldung;

		Meldung = ConcatStrings(IntToString(MakePotion), "x ");
		Meldung = ConcatStrings(Meldung, ItPo_Health_05.description);
		Meldung = ConcatStrings(Meldung, " gebraut");

		Print (Meldung);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Health_05 ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_01) >= 3) 
	&& (Npc_HasItems (hero, ItFo_Water) 	 >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Health_Herb_01, 3);
		Npc_RemoveInvItems (hero,ItFo_Water, 1);
		
		CreateInvItem	   (hero,ItPo_Health_05);  
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Health_EXIT()
{
	Info_ClearChoices	(PC_PotionAlchemy_Health);
};

// Manatränke

INSTANCE PC_PotionAlchemy_Mana (C_Info)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PotionAlchemy_Mana_Condition;
	information		= PC_PotionAlchemy_Mana_Info;
	permanent		= TRUE;
	description		= "Manatränke brauen"; 
};

FUNC INT PC_PotionAlchemy_Mana_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& ((PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Mana_05] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Mana_06] == TRUE)
	|| (Mod_Ring_Alchemist == TRUE))
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_Mana_Info()
{
	Info_ClearChoices	(PC_PotionAlchemy_Mana);

	Info_AddChoice	(PC_PotionAlchemy_Mana, DIALOG_BACK, PC_PotionAlchemy_Mana_EXIT);

	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_04] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Mana, "Manatrunk (max. Menge)", PC_PotionAlchemy_Mana_04_Alle);
		Info_AddChoice	(PC_PotionAlchemy_Mana, "Manatrunk (3 Mana Essenzen, 1 Feldknöterich)", PC_PotionAlchemy_Mana_04);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Mana, "Mana Elixier (max. Menge)", PC_PotionAlchemy_Mana_03_Alle);
		Info_AddChoice	(PC_PotionAlchemy_Mana, "Mana Elixier (2 Feuerwurzeln, 1 Feldknöterich)", PC_PotionAlchemy_Mana_03);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Mana, "Mana Extrakt (max. Menge)", PC_PotionAlchemy_Mana_02_Alle);
		Info_AddChoice	(PC_PotionAlchemy_Mana, "Mana Extrakt (2 Feuerkraut, 1 Feldknöterich)", PC_PotionAlchemy_Mana_02);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	|| (Mod_Ring_Alchemist == TRUE)
	{
		if (Mod_Darf_Mana_01 == TRUE)
		|| (Mod_LehrlingBei != 1)
		{
			Info_AddChoice	(PC_PotionAlchemy_Mana, "Mana Essenz (max. Menge)", PC_PotionAlchemy_Mana_01_Alle);
		};
		Info_AddChoice	(PC_PotionAlchemy_Mana, "Mana Essenz (2 Feuernesseln, 1 Feldknöterich)", PC_PotionAlchemy_Mana_01);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_06] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Mana, "Trank des leichten Mana (max. Menge)", PC_PotionAlchemy_Mana_06_Alle);
		Info_AddChoice	(PC_PotionAlchemy_Mana, "Trank des leichten Mana (2 Feuerwurzel, 1 Alkohol)", PC_PotionAlchemy_Mana_06);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_05] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Mana, "Leichter Manatrank (max. Menge)", PC_PotionAlchemy_Mana_05_Alle);
		Info_AddChoice	(PC_PotionAlchemy_Mana, "Leichter Manatrank (3 Feuernesseln, 1 Alkohol)", PC_PotionAlchemy_Mana_05);
	};
};

FUNC VOID PC_PotionAlchemy_Mana_04_Alle ()
{
	if (Npc_HasItems (hero, ItPo_Mana_01) >= 3) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems(hero, ItMi_Flask) >= 1)
	{
		if (Npc_HasItems(hero, ItPo_Mana_01)/3 >= Npc_HasItems(hero, ItPl_Temp_Herb))
		&& (Npc_HasItems(hero, ItPo_Mana_01)/3 >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Temp_Herb);
			};
		}
		else if (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItPo_Mana_01)/3)
		&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPo_Mana_01)/3 >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPo_Mana_01)/3;
			};
		}
		else
		{
			if (Npc_HasItems(hero, ItPo_Mana_01)/3 >= Npc_HasItems(hero, ItPl_Temp_Herb))
			{
				MakePotion = Npc_HasItems(hero, ItPl_Temp_Herb);
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPo_Mana_01)/3;
			};
		};

		Npc_RemoveInvItems (hero, ItPo_Mana_01, 3*MakePotion);
		Npc_RemoveInvItems (hero, ItPl_Temp_Herb, MakePotion);
		Npc_RemoveInvItems (hero, ItMi_Flask, MakePotion-1);
		
		CreateInvItems	   (hero, ItPo_Mana_Addon_04, MakePotion);  

		var string Meldung;

		Meldung = ConcatStrings(IntToString(MakePotion), "x ");
		Meldung = ConcatStrings(Meldung, ItPo_Mana_Addon_04.description);
		Meldung = ConcatStrings(Meldung, " gebraut");

		Print (Meldung);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Mana_04 ()
{
	if (Npc_HasItems (hero, ItPo_Mana_01) >= 3) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) 	  >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPo_Mana_01,3);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	  ,1);
		
		CreateInvItems	   (hero,ItPo_Mana_Addon_04,1);  
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Mana_03_Alle ()
{
	if (Npc_HasItems (hero, ItPl_Mana_Herb_03) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems(hero, ItMi_Flask) >= 1)
	{
		if (Npc_HasItems(hero, ItPl_Mana_Herb_03)/2 >= Npc_HasItems(hero, ItPl_Temp_Herb))
		&& (Npc_HasItems(hero, ItPl_Mana_Herb_03)/2 >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Temp_Herb);
			};
		}
		else if (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItPl_Mana_Herb_03)/2)
		&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPl_Mana_Herb_03)/2 >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Mana_Herb_03)/2;
			};
		}
		else
		{
			if (Npc_HasItems(hero, ItPl_Mana_Herb_03)/2 >= Npc_HasItems(hero, ItPl_Temp_Herb))
			{
				MakePotion = Npc_HasItems(hero, ItPl_Temp_Herb);
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Mana_Herb_03)/2;
			};
		};

		Npc_RemoveInvItems (hero, ItPl_Mana_Herb_03, 2*MakePotion);
		Npc_RemoveInvItems (hero, ItPl_Temp_Herb, MakePotion);
		Npc_RemoveInvItems (hero, ItMi_Flask, MakePotion-1);
		
		CreateInvItems	   (hero, ItPo_Mana_03, MakePotion);  

		var string Meldung;

		Meldung = ConcatStrings(IntToString(MakePotion), "x ");
		Meldung = ConcatStrings(Meldung, ItPo_Mana_03.description);
		Meldung = ConcatStrings(Meldung, " gebraut");

		Print (Meldung);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Mana_03 ()
{
	if (Npc_HasItems (hero, ItPl_Mana_Herb_03) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) 	  >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Mana_Herb_03,2);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	  ,1);
		
		CreateInvItems	   (hero,ItPo_Mana_03,1);  
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Mana_02_Alle ()
{
	if (Npc_HasItems (hero, ItPl_Mana_Herb_02) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) >= 1) 
	{
		if (Npc_HasItems(hero, ItPl_Mana_Herb_02)/2 >= Npc_HasItems(hero, ItPl_Temp_Herb))
		&& (Npc_HasItems(hero, ItPl_Mana_Herb_02)/2 >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Temp_Herb);
			};
		}
		else if (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItPl_Mana_Herb_02)/2)
		&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPo_Health_01)/3 >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Mana_Herb_02)/2;
			};
		}
		else
		{
			if (Npc_HasItems(hero, ItPl_Mana_Herb_02)/2 >= Npc_HasItems(hero, ItPl_Temp_Herb))
			{
				MakePotion = Npc_HasItems(hero, ItPl_Temp_Herb);
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Mana_Herb_02)/2;
			};
		};

		Npc_RemoveInvItems (hero, ItPl_Mana_Herb_02, 2*MakePotion);
		Npc_RemoveInvItems (hero, ItPl_Temp_Herb, MakePotion);
		Npc_RemoveInvItems (hero, ItMi_Flask, MakePotion-1);
		
		CreateInvItems	   (hero, ItPo_Mana_02, MakePotion);  

		var string Meldung;

		Meldung = ConcatStrings(IntToString(MakePotion), "x ");
		Meldung = ConcatStrings(Meldung, ItPo_Mana_02.description);
		Meldung = ConcatStrings(Meldung, " gebraut");

		Print (Meldung);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Mana_02 ()
{
	if (Npc_HasItems (hero, ItPl_Mana_Herb_02) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb)    >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Mana_Herb_02,2);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	  ,1);
		
		CreateInvItems	   (hero,ItPo_Mana_02,1);  
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Mana_01_Alle ()
{
	if (Npc_HasItems (hero, ItPl_Mana_Herb_01) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems(hero, ItMi_Flask) >= 1)
	{
		if (Npc_HasItems(hero, ItPl_Mana_Herb_01)/2 >= Npc_HasItems(hero, ItPl_Temp_Herb))
		&& (Npc_HasItems(hero, ItPl_Mana_Herb_01)/2 >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Temp_Herb);
			};
		}
		else if (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItPl_Mana_Herb_01)/2)
		&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPl_Mana_Herb_01)/2 >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Mana_Herb_01)/2;
			};
		}
		else
		{
			if (Npc_HasItems(hero, ItPl_Mana_Herb_01)/2 >= Npc_HasItems(hero, ItPl_Temp_Herb))
			{
				MakePotion = Npc_HasItems(hero, ItPl_Temp_Herb);
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Mana_Herb_01)/2;
			};
		};

		Npc_RemoveInvItems (hero, ItPl_Mana_Herb_01, 2*MakePotion);
		Npc_RemoveInvItems (hero, ItPl_Temp_Herb, MakePotion);
		Npc_RemoveInvItems (hero, ItMi_Flask, MakePotion-1);
		
		CreateInvItems	   (hero, ItPo_Mana_01, MakePotion);  

		Mod_Count_Mana_01 += MakePotion;

		var string Meldung;

		Meldung = ConcatStrings(IntToString(MakePotion), "x ");
		Meldung = ConcatStrings(Meldung, ItPo_Mana_01.description);
		Meldung = ConcatStrings(Meldung, " gebraut");

		Print (Meldung);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Mana_01 ()
{
	if (Npc_HasItems (hero, ItPl_Mana_Herb_01) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) 	 >= 1) 
	{
		if (Mod_Darf_Mana_01 == TRUE)
		|| (Mod_LehrlingBei != 1)
		{
			Npc_RemoveInvItems (hero, ItPl_Mana_Herb_01, 2);
			Npc_RemoveInvItems (hero, ItPl_Temp_Herb, 1);
		
			CreateInvItem	   (hero,ItPo_Mana_01);  
			Print (PRINT_AlchemySuccess);

			Mod_Count_Mana_01 += 1;
	
			B_ENDPRODUCTIONDIALOG ();
		}
		else
		{
			Mod_TrankFirstStep = 0;
			Mod_TrankSecondStep = 0;

			Info_ClearChoices	(PC_PotionAlchemy_Mana);

			Info_AddChoice	(PC_PotionAlchemy_Mana, "Feuernessel in den Mörser geben", PC_PotionAlchemy_Mana_01_B);
			Info_AddChoice	(PC_PotionAlchemy_Mana, "Feldknöterich in den Mörser geben", PC_PotionAlchemy_Mana_01_A);
		};
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	
		B_ENDPRODUCTIONDIALOG ();
	};
};

FUNC VOID PC_PotionAlchemy_Mana_01_B ()
{
	Npc_RemoveInvItems (hero, ItPl_Mana_Herb_01, 2);

	if (Mod_TrankFirstStep > 0)
	{
		Mod_TrankSecondStep = TRUE;

		Info_ClearChoices	(PC_PotionAlchemy_Mana);

		Info_AddChoice	(PC_PotionAlchemy_Mana, "Im Wasser erhitzen", PC_PotionAlchemy_Mana_01_C);
	}
	else
	{
		Mod_TrankFirstStep = 2;

		Info_ClearChoices	(PC_PotionAlchemy_Mana);

		Info_AddChoice	(PC_PotionAlchemy_Mana, "Feldknöterich in den Mörser geben", PC_PotionAlchemy_Mana_01_A);
	};
};

FUNC VOID PC_PotionAlchemy_Mana_01_A ()
{
	Npc_RemoveInvItems (hero, ItPl_Temp_Herb, 1);

	if (Mod_TrankFirstStep > 0)
	{
		Mod_TrankSecondStep = TRUE;

		Info_ClearChoices	(PC_PotionAlchemy_Mana);

		Info_AddChoice	(PC_PotionAlchemy_Mana, "Im Wasser erhitzen", PC_PotionAlchemy_Mana_01_C);
	}
	else
	{
		Mod_TrankFirstStep = 1;

		Info_ClearChoices	(PC_PotionAlchemy_Mana);

		Info_AddChoice	(PC_PotionAlchemy_Mana, "Feuernessel in den Mörser geben", PC_PotionAlchemy_Mana_01_B);
	};
};

FUNC VOID PC_PotionAlchemy_Mana_01_C ()
{
	Info_ClearChoices	(PC_PotionAlchemy_Mana);

	Info_AddChoice	(PC_PotionAlchemy_Mana, "In Laborwasserflasche abfüllen", PC_PotionAlchemy_Mana_01_D);
};

FUNC VOID PC_PotionAlchemy_Mana_01_D ()
{
	Info_ClearChoices	(PC_PotionAlchemy_Mana);

	if (Mod_TrankFirstStep == 1)
	{		
		CreateInvItem	   (hero, ItPo_Mana_01);  
		Print (PRINT_AlchemySuccess);

		Mod_Darf_Mana_01 = TRUE;
		Mod_Darf_Health_01 = TRUE;

		Mod_Count_Mana_01 += 1;
	}
	else
	{		
		CreateInvItem	   (hero, ItFo_Tee);  
		Print (PRINT_AlchemySuccess);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Mana_06_Alle ()
{
	if (Npc_HasItems (hero, ItPl_Mana_Herb_02) >= 2) 
	&& (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >= 1)
	&& (Npc_HasItems(hero, ItMi_Flask) >= 1)
	{
		if (Npc_HasItems(hero, ItPl_Mana_Herb_02)/2 >= Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01))
		&& (Npc_HasItems(hero, ItPl_Mana_Herb_02)/2 >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01) >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01);
			};
		}
		else if (Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01) >= Npc_HasItems(hero, ItPl_Mana_Herb_02)/2)
		&& (Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01) >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPl_Mana_Herb_02)/2 >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Mana_Herb_02)/2;
			};
		}
		else
		{
			if (Npc_HasItems(hero, ItPl_Mana_Herb_02)/2 >= Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01))
			{
				MakePotion = Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01);
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Mana_Herb_02)/2;
			};
		};

		Npc_RemoveInvItems (hero, ItPl_Mana_Herb_02, 2*MakePotion);
		Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, MakePotion);
		Npc_RemoveInvItems (hero, ItMi_Flask, MakePotion-1);
		
		CreateInvItems	   (hero, ItPo_Mana_06, MakePotion);  

		var string Meldung;

		Meldung = ConcatStrings(IntToString(MakePotion), "x ");
		Meldung = ConcatStrings(Meldung, ItPo_Mana_06.description);
		Meldung = ConcatStrings(Meldung, " gebraut");

		Print (Meldung);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Mana_06 ()
{
	if (Npc_HasItems (hero, ItPl_Mana_Herb_02) >= 2) 
	&& (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01)    >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Mana_Herb_02, 2);
		Npc_RemoveInvItems (hero,ItMi_Alchemy_Alcohol_01, 1);
		
		CreateInvItems 	   (hero,ItPo_Mana_06, 1); 
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Mana_05_Alle ()
{
	if (Npc_HasItems (hero, ItPl_Mana_Herb_01) >= 3) 
	&& (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >= 1)
	&& (Npc_HasItems(hero, ItMi_Flask) >= 1)
	{
		if (Npc_HasItems(hero, ItPl_Mana_Herb_01)/3 >= Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01))
		&& (Npc_HasItems(hero, ItPl_Mana_Herb_01)/3 >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01) >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01);
			};
		}
		else if (Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01) >= Npc_HasItems(hero, ItPl_Mana_Herb_01)/3)
		&& (Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01) >= Npc_HasItems(hero, ItMi_Flask)-1)
		{
			if (Npc_HasItems(hero, ItPl_Mana_Herb_01)/3 >= Npc_HasItems(hero, ItMi_Flask)-1)
			{
				MakePotion = Npc_HasItems(hero, ItMi_Flask)-1;
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Mana_Herb_01)/3;
			};
		}
		else
		{
			if (Npc_HasItems(hero, ItPl_Mana_Herb_01)/3 >= Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01))
			{
				MakePotion = Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01);
			}
			else
			{
				MakePotion = Npc_HasItems(hero, ItPl_Mana_Herb_01)/3;
			};
		};

		Npc_RemoveInvItems (hero, ItPl_Mana_Herb_01, 3*MakePotion);
		Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, MakePotion);
		Npc_RemoveInvItems (hero, ItMi_Flask, MakePotion-1);
		
		CreateInvItems	   (hero, ItPo_Mana_05, MakePotion);  

		var string Meldung;

		Meldung = ConcatStrings(IntToString(MakePotion), "x ");
		Meldung = ConcatStrings(Meldung, ItPo_Mana_05.description);
		Meldung = ConcatStrings(Meldung, " gebraut");

		Print (Meldung);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Mana_05 ()
{
	if (Npc_HasItems (hero, ItPl_Mana_Herb_01) >= 3) 
	&& (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01)    >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Mana_Herb_01, 3);
		Npc_RemoveInvItems (hero,ItMi_Alchemy_Alcohol_01, 1);
		
		CreateInvItems 	   (hero,ItPo_Mana_05, 1); 
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Mana_EXIT()
{
	Info_ClearChoices	(PC_PotionAlchemy_Mana);
};

// Spezielle Tränke

INSTANCE PC_PotionAlchemy_Special (C_Info)
{
	npc				= PC_Hero;
	nr				= 3;
	condition		= PC_PotionAlchemy_Special_Condition;
	information		= PC_PotionAlchemy_Special_Info;
	permanent		= TRUE;
	description		= "Spezielle Tränke brauen"; 
};

FUNC INT PC_PotionAlchemy_Special_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& ((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE)
	|| (Knows_MCELIXIER == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Speed] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_AdanosWohltat] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_GiftNeutralisierer] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Gift] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Gegengift] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Genesung] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Regeneration] == TRUE)
	|| (DrachensudManaverbrennung == TRUE)
	|| (FolgsamkeitSnapper == TRUE)
	|| (Weisenchronik == TRUE)
	|| (Purpurmond == TRUE))
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_Special_Info()
{
	Info_ClearChoices	(PC_PotionAlchemy_Special);

	Info_AddChoice	(PC_PotionAlchemy_Special, DIALOG_BACK, PC_PotionAlchemy_Special_EXIT);

	if (Weisenchronik == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Weisenchronik (1 schwarzer Weise, 1 Traumrauf, 1 Wacholder)", PC_PotionAlchemy_Special_Weisenchronik);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Trank der Geschwindigkeit (1 Snapperkraut, 1 Feldknöterich)", PC_PotionAlchemy_Special_Speed);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Genesung] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Trank der Genesung (1 Extrakt der Heilung, 1 Wacholder, 4 Heilpflanzen, 1 Feldknöterich)", PC_PotionAlchemy_Special_Genesung);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Trank der Stärke (1 Drachenwurzel, 1 Kronstöckl)", PC_PotionAlchemy_Special_Str);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Trank des Geschicks (1 Goblin Beere, 1 Kronstöckl)", PC_PotionAlchemy_Special_Dex);
	};

	if (FolgsamkeitSnapper == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Trank der Folgsamkeit des Snappers (1 Menschenblut, 1 Hexenblut, 3 Drachensnapperhorn)", PC_PotionAlchemy_Special_FolgsamkeitSnapper);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Regeneration] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Regenerationstrank (1 Milch, 10 Blauflieder)", PC_PotionAlchemy_Special_Regeneration);
	};

	if (Purpurmond == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Purpurmond (1 Fliegenpilz, 2 Sumpfkraut, 1 Milch)", PC_PotionAlchemy_Special_Purpurmond);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Gegengift] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Gegengift (1 Elixier der Heilung, 1 Heilknospe, 2 Feldknöterich)", PC_PotionAlchemy_Special_Gegengift);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Elixier des Geistes (1 Feuerwurzel, 1 Kronstöckl)", PC_PotionAlchemy_Special_PermMana);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Elixier des Lebens (1 Heilwurzel, 1 Kronstöckel)", PC_PotionAlchemy_Special_PermHealth);
	};

	if (Knows_MCELIXIER == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Elixier der Geistveränderung", PC_PotionAlchemy_Special_Geist);
	};

	if (DrachensudManaverbrennung == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Drachensud (4 Drachenei, 1 Drachenwurzel, 2 Drachenblut, 1 Drachenschuppe)", PC_PotionAlchemy_Special_Drachensud);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Dracheneitrunk (10 Drachenei, 1 schwarze Perle, 1 Schwefel)", PC_PotionAlchemy_Special_MegaDrink);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_AdanosWohltat] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Adanos Wohltat (1 Leichte Wundheilung, 1 Trollkirsche, 1 Kronstöckl, 5 Feuernesseln, 4 Heilpflanzen)", PC_PotionAlchemy_Special_AdanosWohltat);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_GiftNeutralisierer] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Trank der temporären Giftimmunität (3 Winterrute, 2 Heilknospe, 1 Zwillingsdorn)", PC_PotionAlchemy_Special_GiftNeutralisierer);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_AdanosWohltat] == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Special, "Mischgift (5 Blutfliegenstachel, 5 Fliegenpilze, 5 Höllenpilze)", PC_PotionAlchemy_Special_Gift);
	};
};

FUNC VOID PC_PotionAlchemy_Special_GiftNeutralisierer ()
{
	if (Npc_HasItems(hero, ItPl_Winterrute) >= 3) 
	&& (Npc_HasItems(hero, ItPl_Heilknospe) >= 2) 
	&& (Npc_HasItems(hero, ItPl_Zwillingsdorn) >= 1)
	{
		Npc_RemoveInvItems (hero, ItPl_Winterrute, 3);
		Npc_RemoveInvItems (hero, ItPl_Heilknospe, 2);
		Npc_RemoveInvItems (hero, ItPl_Zwillingsdorn, 1);
		
		CreateInvItem	   (hero, ItPo_GiftNeutralisierer);  
		Print (PRINT_AlchemySuccess);
	
		B_ENDPRODUCTIONDIALOG ();
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	
		B_ENDPRODUCTIONDIALOG ();
	};
};

FUNC VOID PC_PotionAlchemy_Special_Genesung ()
{
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1) 
	&& (Npc_HasItems(hero, ItFo_Booze) >= 1) 
	&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 4)
	&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= 1)
	{
		Npc_RemoveInvItems (hero, ItPo_Health_02, 1);
		Npc_RemoveInvItems (hero, ItFo_Booze, 1);
		Npc_RemoveInvItems (hero, ItPl_Health_Herb_01, 4);
		Npc_RemoveInvItems (hero, ItPl_Temp_Herb, 1);
		
		CreateInvItem	   (hero, ItPo_Genesung);  
		Print (PRINT_AlchemySuccess);
	
		B_ENDPRODUCTIONDIALOG ();
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	
		B_ENDPRODUCTIONDIALOG ();
	};
};

FUNC VOID PC_PotionAlchemy_Special_Regeneration ()
{
	if (Npc_HasItems(hero, ItFo_Milk) >= 1) 
	&& (Npc_HasItems(hero, ItPl_Blueplant) >= 10)
	{
		Npc_RemoveInvItems (hero, ItFo_Milk, 1);
		Npc_RemoveInvItems (hero, ItPl_Blueplant, 10);
		
		CreateInvItem	   (hero, ItPo_Regeneration);  
		Print (PRINT_AlchemySuccess);
	
		B_ENDPRODUCTIONDIALOG ();
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	
		B_ENDPRODUCTIONDIALOG ();
	};
};

FUNC VOID PC_PotionAlchemy_Special_Gegengift ()
{
	if (Npc_HasItems(hero, ItPo_Health_03) >= 1) 
	&& (Npc_HasItems(hero, ItPl_Heilknospe) >= 1)
	&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= 2)
	{
		Npc_RemoveInvItems (hero, ItPo_Health_03, 1);
		Npc_RemoveInvItems (hero, ItPl_Heilknospe, 1);
		Npc_RemoveInvItems (hero, ItPl_Temp_Herb, 2);
		
		CreateInvItem	   (hero, ItPo_Gegengift);  
		Print (PRINT_AlchemySuccess);
	
		B_ENDPRODUCTIONDIALOG ();
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	
		B_ENDPRODUCTIONDIALOG ();
	};
};

FUNC VOID PC_PotionAlchemy_Special_Gift ()
{
	if (Npc_HasItems(hero, ItAt_Sting) >= 5) 
	&& (Npc_HasItems(hero, ItPl_Mushroom_03) >= 5) 
	&& (Npc_HasItems(hero, ItFo_Plants_mushroom_01) >= 5)
	{
		Npc_RemoveInvItems (hero, ItAt_Sting, 5);
		Npc_RemoveInvItems (hero, ItPl_Mushroom_03, 5);
		Npc_RemoveInvItems (hero, ItFo_Plants_mushroom_01, 5);
		
		CreateInvItems	   (hero, ItPo_Mischgift, 2);  
		Print (PRINT_AlchemySuccess);
	
		B_ENDPRODUCTIONDIALOG ();
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	
		B_ENDPRODUCTIONDIALOG ();
	};
};

FUNC VOID PC_PotionAlchemy_Special_Weisenchronik ()
{
	if (Npc_HasItems(hero, ItMi_Addon_Joint_02) >= 1) 
	&& (Npc_HasItems(hero, ItMi_Traumruf) >= 1) 
	&& (Npc_HasItems(hero, ItFo_Booze) >= 1)
	{
		Npc_RemoveInvItems (hero, ItMi_Addon_Joint_02, 1);
		Npc_RemoveInvItems (hero, ItMi_Traumruf, 1);
		Npc_RemoveInvItems (hero, ItFo_Booze, 1);
		
		CreateInvItem	   (hero, ItPo_Weisenchronik);  
		Print (PRINT_AlchemySuccess);
	
		B_ENDPRODUCTIONDIALOG ();
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	
		B_ENDPRODUCTIONDIALOG ();
	};
};

FUNC VOID PC_PotionAlchemy_Special_FolgsamkeitSnapper ()
{
	if (Npc_HasItems(hero, ItAt_Menschenblut) >= 1) 
	&& (Npc_HasItems(hero, ItAt_Hexenblut) >= 1) 
	&& (Npc_HasItems(hero, ItAt_DrgSnapperHorn) >= 3)
	{
		Npc_RemoveInvItems (hero, ItAt_Menschenblut, 1);
		Npc_RemoveInvItems (hero, ItAt_Hexenblut, 1);
		Npc_RemoveInvItems (hero, ItAt_DrgSnapperHorn, 3);
		
		CreateInvItems	   (hero, ItPo_FolgsamkeitSnapper, 1);  
		Print (PRINT_AlchemySuccess);
	
		B_ENDPRODUCTIONDIALOG ();
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	
		B_ENDPRODUCTIONDIALOG ();
	};
};

FUNC VOID PC_PotionAlchemy_Special_Purpurmond ()
{
	if (Npc_HasItems(hero, ItPl_Mushroom_03) >= 1) 
	&& (Npc_HasItems(hero, ItPl_SwampHerb) >= 2) 
	&& (Npc_HasItems(hero, ItFo_Milk) >= 3)
	{
		Npc_RemoveInvItems (hero, ItPl_Mushroom_03, 1);
		Npc_RemoveInvItems (hero, ItPl_SwampHerb, 2);
		Npc_RemoveInvItems (hero, ItFo_Milk, 3);
		
		CreateInvItems	   (hero, ItPo_Purpurmond, 1);  
		Print (PRINT_AlchemySuccess);
	
		B_ENDPRODUCTIONDIALOG ();
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	
		B_ENDPRODUCTIONDIALOG ();
	};
};

FUNC VOID PC_PotionAlchemy_Special_Speed ()
{
	if (Npc_HasItems (hero, ItPl_Speed_Herb_01) >= 1) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) >= 1) 
	{
		if (Mod_Darf_Speed == TRUE)
		|| (Mod_LehrlingBei != 1)
		{
			Npc_RemoveInvItems (hero, ItPl_Speed_Herb_01, 1);
			Npc_RemoveInvItems (hero, ItPl_Temp_Herb, 1);
		
			CreateInvItem	   (hero, ItPo_Speed);  
			Print (PRINT_AlchemySuccess);

			Mod_Count_Speed += 1;
	
			B_ENDPRODUCTIONDIALOG ();
		}
		else
		{
			Mod_TrankFirstStep = 0;
			Mod_TrankSecondStep = 0;
			Mod_TrankThirdStep = 0;

			Info_ClearChoices	(PC_PotionAlchemy_Special);

			Info_AddChoice	(PC_PotionAlchemy_Special, "Feldknöterich im Mörser zerstoßen", PC_PotionAlchemy_Special_Speed_C);
			Info_AddChoice	(PC_PotionAlchemy_Special, "Snapperkraut in heißes Wasser legen", PC_PotionAlchemy_Special_Speed_B);
			Info_AddChoice	(PC_PotionAlchemy_Special, "Snapperkraut über den Mörser hängen", PC_PotionAlchemy_Special_Speed_A);
		};
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	
		B_ENDPRODUCTIONDIALOG ();
	};
};

FUNC VOID PC_PotionAlchemy_Special_Speed_C ()
{
	Npc_RemoveInvItems (hero, ItPl_Temp_Herb, 1);

	if (Mod_TrankSecondStep > 0)
	{
		Mod_TrankThirdStep = 3;

		Info_ClearChoices	(PC_PotionAlchemy_Special);

		Info_AddChoice	(PC_PotionAlchemy_Special, "Snapperkraut verbrennen", PC_PotionAlchemy_Special_Speed_D);
	}
	else if (Mod_TrankFirstStep > 0)
	{
		Mod_TrankSecondStep = 3;
	}
	else
	{
		Mod_TrankFirstStep = 3;
	};
};

FUNC VOID PC_PotionAlchemy_Special_Speed_B ()
{
	if (Mod_TrankSecondStep > 0)
	{
		Mod_TrankThirdStep = 2;

		Info_ClearChoices	(PC_PotionAlchemy_Special);

		Info_AddChoice	(PC_PotionAlchemy_Special, "Snapperkraut verbrennen", PC_PotionAlchemy_Special_Speed_D);
	}
	else if (Mod_TrankFirstStep > 0)
	{
		Mod_TrankSecondStep = 2;

		Npc_RemoveInvItems (hero, ItPl_Speed_Herb_01, 1);
	}
	else
	{
		Mod_TrankFirstStep = 2;
	};
};

FUNC VOID PC_PotionAlchemy_Special_Speed_A ()
{
	Npc_RemoveInvItems (hero, ItPl_Temp_Herb, 1);

	if (Mod_TrankSecondStep > 0)
	{
		Mod_TrankThirdStep = 1;

		Info_ClearChoices	(PC_PotionAlchemy_Special);

		Info_AddChoice	(PC_PotionAlchemy_Special, "Snapperkraut verbrennen", PC_PotionAlchemy_Special_Speed_D);
	}
	else if (Mod_TrankFirstStep > 0)
	{
		Mod_TrankSecondStep = 1;

		Npc_RemoveInvItems (hero, ItPl_Speed_Herb_01, 1);
	}
	else
	{
		Mod_TrankFirstStep = 1;
	};
};

FUNC VOID PC_PotionAlchemy_Special_Speed_D ()
{
	Info_ClearChoices	(PC_PotionAlchemy_Special);

	Info_AddChoice	(PC_PotionAlchemy_Special, "Mit Knöterich vermischen und erhitzen", PC_PotionAlchemy_Special_Speed_E);
};

FUNC VOID PC_PotionAlchemy_Special_Speed_E ()
{
	Info_ClearChoices	(PC_PotionAlchemy_Special);

	Info_AddChoice	(PC_PotionAlchemy_Special, "Feste Bestandteile heraussieben und abfüllen", PC_PotionAlchemy_Special_Speed_F);
};

FUNC VOID PC_PotionAlchemy_Special_Speed_F ()
{
	Info_ClearChoices	(PC_PotionAlchemy_Special);

	if (Mod_TrankFirstStep == 2)
	&& (Mod_TrankSecondStep == 1)
	{		
		CreateInvItem	   (hero, ItPo_Speed);  
		Print (PRINT_AlchemySuccess);

		Mod_Darf_Speed = TRUE;

		Mod_Count_Speed += 1;
	}
	else
	{		
		CreateInvItem	   (hero, ItFo_Bruehe);  
		Print (PRINT_AlchemySuccess);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Special_Str ()
{
	if (Npc_HasItems (hero, ItPl_Strength_Herb_01)    >= 1) 
	&& (Npc_HasItems (hero, ItPl_Perm_Herb) 	   >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Strength_Herb_01, 1);
		Npc_RemoveInvItems (hero,ItPl_Perm_Herb	  ,1);
		
		CreateInvItems	   (hero,ItPo_Perm_STR,1);  
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Special_Dex ()
{
	if (Npc_HasItems (hero, ItPl_Dex_Herb_01) 		  >= 1) 
	&& (Npc_HasItems (hero, ItPl_Perm_Herb) 	  >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Dex_Herb_01	  , 1);
		Npc_RemoveInvItems (hero,ItPl_Perm_Herb	  , 1);
		
		CreateInvItems	   (hero,ItPo_Perm_Dex,1);  
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Special_PermMana ()
{
	if (Npc_HasItems (hero, ItPl_Mana_Herb_03) 	  >= 1) 
	&& (Npc_HasItems (hero, ItPl_Perm_Herb) 	  >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Mana_Herb_03,1);
		Npc_RemoveInvItems (hero,ItPl_Perm_Herb	  ,1);
		
		CreateInvItems	   (hero,ItPo_Perm_Mana,1);  
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Special_PermHealth ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_03) >= 1) 
	&& (Npc_HasItems (hero, ItPl_Perm_Herb) >= 1) 
	{
		if (Mod_Darf_PermHealth == TRUE)
		|| (Mod_LehrlingBei != 1)
		{
			Npc_RemoveInvItems (hero, ItPl_Health_Herb_03, 1);
			Npc_RemoveInvItems (hero, ItPl_Perm_Herb, 1);
		
			CreateInvItem	   (hero, ItPo_Perm_Health);  
			Print (PRINT_AlchemySuccess);

			Mod_Count_PermHealth += 1;
	
			B_ENDPRODUCTIONDIALOG ();
		}
		else
		{
			Mod_TrankFirstStep = 0;
			Mod_TrankSecondStep = 0;
			Mod_TrankThirdStep = 0;

			Info_ClearChoices	(PC_PotionAlchemy_Special);

			Info_AddChoice	(PC_PotionAlchemy_Special, "Pflanzen in der Flasche erhitzen", PC_PotionAlchemy_Special_PermHealth_A);
		};
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	
		B_ENDPRODUCTIONDIALOG ();
	};
};

FUNC VOID PC_PotionAlchemy_Special_PermHealth_A ()
{
	Npc_RemoveInvItems (hero, ItPl_Perm_Herb, 1);
	Npc_RemoveInvItems (hero, ItPl_Health_Herb_03, 1);

	Mod_PermHealth_Wrong = 1;

	PrintScreen	("Das Wasser erwärmt sich", -1, -1, FONT_SCREEN, 2);

	Info_ClearChoices	(PC_PotionAlchemy_Special);

	Info_AddChoice	(PC_PotionAlchemy_Special, "Flasche verschließen", PC_PotionAlchemy_Special_PermHealth_C);
	Info_AddChoice	(PC_PotionAlchemy_Special, "Warten", PC_PotionAlchemy_Special_PermHealth_B);
};

FUNC VOID PC_PotionAlchemy_Special_PermHealth_B ()
{
	Mod_PermHealth_Wrong = 1;

	PrintScreen	("Das Wasser erwärmt sich", -1, -1, FONT_SCREEN, 2);

	Info_ClearChoices	(PC_PotionAlchemy_Special);

	Info_AddChoice	(PC_PotionAlchemy_Special, "Flasche verschließen", PC_PotionAlchemy_Special_PermHealth_C);
	Info_AddChoice	(PC_PotionAlchemy_Special, "Warten", PC_PotionAlchemy_Special_PermHealth_D);
};

FUNC VOID PC_PotionAlchemy_Special_PermHealth_D ()
{
	Mod_PermHealth_Wrong = 1;

	PrintScreen	("Das Wasser ist heiß", -1, -1, FONT_SCREEN, 2);

	Info_ClearChoices	(PC_PotionAlchemy_Special);

	Info_AddChoice	(PC_PotionAlchemy_Special, "Flasche verschließen", PC_PotionAlchemy_Special_PermHealth_C);
	Info_AddChoice	(PC_PotionAlchemy_Special, "Warten", PC_PotionAlchemy_Special_PermHealth_E);
};

FUNC VOID PC_PotionAlchemy_Special_PermHealth_E ()
{
	Mod_PermHealth_Wrong = 0;

	PrintScreen	("Erste Luftblasen steigen auf", -1, -1, FONT_SCREEN, 2);

	Info_ClearChoices	(PC_PotionAlchemy_Special);

	Info_AddChoice	(PC_PotionAlchemy_Special, "Flasche verschließen", PC_PotionAlchemy_Special_PermHealth_C);
	Info_AddChoice	(PC_PotionAlchemy_Special, "Warten", PC_PotionAlchemy_Special_PermHealth_F);
};

FUNC VOID PC_PotionAlchemy_Special_PermHealth_F ()
{
	Mod_PermHealth_Wrong = 1;

	PrintScreen	("Wilde Luftblasenentwicklung", -1, -1, FONT_SCREEN, 2);

	Info_ClearChoices	(PC_PotionAlchemy_Special);

	Info_AddChoice	(PC_PotionAlchemy_Special, "Flasche verschließen", PC_PotionAlchemy_Special_PermHealth_C);
};

FUNC VOID PC_PotionAlchemy_Special_PermHealth_C ()
{
	Info_ClearChoices	(PC_PotionAlchemy_Special);

	if (Mod_PermHealth_Wrong == 0)
	{		
		CreateInvItem	   (hero, ItPo_PermHealth_Gut);

		Mod_PermHealth_Zeit = B_GetHour();

		Mod_PermHealth_Day = Wld_GetDay();
	}
	else
	{		
		CreateInvItem	   (hero, ItPo_PermHealth_Schlecht);

		Mod_PermHealth_Zeit = B_GetHour();

		Mod_PermHealth_Day = Wld_GetDay();
	};

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Special_Geist ()
{
	if (Npc_HasItems (hero, ItAt_Sting) 		   >= 2) 
	&& (Npc_HasItems (hero, ItPo_Mana_02) 	  	   >= 1) 
	&& (Npc_HasItems (hero, ItPo_Health_01) 	   >= 1) 
	&& (Npc_HasItems (hero, ItFo_Addon_Pfeffer_01) >= 1) 
	{
		Npc_RemoveInvItems (hero,ItAt_Sting					,2);
		Npc_RemoveInvItems (hero,ItPo_Mana_02	  			,1);
		Npc_RemoveInvItems (hero,ItPo_Health_01	  			,1);
		Npc_RemoveInvItems (hero,ItFo_Addon_Pfeffer_01	  	,1);
		
		if (Knows_Bloodfly == TRUE)
		{
			CreateInvItems	   (hero,ItPo_Addon_Geist_02,1);  
		}
		else
		{
			CreateInvItems	   (hero,ItPo_Addon_Geist_01,1);  
		};
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Special_Drachensud ()
{
	if (Npc_HasItems (hero, ItAt_DragonEgg_Giftdrache) >= 4) 
	&& (Npc_HasItems (hero, ItPl_Strength_Herb_01) >= 1) 
	&& (Npc_HasItems (hero, ItAt_Dragonblood) >= 2) 
	&& (Npc_HasItems (hero, ItAt_Dragonscale) >= 1) 
	{
		Npc_RemoveInvItems (hero, ItAt_DragonEgg_Giftdrache, 4);
		Npc_RemoveInvItems (hero, ItPl_Strength_Herb_01, 1);
		Npc_RemoveInvItems (hero, ItAt_Dragonblood, 2);
		Npc_RemoveInvItems (hero, ItAt_Dragonscale, 1);
		
		CreateInvItems 	   (hero,ItPo_Drachensud,1); 
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Special_MegaDrink ()
{
	if (Npc_HasItems (hero, ItAt_DragonEgg_MIS) >= 10) 
	&& (Npc_HasItems (hero, ItMi_DarkPearl)    >= 1) 
	&& (Npc_HasItems (hero, ItMi_Sulfur)    >= 1) 
	{
		Npc_RemoveInvItems (hero,ItAt_DragonEgg_MIS ,10);
		Npc_RemoveInvItems (hero,ItMi_DarkPearl	  ,1);
		Npc_RemoveInvItems (hero,ItMi_Sulfur	  ,1);
		
		CreateInvItems 	   (hero,ItPo_MegaDrink,1); 
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Special_AdanosWohltat ()
{
	if (Npc_HasItems (hero, ItRu_LightHeal) >= 1) 
	&& (Npc_HasItems (hero, ItPl_Trollkirsche)    >= 1) 
	&& (Npc_HasItems (hero, ItPl_Perm_Herb)    >= 1) 
	&& (Npc_HasItems (hero, ItPl_Mana_Herb_01)    >= 5) 
	&& (Npc_HasItems (hero, ItPl_Health_Herb_01)    >= 4) 
	{
		Npc_RemoveInvItems (hero, ItRu_LightHeal, 1);
		Npc_RemoveInvItems (hero, ItPl_Trollkirsche, 1);
		Npc_RemoveInvItems (hero, ItPl_Perm_Herb, 1);
		Npc_RemoveInvItems (hero, ItPl_Mana_Herb_01, 5);
		Npc_RemoveInvItems (hero, ItPl_Health_Herb_01, 4);
		
		CreateInvItems 	   (hero, ItPo_AdanosWohltat, 1); 
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Special_EXIT()
{
	Info_ClearChoices	(PC_PotionAlchemy_Special);
};

// Bier

INSTANCE PC_PotionAlchemy_Beer (C_Info)
{
	npc				= PC_Hero;
	nr				= 4;
	condition		= PC_PotionAlchemy_Beer_Condition;
	information		= PC_PotionAlchemy_Beer_Info;
	permanent		= TRUE;
	description		= "Bier brauen"; 
};

FUNC INT PC_PotionAlchemy_Beer_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_Beer_Info()
{
	Info_ClearChoices	(PC_PotionAlchemy_Beer);

	Info_AddChoice	(PC_PotionAlchemy_Beer, DIALOG_BACK, PC_PotionAlchemy_Beer_EXIT);

	if (Rezept_Orkbier == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Beer, "Orkbier brauen", PC_PotionAlchemy_Beer_Orkbier);
	};
};

FUNC VOID PC_PotionAlchemy_Beer_EXIT()
{
	Info_ClearChoices	(PC_PotionAlchemy_Beer);
};

FUNC VOID PC_PotionAlchemy_Beer_Orkbier()
{
	if (Npc_HasItems (self, ItFo_Beer) >= 1)
	&& (Npc_HasItems (self, ItFo_Booze) >= 1)
	&& (Npc_HasItems (self, ItPl_Mushroom_02) >= 1)
	{
		Npc_RemoveInvItems (self, ItFo_Beer, 1);
		Npc_RemoveInvItems (self, ItFo_Booze, 1);
		Npc_RemoveInvItems (self, ItPl_Mushroom_02, 1);
		
		Print (PRINT_AlchemySuccess);

		CreateInvItems (self, ItFo_Orkbier, 1);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);	
	};

	B_ENDPRODUCTIONDIALOG ();
};

// Geschosse

INSTANCE PC_PotionAlchemy_Geschosse (C_Info)
{
	npc				= PC_Hero;
	nr				= 5;
	condition		= PC_PotionAlchemy_Geschosse_Condition;
	information		= PC_PotionAlchemy_Geschosse_Info;
	permanent		= TRUE;
	description		= "Geschosse präparieren"; 
};

FUNC INT PC_PotionAlchemy_Geschosse_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_Geschosse_Info()
{
	Info_ClearChoices	(PC_PotionAlchemy_Geschosse);

	Info_AddChoice	(PC_PotionAlchemy_Geschosse, DIALOG_BACK, PC_PotionAlchemy_Geschosse_EXIT);

	if (Npc_HasItems(hero, ItPo_Tiergift) >= 1)
	&& (Npc_HasItems(hero, ItRw_Arrow) >= 10)
	{
		Info_AddChoice	(PC_PotionAlchemy_Geschosse, "Tiergiftpfeile herstellen", PC_PotionAlchemy_Geschosse_TiergiftArrow);
	};
	if (Npc_HasItems(hero, ItPo_Tiergift) >= 1)
	&& (Npc_HasItems(hero, ItRw_Bolt) >= 10)
	{
		Info_AddChoice	(PC_PotionAlchemy_Geschosse, "Tiergiftbolzen herstellen", PC_PotionAlchemy_Geschosse_TiergiftBolt);
	};
	if (Npc_HasItems(hero, ItMi_Coal) >= 1)
	&& (Npc_HasItems(hero, ItMi_Sulfur) >= 1)
	&& (Npc_HasItems(hero, ItMi_Salpeter) >= 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest5))
	{
		Info_AddChoice	(PC_PotionAlchemy_Geschosse, "Sprengstoff herstellen", PC_PotionAlchemy_Geschosse_Sprengstoff);
	};
	if (Rezept_Iwan == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Geschosse, "Heilige Pfeile herstellen", PC_PotionAlchemy_Geschosse_HolyArrow);
		Info_AddChoice	(PC_PotionAlchemy_Geschosse, "Heilige Bolzen herstellen", PC_PotionAlchemy_Geschosse_HolyBolt);
	};
	if (Npc_HasItems(hero, ItPo_Pflanzengift) >= 1)
	&& (Npc_HasItems(hero, ItRw_Arrow) >= 10)
	{
		Info_AddChoice	(PC_PotionAlchemy_Geschosse, "Pflanzengiftpfeile herstellen", PC_PotionAlchemy_Geschosse_GewaechsgiftArrow);
	};
	if (Npc_HasItems(hero, ItPo_Pflanzengift) >= 1)
	&& (Npc_HasItems(hero, ItRw_Bolt) >= 10)
	{
		Info_AddChoice	(PC_PotionAlchemy_Geschosse, "Pflanzengiftbolzen herstellen", PC_PotionAlchemy_Geschosse_GewaechsgiftBolt);
	};
	if (Npc_HasItems(hero, ItMi_Rueckverwandlungstinktur) == 1)
	{
		Info_AddChoice	(PC_PotionAlchemy_Geschosse, "Rückverwandlungs-Pfeil herstellen", PC_PotionAlchemy_Geschosse_RueckverwandlungsArrow);
		Info_AddChoice	(PC_PotionAlchemy_Geschosse, "Rückverwandlungs-Bolzen herstellen", PC_PotionAlchemy_Geschosse_RueckverwandlungsBolt);
	};
};

FUNC VOID PC_PotionAlchemy_Geschosse_EXIT()
{
	Info_ClearChoices	(PC_PotionAlchemy_Geschosse);
};

FUNC VOID PC_PotionAlchemy_Geschosse_HolyBolt()
{
	if (Npc_HasItems(hero, ItRw_Bolt) >= 50)
	&& (Npc_HasItems(hero, ItMi_HolyWater2) >= 1)
	{
		Npc_RemoveInvItems (self, ItRw_Bolt, 50);
		Npc_RemoveInvItems (self, ItMi_HolyWater2, 1);
		
		Print (PRINT_AlchemySuccess);

		CreateInvItems (self, ItRw_HolyBolt, 50);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);	
	};

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Geschosse_HolyArrow()
{
	if (Npc_HasItems(hero, ItRw_Arrow) >= 50)
	&& (Npc_HasItems(hero, ItMi_HolyWater2) >= 1)
	{
		Npc_RemoveInvItems (self, ItRw_Arrow, 50);
		Npc_RemoveInvItems (self, ItMi_HolyWater2, 1);
		
		Print (PRINT_AlchemySuccess);

		CreateInvItems (self, ItRw_HolyArrow, 50);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);	
	};

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Geschosse_RueckverwandlungsBolt()
{
	if (Npc_HasItems(hero, ItRw_Bolt) >= 1)
	&& (Npc_HasItems(hero, ItMi_Rueckverwandlungstinktur) >= 1)
	{
		Npc_RemoveInvItems (self, ItRw_Bolt, 1);
		
		Print ("Rückverwandlungsbolzen hergestellt");

		CreateInvItems (self, ItRw_RueckverwandlungsBolt, 1);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);	
	};

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Geschosse_RueckverwandlungsArrow()
{
	if (Npc_HasItems(hero, ItRw_Arrow) >= 1)
	&& (Npc_HasItems(hero, ItMi_Rueckverwandlungstinktur) >= 1)
	{
		Npc_RemoveInvItems (self, ItRw_Arrow, 1);
		
		Print ("Rückverwandlungspfeil hergestellt");

		CreateInvItems (self, ItRw_RueckverwandlungsArrow, 1);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);	
	};

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Geschosse_Tiergiftarrow()
{
	Npc_RemoveInvItems	(hero, ItRw_Arrow, 10);
	Npc_RemoveInvItems	(hero, ItPo_Tiergift, 1);

	CreateInvItems	(hero, ItRw_TiergiftArrow, 10);

	Print	("10 Tiergiftpfeile hergestellt");

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Geschosse_TiergiftBolt()
{
	Npc_RemoveInvItems	(hero, ItRw_Bolt, 10);
	Npc_RemoveInvItems	(hero, ItPo_Tiergift, 1);

	CreateInvItems	(hero, ItRw_TiergiftBolt, 10);

	Print	("10 Tiergiftbolzen hergestellt");

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Geschosse_Sprengstoff()
{
	Npc_RemoveInvItems	(hero, ItMi_Coal, 1);
	Npc_RemoveInvItems	(hero, ItMi_Sulfur, 1);
	Npc_RemoveInvItems	(hero, ItMi_Salpeter, 1);

	CreateInvItems	(hero, ItMi_Sprengstoff, 10);

	Print	("10 Einheiten Sprengstoff hergestellt");

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Geschosse_Gewaechsgiftarrow()
{
	Npc_RemoveInvItems	(hero, ItRw_Arrow, 10);
	Npc_RemoveInvItems	(hero, ItPo_Pflanzengift, 1);

	CreateInvItems	(hero, ItRw_GewaechsgiftArrow, 10);

	Print	("10 Pflanzengiftpfeile hergestellt");

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Geschosse_GewaechsgiftBolt()
{
	Npc_RemoveInvItems	(hero, ItRw_Bolt, 10);
	Npc_RemoveInvItems	(hero, ItPo_Pflanzengift, 1);

	CreateInvItems	(hero, ItRw_GewaechsgiftBolt, 10);

	Print	("10 Pflanzengiftbolzen hergestellt");

	B_ENDPRODUCTIONDIALOG ();
};

// Schnäpse

INSTANCE PC_PotionAlchemy_Booze (C_Info)
{
	npc				= PC_Hero;
	nr				= 6;
	condition		= PC_PotionAlchemy_Booze_Condition;
	information		= PC_PotionAlchemy_Booze_Info;
	permanent		= TRUE;
	description		= "Schnaps brennen"; 
};

FUNC INT PC_PotionAlchemy_Booze_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_Booze_Info()
{
	Info_ClearChoices	(PC_PotionAlchemy_Booze);

	Info_AddChoice	(PC_PotionAlchemy_Booze, DIALOG_BACK, PC_PotionAlchemy_Booze_EXIT);

	if (Knows_SchnellerHering == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Booze, "Schnellen Hering mixen.", PC_PotionAlchemy_Booze_SchnellerHering);
	};

	if (Rezept_Rumtopf == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Booze, "Rumtopf mixen.", PC_PotionAlchemy_Booze_Rumtopf);
	};

	if (Knows_Schlafhammer == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Booze, "Lou's Hammer mit doppelter Menge Rum.", PC_PotionAlchemy_Booze_Schlaf);
	};

	if (Knows_LousHammer == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Booze, "Lou's Hammer versuchen ...", PC_PotionAlchemy_Booze_Lou);
	};

	if (Mod_PCKenntGrogRezept == 1)
	{
		Info_AddChoice	(PC_PotionAlchemy_Booze, "Grog versuchen ...", PC_PotionAlchemy_Booze_Grog);
	};
};

FUNC VOID PC_PotionAlchemy_Booze_EXIT()
{
	Info_ClearChoices	(PC_PotionAlchemy_Booze);
};

FUNC VOID PC_PotionAlchemy_Booze_SchnellerHering()
{
	if (Npc_HasItems (self, ItPl_Speed_Herb_01) >= 1)
	&& (Npc_HasItems (self, ItFo_Fish) >= 1)
	&& (Npc_HasItems (self, ItFo_Addon_Rum) >= 1)
	{
		Npc_RemoveInvItems (self, ItPl_Speed_Herb_01,1);
		Npc_RemoveInvItems (self, ItFo_Addon_Rum,1);
		Npc_RemoveInvItems (self, ItFo_Fish,1);
		
		Print (PRINT_AlchemySuccess);
		CreateInvItems (self, ItFo_Addon_SchnellerHering,1);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);	
	};

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Booze_Rumtopf()
{
	if (Npc_HasItems (self, ItPl_Forestberry) >= 3)
	&& (Npc_HasItems (self, ItFo_Addon_Zucker) >= 1)
	&& (Npc_HasItems (self, ItFo_Addon_Rum) >= 1)
	{
		Npc_RemoveInvItems (self, ItPl_Forestberry,3);
		Npc_RemoveInvItems (self, ItFo_Addon_Rum,1);
		Npc_RemoveInvItems (self, ItFo_Addon_Zucker,1);
		
		Print (PRINT_AlchemySuccess);
		CreateInvItems (self, ItFo_Rumtopf,1);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);	
	};

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Booze_Schlaf()
{
	if (Npc_HasItems (self, ItPl_SwampHerb) >= 1)
	&& (Npc_HasItems (self, ItPl_Beet)		>= 2)
	&& (Npc_HasItems (self, ItAt_SharkTeeth)>= 1)
	&& (Npc_HasItems (self, ItFo_Addon_Rum) >= 2)
	{
		Npc_RemoveInvItems (self, ItPl_SwampHerb,1);
		Npc_RemoveInvItems (self, ItPl_Beet,2);
		Npc_RemoveInvItems (self, ItAt_SharkTeeth,1);
		Npc_RemoveInvItems (self, ItFo_Addon_Rum,2);
		
		Print (PRINT_AlchemySuccess);
		CreateInvItems (self, ItFo_Addon_SchlafHammer,1);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);	
	};

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Booze_Lou()
{
	if (Npc_HasItems (self, ItPl_SwampHerb) >= 1)
	&& (Npc_HasItems (self, ItPl_Beet)		>= 2)
	&& (Npc_HasItems (self, ItAt_SharkTeeth)>= 1)
	&& (Npc_HasItems (self, ItFo_Addon_Rum) >= 1)
	{
		Npc_RemoveInvItems (self, ItPl_SwampHerb,1);
		Npc_RemoveInvItems (self, ItPl_Beet,2);
		Npc_RemoveInvItems (self, ItAt_SharkTeeth,1);
		Npc_RemoveInvItems (self, ItFo_Addon_Rum,1);
		
		Print (PRINT_AlchemySuccess);
		CreateInvItems (self, ItFo_Addon_LousHammer,1);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);	
	};

	B_ENDPRODUCTIONDIALOG ();
};	

FUNC VOID PC_PotionAlchemy_Booze_Grog()
{
	if (Npc_HasItems (self, ItFo_Addon_Zucker) >= 1)
	&& (Npc_HasItems (self, ItFo_Water) >= 1)
	&& (Npc_HasItems (self, ItFo_Addon_Rum) >= 1)
	{
		Npc_RemoveInvItems (self, ItFo_Addon_Zucker, 1);
		Npc_RemoveInvItems (self, ItFo_Addon_Rum, 1);
		Npc_RemoveInvItems (self, ItFo_Water, 1);
		
		Print (PRINT_AlchemySuccess);
		CreateInvItems (self, Mod_RealGrog, 2);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);	
	};

	B_ENDPRODUCTIONDIALOG ();
};

// Sekrete

INSTANCE PC_PotionAlchemy_Sekret (C_INFO)
{
	npc		= PC_Hero;
	nr		= 7;
	condition	= PC_PotionAlchemy_Sekret_Condition;
	information	= PC_PotionAlchemy_Sekret_Info;
	permanent	= 1;
	important	= 0;
	description	= "Sekrete/Gifte abfüllen";
};

FUNC INT PC_PotionAlchemy_Sekret_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY)
	{
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_Sekret_Info()
{
	Info_ClearChoices	(PC_PotionAlchemy_Sekret);

	Info_AddChoice	(PC_PotionAlchemy_Sekret, DIALOG_BACK, PC_PotionAlchemy_Sekret_EXIT);

	if (Npc_HasItems(hero, ItAt_CrawlerMandibles) >= 3)
	{
		Info_AddChoice	(PC_PotionAlchemy_Sekret, "Minecrawler-Sekret aus 3 Zange abfüllen", PC_PotionAlchemy_Sekret_SekretZange);
	};

	if (Npc_HasItems(hero, ItAt_Crawlerqueen) > 0)
	{
		Info_AddChoice	(PC_PotionAlchemy_Sekret, "Minecrawler-Sekret aus Ei abfüllen", PC_PotionAlchemy_Sekret_SekretEi);
	};

	if (Npc_HasItems(hero, ItAt_GigantHeart) > 0)
	{
		Info_AddChoice	(PC_PotionAlchemy_Sekret, "Giftige Eingeweide abfüllen", PC_PotionAlchemy_Sekret_Gigant);
	};

	if (Npc_HasItems(hero, ItAt_Sting) > 0)
	&& (Knows_Bloodfly == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Sekret, "Gift der Blutfliege abfüllen", PC_PotionAlchemy_Sekret_Blutfliege);
	};

	if (Npc_HasItems(hero, ItAt_SpiderMandibles) >= 2)
	{
		Info_AddChoice	(PC_PotionAlchemy_Sekret, "2 Spinnenzangen zu Tiergift abfüllen", PC_PotionAlchemy_Sekret_SpinneTiergift);
	};

	if (Npc_HasItems(hero, ItAt_CrawlerMandibles) >= 2)
	{
		Info_AddChoice	(PC_PotionAlchemy_Sekret, "2 Minecrawlerzangen zu Tiergift abfüllen", PC_PotionAlchemy_Sekret_MinecrawlerTiergift);
	};

	if (Npc_HasItems(hero, ItAt_Sting) >= 3)
	{
		Info_AddChoice	(PC_PotionAlchemy_Sekret, "3 Blufliegenstachel zu Tiergift abfüllen", PC_PotionAlchemy_Sekret_BlutfliegeTiergift);
	};

	if (Npc_HasItems(hero, ItPl_Mushroom_03) >= 2)
	{
		Info_AddChoice	(PC_PotionAlchemy_Sekret, "2 Fliegenpilze zu Pflanzengift abfüllen", PC_PotionAlchemy_Sekret_FliegenpilzGewaechsgift);
	};
};

FUNC VOID PC_PotionAlchemy_Sekret_EXIT()
{
	Info_ClearChoices	(PC_PotionAlchemy_Sekret);
};

FUNC VOID PC_PotionAlchemy_Sekret_SekretZange()
{
	Npc_RemoveInvItems	(hero, ItAt_CrawlerMandibles, 3);
	CreateInvItems	(hero, ItFo_Potion_Elixier_Zange, 1);
		
	Print (PRINT_SekretSuccess);

	PC_PotionAlchemy_Sekret_Info();
};

FUNC VOID PC_PotionAlchemy_Sekret_SekretEi()
{
	Npc_RemoveInvItems	(hero, ItAt_Crawlerqueen, 1);
	CreateInvItems	(hero, ItFo_Potion_Elixier_Egg, 2);
		
	Print (PRINT_SekretSuccess);

	PC_PotionAlchemy_Sekret_Info();
};

FUNC VOID PC_PotionAlchemy_Sekret_Gigant()
{
	Npc_RemoveInvItems	(hero, ItAt_GigantHeart, 1);
	CreateInvItems	(hero, ItPo_Tiergift, 4);
	CreateInvItems	(hero, ItPo_Pflanzengift, 1);

	Print (ConcatStrings("4x ", PRINT_TiergiftSuccess));
	Print (PRINT_GewaechsgiftSuccess);

	PC_PotionAlchemy_Sekret_Info();
};

FUNC VOID PC_PotionAlchemy_Sekret_Blutfliege()
{
	Npc_RemoveInvItems	(hero, ItAt_Sting, 1);
	CreateInvItems	(hero, ItFo_Potion_Blutfliege, 1);
		
	Print (PRINT_SekretSuccess);

	PC_PotionAlchemy_Sekret_Info();
};

FUNC VOID PC_PotionAlchemy_Sekret_SpinneTiergift()
{
	Npc_RemoveInvItems	(hero, ItAt_SpiderMandibles, 2);
	CreateInvItems	(hero, ItPo_Tiergift, 1);
		
	Print (PRINT_TiergiftSuccess);

	PC_PotionAlchemy_Sekret_Info();
};

FUNC VOID PC_PotionAlchemy_Sekret_MinecrawlerTiergift()
{
	Npc_RemoveInvItems	(hero, ItAt_CrawlerMandibles, 2);
	CreateInvItems	(hero, ItPo_Tiergift, 1);
		
	Print (PRINT_TiergiftSuccess);

	PC_PotionAlchemy_Sekret_Info();
};

FUNC VOID PC_PotionAlchemy_Sekret_BlutfliegeTiergift()
{
	Npc_RemoveInvItems	(hero, ItAt_Sting, 3);
	CreateInvItems	(hero, ItPo_Tiergift, 1);
		
	Print (PRINT_TiergiftSuccess);

	PC_PotionAlchemy_Sekret_Info();
};

FUNC VOID PC_PotionAlchemy_Sekret_FliegenpilzGewaechsgift()
{
	Npc_RemoveInvItems	(hero, ItPl_Mushroom_03, 2);
	CreateInvItems	(hero, ItPo_Pflanzengift, 1);
		
	Print (PRINT_GewaechsgiftSuccess);

	PC_PotionAlchemy_Sekret_Info();
};

// Waffen vergiften

INSTANCE PC_PotionAlchemy_WaffeVergiften (C_INFO)
{
	npc		= PC_Hero;
	nr		= 7;
	condition	= PC_PotionAlchemy_WaffeVergiften_Condition;
	information	= PC_PotionAlchemy_WaffeVergiften_Info;
	permanent	= 1;
	important	= 0;
	description	= "Waffe vergiften";
};

FUNC INT PC_PotionAlchemy_WaffeVergiften_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY)
	&& (Npc_HasEquippedMeleeWeapon(hero))
	{
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_WaffeVergiften_Info()
{
	Info_ClearChoices	(PC_PotionAlchemy_WaffeVergiften);

	Info_AddChoice	(PC_PotionAlchemy_WaffeVergiften, DIALOG_BACK, PC_PotionAlchemy_WaffeVergiften_BACK);

	if (Npc_HasItems(hero, ItPo_Tiergift) >= 1)
	{
		Info_AddChoice	(PC_PotionAlchemy_WaffeVergiften, "mit Tiergift", PC_PotionAlchemy_WaffeVergiften_Tiergift);
	};
	if (Npc_HasItems(hero, ItPo_Pflanzengift) >= 1)
	{
		Info_AddChoice	(PC_PotionAlchemy_WaffeVergiften, "mit Gewächsgift", PC_PotionAlchemy_WaffeVergiften_Gewaechsgift);
	};
};

FUNC VOID PC_PotionAlchemy_WaffeVergiften_BACK()
{
	Info_ClearChoices	(PC_PotionAlchemy_WaffeVergiften);
};

FUNC VOID PC_PotionAlchemy_WaffeVergiften_Tiergift()
{
	Npc_RemoveInvItems	(hero, ItPo_Tiergift, 1);

	Mod_Tiergift += 10;

	Info_ClearChoices	(PC_PotionAlchemy_WaffeVergiften);
};

FUNC VOID PC_PotionAlchemy_WaffeVergiften_Gewaechsgift()
{
	Npc_RemoveInvItems	(hero, ItPo_Pflanzengift, 1);

	Mod_Gewaechsgift += 10;

	Info_ClearChoices	(PC_PotionAlchemy_WaffeVergiften);
};

// Stängel

INSTANCE PC_PotionAlchemy_Joint (C_Info)
{
	npc				= PC_Hero;
	nr				= 9;
	condition		= PC_PotionAlchemy_Joint_Condition;
	information		= PC_PotionAlchemy_Joint_Info;
	permanent		= TRUE;
	description		= "Stängel drehen"; 
};

FUNC INT PC_PotionAlchemy_Joint_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_Joint_Info()
{
	Info_ClearChoices	(PC_PotionAlchemy_Joint);

	Info_AddChoice	(PC_PotionAlchemy_Joint, DIALOG_BACK, PC_PotionAlchemy_Joint_EXIT);

	if (Rezept_Traumruf == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Joint, "Traumruf herstellen (1 Stängel)", PC_PotionAlchemy_Joint_Traumruf);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Jeremiah_Kraut))
	{
		Info_AddChoice	(PC_PotionAlchemy_Joint, "Herkulesstängel herstellen (1 Stängel)", PC_PotionAlchemy_Joint_Herkulesstengel);
	};

	if (Green_Extrem == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Joint, "Grünen Novizen herstellen (1 Stängel)", PC_PotionAlchemy_Joint_GrNovize);
	};

	Info_AddChoice	(PC_PotionAlchemy_Joint, "Sumpfkraut verarbeiten (1 Stängel)", PC_PotionAlchemy_Joint_Normal);
};

FUNC VOID PC_PotionAlchemy_Joint_EXIT()
{
	Info_ClearChoices	(PC_PotionAlchemy_Joint);
};

FUNC VOID PC_PotionAlchemy_Joint_Traumruf()
{
	if (Npc_HasItems (hero, ItPl_Mushroom_02) >= 1)
	&& (Npc_HasItems (hero, ItPl_Mana_Herb_01)  >= 2)
	&& (Npc_HasItems(hero, ItMi_Joint) >= 2)
	{
		Npc_RemoveInvItems (hero,ItPl_Mana_Herb_01,2);
		Npc_RemoveInvItems (hero,ItPl_Mushroom_02,1);
		Npc_RemoveInvItems (hero, ItMi_Joint, 2);

		CreateInvItems	   (hero,ItMi_Traumruf,1);  
	
		Print (PRINT_Traumruf_Success);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Joint_Herkulesstengel()
{
	if (Npc_HasItems (hero, ItPl_Herkuleskraut) >= 1)
	&& (Npc_HasItems (hero, ItPl_SwampHerb)  >= 1)
	{
		Npc_RemoveInvItems (hero, ItPl_SwampHerb, 1);
		Npc_RemoveInvItems (hero, ItPl_Herkuleskraut, 1);

		CreateInvItems	   (hero, ItMi_Joint_Herkules, 1);  
	
		Print (PRINT_Joint_Herkules_Success);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Joint_GrNovize()
{
	if (Npc_HasItems (hero, ItPl_SwampHerb) >= 2)
	&& (Npc_HasItems (hero, ItPl_Temp_Herb)  >= 1)
	{
		Npc_RemoveInvItems (hero,ItPl_SwampHerb	 ,2);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	 ,1);
		CreateInvItems	   (hero,ItMi_Addon_Joint_01,1);  
	
		Print (PRINT_Addon_Joint_01_Success);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Joint_Normal()
{
	if (Npc_HasItems (hero, ItPl_SwampHerb) >= 1)
	{
		Npc_RemoveInvItems (hero,ItPl_SwampHerb	 ,1);
		CreateInvItems	   (hero,ItMi_Joint,1);  
	
		Print (PRINT_JointSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};

	B_ENDPRODUCTIONDIALOG ();
};

// Tabak

INSTANCE PC_PotionAlchemy_Tabak (C_Info)
{
	npc				= PC_Hero;
	nr				= 10;
	condition		= PC_PotionAlchemy_Tabak_Condition;
	information		= PC_PotionAlchemy_Tabak_Info;
	permanent		= TRUE;
	description		= "Tabak mischen"; 
};

FUNC INT PC_PotionAlchemy_Tabak_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (Npc_HasItems(hero, ItMi_ApfelTabak) >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_Tabak_Info()
{
	Npc_RemoveInvItems (hero, ItMi_ApfelTabak, 1);
	
	Info_ClearChoices	(PC_PotionAlchemy_Tabak);

	Info_AddChoice	(PC_PotionAlchemy_Tabak, DIALOG_BACK, PC_PotionAlchemy_Tabak_EXIT);

	if (Npc_HasItems(hero, ItFo_Honey) >= 1)
	{
		Info_AddChoice	(PC_PotionAlchemy_Tabak,"...mit Honig",PC_PotionAlchemy_Tabak_Honey);
	};
	if (Npc_HasItems(hero, ItPl_SwampHerb) >= 1)
	{
		Info_AddChoice 	(PC_PotionAlchemy_Tabak,"...mit Sumpfkraut",PC_PotionAlchemy_Tabak_Swampherb);
	};
	if (Npc_HasItems(hero, ItPl_Mushroom_01) >= 1)
	{
		Info_AddChoice 	(PC_PotionAlchemy_Tabak,"...mit Dunkelpilz",PC_PotionAlchemy_Tabak_Mushroom_01);
	};
};

FUNC VOID PC_PotionAlchemy_Tabak_EXIT()
{
	CreateInvItems	(hero, ItMi_ApfelTabak, 1);

	Info_ClearChoices	(PC_PotionAlchemy_Tabak);
};

FUNC VOID PC_PotionAlchemy_Tabak_Honey()
{
	Npc_RemoveInvItems	(hero, ItFo_Honey, 1);
	CreateInvItems (hero, ItMi_Honigtabak, 1);
	Print (PRINT_TabakSuccess);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Tabak_Swampherb()
{
	Npc_RemoveInvItems	(hero, ItPl_SwampHerb, 1);
	CreateInvItems (hero, ItPl_Swampherb, 1);
	Print (PRINT_TabakSuccess);

	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_PotionAlchemy_Tabak_Mushroom_01()
{
	Npc_RemoveInvItems	(hero, ItPl_Mushroom_01, 1);
	CreateInvItems (hero, ItPl_Mushroom_01, 1);
	Print (PRINT_TabakSuccess);

	B_ENDPRODUCTIONDIALOG ();
};

// Tinkturen

INSTANCE PC_PotionAlchemy_Tinktur (C_Info)
{
	npc				= PC_Hero;
	nr				= 11;
	condition		= PC_PotionAlchemy_Tinktur_Condition;
	information		= PC_PotionAlchemy_Tinktur_Info;
	permanent		= TRUE;
	description		= "Tinktur herstellen"; 
};

FUNC INT PC_PotionAlchemy_Tinktur_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_Tinktur_Info()
{
	Info_ClearChoices	(PC_PotionAlchemy_Tinktur);

	Info_AddChoice	(PC_PotionAlchemy_Tinktur, DIALOG_BACK, PC_PotionAlchemy_Tinktur_EXIT);

	if (Npc_HasItems(hero, ItMi_Silverring) >= 2)
	&& (Npc_HasItems(hero, ItMi_Salpeter) >= 1)
	&& (Npc_HasItems(hero, ItMi_HolyWater) >= 1)
	&& (Rezept_Iwan == TRUE)
	{
		Info_AddChoice	(PC_PotionAlchemy_Tinktur,"Heiliges Wasser",PC_PotionAlchemy_Tinktur_HolyWater);
	};
};

FUNC VOID PC_PotionAlchemy_Tinktur_EXIT()
{
	Info_ClearChoices	(PC_PotionAlchemy_Tinktur);
};

FUNC VOID PC_PotionAlchemy_Tinktur_HolyWater()
{
	Npc_RemoveInvItems	(hero, ItMi_Silverring, 2);
	Npc_RemoveInvItems	(hero, ItMi_Salpeter, 1);
	Npc_RemoveInvItems	(hero, ItMi_HolyWater, 1);
	CreateInvItems (hero, ItMi_HolyWater2, 1);

	B_ENDPRODUCTIONDIALOG ();
};

// Ende

INSTANCE PC_PotionAlchemy_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_PotionAlchemy_End_Condition;
	information		= PC_PotionAlchemy_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_PotionAlchemy_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_End_Info()
{
	CreateInvItems (self, ItMi_Flask,1);

	B_ENDPRODUCTIONDIALOG ();
};