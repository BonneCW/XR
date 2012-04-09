var int PrayDayAdanos;
var string concatDonationAdanos;

var int AdanosShrine_STR_Bonus;
var int AdanosShrine_DEX_Bonus;
var int AdanosShrine_MANA_Bonus;

// ****************************************************
// PrayAdanosSchrein_S1
// --------------
// Funktion wird durch Shrine-Benutzung aufgerufen!
// *****************************************************
FUNC VOID PrayAdanosSchrein_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		AI_Output(hero, hero, "Info_Mod_Hero_Altar_Adanos_15_00"); //Adanos!

		self.aivar[AIV_INVINCIBLE]=TRUE; 
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_PrayAdanosSchrein;
		Ai_ProcessInfos (her);
	};
};

//*******************************************************
//	PrayAdanosSchrein Dialog abbrechen
//*******************************************************
INSTANCE PC_PrayAdanosSchrein_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_PrayAdanosSchrein_End_Condition;
	information		= PC_PrayAdanosSchrein_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_PrayAdanosSchrein_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PrayAdanosSchrein)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayAdanosSchrein_End_Info()
{
	B_ENDPRODUCTIONDIALOG ();
}; 
//*******************************************************
//	Beten
//*******************************************************
INSTANCE PC_PrayAdanosSchrein_Pray (C_Info)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PrayAdanosSchrein_Pray_Condition;
	information		= PC_PrayAdanosSchrein_Pray_Info;
	permanent		= TRUE;
	description		= "Beten"; 
};

FUNC INT PC_PrayAdanosSchrein_Pray_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PrayAdanosSchrein)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayAdanosSchrein_Pray_Info()
{
	Info_ClearChoices (PC_PrayAdanosSchrein_Pray);
	Info_AddChoice (PC_PrayAdanosSchrein_Pray,Dialog_Back,PC_PrayAdanosSchrein_Pray_Back);

	Info_AddChoice (PC_PrayAdanosSchrein_Pray,"Ich will beten und opfere nichts.",PC_PrayAdanosSchrein_Pray_NoPay);
			
	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		Info_AddChoice (PC_PrayAdanosSchrein_Pray,"Ich will beten und opfere 100 Gold.",PC_PrayAdanosSchrein_Pray_100);
	};	
	if (Npc_HasItems(hero, ItMi_Gold) >= 50)
	{
		Info_AddChoice (PC_PrayAdanosSchrein_Pray,"Ich will beten und opfere 50 Gold.",PC_PrayAdanosSchrein_Pray_50);
	};
}; 

FUNC VOID PC_PrayAdanosSchrein_Pray_Back ()
{
	Info_ClearChoices (PC_PrayAdanosSchrein_Pray);
};

//****************
//	0 Gold
//****************

FUNC VOID PC_PrayAdanosSchrein_Pray_NoPay ()
{
	var int zufall; zufall = Hlp_Random(100);

	// ----- Heute Schon gebetet? -----	
	if (PrayDayAdanos == Wld_GetDay())		
	{
		PrintScreen	(Print_BlessAdanosNone, -1, -1, FONT_SCREEN, 2);
	}
	else if (zufall < 5) //heute noch nicht gebetet
	{
		B_GivePlayerXP	(50);
	}
	else
	{
		PrintScreen	(Print_BlessAdanosNone, -1, -1, FONT_SCREEN, 2);
	};

	B_Göttergefallen(2, 1);
	
	PrayDayAdanos = Wld_GetDay ();
	Info_ClearChoices (PC_PrayAdanosSchrein_Pray);
};

