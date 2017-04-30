FUNC VOID Angeln_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) {
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Angeln;
		Ai_ProcessInfos (her);
	};
}; 

FUNC INT B_AngelMob_Bestimmung()
{
	if (Hlp_StrCmp (Npc_GetNearestWP (self), "WAY_PASS_MILL_09") && (AngelMob_01_Amount_MAX > AngelMob_01_Amount))
	{
		AngelMob_01_Amount = (AngelMob_01_Amount + 1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "FISCHER_4") && (AngelMob_02_Amount_MAX > AngelMob_02_Amount)
	{
		AngelMob_02_Amount = (AngelMob_02_Amount + 1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "FISCHER_5") && (AngelMob_03_Amount_MAX > AngelMob_03_Amount)
	{
		AngelMob_03_Amount = (AngelMob_03_Amount + 1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "REL_STEGARBEITEN6") && (AngelMob_04_Amount_MAX > AngelMob_04_Amount)
	{
		AngelMob_04_Amount = (AngelMob_04_Amount + 1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "FISCHER_6") && (AngelMob_05_Amount_MAX > AngelMob_05_Amount)
	{
		AngelMob_05_Amount = (AngelMob_05_Amount + 1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "FISCHER_7") && (AngelMob_06_Amount_MAX > AngelMob_06_Amount)
	{
		AngelMob_06_Amount = (AngelMob_06_Amount + 1);
		return TRUE;
	};

	return FALSE;
};

INSTANCE PC_Angeln_Hacken (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Angeln_Hacken_Condition;
	information	= PC_Angeln_Hacken_Info;
	permanent	= 1;
	important	= 0;
	description	= "Die Angel auswerfen";
};

FUNC INT PC_Angeln_Hacken_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Angeln)
	{
		return 1;
	};
};

FUNC VOID PC_Angeln_Hacken_Info()
{
	var int AngelRandom;
	AngelRandom	=	r_max(99);

	if (B_AngelMob_Bestimmung() == TRUE)
	{
		if (AngelRandom < 15)
		{
			CreateInvItems	(hero, ItFo_Fish, 1);
			PrintScreen	("1 Fisch geangelt!", -1, -1, FONT_ScreenSmall, 2);
		}
		else if (AngelRandom < 30)
		{
			CreateInvItems	(hero, ItPl_Weed, 1);
			PrintScreen	("1 Unkraut geangelt!", -1, -1, FONT_ScreenSmall, 2);
		}
		else if (AngelRandom < 45)
		{
			CreateInvItems	(hero, ItMi_Addon_Shell_01, 1);
			PrintScreen	("1 Klappmuschel geangelt!", -1, -1, FONT_ScreenSmall, 2);
		}
		else if (AngelRandom < 60)
		{
			CreateInvItems	(hero, ItMi_Addon_Shell_02, 1);
			PrintScreen	("1 Hornmuschel geangelt!", -1, -1, FONT_ScreenSmall, 2);
		}
		else if (AngelRandom < 75)
		{
			CreateInvItems	(hero, ItFo_SmellyFish, 1);
			PrintScreen	("1 Fisch geangelt!", -1, -1, FONT_ScreenSmall, 2);
		}
		else
		{
			PrintScreen	("Nicht angebissen!", -1, -1, FONT_ScreenSmall, 2);
		};
	}
	else
	{
		PrintScreen ("Hier scheint nichts mehr zu beißen.", -1, -1, FONT_ScreenSmall, 2);	
		B_ENDPRODUCTIONDIALOG ();
		return;
	};
};
	
INSTANCE PC_Angeln_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Angeln_EXIT_Condition;
	information	= PC_Angeln_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT PC_Angeln_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Angeln)
	{
		return 1;
	};
};

FUNC VOID PC_Angeln_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};