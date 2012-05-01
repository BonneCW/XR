INSTANCE Info_Mod_Yasin_Hi (C_INFO)
{
	npc		= Mod_7111_ASS_Yasin_NW;
	nr		= 1;
	condition	= Info_Mod_Yasin_Hi_Condition;
	information	= Info_Mod_Yasin_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und, alles fit?";
};

FUNC INT Info_Mod_Yasin_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Yasin_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Yasin_Hi_15_00"); //Und, alles fit?
	AI_Output(self, hero, "Info_Mod_Yasin_Hi_13_01"); //(wütend) Verschwinde gefälligst.
	AI_Output(hero, self, "Info_Mod_Yasin_Hi_15_02"); //Hey, bleib locker. Ich wollte nur wissen, wie es dir geht.
	AI_Output(self, hero, "Info_Mod_Yasin_Hi_13_03"); //(faucht) Toll, das siehst du doch. Was willst du denn?
	AI_Output(hero, self, "Info_Mod_Yasin_Hi_15_04"); //Gehörst du zu den Gaunern hier?
	AI_Output(self, hero, "Info_Mod_Yasin_Hi_13_05"); //(grummelt) Ja, mein Name ist Yasin. Aber vielleicht werde ich nicht mehr lange zu dieser Gemeinschaft gehören.
};

INSTANCE Info_Mod_Yasin_Aufgabe (C_INFO)
{
	npc		= Mod_7111_ASS_Yasin_NW;
	nr		= 1;
	condition	= Info_Mod_Yasin_Aufgabe_Condition;
	information	= Info_Mod_Yasin_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso das denn?";
};

FUNC INT Info_Mod_Yasin_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Yasin_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Shakir_GaunerWerden))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Yasin_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Yasin_Aufgabe_15_00"); //Wieso das denn?
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_01"); //(wütend) Ich habe vor einiger Zeit krumme Geschäfte mit einigen der Stadtwachen dieser Stadt gemacht.
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_02"); //Einem von diesen Kerlen haben meine Sachen nicht gefallen und er hat mich überall angeschwärzt.
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_03"); //Ich musste aus der Stadt fliehen.
	AI_Output(hero, self, "Info_Mod_Yasin_Aufgabe_15_04"); //Was ist so schlimm daran?
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_05"); //(aufbrausend) Kannst du denn nicht logisch denken oder bist du so blöd?
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_06"); //Der Kerl hat mich verfolgt und hat gesehen, wie ich hier verschwunden bin.
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_07"); //Er kennt unser Versteck und wenn wir Pech haben steht hier bald die Miliz auf der Matte.
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_08"); //Unsere Anführere sind entsprechend begeistert.
	AI_Output(hero, self, "Info_Mod_Yasin_Aufgabe_15_09"); //Das ist nicht gut.
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_10"); //(verärgert) Ja, das ist nicht gut. Du hast ja alles mitbekommen, also ist die Märchenstunde nun beendet. Kannst du nun gehen?
	AI_Output(hero, self, "Info_Mod_Yasin_Aufgabe_15_11"); //Kann ich dir bei deinem Problem helfen?
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_12"); //(argwöhnisch) So, wieso solltest du das tun?
	AI_Output(hero, self, "Info_Mod_Yasin_Aufgabe_15_13"); //Ich bin auf der Suche nach Stimmen, um mich euch anschließen zu können
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_14"); //(überlegt) Ein ehrenwertes Anliegen. Hm ...
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_15"); //Wenn du mir helfen kannst, dann werde ich dir meine Stimme sicherlich geben können.
	AI_Output(hero, self, "Info_Mod_Yasin_Aufgabe_15_16"); //Was soll ich tun?
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_17"); //Erledige diese schmierige Stadtwache für mich, wie es sich für einen wahren Assassinen gehört.
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_18"); //Wenn du ihn tötest bin ich mein Problem los und du hast eine Stimme mehr.
	AI_Output(hero, self, "Info_Mod_Yasin_Aufgabe_15_19"); //Welche Stadtwache ist das genau?
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_20"); //Mika heißt der Mistkerl. Der steht Tag und Nacht vor dem Tor.
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_21"); //Das dumme ist, dass immer einige Torwachen bei ihm stehen.
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_22"); //Du musst ihn weglocken und ausschalten. Die Höhle mit dem Teleporter wäre der perfekte Ort dafür.
	AI_Output(hero, self, "Info_Mod_Yasin_Aufgabe_15_23"); //Alles klar, der Kerl ist so gut wie erledigt.
	AI_Output(self, hero, "Info_Mod_Yasin_Aufgabe_13_24"); //Beeil dich, sonst wird mich unser Rat sicher bald rauswerfen.

	Log_CreateTopic	(TOPIC_MOD_ASS_YASIN_MIKA, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_YASIN_MIKA, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_YASIN_MIKA, "Ich habe nun mit dem Gauner Yasin geredet. Dieser berichtete mir, dass Milizsoldat Mika vor der Stadt durch einen Fehler Yasins über das Versteck der Assassinen Bescheid weiß. Wenn Mika nicht bald erledigt ist, werden die Assassinen sicher von der Miliz angegriffen. Ich soll den Mistkerl für Yasin töten, und zwar, wenn es Nacht ist. Ich soll ihn dazu in die Höhle mit dem Teleporter locken und im Geheimen töten.");
};

INSTANCE Info_Mod_Yasin_MikaTot (C_INFO)
{
	npc		= Mod_7111_ASS_Yasin_NW;
	nr		= 1;
	condition	= Info_Mod_Yasin_MikaTot_Condition;
	information	= Info_Mod_Yasin_MikaTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dieser Mika kann nichts mehr erzählen. Ich hab ihn erledigt.";
};

FUNC INT Info_Mod_Yasin_MikaTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Yasin_Aufgabe))
	&& (Npc_IsDead(Mod_598_MIL_Mika_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Yasin_MikaTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Yasin_MikaTot_15_00"); //Dieser Mika kann nichts mehr erzählen. Ich hab ihn erledigt.
	AI_Output(self, hero, "Info_Mod_Yasin_MikaTot_13_01"); //Sicher?
	AI_Output(hero, self, "Info_Mod_Yasin_MikaTot_15_02"); //Glaubst du mir etwa nicht?
	AI_Output(self, hero, "Info_Mod_Yasin_MikaTot_13_04"); //Doch, doch, natürlich. Jetzt bin ich aber beruhigt. Jemand wie dich kann man brauchen. Meine Stimme hast du.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_SetTopicStatus	(TOPIC_MOD_ASS_YASIN_MIKA, LOG_SUCCESS);

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Yasin_Pickpocket (C_INFO)
{
	npc		= Mod_7111_ASS_Yasin_NW;
	nr		= 1;
	condition	= Info_Mod_Yasin_Pickpocket_Condition;
	information	= Info_Mod_Yasin_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Yasin_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Yasin_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Yasin_Pickpocket);

	Info_AddChoice	(Info_Mod_Yasin_Pickpocket, DIALOG_BACK, Info_Mod_Yasin_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Yasin_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Yasin_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Yasin_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Yasin_Pickpocket);
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

INSTANCE Info_Mod_Yasin_EXIT (C_INFO)
{
	npc		= Mod_7111_ASS_Yasin_NW;
	nr		= 1;
	condition	= Info_Mod_Yasin_EXIT_Condition;
	information	= Info_Mod_Yasin_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Yasin_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Yasin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};