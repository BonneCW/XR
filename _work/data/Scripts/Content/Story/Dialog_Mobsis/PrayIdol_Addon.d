var int PrayIdolDay;
var int RecievedMoney;
var int GivenHitpoints;
var int GivenMana;
const int BeliarsDispo = 10000; //Joly: Gold, die Beliar im ganzen Spiel überhaupt hat.

func void B_HitpointAngleich (var int BeliarsCost)
{
	var int CurrentHitpoints;
	GivenHitpoints = GivenHitpoints + BeliarsCost;
	hero.attribute[ATR_HITPOINTS_MAX] = (hero.attribute[ATR_HITPOINTS_MAX] - BeliarsCost);

	CurrentHitpoints = (hero.attribute[ATR_HITPOINTS] - BeliarsCost);

	if (CurrentHitpoints < 2)
	{
		CurrentHitpoints = 2;
	};
	
	hero.attribute[ATR_HITPOINTS] = CurrentHitpoints;
};

func void B_ManaAngleich (var int BeliarsCost)
{
	var int CurrentMana;
	GivenMana = GivenMana + BeliarsCost;
	hero.attribute[ATR_MANA_MAX] = (hero.attribute[ATR_MANA_MAX] - BeliarsCost);
	hero.aivar[REAL_MANA_MAX] = hero.aivar[REAL_MANA_MAX] - BeliarsCost;

	CurrentMana = (hero.attribute[ATR_MANA] - BeliarsCost);

	if (CurrentMana < 0)
	{
		CurrentMana = 0;
	};
	
	hero.attribute[ATR_MANA] = CurrentMana;
};

func void B_BlitzInArsch ()
{
	var int BlitzInArsch_Hitpoints;
	var int CurrentHitpoints;
	var int Abzug;
	
	CurrentHitpoints = hero.attribute[ATR_HITPOINTS];

	
	BlitzInArsch_Hitpoints = ((CurrentHitpoints * 4)/5);
	
	if (BlitzInArsch_Hitpoints < 2)
	{
		BlitzInArsch_Hitpoints = 2;
	};
	
	Abzug = hero.attribute[ATR_HITPOINTS] - BlitzInArsch_Hitpoints;

	if (Abzug > 0)
	{
		var string concatText1;
		var string concatText2;
		
		concatText1 = ConcatStrings(" ", NAME_Damage);	 
		concatText2 = ConcatStrings(IntToString(Abzug), concatText1);
		AI_PrintScreen	(concatText2, -1, YPOS_GoldTaken, FONT_ScreenSmall, 2);
		Wld_PlayEffect("spellFX_BELIARSRAGE",  hero, hero, 0, 0, 0, FALSE );
	};
	
	hero.attribute[ATR_HITPOINTS] = BlitzInArsch_Hitpoints;
	
};

func void B_GetBeliarsGold (var int Kohle)
{
	RecievedMoney = (RecievedMoney + Kohle);

	if (RecievedMoney > BeliarsDispo)
	{
		Kohle = 100;
	};
	
	var string concatText1;
	var string concatText2;
	CreateInvItems	(hero,	ItMi_Gold,	Kohle);
	concatText1 = ConcatStrings(IntToString(Kohle), " ");
	concatText2 = ConcatStrings(concatText1, PRINT_GoldErhalten);	
	AI_PrintScreen	(concatText2, -1, YPOS_GoldTaken, FONT_ScreenSmall, 2);
};

