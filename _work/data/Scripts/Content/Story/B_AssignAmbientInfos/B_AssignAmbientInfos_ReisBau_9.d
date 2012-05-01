// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_ReisBau_9_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_ReisBau_9 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_ReisBau_9_EXIT_Condition;
	information	= Info_ReisBau_9_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_ReisBau_9_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_ReisBau_9_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_ReisBau_9_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_ReisBau_9_WichtigePersonen_Condition;
	information	= Info_ReisBau_9_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer kümmert sich darum, daß hier auf den Feldern alles glatt geht?";
};                       

FUNC INT Info_ReisBau_9_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_ReisBau_9_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_ReisBau_9_WichtigePersonen_15_00"); //Wer kümmert sich darum, dass hier auf den Feldern alles glatt geht?
	AI_Output(self,hero,"Info_ReisBau_9_WichtigePersonen_09_01"); //Na, wir alle! Der Reislord überwacht zwar alles, aber ich glaube, er sitzt den ganzen Tag in seinem Bunker und zählt die Säcke.
	AI_Output(self,hero,"Info_ReisBau_9_WichtigePersonen_09_02"); //Na, immerhin hat er zusammen mit Homer die ganze Anlage hier gebaut ...
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_ReisBau_9_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_ReisBau_9_DieLage_Condition;
	information	= Info_ReisBau_9_DieLage_Info;
	permanent	= 1;
	description = "Wie steht's?";
};                       

FUNC INT Info_ReisBau_9_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_ReisBau_9_DieLage_Info()
{
	AI_Output(hero,self,"Info_ReisBau_9_DieLage_15_00"); //Wie steht's?
	AI_Output(self,hero,"Info_ReisBau_9_DieLage_09_01"); //Wir arbeiten uns den Arsch ab, damit hier alle was zu futtern kriegen!
};

INSTANCE Info_Mod_ReisBau_9_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_ReisBau_9_Pickpocket_Condition;
	information	= Info_Mod_ReisBau_9_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_ReisBau_9_Pickpocket_Condition()
{
	C_Beklauen	(13, ItMi_Gold, 20);
};

FUNC VOID Info_Mod_ReisBau_9_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_ReisBau_9_Pickpocket);

	Info_AddChoice	(Info_Mod_ReisBau_9_Pickpocket, DIALOG_BACK, Info_Mod_ReisBau_9_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_ReisBau_9_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_ReisBau_9_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_ReisBau_9_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_ReisBau_9_Pickpocket);
};

FUNC VOID Info_Mod_ReisBau_9_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_ReisBau_9_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_ReisBau_9_Pickpocket);

		Info_AddChoice	(Info_Mod_ReisBau_9_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_ReisBau_9_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_ReisBau_9_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_ReisBau_9_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_ReisBau_9_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_ReisBau_9_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_ReisBau_9_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_ReisBau_9_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_ReisBau_9_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_ReisBau_9_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_ReisBau_9_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_ReisBau_9_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_ReisBau_9_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_ReisBau_9(var c_NPC slf)
{
	Info_ReisBau_9_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_ReisBau_9_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_ReisBau_9_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_ReisBau_9_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};








