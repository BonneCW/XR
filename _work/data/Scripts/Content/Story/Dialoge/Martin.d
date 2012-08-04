INSTANCE Info_Mod_Martin_Hi (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_Hi_Condition;
	information	= Info_Mod_Martin_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Martin_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Martin_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Martin_Hi_15_00"); //Wer bist du?
	AI_Output(self, hero, "Info_Mod_Martin_Hi_07_01"); //Ich bin Martin, Proviantmeister der Miliz. Was kann ich für dich tun?
};

INSTANCE Info_Mod_Martin_Rasend (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_Rasend_Condition;
	information	= Info_Mod_Martin_Rasend_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Martin_Rasend_Condition()
{
	if (Mod_WM_Rasend == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Martin_Rasend_Info()
{
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_00"); //Gut, dass du kommst ...
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_01"); //Bei Beliar ... was hat es denn hier für ein Massaker gegeben?
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_02"); //Ein übler Dämon ist dafür verantwortlich.
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_03"); //Was?! Ein einziger Dämon hat diese ganzen Paladine und Stadtbewohner getötet?
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_04"); //Wie genau ist das alles vor sich gegangen?
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_05"); //Nun, ich  werde dir erzählen, was ich bisher mitbekommen habe. Ich war nämlich gerade am Marktplatz etwas einkaufen.
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_06"); //Plötzlich hörte man unmenschliches Brüllen vom Hafen, vernahm, Schreie und Kampfgeräusche.
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_07"); //Ich lief los, um nachzusehen, aber ehe ich noch ankam, sah ich einen gigantischen Dämon in die Höhe steigen, über das Osttor fliegen und in der Ferne verschwinden.
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_08"); //Ja, das muss wirklich ein Ungetüm gewesen sein, so, wie es hier gewütet hat.
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_09"); //Gibt es schon irgendwelche Anhaltspunkte, was es damit auf sich hat, oder wohin der Dämon verschwunden ist?
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_10"); //Nein, noch gar nichts. Es ist ja wirklich noch nicht lange her, dass das alles geschehen ist ...
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_11"); //Ich habe aber jemanden davon sprechen hören, dass der Feuermagier Daron überaus beunruhigt schien und sich weg teleportierte ...
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_12"); //(zu sich selbst) Hmm, genau im Osten liegt ja das Kloster der Feuermagier.
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_13"); //Ok, danke für die Informationen. Ich mache mich dann auf den Weg, um vielleicht mehr über das alles zu Erfahren.
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_14"); //Ok, pass auf dich auf.

	Log_CreateTopic	(TOPIC_MOD_ADANOS_RASEND, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ADANOS_RASEND, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ADANOS_RASEND, "Beim Hafen der Stadt ist etwas Schreckliches vorgefallen.");
	B_LogEntry	(TOPIC_MOD_ADANOS_RASEND, "Ich erfuhr von Martin, dass ein riesiger Dämon die ganzen Paladine am Hafen abgeschlachtet hat und danach nach Osten hin verschwand. Der Feuermagier Daron teleportierte sich anschließend sehr beunruhigt weg.");

	B_StartOtherRoutine	(Mod_523_KDF_Daron_NW, "LIFEKLOSTER");

	B_KillNpc	(Mod_1193_NOV_Novize_NW);
	B_KillNpc	(Mod_554_KDF_Parlan_NW);
};

INSTANCE Info_Mod_Martin_Flugblaetter (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_Flugblaetter_Condition;
	information	= Info_Mod_Martin_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Martin_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Martin_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Martin_Flugblaetter_Info()
{
	AI_Output(hero, self, "Info_Mod_Martin_Flugblaetter_15_00"); //Ich hab hier ein Flugblatt für dich.

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Martin_Flugblaetter_07_01"); //Oh danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Martin_Flugblaetter_07_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Martin_Trade (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_Trade_Condition;
	information	= Info_Mod_Martin_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Martin_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Martin_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Martin_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Martin_Pickpocket (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_Pickpocket_Condition;
	information	= Info_Mod_Martin_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Martin_Pickpocket_Condition()
{
	C_Beklauen	(61, ItSc_PalRepelEvil, 1);
};

FUNC VOID Info_Mod_Martin_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Martin_Pickpocket);

	Info_AddChoice	(Info_Mod_Martin_Pickpocket, DIALOG_BACK, Info_Mod_Martin_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Martin_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Martin_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Martin_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Martin_Pickpocket);
};

FUNC VOID Info_Mod_Martin_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Martin_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Martin_Pickpocket);

		Info_AddChoice	(Info_Mod_Martin_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Martin_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Martin_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Martin_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Martin_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Martin_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Martin_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Martin_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Martin_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Martin_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Martin_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Martin_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Martin_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Martin_EXIT (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_EXIT_Condition;
	information	= Info_Mod_Martin_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Martin_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Martin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};