FUNC VOID B_CheckAllTeleports(var int unlock)
{
	var int newXP;
	if (unlock) {
		newXP = 20;
	};

	if (Mod_BeliarSchreine == 0)
	{
		if (Mod_BeliarStatue_Bibliothek_Dabei)
		&& (Mod_BeliarStatue_Eisgebiet_Dabei)
		&& (Mod_BeliarStatue_City_Dabei)
		&& ((Mod_BeliarStatue_Oldmine_Dabei && Jäger_Dabei) || (!Mod_BeliarStatue_Oldmine_Dabei && !Jäger_Dabei && Mod_AnzahlNebengilden == MaxNebengilden))
		&& (Mod_BeliarStatue_OldDementower_Dabei)
		&& (Mod_BeliarStatue_Banditenlager_Dabei)
		&& (Mod_BeliarStatue_Bergfestung_Dabei)
		&& (Mod_BeliarStatue_Orkstadt_Dabei)
		&& (Mod_BeliarStatue_Canyon_Dabei)
		&& (Mod_BeliarStatue_Strand_Dabei)
		&& (Mod_BeliarStatue_Eremit_Dabei)
		&& ((Mod_BeliarStatue_Kanalisation_Dabei && Diebe_Dabei) || (!Mod_BeliarStatue_Kanalisation_Dabei && !Diebe_Dabei && Mod_AnzahlNebengilden == MaxNebengilden))
		{
			Mod_BeliarSchreine = 1;
			
			Spine_UnlockAchievement(SPINE_ACHIEVEMENT_31);

			B_LogEntry	(TOPIC_MOD_BELIAR_SCHREINE, "Ich habe alle Schreine aktiviert. Mal schauen, was meine Belohnung sein wird.");

			newXP += 1500;
		};
	};

	B_GivePlayerXP	(newXP);
};

// ****************************************************
// PrayIdol_S1
// --------------
// Funktion wird durch -Benutzung aufgerufen!
// *****************************************************
FUNC VOID PrayIdol_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		AI_Output(hero, hero, "Info_Mod_Hero_Altar_Beliar_15_00"); //Beliar!

		Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );

		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	= MOBSI_PRAYIDOL;
		Ai_ProcessInfos (her);
	};
};


//*******************************************************
//	PrayIdol Dialog abbrechen
//*******************************************************
INSTANCE PC_PrayIdol_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_PrayIdol_End_Condition;
	information		= PC_PrayIdol_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_PrayIdol_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayIdol_End_Info()
{
	B_ENDPRODUCTIONDIALOG ();
 	Wld_StopEffect("DEMENTOR_FX");
}; 
//*******************************************************
//	Beten
//*******************************************************

INSTANCE PC_PrayIdol_SpezielleRune (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_PrayIdol_SpezielleRune_Condition;
	information	= PC_PrayIdol_SpezielleRune_Info;
	permanent	= 0;
	important	= 0;
	description	= "Rune aufladen";
};

FUNC INT PC_PrayIdol_SpezielleRune_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL)
	&& (Npc_KnowsInfo(hero, Info_Mod_Cyrco_MinenPart))
	&& (Npc_HasItems(hero, ItMi_SpezielleRune) == 1)
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 1)
	&& (Npc_HasItems(hero, ItAt_GoblinBone) >= 1)
	&& (Npc_GetDistToWP(hero, "WP_OM_HOEHLE_11") < 500)
	{
		return 1;
	};
};

FUNC VOID PC_PrayIdol_SpezielleRune_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_SpezielleRune, 1);
	Npc_RemoveInvItems	(hero, ItAt_SkeletonBone, 1);
	Npc_RemoveInvItems	(hero, ItAt_GoblinBone, 1);

	CreateInvItems	(hero, ItRu_TeleportWaldiPlattform, 1);
};

INSTANCE PC_PrayIdol_SteinEinfuegen (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_PrayIdol_SteinEinfuegen_Condition;
	information	= PC_PrayIdol_SteinEinfuegen_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Stein einfügen)";
};

FUNC INT PC_PrayIdol_SteinEinfuegen_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	&& (Npc_KnowsInfo(hero, Info_Mod_Fahim_SteinRepariert))
	&& (Npc_HasItems(hero, ItMi_Beliarstein) == 1)
	&& (Npc_GetDistToWP(hero, "BELIARSCHREIN_FESTUNG") < 1000)
	{
		return 1;
	};
};

FUNC VOID PC_PrayIdol_SteinEinfuegen_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_Beliarstein, 1);

	hero.attribute[ATR_MANA] -= 5;
	hero.attribute[ATR_MANA_MAX] -= 5;

	B_LogEntry	(TOPIC_MOD_BEL_BELIARSCHREIN, "Ich habe den Beliarschrein repariert.");
};

