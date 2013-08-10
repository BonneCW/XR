// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									Vor Gespräch
// *************************************************************************

INSTANCE Info_SFB_5_Pre(C_INFO)
{
	nr			= 1;
	condition	= Info_SFB_5_Pre_Condition;
	information	= Info_SFB_5_Pre_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_SFB_5_Pre_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_Pre_Info()
{	
	AI_Output(self,hero,"Info_SFB_5_EinerVonEuchWerden_05_00"); //Hallo!
};

// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_5_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_5_EXIT_Condition;
	information	= Info_SFB_5_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_SFB_5_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_SFB_5_KesselProblem (C_INFO) 
{
	nr		= 1;
	condition	= Info_SFB_5_KesselProblem_Condition;
	information	= Info_SFB_5_KesselProblem_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_SFB_5_KesselProblem_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bruce_KesselProblem))
	&& (!Npc_KnowsInfo(hero, Info_SFB_2_KesselProblem))
	&& (!Npc_KnowsInfo(hero, Info_SFB_1_KesselProblem))
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_5_KesselProblem_Info()
{
	AI_Output(self,hero,"Info_SFB_5_KesselProblem_05_00"); //Hey.
};

INSTANCE Info_SFB_5_KesselProblem2 (C_INFO) 
{
	nr		= 1;
	condition	= Info_SFB_5_KesselProblem2_Condition;
	information	= Info_SFB_5_KesselProblem2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, habe gehört, dass wilde Tiere euch bedrohen und einer von euch getötet wurde.";
};                       

FUNC INT Info_SFB_5_KesselProblem2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bruce_KesselProblem))
	&& (!Npc_KnowsInfo(hero, Info_SFB_2_KesselProblem2))
	&& (!Npc_KnowsInfo(hero, Info_SFB_1_KesselProblem2))
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_5_KesselProblem2_Info()
{
	B_Say	(hero, self, "$KESSELPROBLEM01");

	AI_Output(self,hero,"Info_SFB_5_KesselProblem2_05_00"); //Ja, man, habe auch davon gehört. Mitten in der Nacht hat es ihn geholt.
	AI_Output(self,hero,"Info_SFB_5_KesselProblem2_05_01"); //War einfach weg am nächsten morgen.

	B_Say	(hero, self, "§KESSELPROBLEM02");

	AI_Output(self,hero,"Info_SFB_5_KesselProblem2_05_02"); //Doch, der Söldner Bruce hat es mit angesehen.
	AI_Output(self,hero,"Info_SFB_5_KesselProblem2_05_03"); //Er hat das Vieh verfolgt und ihm das Fell über die Ohren gezogen. Geschieht dem Mistvieh recht.
	AI_Output(self,hero,"Info_SFB_5_KesselProblem2_05_04"); //Hätte ich dem Bruce gar nicht zugetraut.
	AI_Output(self,hero,"Info_SFB_5_KesselProblem2_05_05"); //(zu sich selbst) Besonders abends stinkt’s wie ein Feld voll Sumpfkraut.

	B_Say	(hero, self, "§KESSELPROBLEM03");

	AI_Output(self,hero,"Info_SFB_5_KesselProblem2_05_06"); //Ohh ... hey, Mann, vergiss es, ich habe nichts gesagt.

	B_LogEntry	(TOPIC_MOD_NL_TALKESSELPROB, "Wie ich von einem Schürfer erfahren habe, wurde das Opfer nachts von dem Schattenläufer geholt. Außer Bruce hat aber niemand was gesehen oder gehört. Der Schürfer murmelte noch in Zusammenhang mit Bruce irgendetwas von 'abends' und 'Sumpfkraut'.");

	Mod_NL_TalkesselProblem = 1;
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_5_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_5_EinerVonEuchWerden_Condition;
	information	= Info_SFB_5_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Was ist wenn ich hier mitmachen will?";
};                       

FUNC INT Info_SFB_5_EinerVonEuchWerden_Condition()
{
	return TRUE;
};

