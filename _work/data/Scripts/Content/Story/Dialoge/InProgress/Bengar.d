INSTANCE Info_Mod_Bengar_Hi (C_INFO)
{
	npc		= Mod_107_BAU_Bengar_NW;
	nr		= 1;
	condition	= Info_Mod_Bengar_Hi_Condition;
	information	= Info_Mod_Bengar_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Bengar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bengar_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Bengar_Hi_05_01"); //Ich bin Bengar, Bauer auf diesem Hof.
};

INSTANCE Info_Mod_Bengar_Aufgabe (C_INFO)
{
	npc		= Mod_107_BAU_Bengar_NW;
	nr		= 1;
	condition	= Info_Mod_Bengar_Aufgabe_Condition;
	information	= Info_Mod_Bengar_Aufgabe_Info;
	permanent	= 1;
	important	= 0;
	description	= "Baltram wartet auf dein Brot.";
};

FUNC INT Info_Mod_Bengar_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bengar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Baltram_Warentransporte))
	&& (Mod_BengarBaltram == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bengar_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Bengar_Aufgabe_15_00"); //Baltram wartet auf dein Brot.
	AI_Output(self, hero, "Info_Mod_Bengar_Aufgabe_05_01"); //Ich habe erst vor ein paar Tagen Wagen und M�nner bei einem �berfall verloren. Das Risiko gehe ich nicht noch mal ein!
	AI_Output(hero, self, "Info_Mod_Bengar_Aufgabe_15_02"); //Deswegen bin ich ja hier.
	AI_Output(self, hero, "Info_Mod_Bengar_Aufgabe_05_03"); //So? Du willst alleine und voll beladen zur Stadt laufen?
	AI_Output(hero, self, "Info_Mod_Bengar_Aufgabe_15_04"); //W�re nicht das erstes Mal.
	AI_Output(self, hero, "Info_Mod_Bengar_Aufgabe_05_05"); //Na sch�n, wenn du meinst ... ich bekomme dann 150 Gold.

	Info_ClearChoices	(Info_Mod_Bengar_Aufgabe);

	if (Mod_Verhandlungsgeschick > 0)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		Info_AddChoice	(Info_Mod_Bengar_Aufgabe, "(Feilschen) Die Brote sehen nicht so wertvoll aus ...", Info_Mod_Bengar_Aufgabe_C);
	};
	if (Npc_HasItems(hero, ItMi_Gold) >= 150)
	{
		Info_AddChoice	(Info_Mod_Bengar_Aufgabe, "Hier hast du 150 Gold.", Info_Mod_Bengar_Aufgabe_B);
	};
	Info_AddChoice	(Info_Mod_Bengar_Aufgabe, "So viel habe ich nicht.", Info_Mod_Bengar_Aufgabe_A);
};

FUNC VOID Info_Mod_Bengar_Aufgabe_C()
{
	AI_Output(hero, self, "Info_Mod_Bengar_Aufgabe_C_15_00"); //Die Brote sehen nicht so wertvoll aus ...

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Bengar_Aufgabe_C_05_01"); //(m�rrisch) Dann eben 100 Gold. Hauptsache, du l�sst mal was r�berwachsen.

		Npc_RemoveInvItems	(hero, ItMi_Gold, 100);
		CreateInvItems	(hero, ItFo_Bread, 30);

		Mod_BengarBaltram = 1;

		B_ShowGivenThings	("100 Gold gegeben und 30 Brote erhalten");

		B_LogEntry	(TOPIC_MOD_BALTRAM_WARENTRANSPORTE, "Bengar hat mir sein Brot �berlassen.");

		Info_ClearChoices	(Info_Mod_Bengar_Aufgabe);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Bengar_Aufgabe_C_05_02"); //Verarsch mich nicht, klar?

		Info_ClearChoices	(Info_Mod_Bengar_Aufgabe);

		if (Npc_HasItems(hero, ItMi_Gold) >= 150)
		{
			Info_AddChoice	(Info_Mod_Bengar_Aufgabe, "Hier hast du 150 Gold.", Info_Mod_Bengar_Aufgabe_B);
		};
		Info_AddChoice	(Info_Mod_Bengar_Aufgabe, "So viel habe ich nicht.", Info_Mod_Bengar_Aufgabe_A);
	};
};

