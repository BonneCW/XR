// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_OM_BUD_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_3 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_OM_BUD_3_EXIT_Condition;
	information	= Info_OM_BUD_3_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_OM_BUD_3_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_OM_BUD_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_OM_BUD_3_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_OM_BUD_3_Mine_Condition;
	information	= Info_OM_BUD_3_Mine_Info;
	permanent	= 1;
	description = "Erzähl mir was von der Mine";
};                       

FUNC INT Info_OM_BUD_3_Mine_Condition()
{
	return 1;
};

FUNC VOID Info_OM_BUD_3_Mine_Info()
{
	AI_Output(other,self,"Info_OM_BUD_3_Mine_15_00"); //Erzähl mir was von der Mine
	AI_Output(self,other,"Info_OM_BUD_3_Mine_01_01"); //Wir müssen alle arbeiten. Wochenlang ohne Tageslicht. Es gibt kein Entkommen. Die einzige Freiheit ist der Tod.
	
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_OM_BUD_3_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_OM_BUD_3_WichtigePersonen_Condition;
	information	= Info_OM_BUD_3_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier was zu Sagen?";
};                       

FUNC INT Info_OM_BUD_3_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_OM_BUD_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_OM_BUD_3_WichtigePersonen_15_00"); //Wer hat hier was zu sagen?
	AI_Output(self,other,"Info_OM_BUD_3_WichtigePersonen_01_01"); //Kurgan ist der Chef der Mine. Er hat die Kontrolle über die Mine und befehligt alle Wachen.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_OM_BUD_3_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_OM_BUD_3_DieLage_Condition;
	information	= Info_OM_BUD_3_DieLage_Info;
	permanent	= 1;
	description = "Wie sieht's aus?";
};                       

FUNC INT Info_OM_BUD_3_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_OM_BUD_3_DieLage_Info()
{
	AI_Output(other,self,"Info_OM_BUD_3_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self,other,"Info_OM_BUD_3_DieLage_01_01"); //Tja, also mein Rücken schmerzt, meine Arme fallen mir ab, meine Kehle ist trocken und ich bin müde.
	AI_Output(self,other,"Info_OM_BUD_3_DieLage_01_02"); //Und das ständige Geräusch der Spitzhacken. Ich werde noch wahnsinnig.
};

INSTANCE Info_Mod_OM_BUD_3_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_OM_BUD_3_Pickpocket_Condition;
	information	= Info_Mod_OM_BUD_3_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_OM_BUD_3_Pickpocket_Condition()
{
	C_Beklauen	(20, ItMi_Gold, 10);
};

FUNC VOID Info_Mod_OM_BUD_3_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_OM_BUD_3_Pickpocket);

	Info_AddChoice	(Info_Mod_OM_BUD_3_Pickpocket, DIALOG_BACK, Info_Mod_OM_BUD_3_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_OM_BUD_3_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_OM_BUD_3_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_OM_BUD_3_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_OM_BUD_3_Pickpocket);
};

FUNC VOID Info_Mod_OM_BUD_3_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_OM_BUD_3_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_OM_BUD_3_Pickpocket);

		Info_AddChoice	(Info_Mod_OM_BUD_3_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_OM_BUD_3_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_OM_BUD_3_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_OM_BUD_3_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_OM_BUD_3_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_OM_BUD_3_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_OM_BUD_3_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_OM_BUD_3_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_OM_BUD_3_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_OM_BUD_3_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_OM_BUD_3_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_OM_BUD_3_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_OM_BUD_3_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OM_BUD_3(var c_NPC slf)
{
	Info_OM_BUD_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_OM_BUD_3_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_OM_BUD_3_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_OM_BUD_3_DieLage.npc					= Hlp_GetInstanceID(slf);
	Info_Mod_OM_BUD_3_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
