INSTANCE Info_Mod_Lehrling_Hi (C_INFO)
{
	npc		= Mod_7509_OUT_Lehrling_REL;
	nr		= 1;
	condition	= Info_Mod_Lehrling_Hi_Condition;
	information	= Info_Mod_Lehrling_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lehrling_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lehrling_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Lehrling_Hi_24_00"); //Ey, Opa!

	Info_ClearChoices	(Info_Mod_Lehrling_Hi);

	Info_AddChoice	(Info_Mod_Lehrling_Hi, "(ignorieren)", Info_Mod_Lehrling_Hi_B);
	Info_AddChoice	(Info_Mod_Lehrling_Hi, "Ja?", Info_Mod_Lehrling_Hi_A);
};

FUNC VOID Info_Mod_Lehrling_Hi_B()
{
	Info_ClearChoices	(Info_Mod_Lehrling_Hi);
};

FUNC VOID Info_Mod_Lehrling_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Lehrling_Hi_A_15_00"); //Ja?
	AI_Output(self, hero, "Info_Mod_Lehrling_Hi_A_24_01"); //Du hast doch 'n bisschen Zeit, oder? Könntest 'ne Aufgabe für mich erledigen.

	Info_ClearChoices	(Info_Mod_Lehrling_Hi);

	Info_AddChoice	(Info_Mod_Lehrling_Hi, "Kein Interesse.", Info_Mod_Lehrling_Hi_D);
	Info_AddChoice	(Info_Mod_Lehrling_Hi, "Was willst du?", Info_Mod_Lehrling_Hi_C);
};

FUNC VOID Info_Mod_Lehrling_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Lehrling_Hi_D_15_00"); //Kein Interesse.

	Info_ClearChoices	(Info_Mod_Lehrling_Hi);
};

FUNC VOID Info_Mod_Lehrling_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Lehrling_Hi_C_15_00"); //Was willst du?
	AI_Output(self, hero, "Info_Mod_Lehrling_Hi_C_24_01"); //Jo, also, letztens hab ich 'nen Haufen ziemlich wichtiger Zettel verloren.
	AI_Output(self, hero, "Info_Mod_Lehrling_Hi_C_24_02"); //Ich war da gerade beim Bauern und hab' denen eine kleine Überdachung vor die Haustür gebaut.
	AI_Output(self, hero, "Info_Mod_Lehrling_Hi_C_24_03"); //Inner Mittagspause habe ich dann die Zettel ... ausprobiert, und zwar hinterm Haus, Richtung Kornfeld.
	AI_Output(self, hero, "Info_Mod_Lehrling_Hi_C_24_04"); //Dann kam der Bauer und hat mich richtig erschreckt ... und da hab ich die Blätter fallen gelassen.
	AI_Output(self, hero, "Info_Mod_Lehrling_Hi_C_24_05"); //War zu aufgeregt, deshalb hab ich sie dort vergessen, verstehste bestimmt.
	AI_Output(self, hero, "Info_Mod_Lehrling_Hi_C_24_06"); //Vielleicht kannst ja mal vorbeigucken, ob du die Seiten findest.
	AI_Output(hero, self, "Info_Mod_Lehrling_Hi_C_15_07"); //Wie sieht's mit einer Aufwandsentschädigung aus?
	AI_Output(self, hero, "Info_Mod_Lehrling_Hi_C_24_08"); //Das wär mir sicher 'n paar Mäuse wert.

	Info_ClearChoices	(Info_Mod_Lehrling_Hi);

	Info_AddChoice	(Info_Mod_Lehrling_Hi, "Kein Interesse.", Info_Mod_Lehrling_Hi_D);
	Info_AddChoice	(Info_Mod_Lehrling_Hi, "Ich werde mich umsehen.", Info_Mod_Lehrling_Hi_E);
};

FUNC VOID Info_Mod_Lehrling_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Lehrling_Hi_E_15_00"); //Ich werde mich umsehen.

	Info_ClearChoices	(Info_Mod_Lehrling_Hi);

	Log_CreateTopic	(TOPIC_MOD_KHORATA_DOKUMENTE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_DOKUMENTE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_DOKUMENTE, "Der Lehrling des Handwerkers in Khorata hat einige 'wichtige' Seiten beim Bauernhof von Erhard verloren.");

	Mod_REL_Dokumente = 1;
};

