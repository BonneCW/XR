INSTANCE Info_Mod_Fellan_Hi (C_INFO)
{
	npc		= Mod_574_NONE_Fellan_NW;
	nr		= 1;
	condition	= Info_Mod_Fellan_Hi_Condition;
	information	= Info_Mod_Fellan_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Fellan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fellan_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Fellan_Hi_08_01"); //St�r mich nicht. Ich muss mir �berlegen, wie ich verhindern kann, dass es in mein Haus regnet.
};

INSTANCE Info_Mod_Fellan_Regenproblem (C_INFO)
{
	npc		= Mod_574_NONE_Fellan_NW;
	nr		= 1;
	condition	= Info_Mod_Fellan_Regenproblem_Condition;
	information	= Info_Mod_Fellan_Regenproblem_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es regnet in dein Haus?";
};

FUNC INT Info_Mod_Fellan_Regenproblem_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fellan_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fellan_Regenproblem_Info()
{
	AI_Output(hero, self, "Info_Mod_Fellan_Regenproblem_15_00"); //Es regnet in dein Haus?
	AI_Output(self, hero, "Info_Mod_Fellan_Regenproblem_08_01"); //Ja. Es scheint so, als w�re irgendwo ein Loch. Was soll ich jetzt blo� machen?

	Info_ClearChoices	(Info_Mod_Fellan_Regenproblem);

	Info_AddChoice	(Info_Mod_Fellan_Regenproblem, "Da kann ich dir auch nicht helfen.", Info_Mod_Fellan_Regenproblem_B);
	Info_AddChoice	(Info_Mod_Fellan_Regenproblem, "Schon mal von Brettern und N�geln geh�rt?", Info_Mod_Fellan_Regenproblem_A);
};

FUNC VOID Info_Mod_Fellan_Regenproblem_B()
{
	AI_Output(hero, self, "Info_Mod_Fellan_Regenproblem_B_15_00"); //Da kann ich dir auch nicht helfen.
	AI_Output(self, hero, "Info_Mod_Fellan_Regenproblem_B_08_01"); //(seufzt) Was soll ich nur machen?

	Info_ClearChoices	(Info_Mod_Fellan_Regenproblem);
};

FUNC VOID Info_Mod_Fellan_Regenproblem_A()
{
	AI_Output(hero, self, "Info_Mod_Fellan_Regenproblem_A_15_00"); //Schon mal von Brettern und N�geln geh�rt?
	AI_Output(self, hero, "Info_Mod_Fellan_Regenproblem_A_08_01"); //�h ... jetzt, wo du es sagst ...
	AI_Output(hero, self, "Info_Mod_Fellan_Regenproblem_A_15_02"); //Einen Hammer brauchst du dann auch noch.
	AI_Output(self, hero, "Info_Mod_Fellan_Regenproblem_A_08_03"); //Wo bekomm ich denn den wieder her?

	Info_ClearChoices	(Info_Mod_Fellan_Regenproblem);

	Info_AddChoice	(Info_Mod_Fellan_Regenproblem, "Das ist dein Problem.", Info_Mod_Fellan_Regenproblem_D);
	Info_AddChoice	(Info_Mod_Fellan_Regenproblem, "Ich besorg dir einen.", Info_Mod_Fellan_Regenproblem_C);
};

FUNC VOID Info_Mod_Fellan_Regenproblem_D()
{
	AI_Output(hero, self, "Info_Mod_Fellan_Regenproblem_D_15_00"); //Das ist dein Problem.
	AI_Output(self, hero, "Info_Mod_Fellan_Regenproblem_D_08_01"); //(seufzt) Ich werde wahrscheinlich in meinem eigenen Haus ertrinken.

	Info_ClearChoices	(Info_Mod_Fellan_Regenproblem);
};

