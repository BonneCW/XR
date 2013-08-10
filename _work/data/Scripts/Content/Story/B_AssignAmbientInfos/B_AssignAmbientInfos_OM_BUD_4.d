// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_OM_BUD_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_OM_BUD_4_EXIT_Condition;
	information	= Info_OM_BUD_4_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_OM_BUD_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_OM_BUD_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Die Mine
// *************************************************************************

INSTANCE Info_OM_BUD_4_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_OM_BUD_4_Mine_Condition;
	information	= Info_OM_BUD_4_Mine_Info;
	permanent	= 1;
	description = "Erzähl mir was von der Mine";
};                       

FUNC INT Info_OM_BUD_4_Mine_Condition()
{
	return 1;
};

FUNC VOID Info_OM_BUD_4_Mine_Info()
{
	AI_Output(other,self,"Info_OM_BUD_4_Mine_15_00"); //Erzähl mir was von der Mine
	AI_Output(self,other,"Info_OM_BUD_4_Mine_01_01"); //Eine Spitzhacke und Schweiß. Das brauchst du hier drin.
	AI_Output(self,other,"Info_OM_BUD_4_Mine_01_02"); //Aber, wenn du längst weg bist, werde ich hier immer noch das Erz aus dem Berg schlagen. Das ist meine Aufgabe. Das ist mein Leben.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_OM_BUD_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_OM_BUD_4_WichtigePersonen_Condition;
	information	= Info_OM_BUD_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier was zu Sagen?";
};                       

FUNC INT Info_OM_BUD_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_OM_BUD_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_OM_BUD_4_WichtigePersonen_15_00"); //Wer hat hier was zu sagen?
	AI_Output(self,other,"Info_OM_BUD_4_WichtigePersonen_01_01"); //Kurgan und ein paar andere Beliar-Anhänger haben vor ein paar Wochen die Mine übernommen. Seitdem kommen wir hier nicht mehr raus.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_OM_BUD_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_OM_BUD_4_DieLage_Condition;
	information	= Info_OM_BUD_4_DieLage_Info;
	permanent	= 1;
	description = "Wie sieht's aus?";
};                       

FUNC INT Info_OM_BUD_4_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_OM_BUD_4_DieLage_Info()
{
	AI_Output(other,self,"Info_OM_BUD_4_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self,other,"Info_OM_BUD_4_DieLage_01_01"); //Früher war alles besser.
};

INSTANCE Info_Mod_OM_BUD_4_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_OM_BUD_4_Pickpocket_Condition;
	information	= Info_Mod_OM_BUD_4_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_OM_BUD_4_Pickpocket_Condition()
{
	C_Beklauen	(8 + r_max(12), ItMi_Gold, 10 + r_max(5));
};

FUNC VOID Info_Mod_OM_BUD_4_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_OM_BUD_4_Pickpocket);

	Info_AddChoice	(Info_Mod_OM_BUD_4_Pickpocket, DIALOG_BACK, Info_Mod_OM_BUD_4_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_OM_BUD_4_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_OM_BUD_4_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_OM_BUD_4_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_OM_BUD_4_Pickpocket);
};

FUNC VOID Info_Mod_OM_BUD_4_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_OM_BUD_4_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_OM_BUD_4_Pickpocket);

		Info_AddChoice	(Info_Mod_OM_BUD_4_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_OM_BUD_4_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_OM_BUD_4_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_OM_BUD_4_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_OM_BUD_4_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_OM_BUD_4_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_OM_BUD_4_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_OM_BUD_4_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_OM_BUD_4_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_OM_BUD_4_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_OM_BUD_4_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_OM_BUD_4_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_OM_BUD_4_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OM_BUD_4(var c_NPC slf)
{
	
	
	Info_OM_BUD_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_OM_BUD_4_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_OM_BUD_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_OM_BUD_4_DieLage.npc					= Hlp_GetInstanceID(slf);
	Info_Mod_OM_BUD_4_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