INSTANCE Info_Mod_Lehrling_Dokumente (C_INFO)
{
	npc		= Mod_7509_OUT_Lehrling_REL;
	nr		= 1;
	condition	= Info_Mod_Lehrling_Dokumente_Condition;
	information	= Info_Mod_Lehrling_Dokumente_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du deine Zettel.";
};

FUNC INT Info_Mod_Lehrling_Dokumente_Condition()
{
	if (Mod_REL_Dokumente == 5)
	&& (Npc_HasItems(hero, ItWr_Lehrling01) == 1)
	&& (Npc_HasItems(hero, ItWr_Lehrling02) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lehrling_Dokumente_Info()
{
	AI_Output(hero, self, "Info_Mod_Lehrling_Dokumente_15_00"); //Hier hast du deine Zettel.

	Npc_RemoveInvItems	(hero, ItWr_Lehrling01, 1);
	Npc_RemoveInvItems	(hero, ItWr_Lehrling02, 1);

	B_ShowGivenThings	("Blätter des Lehrlings gegeben");

	AI_Output(self, hero, "Info_Mod_Lehrling_Dokumente_24_01"); //Danke, Alter! Hier haste 10 Münzen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 10);

	AI_Output(hero, self, "Info_Mod_Lehrling_Dokumente_15_02"); //Bisschen wenig ... Mika hat dafür 200 verlangt.
	AI_Output(self, hero, "Info_Mod_Lehrling_Dokumente_24_03"); //Wa?! So viel hab ich nicht!
	AI_Output(hero, self, "Info_Mod_Lehrling_Dokumente_15_04"); //Dann lass dir was einfallen.
	AI_Output(self, hero, "Info_Mod_Lehrling_Dokumente_24_05"); //Mann, versuch ich doch! (überlegt) Na gut, kriegste halt meine Goldketten, okay?

	B_GiveInvItems	(self, hero, ItMi_GoldNecklace, 2);

	AI_Output(hero, self, "Info_Mod_Lehrling_Dokumente_15_06"); //Meinetwegen.

	B_LogEntry	(TOPIC_MOD_KHORATA_DOKUMENTE, "Der Lehrling hat seinen Besitz wieder.");
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_DOKUMENTE, LOG_SUCCESS);
	
	B_GivePlayerXP(150);

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;
	
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_27);
};

INSTANCE Info_Mod_Lehrling_Cutter (C_INFO)
{
	npc		= Mod_7509_OUT_Lehrling_REL;
	nr		= 1;
	condition	= Info_Mod_Lehrling_Cutter_Condition;
	information	= Info_Mod_Lehrling_Cutter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir die Dokumente geben?";
};

FUNC INT Info_Mod_Lehrling_Cutter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lehrling_Dokumente))
	&& (Npc_KnowsInfo(hero, Info_Mod_Cutter_Anbau))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lehrling_Cutter_Info()
{
	AI_Output(hero, self, "Info_Mod_Lehrling_Cutter_15_00"); //Kannst du mir die Dokumente geben?
	AI_Output(self, hero, "Info_Mod_Lehrling_Cutter_24_01"); //Hä? Du hast sie mir doch erst zurückgebracht?
	AI_Output(hero, self, "Info_Mod_Lehrling_Cutter_15_02"); //Ich könnte sie jetzt selbst gebrauchen.
	AI_Output(self, hero, "Info_Mod_Lehrling_Cutter_24_03"); //Für 50 Mäuse kannste sie haben.

	Info_ClearChoices	(Info_Mod_Lehrling_Cutter);

	Info_AddChoice	(Info_Mod_Lehrling_Cutter, "Das ist es mir nicht wert.", Info_Mod_Lehrling_Cutter_C);
	if (Npc_HasItems(hero, ItMi_Gold) >= 50)
	{
		Info_AddChoice	(Info_Mod_Lehrling_Cutter, "Gut, hier ist das Gold.", Info_Mod_Lehrling_Cutter_B);
	};
	if (Mod_Verhandlungsgeschick > 0)
	{
		Info_AddChoice	(Info_Mod_Lehrling_Cutter, "(Feilschen) Ich habe dir schon so viel geholfen ...", Info_Mod_Lehrling_Cutter_A);
	};
};

FUNC VOID Info_Mod_Lehrling_Cutter_C()
{
	AI_Output(hero, self, "Info_Mod_Lehrling_Cutter_C_15_00"); //Das ist es mir nicht wert.

	Info_ClearChoices	(Info_Mod_Lehrling_Cutter);
};

