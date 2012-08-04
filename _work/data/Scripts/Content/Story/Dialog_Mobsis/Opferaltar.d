FUNC VOID Opferaltar_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		if (hero.guild == GIL_NOV)
		&& (Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_04))
		&& (!Npc_KnowsInfo(hero, Info_Mod_AdanosDog_Kristall))
		{
			B_SetAivar(self, AIV_INVINCIBLE, TRUE);
			PLAYER_MOBSI_PRODUCTION	= MOBSI_Opferaltar;
			Ai_ProcessInfos (her);
		}
		else if (Assassinen_Dabei == TRUE)
		&& (Mod_ASS_Waechter_01 == 1)
		&& (Mod_ASS_Waechter_02 == 1)
		&& (Mod_ASS_Waechter_03 == 1)
		&& (Mod_ASS_Waechter_04 == 1)
		&& (Mod_ASS_Waechter_05 == 1)
		&& (Mod_ASS_Waechter_06 == 1)
		&& (Mod_ASS_Waechter_07 == 1)
		&& (Mod_ASS_Waechter_08 == 1)
		&& (Mod_ASS_Waechter_09 == 1)
		{
			B_SetAivar(self, AIV_INVINCIBLE, TRUE);
			PLAYER_MOBSI_PRODUCTION	= MOBSI_Opferaltar;
			Ai_ProcessInfos (her);
		}
		else if (Mod_Riordian_Geister == 1)
		{
			B_SetAivar(self, AIV_INVINCIBLE, TRUE);
			PLAYER_MOBSI_PRODUCTION	= MOBSI_Opferaltar;
			Ai_ProcessInfos (her);
		}
		else
		{
			hero.attribute[ATR_HITPOINTS] -= hero.attribute[ATR_HITPOINTS]/2;
			Wld_PlayEffect("SpellFX_BELIARSRAGE", hero, hero, 0, 0, 0, FALSE);
		};
	};
}; 

FUNC VOID B_CheckOpfergaben()
{
	if (CurrentOpfer == 6)
	{
		if (Mod_WM_Nahrungsopfer > 0)
		{
			if (Mod_WM_Nahrungsopfer == 1)
			{
				if (Npc_GetDistToWP(hero, "ADW_ADANOSTEMPEL_RAVEN_11") < 500)
				{
					Wld_InsertNpc	(AdanosDog, "ADW_ADANOSTEMPEL_RAVEN_11");
				}
				else if (Npc_GetDistToWP(hero, "ADW_ANCIENTGHOST") < 500)
				{
					Wld_InsertNpc	(AdanosDog, "ADW_ANCIENTGHOST");
				};
			}
			else if (Mod_WM_Nahrungsopfer == 3)
			{
				if (Npc_GetDistToWP(hero, "ADW_ADANOSTEMPEL_RAVEN_11") < 500)
				{
					Wld_InsertNpc	(Mod_7205_GUR_BaalNetbek_AW, "ADW_ADANOSTEMPEL_RAVEN_11");
				}
				else if (Npc_GetDistToWP(hero, "ADW_ANCIENTGHOST") < 500)
				{
					Wld_InsertNpc	(Mod_7205_GUR_BaalNetbek_AW, "ADW_ANCIENTGHOST");
				};

				Mod_WM_Nahrungsopfer = 0;

				Mod_WM_Knochenopfer = 0;
				Mod_WM_Goldopfer = 0;
				Mod_WM_Erzopfer = 0;
				Mod_WM_Heilopfer = 0;
				Mod_WM_Manaopfer = 0;

				CurrentOpfer = 0;
			}
			else
			{
				if (Npc_GetDistToWP(hero, "ADW_ADANOSTEMPEL_RAVEN_11") < 500)
				{
					Wld_InsertNpc	(Demon, "ADW_ADANOSTEMPEL_RAVEN_11");
				}
				else if (Npc_GetDistToWP(hero, "ADW_ANCIENTGHOST") < 500)
				{
					Wld_InsertNpc	(Demon, "ADW_ANCIENTGHOST");
				};

				Mod_WM_Nahrungsopfer = 0;

				Mod_WM_Knochenopfer = 0;
				Mod_WM_Goldopfer = 0;
				Mod_WM_Erzopfer = 0;
				Mod_WM_Heilopfer = 0;
				Mod_WM_Manaopfer = 0;

				CurrentOpfer = 0;
			};

			B_ENDPRODUCTIONDIALOG();
		};
	};
};

INSTANCE PC_Opferaltar_Zeremoniendolch (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Opferaltar_Zeremoniendolch_Condition;
	information	= PC_Opferaltar_Zeremoniendolch_Info;
	permanent	= 1;
	important	= 0;
	description	= "Zeremoniendolch nehmen";
};

