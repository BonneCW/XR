// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_ReisBau_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_ReisBau_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_ReisBau_4_EXIT_Condition;
	information	= Info_ReisBau_4_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_ReisBau_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_ReisBau_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_ReisBau_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_ReisBau_4_WichtigePersonen_Condition;
	information	= Info_ReisBau_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "Habt ihr einen Anführer?";
};                       

FUNC INT Info_ReisBau_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_ReisBau_4_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_ReisBau_4_WichtigePersonen_15_00"); //Habt ihr einen Anführer?
	AI_Output(self,hero,"Info_ReisBau_4_WichtigePersonen_04_01"); //Der Reislord ist so was wie unser Anführer. Aber die meisten arbeiten nur aus Angst vor ihm und seinen Schlägern.
	AI_Output(self,hero,"Info_ReisBau_4_WichtigePersonen_04_02"); //Bei mir sieht das anders aus. Ich hab' schon ein paar Jahre auf dem Buckel und keine Lust mehr, mich mit den Söldnern im Lager rumzuschlagen ... Die Reisfelder sind genau das Richtige für mich.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_ReisBau_4_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_ReisBau_4_DasLager_Condition;
	information	= Info_ReisBau_4_DasLager_Info;
	permanent	= 1;
	description = "Was muß ich über diesen Ort wissen?";
};                       

FUNC INT Info_ReisBau_4_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_ReisBau_4_DasLager_Info()
{
	AI_Output(hero,self,"Info_ReisBau_4_DasLager_15_00"); //Was muss ich über diesen Ort wissen?
	AI_Output(self,hero,"Info_ReisBau_4_DasLager_04_01"); //Sei vorsichtig, wenn du ins Lager gehst, Junge! Da laufen so einige Halsabschneider rum, die einem Neuen wie dir an die Kehle wollen.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_ReisBau_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_ReisBau_4_DieLage_Condition;
	information	= Info_ReisBau_4_DieLage_Info;
	permanent	= 1;
	description = "Wie läuft's denn so?";
};                       

FUNC INT Info_ReisBau_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_ReisBau_4_DieLage_Info()
{
	AI_Output(hero,self,"Info_ReisBau_4_DieLage_15_00"); //Wie läuft's denn so?
	AI_Output(self,hero,"Info_ReisBau_4_DieLage_04_01"); //Gibt 'ne Menge zu tun. Wir brauchen viel Reis, um die Leute hier alle ernähren zu können.
};

INSTANCE Info_Mod_ReisBau_4_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_ReisBau_4_Pickpocket_Condition;
	information	= Info_Mod_ReisBau_4_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_ReisBau_4_Pickpocket_Condition()
{
	C_Beklauen	(r_max(30), ItMi_Gold, 10+r_max(20));
};

FUNC VOID Info_Mod_ReisBau_4_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_ReisBau_4_Pickpocket);

	Info_AddChoice	(Info_Mod_ReisBau_4_Pickpocket, DIALOG_BACK, Info_Mod_ReisBau_4_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_ReisBau_4_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_ReisBau_4_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_ReisBau_4_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_ReisBau_4_Pickpocket);
};

FUNC VOID Info_Mod_ReisBau_4_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_ReisBau_4_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_ReisBau_4_Pickpocket);

		Info_AddChoice	(Info_Mod_ReisBau_4_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_ReisBau_4_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_ReisBau_4_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_ReisBau_4_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_ReisBau_4_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_ReisBau_4_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_ReisBau_4_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_ReisBau_4_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_ReisBau_4_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_ReisBau_4_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_ReisBau_4_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_ReisBau_4_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_ReisBau_4_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_ReisBau_4(var c_NPC slf)
{
	Info_ReisBau_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_ReisBau_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_ReisBau_4_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_ReisBau_4_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_ReisBau_4_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