FUNC VOID Info_Mod_Lehrling_Cutter_B()
{
	AI_Output(hero, self, "Info_Mod_Lehrling_Cutter_B_15_00"); //Gut, hier ist das Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Lehrling_Cutter_B_24_01"); //Krass, danke, Mann!

	CreateInvItems	(hero, ItWr_Lehrling01, 1);
	CreateInvItems	(hero, ItWr_Lehrling02, 1);

	B_ShowGivenThings	("Blätter des Lehrlings erhalten");

	Info_ClearChoices	(Info_Mod_Lehrling_Cutter);
};

FUNC VOID Info_Mod_Lehrling_Cutter_A()
{
	AI_Output(hero, self, "Info_Mod_Lehrling_Cutter_A_15_00"); //Ich habe dir schon so viel geholfen ...

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Lehrling_Cutter_A_24_01"); //Stimmt schon irgendwie. Na gut, dann nimm's halt.

		CreateInvItems	(hero, ItWr_Lehrling01, 1);
		CreateInvItems	(hero, ItWr_Lehrling02, 1);

		B_ShowGivenThings	("Blätter des Lehrlings erhalten");
	
		B_GivePlayerXP	(10);

		B_RaiseHandelsgeschick (2);

		Info_ClearChoices	(Info_Mod_Lehrling_Cutter);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Lehrling_Cutter_A_24_02"); //Jo, Alter, aber ... nee, günstiger geb ich die nicht her.

		Info_ClearChoices	(Info_Mod_Lehrling_Cutter);

		Info_AddChoice	(Info_Mod_Lehrling_Cutter, "Das ist es mir nicht wert.", Info_Mod_Lehrling_Cutter_C);

		if (Npc_HasItems(hero, ItMi_Gold) >= 50)
		{
			Info_AddChoice	(Info_Mod_Lehrling_Cutter, "Gut, hier ist das Gold.", Info_Mod_Lehrling_Cutter_B);
		};
	};
};

INSTANCE Info_Mod_Lehrling_Freudenspender (C_INFO)
{
	npc		= Mod_7509_OUT_Lehrling_REL;
	nr		= 1;
	condition	= Info_Mod_Lehrling_Freudenspender_Condition;
	information	= Info_Mod_Lehrling_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Meinst du, du verträgst Freudenspender?";
};                       

FUNC INT Info_Mod_Lehrling_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Lehrling_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Lehrling_Freudenspender_15_00"); //Meinst du, du verträgst Freudenspender?
	AI_Output(self, hero, "Info_Mod_Lehrling_Freudenspender_24_01"); //Was für eine Frage! Hast du was?
	AI_Output(hero, self, "Info_Mod_Lehrling_Freudenspender_15_02"); //Sicher doch.
	AI_Output(self, hero, "Info_Mod_Lehrling_Freudenspender_24_03"); //Ich stehe in deiner Schuld.

	B_GiveInvItems	(hero, self, ItMi_Freudenspender, 1);

	B_GiveInvItems	(self, hero, ItMi_Gold, 10);

	Mod_Freudenspender	+= 1;
};

INSTANCE Info_Mod_Lehrling_Pickpocket (C_INFO)
{
	npc		= Mod_7509_OUT_Lehrling_REL;
	nr		= 1;
	condition	= Info_Mod_Lehrling_Pickpocket_Condition;
	information	= Info_Mod_Lehrling_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Lehrling_Pickpocket_Condition()
{
	C_Beklauen	(51, ItMi_Gold, 15);
};

FUNC VOID Info_Mod_Lehrling_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Lehrling_Pickpocket);

	Info_AddChoice	(Info_Mod_Lehrling_Pickpocket, DIALOG_BACK, Info_Mod_Lehrling_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Lehrling_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Lehrling_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Lehrling_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Lehrling_Pickpocket);
};

FUNC VOID Info_Mod_Lehrling_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Lehrling_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Lehrling_Pickpocket);

		Info_AddChoice	(Info_Mod_Lehrling_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Lehrling_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Lehrling_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Lehrling_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Lehrling_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Lehrling_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Lehrling_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Lehrling_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Lehrling_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Lehrling_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Lehrling_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Lehrling_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Lehrling_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Lehrling_EXIT (C_INFO)
{
	npc		= Mod_7509_OUT_Lehrling_REL;
	nr		= 1;
	condition	= Info_Mod_Lehrling_EXIT_Condition;
	information	= Info_Mod_Lehrling_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lehrling_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lehrling_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};