FUNC INT PC_Opferaltar_Zeremoniendolch_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Opferaltar)
	&& (Assassinen_Dabei == TRUE)
	&& (Mod_ASS_Waechter_01 == 1)
	&& (Mod_ASS_Waechter_02 == 1)
	&& (Mod_ASS_Waechter_03 == 1)
	&& (Mod_ASS_Waechter_04 == 1)
	&& (Mod_ASS_Waechter_05 == 1)
	&& (Mod_ASS_Waechter_06 == 1)
	&& (Mod_ASS_Waechter_07 == 1)
	&& (Mod_ASS_Waechter_08 == 1)
	&& (Mod_ASS_Waechter_09 == 1)
	{
		return 1;
	};
};

FUNC VOID PC_Opferaltar_Zeremoniendolch_Info()
{
	CreateInvItems	(hero, ItMw_Avaquar, 1);

	B_ShowGivenThings	("Zeremoniendolch erhalten");

	B_LogEntry	(TOPIC_MOD_ASS_ZEREMONIENDOLCH, "Was ein Akt! Aber den Dolch habe ich endlich. Nochmal mit dem Eremiten reden und dann ab zu Mustafa.");

	B_GivePlayerXP	(300);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Opferaltar_Plagegeister (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Opferaltar_Plagegeister_Condition;
	information	= PC_Opferaltar_Plagegeister_Info;
	permanent	= 1;
	important	= 0;
	description	= "Geister besänftigen";
};

FUNC INT PC_Opferaltar_Plagegeister_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Opferaltar)
	&& (Mod_Riordian_Geister == 1)
	&& (Npc_HasItems(hero, ItWr_PlagegeisterFormel) == 1)
	{
		return 1;
	};
};

FUNC VOID PC_Opferaltar_Plagegeister_Info()
{
	if (Npc_HasItems(hero, ItSc_Sleep) >= 1)
	&& (Npc_HasItems(hero, ItSc_Charm) >= 1)
	&& (Npc_HasItems(hero, ItPl_SwampHerb) >= 3)
	{
		AI_Output(hero, hero, "PC_Opferaltar_Plagegeister_15_00"); //Ighoriat Thorul. Kehrt ins Totenreich zurück, ihr ruhelosen Geister!

		Wld_PlayEffect	("spellFX_Sleep_TARGET", hero, hero, 0, 0, 0, FALSE);
		Wld_PlayEffect	("FX_EARTHQUAKE", hero, hero, 0, 0, 0, FALSE);
		Wld_PlayEffect	("spellFX_LIGHTSTAR_RingRitual", hero, hero, 0, 0, 0, FALSE);
		Snd_Play	("MFX_GhostVoice");

		Npc_RemoveInvItems	(hero, ItSc_Sleep, 1);
		Npc_RemoveInvItems	(hero, ItSc_Charm, 1);
		Npc_RemoveInvItems	(hero, ItPl_SwampHerb, 3);
		Npc_RemoveInvItems	(hero, ItWr_PlagegeisterFormel, 1);

		Mod_Riordian_Geister = 2;

		B_RemoveNpc	(RuheloseSeele_01);
		B_RemoveNpc	(RuheloseSeele_02);
		B_RemoveNpc	(RuheloseSeele_03);
		B_RemoveNpc	(RuheloseSeele_04);
		B_RemoveNpc	(RuheloseSeele_05);
		B_RemoveNpc	(RuheloseSeele_06);
		B_RemoveNpc	(RuheloseSeele_07);
		B_RemoveNpc	(RuheloseSeele_08);
		B_RemoveNpc	(RuheloseSeele_09);
	}
	else
	{
		Print	("Mir fehlen die nötigen Gegenstände!");
	};

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Opferaltar_Knochen (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Opferaltar_Knochen_Condition;
	information	= PC_Opferaltar_Knochen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Knochen eines Skelettes opfern";
};

FUNC INT PC_Opferaltar_Knochen_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Opferaltar)
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) > 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_04))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_26))
	&& (Mod_WM_Knochenopfer == 0)
	{
		return 1;
	};
};

FUNC VOID PC_Opferaltar_Knochen_Info()
{
	Npc_RemoveInvItems	(hero, ItAt_SkeletonBone, 1);
	
	CurrentOpfer += 1;

	Mod_WM_Knochenopfer = 1;

	B_CheckOpfergaben();
};

INSTANCE PC_Opferaltar_Heilwurzel (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Opferaltar_Heilwurzel_Condition;
	information	= PC_Opferaltar_Heilwurzel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Heilwurzel opfern";
};