INSTANCE PC_PrayIdol_TeleportPlusBibliothek (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_PrayIdol_TeleportPlusBibliothek_Condition;
	information	= PC_PrayIdol_TeleportPlusBibliothek_Info;
	permanent	= 0;
	important	= 0;
	description	= "In Teleport-System einfügen";
};

FUNC INT PC_PrayIdol_TeleportPlusBibliothek_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	&& (Npc_GetDistToWP(hero, "LABYRINTH_75") < 1000)
	{
		return 1;
	};
};

FUNC VOID PC_PrayIdol_TeleportPlusBibliothek_Info()
{
	Mod_BeliarStatue_Bibliothek_Dabei = 1;

	B_CheckAllTeleports(TRUE);
};

INSTANCE PC_PrayIdol_TeleportPlusCity (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_PrayIdol_TeleportPlusCity_Condition;
	information	= PC_PrayIdol_TeleportPlusCity_Info;
	permanent	= 0;
	important	= 0;
	description	= "In Teleport-System einfügen";
};

FUNC INT PC_PrayIdol_TeleportPlusCity_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	&& (BeliarSchreibStadtPlus == 1)
	{
		return 1;
	};
};

FUNC VOID PC_PrayIdol_TeleportPlusCity_Info()
{
	Mod_BeliarStatue_City_Dabei	=	1;

	B_CheckAllTeleports(TRUE);
};

INSTANCE PC_PrayIdol_TeleportPlusOldmine (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_PrayIdol_TeleportPlusOldmine_Condition;
	information	= PC_PrayIdol_TeleportPlusOldmine_Info;
	permanent	= 0;
	important	= 0;
	description	= "In Teleport-System einfügen";
};

FUNC INT PC_PrayIdol_TeleportPlusOldmine_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	&& (Npc_GetDistToWP(hero, "WP_OM_HOEHLE_11") < 500)
	{
		return 1;
	};
};

FUNC VOID PC_PrayIdol_TeleportPlusOldmine_Info()
{
	Mod_BeliarStatue_Oldmine_Dabei	=	1;

	B_CheckAllTeleports(TRUE);
};

INSTANCE PC_PrayIdol_TeleportPlusOldDementower (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_PrayIdol_TeleportPlusOldDementower_Condition;
	information	= PC_PrayIdol_TeleportPlusOldDementower_Info;
	permanent	= 0;
	important	= 0;
	description	= "In Teleport-System einfügen";
};

FUNC INT PC_PrayIdol_TeleportPlusOldDementower_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	&& (Npc_GetDistToWP(hero, "DT_PLATFORM_02") < 500)
	{
		return 1;
	};
};

FUNC VOID PC_PrayIdol_TeleportPlusOldDementower_Info()
{
	Mod_BeliarStatue_OldDementower_Dabei	=	1;

	B_CheckAllTeleports(TRUE);
};

INSTANCE PC_PrayIdol_TeleportPlusBanditenlager (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_PrayIdol_TeleportPlusBanditenlager_Condition;
	information	= PC_PrayIdol_TeleportPlusBanditenlager_Info;
	permanent	= 0;
	important	= 0;
	description	= "In Teleport-System einfügen";
};

FUNC INT PC_PrayIdol_TeleportPlusBanditenlager_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	&& (Npc_GetDistToWP(hero, "BELIAR_TELEPORT_03") < 500)
	{
		return 1;
	};
};

FUNC VOID PC_PrayIdol_TeleportPlusBanditenlager_Info()
{
	Mod_BeliarStatue_Banditenlager_Dabei	=	1;

	B_CheckAllTeleports(TRUE);
};

INSTANCE PC_PrayIdol_TeleportPlusBergfestung (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_PrayIdol_TeleportPlusBergfestung_Condition;
	information	= PC_PrayIdol_TeleportPlusBergfestung_Info;
	permanent	= 0;
	important	= 0;
	description	= "In Teleport-System einfügen";
};

