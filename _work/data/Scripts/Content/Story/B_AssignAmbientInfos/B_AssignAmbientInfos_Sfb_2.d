// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									Vor Gespräch
// *************************************************************************

INSTANCE Info_SFB_2_Pre(C_INFO)
{
	nr			= 1;
	condition	= Info_SFB_2_Pre_Condition;
	information	= Info_SFB_2_Pre_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_SFB_2_Pre_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_Pre_Info()
{	
	AI_Output(self,hero,"Info_SFB_2_EinerVonEuchWerden_02_00"); //Was willst du hier. Ich habe keine Lust, irgendwelchen Ärger zu bekommen.
};

// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_2_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_2_EXIT_Condition;
	information	= Info_SFB_2_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_SFB_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_2_KesselProblem (C_INFO) 
{
	nr		= 1;
	condition	= Info_SFB_2_KesselProblem_Condition;
	information	= Info_SFB_2_KesselProblem_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_SFB_2_KesselProblem_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bruce_KesselProblem))
	&& (!Npc_KnowsInfo(hero, Info_SFB_1_KesselProblem))
	&& (!Npc_KnowsInfo(hero, Info_SFB_5_KesselProblem))
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_2_KesselProblem_Info()
{
	AI_Output(self,hero,"Info_SFB_2_KesselProblem_02_00"); //Hey.
};

INSTANCE Info_SFB_2_KesselProblem2 (C_INFO) 
{
	nr		= 1;
	condition	= Info_SFB_2_KesselProblem2_Condition;
	information	= Info_SFB_2_KesselProblem2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, habe gehört, dass wilde Tiere euch bedrohen und einer von euch getötet wurde.";
};                       

FUNC INT Info_SFB_2_KesselProblem2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bruce_KesselProblem))
	&& (!Npc_KnowsInfo(hero, Info_SFB_1_KesselProblem2))
	&& (!Npc_KnowsInfo(hero, Info_SFB_5_KesselProblem2))
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_2_KesselProblem2_Info()
{
	B_Say	(hero, self, "$KESSELPROBLEM01");

	AI_Output(self,hero,"Info_SFB_2_KesselProblem2_02_00"); //Ja, man, habe auch davon gehört. Mitten in der Nacht hat es ihn geholt.
	AI_Output(self,hero,"Info_SFB_2_KesselProblem2_02_01"); //War einfach weg am nächsten morgen.

	B_Say	(hero, self, "§KESSELPROBLEM02");

	AI_Output(self,hero,"Info_SFB_2_KesselProblem2_02_02"); //Doch, der Söldner Bruce hat es mit angesehen.
	AI_Output(self,hero,"Info_SFB_2_KesselProblem2_02_03"); //Er hat das Vieh verfolgt und ihm das Fell über die Ohren gezogen. Geschieht dem Mistvieh recht.
	AI_Output(self,hero,"Info_SFB_2_KesselProblem2_02_04"); //Hätte ich dem Bruce gar nicht zugetraut.
	AI_Output(self,hero,"Info_SFB_2_KesselProblem2_02_05"); //(zu sich selbst) Besonders abends stinkt’s wie ein Feld voll Sumpfkraut.

	B_Say	(hero, self, "§KESSELPROBLEM03");

	AI_Output(self,hero,"Info_SFB_2_KesselProblem2_02_06"); //Ohh ... hey, Mann, vergiss es, ich habe nichts gesagt.

	B_LogEntry	(TOPIC_MOD_NL_TALKESSELPROB, "Wie ich von einem Schürfer erfahren habe, wurde das Opfer nachts von dem Schattenläufer geholt. Außer Bruce hat aber niemand was gesehen oder gehört. Der Schürfer murmelte noch in Zusammenhang mit Bruce irgendetwas von 'abends' und 'Sumpfkraut'.");

	Mod_NL_TalkesselProblem = 1;
};

INSTANCE Info_SFB_2_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_2_EinerVonEuchWerden_Condition;
	information	= Info_SFB_2_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Was muss ich tun, um bei euch mitzumachen?";
};                       

