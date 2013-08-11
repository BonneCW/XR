INSTANCE Info_Mod_Tom_Hi (C_INFO)
{
	npc		= Mod_967_BDT_Tom_NW;
	nr		= 1;
	condition	= Info_Mod_Tom_Hi_Condition;
	information	= Info_Mod_Tom_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Tom_Hi_Condition()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	
	if (Hlp_IsItem(itm, ITAR_MIL_L) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_MIL_M) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_PAL_M) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_PAL_H) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_PAL_TIGER) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_MIL_s2) == TRUE)
	{
		return 0;
	}
	else if (Mod_Gilde > 0)
	&& (Mod_DidCrime)
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tom_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Tom_Hi_11_00"); //He, was sagst du zu der Sache mit Bloodwyns Geldeintreiberei im Lager damals.
	AI_Output(hero, self, "Info_Mod_Tom_Hi_15_01"); //Was?! Ist doch schon lange her ... wen interessiert’s ...
	AI_Output(self, hero, "Info_Mod_Tom_Hi_11_02"); //Bist du also doch der Typ aus der Kolonie damals ...
	AI_Output(hero, self, "Info_Mod_Tom_Hi_15_03"); //Was meinst du?
	AI_Output(self, hero, "Info_Mod_Tom_Hi_11_04"); //Ich war damals Buddler im Alten Lager und glaubte dich als Mitgefangenen wieder erkannt zu haben.
	AI_Output(self, hero, "Info_Mod_Tom_Hi_11_05"); //Um auf Nummer sich gehen zu wollen, habe ich dir diese Frage gestellt.
	AI_Output(hero, self, "Info_Mod_Tom_Hi_15_06"); //Und wozu das Ganze?
	AI_Output(self, hero, "Info_Mod_Tom_Hi_11_07"); //Nun, ich habe da ein Problem, dass ich nicht unbedingt jedem kleinbürgerlichen Spießer aus dieser Stadt anvertrauen kann ... sondern lieber einem anderen Ex-Knacki.
	AI_Output(hero, self, "Info_Mod_Tom_Hi_15_08"); //Was soll ich für dich machen?
	AI_Output(self, hero, "Info_Mod_Tom_Hi_11_09"); //Ein Kumpel von mir hat ein Lager bei der Brücke nahe der Taverne. Ich hab allerdings erfahren, dass ein kleiner Miliztrupp dorthin aufgebrochen ist.
	AI_Output(self, hero, "Info_Mod_Tom_Hi_11_10"); //Du musst ihn unbedingt warnen.

	Mod_Tom_Boese = TRUE;

	Log_CreateTopic	(TOPIC_MOD_TOMSFREUND, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_TOMSFREUND, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_TOMSFREUND, "Ein gewisser Tom bat mich seinen Freund, welcher sich nahe der Taverne bei einer Brücke aufhält, vor einem Miliztrupp zu warnen.");
};

INSTANCE Info_Mod_Tom_Franco (C_INFO)
{
	npc		= Mod_967_BDT_Tom_NW;
	nr		= 1;
	condition	= Info_Mod_Tom_Franco_Condition;
	information	= Info_Mod_Tom_Franco_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab Franco gewarnt.";
};