FUNC INT PC_PrayIdol_TeleportPlusBergfestung_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	&& (Npc_GetDistToWP(hero, "BELIAR_TELEPORT_02") < 500)
	{
		return 1;
	};
};

FUNC VOID PC_PrayIdol_TeleportPlusBergfestung_Info()
{
	Mod_BeliarStatue_Bergfestung_Dabei	=	1;

	B_CheckAllTeleports(TRUE);
};

INSTANCE PC_PrayIdol_TeleportPlusOrkstadt (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_PrayIdol_TeleportPlusOrkstadt_Condition;
	information	= PC_PrayIdol_TeleportPlusOrkstadt_Info;
	permanent	= 0;
	important	= 0;
	description	= "In Teleport-System einfügen";
};

FUNC INT PC_PrayIdol_TeleportPlusOrkstadt_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	&& (Npc_GetDistToWP(hero, "BELIAR_TELEPORT_01") < 500)
	{
		return 1;
	};
};

FUNC VOID PC_PrayIdol_TeleportPlusOrkstadt_Info()
{
	Mod_BeliarStatue_Orkstadt_Dabei	=	1;

	B_CheckAllTeleports(TRUE);
};

INSTANCE PC_PrayIdol_TeleportPlusCanyon (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_PrayIdol_TeleportPlusCanyon_Condition;
	information	= PC_PrayIdol_TeleportPlusCanyon_Info;
	permanent	= 0;
	important	= 0;
	description	= "In Teleport-System einfügen";
};

FUNC INT PC_PrayIdol_TeleportPlusCanyon_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	&& (Npc_GetDistToWP(hero, "WP_AW_CANYON_STATUE") < 500)
	{
		return 1;
	};
};

FUNC VOID PC_PrayIdol_TeleportPlusCanyon_Info()
{
	Mod_BeliarStatue_Canyon_Dabei	=	1;

	B_CheckAllTeleports(TRUE);
};

INSTANCE PC_PrayIdol_TeleportPlusStrand (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_PrayIdol_TeleportPlusStrand_Condition;
	information	= PC_PrayIdol_TeleportPlusStrand_Info;
	permanent	= 0;
	important	= 0;
	description	= "In Teleport-System einfügen";
};

FUNC INT PC_PrayIdol_TeleportPlusStrand_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	&& (Npc_GetDistToWP(hero, "WP_AW_STRAND_STATUE") < 500)
	{
		return 1;
	};
};

FUNC VOID PC_PrayIdol_TeleportPlusStrand_Info()
{
	Mod_BeliarStatue_Strand_Dabei	=	1;

	B_CheckAllTeleports(TRUE);
};

INSTANCE PC_PrayIdol_TeleportPlusEremit (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_PrayIdol_TeleportPlusEremit_Condition;
	information	= PC_PrayIdol_TeleportPlusEremit_Info;
	permanent	= 0;
	important	= 0;
	description	= "In Teleport-System einfügen";
};

FUNC INT PC_PrayIdol_TeleportPlusEremit_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	&& (Npc_GetDistToWP(hero, "WP_AW_EREMIT_STATUE") < 500)
	{
		return 1;
	};
};

FUNC VOID PC_PrayIdol_TeleportPlusEremit_Info()
{
	Mod_BeliarStatue_Eremit_Dabei	=	1;

	B_CheckAllTeleports(TRUE);
};

INSTANCE PC_PrayIdol_TeleportPlusEisgebiet (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_PrayIdol_TeleportPlusEisgebiet_Condition;
	information	= PC_PrayIdol_TeleportPlusEisgebiet_Info;
	permanent	= 0;
	important	= 0;
	description	= "In Teleport-System einfügen";
};

FUNC INT PC_PrayIdol_TeleportPlusEisgebiet_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	&& (CurrentLevel == EISGEBIET_ZEN)
	{
		return 1;
	};
};

FUNC VOID PC_PrayIdol_TeleportPlusEisgebiet_Info()
{
	Mod_BeliarStatue_Eisgebiet_Dabei	=	1;

	B_CheckAllTeleports(TRUE);
};