FUNC VOID B_PrayAdanos (var int Goldi, var int EXPi)
{
	AdanosGoldGesamt += Goldi;

	Mod_CountSpende += Goldi;

	if (AdanosGoldGesamt >= 1000)
	&& (AdanosZusatzBonus == 0)
	{
		AdanosZusatzBonus = 1;

		if (Mod_Schwierigkeit != 4)
		{
			hero.lp += 1;

			PrintScreen	("Adanos gewährt dir einen Lernpunkt", -1, 5, FONT_SCREEN, 2);
		}
		else
		{
			hero.protection[PROT_BLUNT] += 1000;
			hero.protection[PROT_EDGE] += 1000;
			hero.protection[PROT_POINT] += 1000;

			PrintScreen	("Adanos gewährt dir mehr Schutz", -1, 5, FONT_SCREEN, 2);
		};
	}
	else if (AdanosGoldGesamt >= 2000)
	&& (AdanosZusatzBonus == 1)
	{
		AdanosZusatzBonus = 2;

		hero.attribute[ATR_MANA_MAX] += 10;
		hero.attribute[ATR_MANA] += 10;

		PrintScreen	("Adanos gewährt dir 10 Mana", -1, 5, FONT_SCREEN, 2);
	}
	else if (AdanosGoldGesamt >= 3000)
	&& (AdanosZusatzBonus == 2)
	{
		AdanosZusatzBonus = 3;

		EXPi += 2000;

		PrintScreen	("Adanos gewährt dir zusätzliche 2000 Erfahrungspunkte", -1, 5, FONT_SCREEN, 2);
	}
	else if (AdanosGoldGesamt >= 4000)
	&& (AdanosZusatzBonus == 3)
	{
		AdanosZusatzBonus = 4;

		if (Mod_Schwierigkeit != 4)
		{
			hero.lp += 5;

			PrintScreen	("Adanos gewährt dir 5 Lernpunkte", -1, 5, FONT_SCREEN, 2);
		}
		else
		{
			hero.protection[PROT_BLUNT] += 5000;
			hero.protection[PROT_EDGE] += 5000;
			hero.protection[PROT_POINT] += 5000;

			PrintScreen	("Adanos gewährt dir mehr Schutz", -1, 5, FONT_SCREEN, 2);
		};
	}
	else if (AdanosGoldGesamt >= 5000)
	&& (AdanosZusatzBonus == 4)
	{
		AdanosZusatzBonus = 5;

		B_RaiseFightTalent	(hero, NPC_TALENT_1H, 2);
		B_RaiseFightTalent	(hero, NPC_TALENT_2H, 2);
		B_RaiseFightTalent	(hero, NPC_TALENT_BOW, 2);
		B_RaiseFightTalent	(hero, NPC_TALENT_CROSSBOW, 2);

		PrintScreen	("Adanos gewährt dir 2% Bonus auf alle deine Kampffertigkeiten", -1, 5, FONT_SCREEN, 2);
	}
	else if (AdanosGoldGesamt >= 6500)
	&& (AdanosZusatzBonus == 5)
	{
		AdanosZusatzBonus = 6;

		hero.attribute[ATR_MANA_MAX] += 15;
		hero.attribute[ATR_MANA] += 15;

		PrintScreen	("Adanos gewährt dir 15 Mana", -1, 5, FONT_SCREEN, 2);
	}
	else if (AdanosGoldGesamt >= 8000)
	&& (AdanosZusatzBonus == 6)
	{
		AdanosZusatzBonus = 7;

		if (Mod_Schwierigkeit != 4)
		{
			hero.lp += 10;

			PrintScreen	("Adanos gewährt dir 10 Lernpunkte", -1, 5, FONT_SCREEN, 2);
		}
		else
		{
			hero.protection[PROT_BLUNT] += 10000;
			hero.protection[PROT_EDGE] += 10000;
			hero.protection[PROT_POINT] += 10000;

			PrintScreen	("Adanos gewährt dir mehr Schutz", -1, 5, FONT_SCREEN, 2);
		};
	}
	else if (AdanosGoldGesamt >= 10000)
	&& (AdanosZusatzBonus == 7)
	{
		AdanosZusatzBonus = 8;

		EXPi += 15000;

		PrintScreen	("Adanos gewährt dir zusätzliche 15000 Erfahrungspunkte", -1, 5, FONT_SCREEN, 2);
	}
	else if (AdanosGoldGesamt >= 14000)
	&& (AdanosZusatzBonus == 8)
	{
		AdanosZusatzBonus = 9;

		B_RaiseFightTalent	(hero, NPC_TALENT_1H, 5);
		B_RaiseFightTalent	(hero, NPC_TALENT_2H, 5);
		B_RaiseFightTalent	(hero, NPC_TALENT_BOW, 5);
		B_RaiseFightTalent	(hero, NPC_TALENT_CROSSBOW, 5);

		PrintScreen	("Adanos gewährt dir 5% Bonus auf alle deine Kampffertigkeiten", -1, 5, FONT_SCREEN, 2);
	};

	if (EXPi > 0)
	{
		B_GivePlayerXP	(EXPi);
	};
};