FUNC INT Info_Mod_Tom_Franco_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Franco_Warnung))
	&& (Mod_Tom_Boese == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tom_Franco_Info()
{
	AI_Output(hero, self, "Info_Mod_Tom_Franco_15_00"); //Ich hab Franco gewarnt. Er hat gesagt er geht zu Edgor.
	AI_Output(self, hero, "Info_Mod_Tom_Franco_11_01"); //Sehr gut, danke.

	B_LogEntry	(TOPIC_MOD_TOMSFREUND, "Ich hab Tom von der Flucht Francos berichtet.");
	B_SetTopicStatus	(TOPIC_MOD_TOMSFREUND, LOG_SUCCESS);

	Mod_Tom_Boese = FALSE;

	B_GivePlayerXP	(100);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Tom_Belohnung (C_INFO)
{
	npc		= Mod_967_BDT_Tom_NW;
	nr		= 1;
	condition	= Info_Mod_Tom_Belohnung_Condition;
	information	= Info_Mod_Tom_Belohnung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie stehts mit einer Belohnung?";
};

FUNC INT Info_Mod_Tom_Belohnung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tom_Franco))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tom_Belohnung_Info()
{
	AI_Output(hero, self, "Info_Mod_Tom_Belohnung_15_00"); //Wie stehts mit einer Belohnung?
	AI_Output(self, hero, "Info_Mod_Tom_Belohnung_11_01"); //Gut, du hast mir einen Gefallen getan, jetzt tue ich dir einen.
	AI_Output(self, hero, "Info_Mod_Tom_Belohnung_11_02"); //Nimm diesen Ring und gehe zu Edgor. Er befindet sich in der Nähe von Bengars Hof.

	B_GiveInvItems	(self, hero, Mod_Banditenring, 1);

	AI_Output(self, hero, "Info_Mod_Tom_Belohnung_11_03"); //Du wirst etwas für ihn erledigen müssen und dann gibt er dir die erste Hälfte eines Wortes. Wenn du beide Hälften hast, dann kannst du zu unserem Hauptlager gehen und du wirst aufgenommen.

	Log_CreateTopic	(TOPIC_MOD_AUFNAHME_BANDITEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AUFNAHME_BANDITEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AUFNAHME_BANDITEN, "Tom hat mir einen Ring gegeben mit dem ich zu Edgor gehen soll. Von diesem erhalte ich dann die erste Hälfte eines Wortes. Wenn ich beide Hälften habe, werde ich aufgenommen.");
};

INSTANCE Info_Mod_Tom_Krautquest (C_INFO)
{
	npc		= Mod_967_BDT_Tom_NW;
	nr		= 1;
	condition	= Info_Mod_Tom_Krautquest_Condition;
	information	= Info_Mod_Tom_Krautquest_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Tom_Krautquest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Senyan_TomKraut))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tom_Krautquest_Info()
{
	AI_Output(self, hero, "Info_Mod_Tom_Krautquest_11_00"); //Du hier? Hör zu, du musst mir helfen.
	AI_Output(self, hero, "Info_Mod_Tom_Krautquest_11_01"); //Die Schweine haben mich mit Sumpfkrautpflanzen erwischt und wollen mich hier im Kerker versauern lassen.
	AI_Output(hero, self, "Info_Mod_Tom_Krautquest_15_02"); //Soll ich dich freikaufen?
	AI_Output(self, hero, "Info_Mod_Tom_Krautquest_11_03"); //Ja, schau bitte, was du tun kannst. Obwohl ich mir nicht sicher bin, ob Andre sich darauf einlässt.
	AI_Output(hero, self, "Info_Mod_Tom_Krautquest_15_04"); //Ok, ich werde mit ihm sprechen.

	B_LogEntry	(TOPIC_MOD_TOM_KRAUT, "Ich sollte mal schauen, ob ich bei Andre eine Freilassung erwirken kann.");
};

INSTANCE Info_Mod_Tom_Krautquest2 (C_INFO)
{
	npc		= Mod_967_BDT_Tom_NW;
	nr		= 1;
	condition	= Info_Mod_Tom_Krautquest2_Condition;
	information	= Info_Mod_Tom_Krautquest2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Schlechte Nachrichten ...";
};

