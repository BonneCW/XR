INSTANCE Info_Mod_Jesse_Hi (C_INFO)
{
	npc		= Mod_1506_BUD_Jesse_MT;
	nr		= 1;
	condition	= Info_Mod_Jesse_Hi_Condition;
	information	= Info_Mod_Jesse_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was macht die Arbeit, Schürfer?";
};

FUNC INT Info_Mod_Jesse_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jesse_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Jesse_Hi_15_00"); //Was macht die Arbeit, Schürfer?
	AI_Output(self, hero, "Info_Mod_Jesse_Hi_03_01"); //Ach, der gleiche Job, den ich schon damals als Buddler erledigen musste.
	AI_Output(self, hero, "Info_Mod_Jesse_Hi_03_02"); //Aber nach den ganzen Schweinereien, die das Alte Lager damals gemacht hat, bin ich lieber ins Neue Lager gegangen.
	AI_Output(hero, self, "Info_Mod_Jesse_Hi_15_03"); //Du meinst den Überfall auf die Mine hier?
	AI_Output(self, hero, "Info_Mod_Jesse_Hi_03_04"); //Ja, unter anderem. Deshalb sind hier auch ein paar Plätze für Schürfer frei geworden.
	AI_Output(self, hero, "Info_Mod_Jesse_Hi_03_05"); //Nachdem die Gardisten alle abgeschlachtet hatten, hat das Neue Lager ja Händeringend nach Arbeitern gesucht. Ist schon ganz ok hier.
	AI_Output(self, hero, "Info_Mod_Jesse_Hi_03_06"); //Und zumindest gibt es hier keine Wahnsinnigen, die mit magischem Schwert Jagd auf alles machen, was geht und steht ... wie der Verrückte im Alten Lager damals.
	AI_Output(self, hero, "Info_Mod_Jesse_Hi_03_07"); //Möchte gar nicht daran zurückdenken.
};

INSTANCE Info_Mod_Jesse_Costa (C_INFO)
{
	npc		= Mod_1506_BUD_Jesse_MT;
	nr		= 1;
	condition	= Info_Mod_Jesse_Costa_Condition;
	information	= Info_Mod_Jesse_Costa_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du hast da etwas, das Costa gehört.";
};

FUNC INT Info_Mod_Jesse_Costa_Condition()
{
	if (Mod_Costa_Guertel == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jesse_Costa_Info()
{
	AI_Output(hero, self, "Info_Mod_Jesse_Costa_15_00"); //Du hast da etwas, das Costa gehört.
	AI_Output(self, hero, "Info_Mod_Jesse_Costa_03_01"); //(besorgt) Ja, ich habe noch einiges von ihm. Weißt du, was aus ihm geworden ist? Haben die Gardisten ihn erwischt?
	AI_Output(hero, self, "Info_Mod_Jesse_Costa_15_02"); //Nein. Er hat den Zeitpunkt verschlafen.
	AI_Output(self, hero, "Info_Mod_Jesse_Costa_03_03"); //(bestürzt) Oh nein! Und wir dachten, ihm wäre etwas zugestoßen! Sitzt er noch immer im Lager fest?
	AI_Output(hero, self, "Info_Mod_Jesse_Costa_15_04"); //So ist es.
	AI_Output(self, hero, "Info_Mod_Jesse_Costa_03_05"); //Dann muss ich ihn unbedingt retten. Ich werde noch heute Nacht aufbrechen und ihn da rausholen.
	AI_Output(hero, self, "Info_Mod_Jesse_Costa_15_06"); //Ist das nicht etwas überstürzt?
	AI_Output(self, hero, "Info_Mod_Jesse_Costa_03_07"); //Nicht, wenn er Bescheid weiß und sich darauf vorbereitet. Kannst du dich frei im Lager bewegen?

	Info_ClearChoices	(Info_Mod_Jesse_Costa);

	Info_AddChoice	(Info_Mod_Jesse_Costa, "Nein.", Info_Mod_Jesse_Costa_B);
	Info_AddChoice	(Info_Mod_Jesse_Costa, "Ja.", Info_Mod_Jesse_Costa_A);
};

FUNC VOID Info_Mod_Jesse_Costa_B()
{
	AI_Output(hero, self, "Info_Mod_Jesse_Costa_B_15_00"); //Nein.
	AI_Output(self, hero, "Info_Mod_Jesse_Costa_B_03_01"); //Schade. Dann werde ich es so versuchen.

	Info_ClearChoices	(Info_Mod_Jesse_Costa);

	Mod_Costa_Guertel = 2;
};

FUNC VOID Info_Mod_Jesse_Costa_A()
{
	AI_Output(hero, self, "Info_Mod_Jesse_Costa_A_15_00"); //Ja.
	AI_Output(self, hero, "Info_Mod_Jesse_Costa_A_03_01"); //Du musst Costa noch heute warnen, dass er mich um Mitternacht an unserem letzten vereinbarten Ort treffen soll. Unbedingt heute, verstehst du?

	Info_ClearChoices	(Info_Mod_Jesse_Costa);

	B_LogEntry	(TOPIC_MOD_COSTA_GUERTEL, "Ich habe Jesse gefunden. Aber statt mir den Gürtel zu geben, will er jetzt eigenhändig Costa befreien. Dazu ist es dringend notwendig, dass ich Costa noch vor Mitternacht Bescheid gebe, damit er sich auf die Flucht vorbereiten kann.");

	Mod_Costa_Guertel_Tag = Wld_GetDay();
};

INSTANCE Info_Mod_Jesse_Pickpocket (C_INFO)
{
	npc		= Mod_1506_BUD_Jesse_MT;
	nr		= 1;
	condition	= Info_Mod_Jesse_Pickpocket_Condition;
	information	= Info_Mod_Jesse_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Jesse_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Nugget, 2);
};

FUNC VOID Info_Mod_Jesse_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Jesse_Pickpocket);

	Info_AddChoice	(Info_Mod_Jesse_Pickpocket, DIALOG_BACK, Info_Mod_Jesse_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Jesse_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Jesse_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Jesse_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Jesse_Pickpocket);
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

INSTANCE Info_Mod_Jesse_EXIT (C_INFO)
{
	npc		= Mod_1506_BUD_Jesse_MT;
	nr		= 1;
	condition	= Info_Mod_Jesse_EXIT_Condition;
	information	= Info_Mod_Jesse_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Jesse_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jesse_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};