INSTANCE PC_PrayIdol_TeleportPlusKanalisation (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_PrayIdol_TeleportPlusKanalisation_Condition;
	information	= PC_PrayIdol_TeleportPlusKanalisation_Info;
	permanent	= 0;
	important	= 0;
	description	= "In Teleport-System einfügen";
};

FUNC INT PC_PrayIdol_TeleportPlusKanalisation_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	&& (Npc_GetDistToWP(hero, "REL_CITY_KANAL_027") < 500)
	{
		return 1;
	};
};

FUNC VOID PC_PrayIdol_TeleportPlusKanalisation_Info()
{
	Mod_BeliarStatue_Kanalisation_Dabei	=	1;

	B_CheckAllTeleports(TRUE);
};

INSTANCE PC_PrayIdol_Teleport (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_PrayIdol_Teleport_Condition;
	information	= PC_PrayIdol_Teleport_Info;
	permanent	= 1;
	important	= 0;
	description	= "Teleport zu ...";
};

FUNC INT PC_PrayIdol_Teleport_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	{
		B_CheckAllTeleports(FALSE);
		
		if ((Npc_KnowsInfo(hero, Info_Mod_Raven_Belagerung))
		&& (!Npc_KnowsInfo(hero, PC_PrayIdol_SteinEinfuegen))
		&& (Npc_GetDistToWP(hero, "BELIARSCHREIN_FESTUNG") < 1000))
		//|| (Mod_DunklerPilger == 0)
		{
			return 0;
		}
		else
		{
			return 1;
		};
	};
};

FUNC VOID PC_PrayIdol_Teleport_Info()
{
	Info_ClearChoices	(PC_PrayIdol_Teleport);
	
	Info_AddChoice	(PC_PrayIdol_Teleport, DIALOG_BACK, PC_PrayIdol_Teleport_BACK);

	if (Mod_BeliarStatue_Eisgebiet_Dabei == TRUE)
	{
		Info_AddChoice	(PC_PrayIdol_Teleport, "... dem Eisgebiet", PC_PrayIdol_Teleport_Eisgebiet);
	};

	if (Mod_BeliarStatue_City_Dabei == TRUE)
	{
		Info_AddChoice	(PC_PrayIdol_Teleport, "... der Stadt", PC_PrayIdol_Teleport_City);
	};

	if (Mod_BeliarStatue_Kanalisation_Dabei == TRUE)
	{
		Info_AddChoice	(PC_PrayIdol_Teleport, "... der Spendenhöhle", PC_PrayIdol_Teleport_Kanalisation);
	};

	Info_AddChoice	(PC_PrayIdol_Teleport, "... Xardas", PC_PrayIdol_Teleport_Xardas);

	if (Mod_BeliarStatue_Krieger_Dabei == TRUE)
	{
		Info_AddChoice	(PC_PrayIdol_Teleport, "... der Beliarfestung", PC_PrayIdol_Teleport_Krieger);
	};

	if (Mod_BeliarStatue_Bibliothek_Dabei == TRUE)
	&& ((Kapitel < 5)
	|| (Mod_BeliarBibScene == 4))
	{
		Info_AddChoice	(PC_PrayIdol_Teleport, "... der Bibliothek", PC_PrayIdol_Teleport_Bibliothek);
	};
		
	if (Mod_BeliarStatue_Banditenlager_Dabei == 1)
	{
		Info_AddChoice	(PC_PrayIdol_Teleport, "... dem Banditenlager", PC_PrayIdol_Teleport_Banditenlager);
	};	
	if (Mod_BeliarStatue_Bergfestung_Dabei == 1)
	{
		Info_AddChoice	(PC_PrayIdol_Teleport, "... der Bergfestung", PC_PrayIdol_Teleport_Bergfestung);
	};
	if (Mod_BeliarStatue_Orkstadt_Dabei == 1)
	{
		Info_AddChoice	(PC_PrayIdol_Teleport, "... der Orkstadt", PC_PrayIdol_Teleport_Orkstadt);
	};
	if (Mod_BeliarStatue_Oldmine_Dabei == 1)
	{
		Info_AddChoice	(PC_PrayIdol_Teleport, "... der alten Mine", PC_PrayIdol_Teleport_Oldmine);
	};
	if (Mod_BeliarStatue_Canyon_Dabei == 1)
	{
		Info_AddChoice	(PC_PrayIdol_Teleport, "... dem Canyon", PC_PrayIdol_Teleport_Canyon);
	};
	if (Mod_BeliarStatue_Strand_Dabei == 1)
	{
		Info_AddChoice	(PC_PrayIdol_Teleport, "... dem Piratenstrand", PC_PrayIdol_Teleport_Strand);
	};
	if (Mod_BeliarStatue_Eremit_Dabei == 1)
	{
		Info_AddChoice	(PC_PrayIdol_Teleport, "... dem Eremit", PC_PrayIdol_Teleport_Eremit);
	};
	if (Mod_BeliarStatue_OldDementower_Dabei == TRUE)
	{
		Info_AddChoice	(PC_PrayIdol_Teleport, "... dem alten Dämonenturm", PC_PrayIdol_Teleport_OldDementower);
	};
};