FUNC INT PC_Opferaltar_Heilwurzel_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Opferaltar)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_03) > 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_04))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_26))
	&& (Mod_WM_Heilopfer == 0)
	{
		return 1;
	};
};

FUNC VOID PC_Opferaltar_Heilwurzel_Info()
{
	Npc_RemoveInvItems	(hero, ItPl_Health_Herb_03, 1);
	
	CurrentOpfer += 1;

	Mod_WM_Heilopfer = 1;

	B_CheckOpfergaben();
};

INSTANCE PC_Opferaltar_Feuerwurzel (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Opferaltar_Feuerwurzel_Condition;
	information	= PC_Opferaltar_Feuerwurzel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Feuerwurzel opfern";
};

FUNC INT PC_Opferaltar_Feuerwurzel_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Opferaltar)
	&& (Npc_HasItems(hero, ItPl_Mana_Herb_03) > 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_04))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_26))
	&& (Mod_WM_Manaopfer == 0)
	{
		return 1;
	};
};

FUNC VOID PC_Opferaltar_Feuerwurzel_Info()
{
	Npc_RemoveInvItems	(hero, ItPl_Mana_Herb_03, 1);
	
	CurrentOpfer += 1;

	Mod_WM_Manaopfer = 1;

	B_CheckOpfergaben();
};

INSTANCE PC_Opferaltar_Gold (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Opferaltar_Gold_Condition;
	information	= PC_Opferaltar_Gold_Info;
	permanent	= 1;
	important	= 0;
	description	= "500 Gold opfern";
};

FUNC INT PC_Opferaltar_Gold_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Opferaltar)
	&& (Npc_HasItems(hero, ItMi_Gold) > 499)
	&& (Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_04))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_26))
	&& (Mod_WM_Goldopfer == 0)
	{
		return 1;
	};
};

FUNC VOID PC_Opferaltar_Gold_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_Gold, 499);
	
	CurrentOpfer += 1;

	Mod_WM_Goldopfer = 1;

	B_CheckOpfergaben();
};

INSTANCE PC_Opferaltar_Erz (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Opferaltar_Erz_Condition;
	information	= PC_Opferaltar_Erz_Info;
	permanent	= 1;
	important	= 0;
	description	= "Erzbrocken opfern";
};

FUNC INT PC_Opferaltar_Erz_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Opferaltar)
	&& (Npc_HasItems(hero, ItMi_Nugget) > 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_04))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_26))
	&& (Mod_WM_Erzopfer == 0)
	{
		return 1;
	};
};

FUNC VOID PC_Opferaltar_Erz_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 1);
	
	CurrentOpfer += 1;

	Mod_WM_Erzopfer = 1;

	B_CheckOpfergaben();
};

INSTANCE PC_Opferaltar_Nahrung (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Opferaltar_Nahrung_Condition;
	information	= PC_Opferaltar_Nahrung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Nahrung opfern";
};

FUNC INT PC_Opferaltar_Nahrung_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Opferaltar)
	&& (Mod_WM_Nahrungsopfer == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_04))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_26))
	{
		return 1;
	};
};