FUNC INT Info_SFB_2_EinerVonEuchWerden_Condition()
{
	return TRUE;
};

FUNC VOID Info_SFB_2_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_SFB_2_EinerVonEuchWerden_15_00"); //Was muss ich tun, um bei euch mitzumachen?
	AI_Output(self,hero,"Info_SFB_2_EinerVonEuchWerden_02_01"); //Ich kann dir da nicht weiterhelfen. Ich bin hier nur 'ne kleine Nummer.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_2_WichtigePersonen_Condition;
	information	= Info_SFB_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier was zu sagen?";
};                       

FUNC INT Info_SFB_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_SFB_2_WichtigePersonen_15_00"); //Wer hat hier was zu sagen?
	AI_Output(self,hero,"Info_SFB_2_WichtigePersonen_02_01"); //Hier im Kessel haben die Söldner das Sagen.
	AI_Output(self,hero,"Info_SFB_2_WichtigePersonen_02_02"); //Also pass gut auf, mit wem du dich anlegst.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_2_DasLager_Condition;
	information	= Info_SFB_2_DasLager_Info;
	permanent	= 1;
	description = "Ich will mehr über dieses Lager erfahren.";
};                       

FUNC INT Info_SFB_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_DasLager_Info()
{
	AI_Output(hero,self,"Info_SFB_2_DasLager_15_00"); //Ich will mehr über dieses Lager erfahren.
	AI_Output(self,hero,"Info_SFB_2_DasLager_02_01"); //Ich weiß nicht, ob ich dir da weiterhelfen kann, sprich am besten mit den Söldnern.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_2_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_2_DieLage_Condition;
	information	= Info_SFB_2_DieLage_Info;
	permanent	= 1;
	description = "Wie ist das Leben hier?";
};                       

FUNC INT Info_SFB_2_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_DieLage_Info()
{
	AI_Output(hero,self,"Info_SFB_2_DieLage_15_00"); //Wie ist das Leben hier?
	AI_Output(self,hero,"Info_SFB_2_DieLage_02_01"); //Ich will mich nicht beklagen. Wir haben alle unseren Teil zu tragen.
	AI_Output(self,hero,"Info_SFB_2_DieLage_02_02"); //Aber zumindest ist es hier besser als im Alten Lager.
	AI_Output(self,hero,"Info_SFB_2_DieLage_02_03"); //Kommst du aus dem Alten Lager?
	AI_Output(self,hero,"Info_SFB_2_DieLage_02_04"); //Wenn du aus dem Alten Lager kommst, ich will keinen Ärger!
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_SFB_2_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_SFB_2_Pickpocket_Condition;
	information	= Info_Mod_SFB_2_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_SFB_2_Pickpocket_Condition()
{
	C_Beklauen	(18, ItMi_Gold, 25);
};

FUNC VOID Info_Mod_SFB_2_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_SFB_2_Pickpocket);

	Info_AddChoice	(Info_Mod_SFB_2_Pickpocket, DIALOG_BACK, Info_Mod_SFB_2_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_SFB_2_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_SFB_2_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_SFB_2_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_SFB_2_Pickpocket);
};

FUNC VOID Info_Mod_SFB_2_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_SFB_2_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_SFB_2_Pickpocket);

		Info_AddChoice	(Info_Mod_SFB_2_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_SFB_2_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_SFB_2_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_SFB_2_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_SFB_2_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_SFB_2_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_SFB_2_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_SFB_2_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_SFB_2_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_SFB_2_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_SFB_2_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_SFB_2_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_SFB_2_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_2(var c_NPC slf)
{

	Info_SFB_2_Pre.npc					= Hlp_GetInstanceID(slf);
	
	Info_SFB_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_2_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_2_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_sfb_2_KesselProblem.npc		= Hlp_GetInstanceID(slf);
	Info_sfb_2_KesselProblem2.npc		= Hlp_GetInstanceID(slf);
	Info_Mod_SFB_2_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
