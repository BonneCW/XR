INSTANCE Info_Mod_Pedro_Hi (C_INFO)
{
	npc		= Mod_7037_NOV_Pedro_NW;
	nr		= 1;
	condition	= Info_Mod_Pedro_Hi_Condition;
	information	= Info_Mod_Pedro_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Pedro_Hi_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Parlan_Ring))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pedro_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Pedro_Hi_09_01"); //Ich bin Pedro. Was willst du von mir?
};

INSTANCE Info_Mod_Pedro_Erwischt (C_INFO)
{
	npc		= Mod_7037_NOV_Pedro_NW;
	nr		= 1;
	condition	= Info_Mod_Pedro_Erwischt_Condition;
	information	= Info_Mod_Pedro_Erwischt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Pedro_Erwischt_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Pedro_Erwischt_Info()
{
	AI_Output(self, hero, "Info_Mod_Pedro_Erwischt_09_00"); //Was willst du hier?
	AI_Output(hero, self, "Info_Mod_Pedro_Erwischt_15_01"); //Du hast Parlan seinen Feuerring gestohlen.
	AI_Output(self, hero, "Info_Mod_Pedro_Erwischt_09_02"); //Na und?
	AI_Output(hero, self, "Info_Mod_Pedro_Erwischt_15_03"); //Er will ihn wieder haben.	
	AI_Output(self, hero, "Info_Mod_Pedro_Erwischt_09_04"); //Dann komm und hol ihn dir.

	AI_StopProcessInfos	(self);
	B_Attack	(self, hero, AR_NONE, 1);
};

INSTANCE Info_Mod_Pedro_Niederlage (C_INFO)
{
	npc		= Mod_7037_NOV_Pedro_NW;
	nr		= 1;
	condition	= Info_Mod_Pedro_Niederlage_Condition;
	information	= Info_Mod_Pedro_Niederlage_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Pedro_Niederlage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pedro_Erwischt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pedro_Niederlage_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Pedro_Niederlage_09_00"); //Ok, du hast gewonnen.
			AI_Output(hero, self, "Info_Mod_Pedro_Niederlage_15_01"); //Gibst du mir jetzt den Ring?
			AI_Output(self, hero, "Info_Mod_Pedro_Niederlage_09_02"); //Hier ist er.

			B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "Nachdem ich Pedro eine Lektion erteilt habe hat er mir den Ring gegeben.");

			CreateInvItems	(self, ItRi_Feuerring_Parlan, 1);
			B_GiveInvItems	(self, hero, ItRi_Feuerring_Parlan, 1);

			B_Göttergefallen(1, 1);
		}
		else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Pedro_Niederlage_09_03"); //Das hast du davon. Jetzt mach das du verschwindest.
		};
							
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Pedro_Pickpocket (C_INFO)
{
	npc		= Mod_7037_NOV_Pedro_NW;
	nr		= 1;
	condition	= Info_Mod_Pedro_Pickpocket_Condition;
	information	= Info_Mod_Pedro_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_40;
};

FUNC INT Info_Mod_Pedro_Pickpocket_Condition()
{
	C_Beklauen	(35, ItMi_Gold, 60);
};

FUNC VOID Info_Mod_Pedro_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Pedro_Pickpocket);

	Info_AddChoice	(Info_Mod_Pedro_Pickpocket, DIALOG_BACK, Info_Mod_Pedro_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Pedro_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Pedro_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Pedro_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Pedro_Pickpocket);
};

FUNC VOID Info_Mod_Pedro_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Pedro_Pickpocket);
};

INSTANCE Info_Mod_Pedro_EXIT (C_INFO)
{
	npc		= Mod_7037_NOV_Pedro_NW;
	nr		= 1;
	condition	= Info_Mod_Pedro_EXIT_Condition;
	information	= Info_Mod_Pedro_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Pedro_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Pedro_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};