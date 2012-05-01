// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_ReisBau_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_ReisBau_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_ReisBau_2_EXIT_Condition;
	information	= Info_ReisBau_2_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_ReisBau_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_ReisBau_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_ReisBau_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_ReisBau_2_WichtigePersonen_Condition;
	information	= Info_ReisBau_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Arbeitest du freiwillig auf den Reisfeldern?";
};                       

FUNC INT Info_ReisBau_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_ReisBau_2_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_ReisBau_2_WichtigePersonen_15_00"); //Arbeitest du freiwillig auf den Reisfeldern?
	AI_Output(self,hero,"Info_ReisBau_2_WichtigePersonen_02_01"); //Ja. Ja das tue ich. Ist nämlich besser freiwillig zu arbeiten, als von den Schlägern vom Reislord abgeholt zu werden.
	AI_Output(hero,self,"Info_ReisBau_2_WichtigePersonen_15_02"); //So so ...
};

INSTANCE Info_ReisBau_2_DankeProBauer(C_INFO)
{
	nr			= 3;
	condition	= Info_ReisBau_2_DankeProBauer_Condition;
	information	= Info_ReisBau_2_DankeProBauer_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_ReisBau_2_DankeProBauer_Condition()
{
	if (Mod_NL_ReislordProBauern == 1)
	&& (Wld_GetDay()-3 > Mod_NL_ReislordProBauern_Day)
	{
		return 1;
	};
};

FUNC VOID Info_ReisBau_2_DankeProBauer_Info()
{
	AI_Output(self,hero,"Info_ReisBau_2_DankeProBauer_02_00"); //Ahh, da bist du ja. Geh am besten gleich zu Horatio.
	AI_Output(self,hero,"Info_ReisBau_2_DankeProBauer_02_01"); //Wir haben ein kleines Dankeschön für dich.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_ReisBau_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_ReisBau_2_DasLager_Condition;
	information	= Info_ReisBau_2_DasLager_Info;
	permanent	= 1;
	description = "Was kannst du mir über das Lager erzählen?";
};                       

FUNC INT Info_ReisBau_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_ReisBau_2_DasLager_Info()
{
	AI_Output(hero,self,"Info_ReisBau_2_DasLager_15_00"); //Was kannst du mir über das Lager erzählen?
	AI_Output(self,hero,"Info_ReisBau_2_DasLager_02_01"); //Es ist seit dem Fall der Barriere viel sicherer geworden. Die Banditen haben sich jetzt entweder den Söldnern angeschlossen oder sind in ein anderes Lager gegangen.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_ReisBau_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_ReisBau_2_DieLage_Condition;
	information	= Info_ReisBau_2_DieLage_Info;
	permanent	= 1;
	description = "Alles klar bei dir?";
};                       

FUNC INT Info_ReisBau_2_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_ReisBau_2_DieLage_Info()
{
	AI_Output(hero,self,"Info_ReisBau_2_DieLage_15_00"); //Alles klar bei dir?
	AI_Output(self,hero,"Info_ReisBau_2_DieLage_02_01"); //Was willst du? Hat Der Reislord dich geschickt? Ich arbeite doch jeden Tag!
	AI_Output(hero,self,"Info_ReisBau_2_DieLage_15_02"); //Niemand hat mich geschickt - ich will mich nur ein bisschen unterhalten.
};

INSTANCE Info_Mod_ReisBau_2_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_ReisBau_2_Pickpocket_Condition;
	information	= Info_Mod_ReisBau_2_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_ReisBau_2_Pickpocket_Condition()
{
	C_Beklauen	(10, ItMi_Gold, 10);
};

FUNC VOID Info_Mod_ReisBau_2_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_ReisBau_2_Pickpocket);

	Info_AddChoice	(Info_Mod_ReisBau_2_Pickpocket, DIALOG_BACK, Info_Mod_ReisBau_2_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_ReisBau_2_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_ReisBau_2_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_ReisBau_2_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_ReisBau_2_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_ReisBau_2(var c_NPC slf)
{
	Info_ReisBau_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_ReisBau_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_ReisBau_2_DankeProBauer.npc		= Hlp_GetInstanceID(slf);
	Info_ReisBau_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_ReisBau_2_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_ReisBau_2_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
