// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Sld_11_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Sld_11 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Sld_11_EXIT_Condition;
	information	= Info_Sld_11_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Sld_11_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Sld_11_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Sld_11_EinerVonEuchWerden_Condition;
	information	= Info_Sld_11_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Ich will ein Söldner werden.";
};                       

FUNC INT Info_Sld_11_EinerVonEuchWerden_Condition()
{
	if (Mod_Gilde == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_Sld_11_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_Sld_11_EinerVonEuchWerden_15_00"); //Ich will ein Söldner werden.
	AI_Output(self,hero,"Info_Sld_11_EinerVonEuchWerden_11_01"); //Das ist nicht schwer. Wenn du für unsere Sache kämpfen willst, wird Lee dich nehmen.
	AI_Output(self,hero,"Info_Sld_11_EinerVonEuchWerden_11_02"); //Aber er nimmt nur Leute, die gut mit dem Schwert umgehen können. Wie sieht's damit bei dir aus?
	AI_Output(hero,self,"Info_Sld_11_EinerVonEuchWerden_15_03"); //Nun ...
	AI_Output(self,hero,"Info_Sld_11_EinerVonEuchWerden_11_04"); //Dachte ich mir. Wenn es dir wirklich ernst ist, rede mit Cord. Er hat schon mal einen Frischling ausgebildet.
	AI_Output(self,hero,"Info_Sld_11_EinerVonEuchWerden_11_05"); //Vielleicht hast du ja Glück und er macht sich auch bei dir die Mühe.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Sld_11_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Sld_11_WichtigePersonen_Condition;
	information	= Info_Sld_11_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT Info_Sld_11_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_Sld_11_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,hero,"Info_Sld_11_WichtigePersonen_11_01"); //Im Grunde regelt Lee alles. Er ist unser Anführer.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Sld_11_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Sld_11_DasLager_Condition;
	information	= Info_Sld_11_DasLager_Info;
	permanent	= 1;
	description = "Gibt es Probleme hier im Lager?";
};                       

FUNC INT Info_Sld_11_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_DasLager_Info()
{
	AI_Output(hero,self,"Info_Sld_11_DasLager_15_00"); //Gibt es Probleme hier im Lager?
	AI_Output(self,hero,"Info_Sld_11_DasLager_11_01"); //Junge, hier gibt es immer Probleme.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Sld_11_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Sld_11_DieLage_Condition;
	information	= Info_Sld_11_DieLage_Info;
	permanent	= 1;
	description = "Alles klar bei dir?";
};                       

FUNC INT Info_Sld_11_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_DieLage_Info()
{
	AI_Output(hero,self,"Info_Sld_11_DieLage_15_00"); //Alles klar bei dir?
	AI_Output(self,hero,"Info_Sld_11_DieLage_11_01"); //Noch ist alles ruhig ...
	AI_Output(hero,self,"Info_Sld_11_DieLage_15_02"); //Noch?
	AI_Output(self,hero,"Info_Sld_11_DieLage_11_03"); //Wenn die ehemaligen Banditen weiter Artos' Konvois überfallen, steht er irgendwann mit seiner Armee hier vor dem Tor.
	AI_Output(self,hero,"Info_Sld_11_DieLage_11_04"); //Und das wird bestimmt kein Spaß.
};

INSTANCE Info_Mod_SLD_11_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_SLD_11_Pickpocket_Condition;
	information	= Info_Mod_SLD_11_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_SLD_11_Pickpocket_Condition()
{
	C_Beklauen	(75, ItMi_Gold, 390);
};

FUNC VOID Info_Mod_SLD_11_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_SLD_11_Pickpocket);

	Info_AddChoice	(Info_Mod_SLD_11_Pickpocket, DIALOG_BACK, Info_Mod_SLD_11_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_SLD_11_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_SLD_11_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_SLD_11_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_SLD_11_Pickpocket);
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

FUNC VOID B_AssignAmbientInfos_Sld_11(var c_NPC slf)
{
	Info_Sld_11_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_Sld_11_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Sld_11_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_Sld_11_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_Sld_11_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_SLD_11_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
