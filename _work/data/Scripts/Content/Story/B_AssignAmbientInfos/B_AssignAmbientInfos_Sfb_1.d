// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_sfb_1_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_sfb_1_EXIT_Condition;
	information	= Info_sfb_1_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_sfb_1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_sfb_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_sfb_1_KesselProblem (C_INFO) 
{
	nr		= 1;
	condition	= Info_sfb_1_KesselProblem_Condition;
	information	= Info_sfb_1_KesselProblem_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_sfb_1_KesselProblem_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bruce_KesselProblem))
	&& (!Npc_KnowsInfo(hero, Info_SFB_2_KesselProblem))
	&& (!Npc_KnowsInfo(hero, Info_SFB_5_KesselProblem))
	{
		return TRUE;
	};
};

FUNC VOID Info_sfb_1_KesselProblem_Info()
{
	AI_Output(self,hero,"Info_sfb_1_KesselProblem_01_00"); //Hey.
};

INSTANCE Info_sfb_1_KesselProblem2 (C_INFO) 
{
	nr		= 1;
	condition	= Info_sfb_1_KesselProblem2_Condition;
	information	= Info_sfb_1_KesselProblem2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, habe gehört, dass wilde Tiere euch bedrohen und einer von euch getötet wurde.";
};                       

FUNC INT Info_sfb_1_KesselProblem2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bruce_KesselProblem))
	&& (!Npc_KnowsInfo(hero, Info_SFB_2_KesselProblem2))
	&& (!Npc_KnowsInfo(hero, Info_SFB_5_KesselProblem2))
	{
		return TRUE;
	};
};

FUNC VOID Info_sfb_1_KesselProblem2_Info()
{
	B_Say	(hero, self, "$KESSELPROBLEM01");

	AI_Output(self,hero,"Info_sfb_1_KesselProblem2_01_00"); //Ja, man, habe auch davon gehört. Mitten in der Nacht hat es ihn geholt.
	AI_Output(self,hero,"Info_sfb_1_KesselProblem2_01_01"); //War einfach weg am nächsten morgen.

	B_Say	(hero, self, "§KESSELPROBLEM02");

	AI_Output(self,hero,"Info_sfb_1_KesselProblem2_01_02"); //Doch, der Söldner Bruce hat es mit angesehen.
	AI_Output(self,hero,"Info_sfb_1_KesselProblem2_01_03"); //Er hat das Vieh verfolgt und ihm das Fell über die Ohren gezogen. Geschieht dem Mistvieh recht.
	AI_Output(self,hero,"Info_sfb_1_KesselProblem2_01_04"); //Hätte ich dem Bruce gar nicht zugetraut.
	AI_Output(self,hero,"Info_sfb_1_KesselProblem2_01_05"); //(zu sich selbst) Besonders abends stinkt’s wie ein Feld voll Sumpfkraut.

	B_Say	(hero, self, "§KESSELPROBLEM03");

	AI_Output(self,hero,"Info_sfb_1_KesselProblem2_01_06"); //Ohh ... hey, Mann, vergiss es, ich habe nichts gesagt.

	B_LogEntry	(TOPIC_MOD_NL_TALKESSELPROB, "Wie ich von einem Schürfer erfahren habe, wurde das Opfer nachts von dem Schattenläufer geholt. Außer Bruce hat aber niemand was gesehen oder gehört. Der Schürfer murmelte noch in Zusammenhang mit Bruce irgendetwas von 'abends' und 'Sumpfkraut'.");

	Mod_NL_TalkesselProblem = 1;
};

INSTANCE Info_sfb_1_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_sfb_1_EinerVonEuchWerden_Condition;
	information	= Info_sfb_1_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Wie kann ich dem Schürferbund beitreten?";
};                       

FUNC INT Info_sfb_1_EinerVonEuchWerden_Condition()
{
		return TRUE;
};