FUNC VOID PC_Opferaltar_Nahrung_Info()
{
	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	CurrentOpfer += 1;

	if (Npc_HasItems(hero, ItFoMuttonZombie) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Zombiefleisch opfern", PC_Opferaltar_Nahrung_MuttonZombie);
	};
	if (Npc_HasItems(hero, ItFo_Sausage) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Wurst opfern", PC_Opferaltar_Nahrung_Sausage);
	};
	if (Npc_HasItems(hero, ItFo_Wineberrys_01) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Weintrauben opfern", PC_Opferaltar_Nahrung_Wineberrys_01);
	};
	if (Npc_HasItems(hero, ItFo_XPStew) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Thekla's Eintopf opfern", PC_Opferaltar_Nahrung_XPStew);
	};
	if (Npc_HasItems(hero, ItPl_SwampHerb) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Sumpfkraut opfern", PC_Opferaltar_Nahrung_SwampHerb);
	};
	if (Npc_HasItems(hero, ItFo_StockFish) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Stockfisch opfern", PC_Opferaltar_Nahrung_StockFish);
	};
	if (Npc_HasItems(hero, ItFo_Bacon) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Schinken opfern", PC_Opferaltar_Nahrung_Bacon);
	};
	if (Npc_HasItems(hero, ItFo_Schafswurst) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Schafswurst opfern", PC_Opferaltar_Nahrung_Schafswurst);
	};
	if (Npc_HasItems(hero, ItFo_Kuerbis) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Kürbis opfern", PC_Opferaltar_Nahrung_Kuerbis);
	};
	if (Npc_HasItems(hero, ItFo_Cheese) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Käse opfern", PC_Opferaltar_Nahrung_Cheese);
	};
	if (Npc_HasItems(hero, ItFo_Honey) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Honig opfern", PC_Opferaltar_Nahrung_Honey);
	};
	if (Npc_HasItems(hero, ItFo_PfefferBacon) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "gepfefferten Schinken opfern", PC_Opferaltar_Nahrung_PfefferBacon);
	};
	if (Npc_HasItems(hero, ItFo_Fish_Gebraten) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "gebratenen Fisch opfern", PC_Opferaltar_Nahrung_Fish_Gebraten);
	};
	if (Npc_HasItems(hero, ItFo_Fleischeintopf) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Fleischeintopf opfern", PC_Opferaltar_Nahrung_Fleischeintopf);
	};
	if (Npc_HasItems(hero, ItFo_FishSoup) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Fischsuppe opfern", PC_Opferaltar_Nahrung_FishSoup);
	};
	if (Npc_HasItems(hero, ItFo_Fishragout) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Fischragout opfern", PC_Opferaltar_Nahrung_Fishragout);
	};
	if (Npc_HasItems(hero, ItFo_Fish) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Fisch opfern", PC_Opferaltar_Nahrung_Fish);
	};
	if (Npc_HasItems(hero, ItFo_Stew) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Eintopf opfern", PC_Opferaltar_Nahrung_Stew);
	};
	if (Npc_HasItems(hero, ItFo_Blutkult) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Dämoneneintopf der Verdammnis opfern", PC_Opferaltar_Nahrung_Blutkult);
	};
	if (Npc_HasItems(hero, ItFo_Bread) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Brot opfern", PC_Opferaltar_Nahrung_Bread);
	};
	if (Npc_HasItems(hero, ItFo_Apple) > 0)
	{
		Info_AddChoice	(PC_Opferaltar_Nahrung, "Apfel opfern", PC_Opferaltar_Nahrung_Apple);
	};
};

FUNC VOID PC_Opferaltar_Nahrung_MuttonZombie()
{
	Npc_RemoveInvItems	(hero, ItFoMuttonZombie, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_Sausage()
{
	Npc_RemoveInvItems	(hero, ItFo_Sausage, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_Wineberrys_01()
{
	Npc_RemoveInvItems	(hero, ItFo_Wineberrys_01, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_XPStew()
{
	Npc_RemoveInvItems	(hero, ItFo_XPStew, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_SwampHerb()
{
	Npc_RemoveInvItems	(hero, ItPl_SwampHerb, 1);

	Mod_WM_Nahrungsopfer = 3;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_StockFish()
{
	Npc_RemoveInvItems	(hero, ItFo_StockFish, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_Bacon()
{
	Npc_RemoveInvItems	(hero, ItFo_Bacon, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_Schafswurst()
{
	Npc_RemoveInvItems	(hero, ItFo_Schafswurst, 1);

	Mod_WM_Nahrungsopfer = 1;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_Kuerbis()
{
	Npc_RemoveInvItems	(hero, ItFo_Kuerbis, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_Cheese()
{
	Npc_RemoveInvItems	(hero, ItFo_Cheese, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_Honey()
{
	Npc_RemoveInvItems	(hero, ItFo_Honey, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_PfefferBacon()
{
	Npc_RemoveInvItems	(hero, ItFo_PfefferBacon, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_Fish_Gebraten()
{
	Npc_RemoveInvItems	(hero, ItFo_Fish_Gebraten, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_Fleischeintopf()
{
	Npc_RemoveInvItems	(hero, ItFo_Fleischeintopf, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_FishSoup()
{
	Npc_RemoveInvItems	(hero, ItFo_FishSoup, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_Fishragout()
{
	Npc_RemoveInvItems	(hero, ItFo_Fishragout, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_Fish()
{
	Npc_RemoveInvItems	(hero, ItFo_Fish, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_Stew()
{
	Npc_RemoveInvItems	(hero, ItFo_Stew, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_Blutkult()
{
	Npc_RemoveInvItems	(hero, ItFo_Blutkult, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_Bread()
{
	Npc_RemoveInvItems	(hero, ItFo_Bread, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

FUNC VOID PC_Opferaltar_Nahrung_Apple()
{
	Npc_RemoveInvItems	(hero, ItFo_Apple, 1);

	Mod_WM_Nahrungsopfer = 2;

	Info_ClearChoices	(PC_Opferaltar_Nahrung);

	B_CheckOpfergaben();
};

INSTANCE PC_Opferaltar_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Opferaltar_EXIT_Condition;
	information	= PC_Opferaltar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT PC_Opferaltar_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Opferaltar)
	{
		return 1;
	};
};

FUNC VOID PC_Opferaltar_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};