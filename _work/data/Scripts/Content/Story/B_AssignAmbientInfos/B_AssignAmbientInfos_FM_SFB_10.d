// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_FM_SFB_10_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_FM_SFB_10_EXIT_Condition;
	information	= Info_FM_SFB_10_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_FM_SFB_10_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_FM_SFB_10_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_FM_SFB_10_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_FM_SFB_10_EinerVonEuchWerden_Condition;
	information	= Info_FM_SFB_10_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Wie kann ich dem Schürferbund beitreten?";
};                       

FUNC INT Info_FM_SFB_10_EinerVonEuchWerden_Condition()
{
		return TRUE;
};

FUNC VOID Info_FM_SFB_10_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_FM_SFB_10_EinerVonEuchWerden_15_00"); //Wie kann ich dem Schürferbund beitreten?
	AI_Output(self,hero,"Info_FM_SFB_10_EinerVonEuchWerden_10_01"); //Bei uns mitmachen? Glaub bloß nicht, hier wird nicht gearbeitet, nur weil man uns nicht zwingt.
	AI_Output(self,hero,"Info_FM_SFB_10_EinerVonEuchWerden_10_02"); //Also wenn du glaubst, du kannst hier faulenzen, dann bist du schief gewickelt, mein Freund.
	AI_Output(self,hero,"Info_FM_SFB_10_EinerVonEuchWerden_10_03"); //Wenn du jetzt immer noch glaubst hier richtig zu sein, dann such dir ne Spitzhacke und melde dich bei der Wache vor dem Eingang zur Mine.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_FM_SFB_10_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_FM_SFB_10_WichtigePersonen_Condition;
	information	= Info_FM_SFB_10_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT Info_FM_SFB_10_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_FM_SFB_10_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_FM_SFB_10_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,hero,"Info_FM_SFB_10_WichtigePersonen_10_01"); //Das Sagen? Sieh dich doch mal um. Bestimmt nicht die Leute, die den ganzen Tag schuften, um genug Erz zu fördern.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_FM_SFB_10_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_FM_SFB_10_DasLager_Condition;
	information	= Info_FM_SFB_10_DasLager_Info;
	permanent	= 1;
	description = "Was ist das hier?";
};                       

FUNC INT Info_FM_SFB_10_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_FM_SFB_10_DasLager_Info()
{
	AI_Output(hero,self,"Info_FM_SFB_10_DasLager_15_00"); //Was ist das hier?
	AI_Output(self,hero,"Info_FM_SFB_10_DasLager_10_01"); //Wie sieht es denn aus? Wie der Palast des Königs?
	AI_Output(self,hero,"Info_FM_SFB_10_DasLager_10_02"); //Also wenn du wirklich in der Freien Mine arbeiten willst, dann solltest du nicht so viel reden sondern mehr arbeiten.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_FM_SFB_10_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_FM_SFB_10_DieLage_Condition;
	information	= Info_FM_SFB_10_DieLage_Info;
	permanent	= 1;
	description = "Wie sieht's aus?";
};                       

FUNC INT Info_FM_SFB_10_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_FM_SFB_10_DieLage_Info()
{
	AI_Output(hero,self,"Info_FM_SFB_10_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self,hero,"Info_FM_SFB_10_DieLage_10_01"); //Wie soll's schon aussehen? Beschissen wie immer. Kaum was zu beißen, dafür immer was zu tun.
};

INSTANCE Info_Mod_FM_SFB_10_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_FM_SFB_10_Pickpocket_Condition;
	information	= Info_Mod_FM_SFB_10_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_FM_SFB_10_Pickpocket_Condition()
{
	C_Beklauen	(10, ItMi_Gold, 10);
};

FUNC VOID Info_Mod_FM_SFB_10_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_FM_SFB_10_Pickpocket);

	Info_AddChoice	(Info_Mod_FM_SFB_10_Pickpocket, DIALOG_BACK, Info_Mod_FM_SFB_10_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_FM_SFB_10_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_FM_SFB_10_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_FM_SFB_10_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_FM_SFB_10_Pickpocket);
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

FUNC VOID B_AssignAmbientInfos_FM_SFB_10(var c_NPC slf)
{
	
	Info_FM_SFB_10_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_FM_SFB_10_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_FM_SFB_10_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_FM_SFB_10_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_FM_SFB_10_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_FM_SFB_10_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