FUNC VOID Info_sfb_1_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_sfb_1_EinerVonEuchWerden_15_00"); //Wie kann ich dem Schürferbund beitreten?
	AI_Output(self,hero,"Info_sfb_1_EinerVonEuchWerden_01_01"); //Bei uns mitmachen? Glaub bloß nicht, hier wird nicht gearbeitet, nur weil man uns nicht zwingt.
	AI_Output(self,hero,"Info_sfb_1_EinerVonEuchWerden_01_02"); //Also wenn du glaubst, du kannst hier faulenzen, dann bist du schief gewickelt, mein Freund.
	AI_Output(self,hero,"Info_sfb_1_EinerVonEuchWerden_01_03"); //Wenn du jetzt immer noch glaubst hier richtig zu sein, dann such dir ne Spitzhacke und melde dich bei der Wache vor dem Eingang zur Mine.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_sfb_1_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_sfb_1_WichtigePersonen_Condition;
	information	= Info_sfb_1_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT Info_sfb_1_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_sfb_1_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_sfb_1_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,hero,"Info_sfb_1_WichtigePersonen_01_01"); //Das Sagen? Sieh dich doch mal um. Bestimmt nicht die Leute, die den ganzen Tag schuften, um genug Erz zu fördern.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_sfb_1_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_sfb_1_DasLager_Condition;
	information	= Info_sfb_1_DasLager_Info;
	permanent	= 1;
	description = "Was ist das hier?";
};                       

FUNC INT Info_sfb_1_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_sfb_1_DasLager_Info()
{
	AI_Output(hero,self,"Info_sfb_1_DasLager_15_00"); //Was ist das hier?
	AI_Output(self,hero,"Info_sfb_1_DasLager_01_01"); //Wie sieht es denn aus? Wie der Palast des Königs?
	AI_Output(self,hero,"Info_sfb_1_DasLager_01_02"); //Also wenn du wirklich in der Freien Mine arbeiten willst, dann wirst du erst hier im Kessel beweisen müssen, dass wir dich gebrauchen können.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_sfb_1_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_sfb_1_DieLage_Condition;
	information	= Info_sfb_1_DieLage_Info;
	permanent	= 1;
	description = "Wie sieht's aus?";
};                       

FUNC INT Info_sfb_1_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_sfb_1_DieLage_Info()
{
	AI_Output(hero,self,"Info_sfb_1_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self,hero,"Info_sfb_1_DieLage_01_01"); //Wie soll's schon aussehen? Beschissen wie immer. Kaum was zu beißen, dafür immer was zu tun.
};

INSTANCE Info_Mod_SFB_1_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_SFB_1_Pickpocket_Condition;
	information	= Info_Mod_SFB_1_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_SFB_1_Pickpocket_Condition()
{
	C_Beklauen	(r_max(30), ItMi_Gold, 10+r_max(20));
};

FUNC VOID Info_Mod_SFB_1_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_SFB_1_Pickpocket);

	Info_AddChoice	(Info_Mod_SFB_1_Pickpocket, DIALOG_BACK, Info_Mod_SFB_1_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_SFB_1_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_SFB_1_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_SFB_1_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_SFB_1_Pickpocket);
};

FUNC VOID Info_Mod_SFB_1_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_SFB_1_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_SFB_1_Pickpocket);

		Info_AddChoice	(Info_Mod_SFB_1_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_SFB_1_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_SFB_1_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_SFB_1_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_SFB_1_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_SFB_1_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_SFB_1_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_SFB_1_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_SFB_1_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_SFB_1_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_SFB_1_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_SFB_1_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_SFB_1_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_sfb_1(var c_NPC slf)
{
	
	Info_sfb_1_EXIT.npc			= Hlp_GetInstanceID(slf);
	Info_sfb_1_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_sfb_1_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_sfb_1_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_sfb_1_DieLage.npc			= Hlp_GetInstanceID(slf);
	Info_sfb_1_KesselProblem.npc		= Hlp_GetInstanceID(slf);
	Info_sfb_1_KesselProblem2.npc		= Hlp_GetInstanceID(slf);
	Info_Mod_SFB_1_Pickpocket.npc		= Hlp_GetInstanceID(slf);
};