FUNC VOID Info_Mod_Bengar_Aufgabe_B()
{
	AI_Output(hero, self, "Info_Mod_Bengar_Aufgabe_B_15_00"); //Hier hast du 150 Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 150);

	AI_Output(self, hero, "Info_Mod_Bengar_Aufgabe_B_05_01"); //Und hier das Brot.

	B_GiveInvItems	(self, hero, ItFo_Bread, 30);

	Mod_BengarBaltram = 1;

	B_LogEntry	(TOPIC_MOD_BALTRAM_WARENTRANSPORTE, "Bengar hat mir sein Brot �berlassen.");

	Info_ClearChoices	(Info_Mod_Bengar_Aufgabe);
};

FUNC VOID Info_Mod_Bengar_Aufgabe_A()
{
	AI_Output(hero, self, "Info_Mod_Bengar_Aufgabe_A_15_00"); //So viel habe ich nicht.
	AI_Output(self, hero, "Info_Mod_Bengar_Aufgabe_A_05_01"); //(sp�ttisch) Na, das nenne ich mal Vorausplanung! Komm wieder, wenn du das Gold hast.

	Info_ClearChoices	(Info_Mod_Bengar_Aufgabe);
};

INSTANCE Info_Mod_Bengar_Kakos (C_INFO)
{
	npc		= Mod_107_BAU_Bengar_NW;
	nr		= 1;
	condition	= Info_Mod_Bengar_Kakos_Condition;
	information	= Info_Mod_Bengar_Kakos_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bengar_Kakos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Drachen))
	&& (Npc_IsDead(Kakos_11006_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bengar_Kakos_Info()
{
	AI_Output(self, hero, "Info_Mod_Bengar_Kakos_05_00"); //Hab vielen Dank. Unglaublich, was du an diesem Riesen geleistet hast.
	AI_Output(self, hero, "Info_Mod_Bengar_Kakos_05_01"); //Hat uns Tag und Nacht schuften lassen und uns die Haare vom Kopf gefressen, dieser Bastard.
	AI_Output(self, hero, "Info_Mod_Bengar_Kakos_05_02"); //Viel l�nger h�tten wir das nicht mehr ausgehalten.
	AI_Output(self, hero, "Info_Mod_Bengar_Kakos_05_03"); //Hier, nimm den Schatz des Riesen zum Dank, den wir f�r ihn aufpolieren sollten.

	B_GiveInvItems	(self, hero, ItMi_Riesenschatz, 1);

	AI_Output(self, hero, "Info_Mod_Bengar_Kakos_05_04"); //(lacht geh�ssig) Da, wo er jetzt ist, wird er ihn nicht mehr brauchen.

	B_GivePlayerXP	(500);

	B_SetTopicStatus	(TOPIC_MOD_NL_KAKOS, LOG_SUCCESS);
};

INSTANCE Info_Mod_Bengar_Pickpocket (C_INFO)
{
	npc		= Mod_107_BAU_Bengar_NW;
	nr		= 1;
	condition	= Info_Mod_Bengar_Pickpocket_Condition;
	information	= Info_Mod_Bengar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Bengar_Pickpocket_Condition()
{
	C_Beklauen	(35, ItMi_Gold, 15);
};

FUNC VOID Info_Mod_Bengar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bengar_Pickpocket);

	Info_AddChoice	(Info_Mod_Bengar_Pickpocket, DIALOG_BACK, Info_Mod_Bengar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bengar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bengar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bengar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bengar_Pickpocket);
};

FUNC VOID Info_Mod_Bengar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Bengar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Bengar_Pickpocket);

		Info_AddChoice	(Info_Mod_Bengar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Bengar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Bengar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Bengar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Bengar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Bengar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Bengar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Bengar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Bengar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Bengar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Bengar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Bengar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Bengar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Bengar_EXIT (C_INFO)
{
	npc		= Mod_107_BAU_Bengar_NW;
	nr		= 1;
	condition	= Info_Mod_Bengar_EXIT_Condition;
	information	= Info_Mod_Bengar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bengar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bengar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};