//****************
//	100 Gold
//****************
func VOID PC_PrayAdanosSchrein_Pray_100 ()
{
	Npc_RemoveInvItems	(hero, ItMi_Gold, 100);
	
	if (PrayDayAdanos == Wld_GetDay())		
	{
		PrintScreen	(Print_BlessAdanosNone, -1, -1, FONT_SCREEN, 2);

		B_PrayAdanos (100, 0);
	}
	else
	{
		B_PrayAdanos (100, 200);
	};

	B_Göttergefallen(2, 3);
	
	PrayDayAdanos = Wld_GetDay ();
	Info_ClearChoices (PC_PrayAdanosSchrein_Pray);
};

//****************
//	50 Gold
//****************
FUNC VOID PC_PrayAdanosSchrein_Pray_50 ()
{
	Npc_RemoveInvItems	(hero, ItMi_Gold, 50);
	
	// ----- Heute Schon gebetet? -----	
	if (PrayDayAdanos == Wld_GetDay())		
	{
		PrintScreen	(Print_BlessAdanosNone, -1, -1, FONT_SCREEN, 2);

		B_PrayAdanos (50, 0);
	}
	else//heute noch nicht gebetet
	{
		B_PrayAdanos (50, 120);
	};

	B_Göttergefallen(2, 2);
	
	PrayDayAdanos = Wld_GetDay ();
	Info_ClearChoices (PC_PrayAdanosSchrein_Pray);
};

INSTANCE PC_PrayAdanosSchrein_Reg (C_Info)
{
	npc				= PC_Hero;
	nr				= 3;
	condition		= PC_PrayAdanosSchrein_Reg_Condition;
	information		= PC_PrayAdanosSchrein_Reg_Info;
	permanent		= TRUE;
	description		= "Regeneration erlangen"; 
};

FUNC INT PC_PrayAdanosSchrein_Reg_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PrayAdanosSchrein)
	&& (Mana_Perk == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayAdanosSchrein_Reg_Info()
{
	Info_ClearChoices (PC_PrayAdanosSchrein_Reg);
	Info_AddChoice (PC_PrayAdanosSchrein_Reg,Dialog_Back,PC_PrayAdanosSchrein_Reg_Back);
			
	if (Mana_Perk == FALSE)
	{
		if (Mod_Schwierigkeit == 4)
		{
			Info_AddChoice (PC_PrayAdanosSchrein_Reg,"Manaregeneration (7000 Gold)",PC_PrayAdanosSchrein_Reg_Mana);
		}
		else
		{
			Info_AddChoice (PC_PrayAdanosSchrein_Reg,"Manaregeneration (20 LP und 5000 Gold)",PC_PrayAdanosSchrein_Reg_Mana);
		};
	};
}; 

FUNC VOID PC_PrayAdanosSchrein_Reg_Back ()
{
	Info_ClearChoices (PC_PrayAdanosSchrein_Reg);
};

FUNC VOID PC_PrayAdanosSchrein_Reg_Mana ()
{
	if (hero.lp >= 20)
	&& (Mod_Schwierigkeit != 4)
	{
		if (Npc_HasItems(hero, ItMi_Gold) >= 5000)
		{
			hero.lp -= 20;

			Mana_Perk = TRUE;

			Npc_RemoveInvItems	(hero, ItMi_Gold, 5000);
		}
		else
		{
			PrintScreen	(PRINT_NotEnoughGold, -1,-1, FONT_ScreenSmall ,2);
		};
	}
	else if (Mod_Schwierigkeit == 4)
	{
		if (Npc_HasItems(hero, ItMi_Gold) >= 7000)
		{
			Mana_Perk = TRUE;

			Npc_RemoveInvItems	(hero, ItMi_Gold, 7000);
		}
		else
		{
			PrintScreen	(PRINT_NotEnoughGold, -1,-1, FONT_ScreenSmall ,2);
		};
	}
	else
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
	};
};