FUNC VOID Info_Mod_Fellan_Regenproblem_C()
{
	AI_Output(hero, self, "Info_Mod_Fellan_Regenproblem_C_15_00"); //Ich besorg dir einen.
	AI_Output(self, hero, "Info_Mod_Fellan_Regenproblem_C_08_01"); //Wirklich? Das w�re toll.

	Log_CreateTopic	(TOPIC_MOD_FELLAN_REGEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FELLAN_REGEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FELLAN_REGEN, "Fellan hat scheinbar ein Problem mit dem Dach seines Hauses. Ich hab ihm erkl�rt, dass er zum Reparieren Bretter und N�gel braucht, jedoch hat er nicht mal einen Hammer. Ich hab mich bereit erkl�rt, ihm einen Hammer zu besorgen.");

	Fellan_Hammer = 1;

	Info_ClearChoices	(Info_Mod_Fellan_Regenproblem);
};

INSTANCE Info_Mod_Fellan_HabHammer (C_INFO)
{
	npc		= Mod_574_NONE_Fellan_NW;
	nr		= 1;
	condition	= Info_Mod_Fellan_HabHammer_Condition;
	information	= Info_Mod_Fellan_HabHammer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du einen Hammer.";
};

FUNC INT Info_Mod_Fellan_HabHammer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fellan_Regenproblem))
	&& (Npc_HasItems(hero, ItMi_Hammer) > 0)
	&& (Fellan_Hammer == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fellan_HabHammer_Info()
{
	AI_Output(hero, self, "Info_Mod_Fellan_HabHammer_15_00"); //Hier hast du einen Hammer.

	B_GiveInvItems	(hero, self, ItMi_Hammer, 1);

	AI_Output(self, hero, "Info_Mod_Fellan_HabHammer_08_01"); //Danke, dann werd ich mich jetzt mal daran machen, dieses Loch zu schlie�en.

	B_LogEntry	(TOPIC_MOD_FELLAN_REGEN, "Fellan hat jetzt einen Hammer und will sich jetzt daran machen, das Loch zu schlie�en.");
	B_SetTopicStatus	(TOPIC_MOD_FELLAN_REGEN, LOG_SUCCESS);

	B_GivePlayerXP	(50);

	B_StartOtherRoutine	(self, "REPAIR");

	CurrentNQ += 1;

	Npc_SetRefuseTalk (self, 60);
};

INSTANCE Info_Mod_Fellan_NochAmHaemmern (C_INFO)
{
	npc		= Mod_574_NONE_Fellan_NW;
	nr		= 1;
	condition	= Info_Mod_Fellan_NochAmHaemmern_Condition;
	information	= Info_Mod_Fellan_NochAmHaemmern_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du etwa immer noch nicht fertig mit dem Reparieren?";
};

FUNC INT Info_Mod_Fellan_NochAmHaemmern_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fellan_HabHammer))
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Kapitel >= 2)
	&& (Mod_WilfriedsQuest >= 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fellan_NochAmHaemmern_Info()
{
	AI_Output(hero, self, "Info_Mod_Fellan_NochAmHaemmern_15_00"); //Bist du etwa immer noch nicht fertig mit dem Reparieren?
	AI_Output(self, hero, "Info_Mod_Fellan_NochAmHaemmern_08_01"); //Ach, es ist zum Verzweifeln. Mal schlage ich daneben, dann verbiegt sich der Nagel.
	AI_Output(self, hero, "Info_Mod_Fellan_NochAmHaemmern_08_02"); //Mal schlage ich zu hart, dann brechen die umliegenden Bretter ebenfalls.
	AI_Output(self, hero, "Info_Mod_Fellan_NochAmHaemmern_08_03"); //Ich kann von Gl�ck sagen, dass dieses morsche Gebilde, das mein Haus sein will, �berhaupt noch steht.

	Info_ClearChoices	(Info_Mod_Fellan_NochAmHaemmern);

	Info_AddChoice	(Info_Mod_Fellan_NochAmHaemmern, "Da kann ich dir auch nicht helfen.", Info_Mod_Fellan_NochAmHaemmern_B);
	Info_AddChoice	(Info_Mod_Fellan_NochAmHaemmern, "Ich w�sste da eins.", Info_Mod_Fellan_NochAmHaemmern_A);
};

FUNC VOID Info_Mod_Fellan_NochAmHaemmern_B()
{
	AI_Output(hero, self, "Info_Mod_Fellan_NochAmHaemmern_B_15_00"); //Da kann ich dir auch nicht helfen.

	Info_ClearChoices	(Info_Mod_Fellan_NochAmHaemmern);
};

FUNC VOID Info_Mod_Fellan_NochAmHaemmern_A()
{
	AI_Output(hero, self, "Info_Mod_Fellan_NochAmHaemmern_A_15_00"); //Ich w�sste da eins.
	AI_Output(self, hero, "Info_Mod_Fellan_NochAmHaemmern_A_08_01"); //Ach ja, und wo?
	AI_Output(hero, self, "Info_Mod_Fellan_NochAmHaemmern_A_15_02"); //Auf der anderen Seite des Hafens. Fr�her hat dort Wilfried gewohnt, aber der ist ... gestorben.
	AI_Output(self, hero, "Info_Mod_Fellan_NochAmHaemmern_A_08_03"); //Na, vielen Dank f�r den Tipp. Da muss ich mich doch glatt mal umh�ren.

	B_GivePlayerXP	(50);

	Mod_Fellan_Day = Wld_GetDay();

	Mod_Fellan_Umzug = 1;

	Info_ClearChoices	(Info_Mod_Fellan_NochAmHaemmern);
};

INSTANCE Info_Mod_Fellan_NochAmHaemmern2 (C_INFO)
{
	npc		= Mod_574_NONE_Fellan_NW;
	nr		= 1;
	condition	= Info_Mod_Fellan_NochAmHaemmern2_Condition;
	information	= Info_Mod_Fellan_NochAmHaemmern2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fellan_NochAmHaemmern2_Condition()
{
	if (Mod_Fellan_Umzug == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fellan_NochAmHaemmern2_Info()
{
	AI_Output(self, hero, "Info_Mod_Fellan_NochAmHaemmern2_08_00"); //Tja, Schei�e. Letzte Nacht hat's hier schon reingeregnet.
	AI_Output(self, hero, "Info_Mod_Fellan_NochAmHaemmern2_08_01"); //Anscheinend ist das H�mmern bis ans Ende meiner Tage meine Bestimmung.
};

INSTANCE Info_Mod_Fellan_Flugblaetter (C_INFO)
{
	npc		= Mod_574_NONE_Fellan_NW;
	nr		= 1;
	condition	= Info_Mod_Fellan_Flugblaetter_Condition;
	information	= Info_Mod_Fellan_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt f�r dich.";
};

FUNC INT Info_Mod_Fellan_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Fellan_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fellan_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Fellan_Flugblaetter_08_01"); //Oh danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Fellan_Flugblaetter_08_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Fellan_Pickpocket (C_INFO)
{
	npc		= Mod_574_NONE_Fellan_NW;
	nr		= 1;
	condition	= Info_Mod_Fellan_Pickpocket_Condition;
	information	= Info_Mod_Fellan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Fellan_Pickpocket_Condition()
{
	C_Beklauen	(35, ItMi_Gold, 16);
};

FUNC VOID Info_Mod_Fellan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fellan_Pickpocket);

	Info_AddChoice	(Info_Mod_Fellan_Pickpocket, DIALOG_BACK, Info_Mod_Fellan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fellan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fellan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fellan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fellan_Pickpocket);
};

FUNC VOID Info_Mod_Fellan_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fellan_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fellan_Pickpocket);

		Info_AddChoice	(Info_Mod_Fellan_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fellan_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fellan_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fellan_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fellan_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fellan_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fellan_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fellan_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fellan_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fellan_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fellan_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fellan_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fellan_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fellan_EXIT (C_INFO)
{
	npc		= Mod_574_NONE_Fellan_NW;
	nr		= 1;
	condition	= Info_Mod_Fellan_EXIT_Condition;
	information	= Info_Mod_Fellan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fellan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fellan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};