FUNC VOID PC_PrayIdol_Teleport_BACK()
{
	Info_ClearChoices	(PC_PrayIdol_Teleport);
};

FUNC VOID PC_PrayIdol_Teleport_Eisgebiet()
{
	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	if (CurrentLevel == EISGEBIET_ZEN)
	{
		AI_Teleport	(hero, "OSTTELEPORTERABENTEURER_2");
	}
	else
	{
		B_SetLevelchange ("Zafiron\Eisgebiet.zen", "OSTTELEPORTERABENTEURER_2");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

FUNC VOID PC_PrayIdol_Teleport_City()
{
	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		AI_Teleport	(hero, "NW_CITY_KANAL_03");
	}
	else
	{
		B_SetLevelchange ("NewWorld\NewWorld.zen", "NW_CITY_KANAL_03");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

FUNC VOID PC_PrayIdol_Teleport_Kanalisation()
{
	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	if (CurrentLevel == RELENDEL_ZEN)
	{
		AI_Teleport	(hero, "REL_CITY_KANAL_027");
	}
	else
	{
		B_SetLevelchange ("Zafiron\Relendel.zen", "REL_CITY_KANAL_027");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

FUNC VOID PC_PrayIdol_Teleport_OldDementower()
{
	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "DT_E3_03");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "DT_E3_03");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

FUNC VOID PC_PrayIdol_Teleport_Oldmine()
{
	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "WP_OM_HOEHLE_08");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "WP_OM_HOEHLE_08");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

FUNC VOID PC_PrayIdol_Teleport_Xardas()
{
	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		AI_Teleport	(hero, "START_GOTHIC2");
	}
	else
	{
		B_SetLevelchange ("NewWorld\NewWorld.zen", "START_GOTHIC2");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

FUNC VOID PC_PrayIdol_Teleport_Krieger()
{
	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "PALTOBURG_2");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "PALTOBURG_2");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

FUNC VOID PC_PrayIdol_Teleport_Bibliothek()
{
	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "LABYRINTH_8");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "LABYRINTH_8");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

FUNC VOID PC_PrayIdol_Teleport_Banditenlager()
{
	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "LOCATION_11_06");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "LOCATION_11_06");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

FUNC VOID PC_PrayIdol_Teleport_Bergfestung()
{
	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "LOCATION_19_03_ENTRANCE_HARPYE");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "LOCATION_19_03_ENTRANCE_HARPYE");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