FUNC VOID Info_SFB_5_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_SFB_5_EinerVonEuchWerden_15_00"); //Was ist, wenn ich hier mitmachen will?
	AI_Output(self,hero,"Info_SFB_5_EinerVonEuchWerden_05_01"); //Hier mitmachen? Als was, Wasserträger?
	AI_Output(hero,self,"Info_SFB_5_EinerVonEuchWerden_15_02"); //Nein, als Schürfer?
	AI_Output(self,hero,"Info_SFB_5_EinerVonEuchWerden_05_03"); //Pass mal auf, lass dir eins gesagt sein: Niemand wird FREIWILLIG Schürfer.
	AI_Output(self,hero,"Info_SFB_5_EinerVonEuchWerden_05_04"); //Aber bitte, wenn du unbedingt willst.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_5_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_5_WichtigePersonen_Condition;
	information	= Info_SFB_5_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer ist hier wichtig?";
};                       

FUNC INT Info_SFB_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_SFB_5_WichtigePersonen_15_00"); //Wer ist hier wichtig?
	AI_Output(self,hero,"Info_SFB_5_WichtigePersonen_05_01"); //Wer hier wichtig ist? Ich!
	AI_Output(self,hero,"Info_SFB_5_WichtigePersonen_05_02"); //Aber ich glaube, du willst wissen, wer hier das Sagen hat.
	AI_Output(self,hero,"Info_SFB_5_WichtigePersonen_05_03"); //Also, ich denke, du solltest dich an die Söldner wenden.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_5_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_5_DasLager_Condition;
	information	= Info_SFB_5_DasLager_Info;
	permanent	= 1;
	description = "Was gibt es hier im Lager?";
};                       

FUNC INT Info_SFB_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DasLager_Info()
{
	AI_Output(hero,self,"Info_SFB_5_DasLager_15_00"); //Was gibt es hier im Lager?
	AI_Output(self,hero,"Info_SFB_5_DasLager_05_01"); //Kommt drauf an was man draus macht. Für einige nur viel Arbeit, für andere gibt's auch 'ne ganze Menge Spaß.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_5_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_5_DieLage_Condition;
	information	= Info_SFB_5_DieLage_Info;
	permanent	= 1;
	description = "Wie ist das Leben hier?";
};                       

FUNC INT Info_SFB_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DieLage_Info()
{
	AI_Output(hero,self,"Info_SFB_5_DieLage_15_00"); //Wie ist das Leben hier?
	AI_Output(self,hero,"Info_SFB_5_DieLage_05_01"); //Toll!	
};

INSTANCE Info_Mod_SFB_5_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_SFB_5_Pickpocket_Condition;
	information	= Info_Mod_SFB_5_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_SFB_5_Pickpocket_Condition()
{
	C_Beklauen	(r_max(30), ItMi_Gold, 10 + r_max(5));
};

FUNC VOID Info_Mod_SFB_5_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_SFB_5_Pickpocket);

	Info_AddChoice	(Info_Mod_SFB_5_Pickpocket, DIALOG_BACK, Info_Mod_SFB_5_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_SFB_5_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_SFB_5_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_SFB_5_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_SFB_5_Pickpocket);
};

FUNC VOID Info_Mod_SFB_5_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_SFB_5_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_SFB_5_Pickpocket);

		Info_AddChoice	(Info_Mod_SFB_5_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_SFB_5_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_SFB_5_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_SFB_5_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_SFB_5_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_SFB_5_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_SFB_5_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_SFB_5_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_SFB_5_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_SFB_5_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_SFB_5_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_SFB_5_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_SFB_5_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_5(var c_NPC slf)
{

	Info_SFB_5_Pre.npc			= Hlp_GetInstanceID(slf);
	
	Info_SFB_5_EXIT.npc			= Hlp_GetInstanceID(slf);
	Info_SFB_5_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_5_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_5_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_SFB_5_DieLage.npc			= Hlp_GetInstanceID(slf);
	Info_sfb_5_KesselProblem.npc		= Hlp_GetInstanceID(slf);
	Info_sfb_5_KesselProblem2.npc		= Hlp_GetInstanceID(slf);
	Info_Mod_SFB_5_Pickpocket.npc		= Hlp_GetInstanceID(slf);
};