FUNC INT Info_Mod_Tom_Krautquest2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_TomKraut))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tom_Krautquest2_Info()
{
	AI_Output(hero, self, "Info_Mod_Tom_Krautquest2_15_00"); //Schlechte Nachrichten ...
	AI_Output(self, hero, "Info_Mod_Tom_Krautquest2_11_01"); //Ja, ich weiß, habe alles mit angehört.
	AI_Output(hero, self, "Info_Mod_Tom_Krautquest2_15_02"); //Wie nun weiter?
	AI_Output(self, hero, "Info_Mod_Tom_Krautquest2_11_03"); //Nun, lass mich nachdenken ... Soweit ich es mitbekommen habe, befindet sich das Sumpfkraut in der Asservatentruhe hinter Andre ...
	AI_Output(hero, self, "Info_Mod_Tom_Krautquest2_15_04"); //Soll ich es stehlen?
	AI_Output(self, hero, "Info_Mod_Tom_Krautquest2_11_05"); //Nein, so einfach ist es wohl nicht.
	AI_Output(self, hero, "Info_Mod_Tom_Krautquest2_11_06"); //Letztendlich können die Torwachen bezeugen, wie mir das Kraut abgenommen wurde ... und allein Mikas Wort bedeutet eine ganze Menge.
	AI_Output(hero, self, "Info_Mod_Tom_Krautquest2_15_07"); //Was dann?
	AI_Output(self, hero, "Info_Mod_Tom_Krautquest2_11_08"); //Hmm ... das Kraut haben sie gesehen ...
	AI_Output(self, hero, "Info_Mod_Tom_Krautquest2_11_09"); //Da fällt mir ein, dass ich mal ein Kraut gesehen habe, dass Sumpfkraut sehr ähnlich sah ... aber es war eben kein Sumpfkraut.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Tom_Krautquest3 (C_INFO)
{
	npc		= Mod_967_BDT_Tom_NW;
	nr		= 1;
	condition	= Info_Mod_Tom_Krautquest3_Condition;
	information	= Info_Mod_Tom_Krautquest3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Tom_Krautquest3_Condition()
{
	if (Mod_SenyanTom_Kraut == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tom_Krautquest3_Info()
{
	AI_Output(self, hero, "Info_Mod_Tom_Krautquest3_11_00"); //Das hast du wirklich großartig hinbekommen. Und ich hatte schon befürchtet, ich müsste dort ewig versauern. (lacht)
	AI_Output(self, hero, "Info_Mod_Tom_Krautquest3_11_01"); //Du hättest mal das Gesicht von Andre sehen sollen, als er mich aus der Zelle ließ und mir mit Worten des Bedauerns einen dicken Beutel voller Münzen in die Hand drückte, hähä ...
	AI_Output(self, hero, "Info_Mod_Tom_Krautquest3_11_02"); //Hier, das Gold steht selbstverständlich dir zu.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_Tom_Krautquest3_11_03"); //Und nimm noch diesen Ring hier. Den hast du dir ebenfalls redlich verdient.

	B_GiveInvItems	(self, hero, ItRi_Talentring, 1);

	AI_Output(self, hero, "Info_Mod_Tom_Krautquest3_11_04"); //Pass auf dich auf.

	B_GivePlayerXP	(200);

	B_SetTopicStatus	(TOPIC_MOD_TOM_KRAUT, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Tom_Pickpocket (C_INFO)
{
	npc		= Mod_967_BDT_Tom_NW;
	nr		= 1;
	condition	= Info_Mod_Tom_Pickpocket_Condition;
	information	= Info_Mod_Tom_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Tom_Pickpocket_Condition()
{
	C_Beklauen	(52, ItMi_Gold, 15);
};

FUNC VOID Info_Mod_Tom_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Tom_Pickpocket);

	Info_AddChoice	(Info_Mod_Tom_Pickpocket, DIALOG_BACK, Info_Mod_Tom_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Tom_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Tom_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Tom_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Tom_Pickpocket);
};

FUNC VOID Info_Mod_Tom_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Tom_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Tom_Pickpocket);

		Info_AddChoice	(Info_Mod_Tom_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Tom_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Tom_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Tom_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Tom_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Tom_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Tom_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Tom_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Tom_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Tom_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Tom_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Tom_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Tom_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Tom_EXIT (C_INFO)
{
	npc		= Mod_967_BDT_Tom_NW;
	nr		= 1;
	condition	= Info_Mod_Tom_EXIT_Condition;
	information	= Info_Mod_Tom_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Tom_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Tom_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};