FUNC VOID PC_PrayIdol_Teleport_Orkstadt()
{
	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	if (CurrentLevel == MINENTAL_ZEN)
	{
		AI_Teleport	(hero, "OW_ORCBRIDGE_END");
	}
	else
	{
		B_SetLevelchange ("Minental\Minental.zen", "OW_ORCBRIDGE_END");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

FUNC VOID PC_PrayIdol_Teleport_Canyon()
{
	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	if (CurrentLevel == ADDONWORLD_ZEN)
	{
		AI_Teleport	(hero, "ADW_CANYON_PATH_TO_LIBRARY_17");
	}
	else
	{
		B_SetLevelchange ("Addon\AddonWorld.zen", "ADW_CANYON_PATH_TO_LIBRARY_17");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

FUNC VOID PC_PrayIdol_Teleport_Strand()
{
	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	if (CurrentLevel == ADDONWORLD_ZEN)
	{
		AI_Teleport	(hero, "ADW_PIRATECAMP_LONEBEACH_10");
	}
	else
	{
		B_SetLevelchange ("Addon\AddonWorld.zen", "ADW_PIRATECAMP_LONEBEACH_10");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

FUNC VOID PC_PrayIdol_Teleport_Eremit()
{
	B_ENDPRODUCTIONDIALOG();
	Wld_PlayEffect("spellFX_RedTeleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");

	if (CurrentLevel == ADDONWORLD_ZEN)
	{
		AI_Teleport	(hero, "WP_AW_EREMIT_STATUE");
	}
	else
	{
		B_SetLevelchange ("Addon\AddonWorld.zen", "WP_AW_EREMIT_STATUE");

		AI_Teleport	(hero, "OBELISKSCHREIN_WP");
	};
};

INSTANCE PC_PrayIdol_PrayIdol (C_Info)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PrayIdol_PrayIdol_Condition;
	information		= PC_PrayIdol_PrayIdol_Info;
	permanent		= TRUE;
	description		= NAME_ADDON_BETEN; //ADDON
};

FUNC INT PC_PrayIdol_PrayIdol_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	 ==	MOBSI_PRAYIDOL)
	{	
		return TRUE;
	};
};
	
FUNC VOID PC_PrayIdol_PrayIdol_Info()
{
	Info_ClearChoices (PC_PrayIdol_PrayIdol);
	Info_AddChoice (PC_PrayIdol_PrayIdol,Dialog_Back,PC_PrayIdol_PrayIdol_Back);
	Info_AddChoice (PC_PrayIdol_PrayIdol , NAME_ADDON_PRAYIDOL_GIVENOTHING ,PC_PrayIdol_PrayIdol_NoPay);

	if (GivenHitpoints	<= 50)
	{
		if (hero.attribute[ATR_HITPOINTS_MAX] >= 40)//Joly:nicht weniger -> Uncoscious
		{
			Info_AddChoice (PC_PrayIdol_PrayIdol, NAME_ADDON_PRAYIDOL_GIVEHITPOINT1 ,PC_PrayIdol_PrayIdol_SmallPay);
		};
		if (hero.attribute[ATR_HITPOINTS_MAX] >= 40)
		{
			Info_AddChoice (PC_PrayIdol_PrayIdol, NAME_ADDON_PRAYIDOL_GIVEHITPOINT2 ,PC_PrayIdol_PrayIdol_MediumPay);
		};
		if (hero.attribute[ATR_HITPOINTS_MAX] >= 40)
		{
			Info_AddChoice (PC_PrayIdol_PrayIdol, NAME_ADDON_PRAYIDOL_GIVEHITPOINT3 ,PC_PrayIdol_PrayIdol_BigPay);
		};
	};
	
	if (GivenMana <= 10)
	{
		if (hero.attribute[ATR_MANA_MAX] > 10)
		{
			Info_AddChoice (PC_PrayIdol_PrayIdol, NAME_ADDON_PRAYIDOL_GIVEMANA ,PC_PrayIdol_PrayIdol_ManaPay);
		};
	};
}; 

FUNC VOID PC_PrayIdol_PrayIdol_Back () 
{
	Info_ClearChoices (PC_PrayIdol_PrayIdol);
};

//****************
//	Nichts gespendet
//****************

FUNC VOID PC_PrayIdol_PrayIdol_NoPay ()
{
	B_BlitzInArsch ();
	Info_ClearChoices (PC_PrayIdol_PrayIdol);
};

//****************
//	1 LebensEnergie
//****************

FUNC VOID PC_PrayIdol_PrayIdol_SmallPay ()
{
	B_HitpointAngleich (1);
	
	//----- Heute Schon gebetet? -----
	if (PrayIdolDay == Wld_GetDay())	
	|| (RecievedMoney >= BeliarsDispo)								
	{
		B_BlitzInArsch ();
	}
	else
	{
		//----- SC ist Paladin / KDF ------
		if ((hero.guild == GIL_PAL)||(hero.guild == GIL_VLK))
		{
			B_GetBeliarsGold (25);
		}
		else if (hero.guild == GIL_KDF)//alle anderen
		{	
			B_GetBeliarsGold (75);
		}
		else
		{
			B_GetBeliarsGold (50);
		};
	};

	B_Göttergefallen(3, 1);
	
	PrayIdolDay = Wld_GetDay ();
	Info_ClearChoices (PC_PrayIdol_PrayIdol);
};

//****************
//	2 LebensEnergie
//****************


FUNC VOID PC_PrayIdol_PrayIdol_MediumPay ()
{
	B_HitpointAngleich (5);
	
	//----- Heute Schon gebetet? -----
	if (PrayIdolDay == Wld_GetDay())	
	|| (RecievedMoney >= BeliarsDispo)								
	{
		B_BlitzInArsch ();
	}
	else
	{
		//----- SC ist Paladin / KDF ------
		if ((hero.guild == GIL_PAL)||(hero.guild == GIL_VLK))
		{
			B_GetBeliarsGold (125);
		}
		else if (hero.guild == GIL_KDF)//alle anderen
		{	
			B_GetBeliarsGold (375);
		}
		else
		{
			B_GetBeliarsGold (250);
		};
	};

	B_Göttergefallen(3, 2);
	
	PrayIdolDay = Wld_GetDay ();
	Info_ClearChoices (PC_PrayIdol_PrayIdol);
};

//****************
//	10 LebensEnergie oder 1 Mana
//****************
func VOID PC_PrayIdol_PrayIdol_BigPayManaPay ()
{
	if (PrayIdolDay == Wld_GetDay())	
	|| (RecievedMoney >= BeliarsDispo)								
	{
		B_BlitzInArsch ();
	}
	else
	{
		//----- SC ist Paladin / KDF ------
		if ((hero.guild == GIL_PAL)||(hero.guild == GIL_VLK))
		{
			B_GetBeliarsGold (250);
		}
		else if (hero.guild == GIL_KDF)
		{
			B_GetBeliarsGold (750);
		}
		else //alle anderen
		{	
			B_GetBeliarsGold (500);
		};
	};

	B_Göttergefallen(3, 3);
	
	PrayIdolDay = Wld_GetDay ();
	Info_ClearChoices (PC_PrayIdol_PrayIdol);
};

FUNC VOID PC_PrayIdol_PrayIdol_BigPay ()
{
	B_HitpointAngleich (10);
	PC_PrayIdol_PrayIdol_BigPayManaPay ();
};
FUNC VOID PC_PrayIdol_PrayIdol_ManaPay ()
{
	B_ManaAngleich (1);
	PC_PrayIdol_PrayIdol_BigPayManaPay ();
};

//*******************************************************
//	SchwertWeihe
//*******************************************************
INSTANCE PC_PrayShrine_UPGRATEBELIARSWEAPON (C_Info) 
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PrayShrine_UPGRATEBELIARSWEAPON_Condition;
	information		= PC_PrayShrine_UPGRATEBELIARSWEAPON_Info;
	permanent		= TRUE;
	description		= NAME_ADDON_UPGRATEBELIARSWEAPON; 
};

FUNC INT PC_PrayShrine_UPGRATEBELIARSWEAPON_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_HabSchwert))
	&& ((C_ScCanUpgrateBeliarsWeapon ()) == TRUE)
	&& ((C_ScHasBeliarsWeapon ()) == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayShrine_UPGRATEBELIARSWEAPON_Info()
{
	B_ClearBeliarsWeapon ();
	B_UpgrateBeliarsWeapon ();
}; 
