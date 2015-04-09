INSTANCE Info_Mod_Bramrad_Hi (C_INFO)
{
	npc		= Mod_1019_KGD_Bamrad_MT;
	nr		= 1;
	condition	= Info_Mod_Bramrad_Hi_Condition;
	information	= Info_Mod_Bramrad_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Bramrad_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bramrad_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Bramrad_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Bramrad_Hi_07_01"); //Hi, was gibt's?
	AI_Output(hero, self, "Info_Mod_Bramrad_Hi_15_02"); //Du bist doch Jäger. Ist das Minental nicht ziehmlich gefährlich zum Jagen?
	AI_Output(self, hero, "Info_Mod_Bramrad_Hi_07_03"); //Wenn man weiß, wo man jagen kann, ist das Minental auch nicht gefährlicher, als der Rest von Khorinis.
	AI_Output(self, hero, "Info_Mod_Bramrad_Hi_07_04"); //Außerdem haben wir Glück. Auf dem Weg ins Minental tummeln sich genug Scavenger, so dass wir nur selten tiefer ins Tal gehen müssen.
	AI_Output(hero, self, "Info_Mod_Bramrad_Hi_15_05"); //Also ernährt ihr euch fast nur von Scavengern?
	AI_Output(self, hero, "Info_Mod_Bramrad_Hi_07_06"); //Sie sind nun mal leicht zu töten, aber ab und zu finden wir am Pass auch ein paar Molerats, die sind noch leichter zu töten, weil sie so langsam sind, so dass sie meistens schon tot sind bevor sie einen erreichen.
	AI_Output(self, hero, "Info_Mod_Bramrad_Hi_07_07"); //Tja, wenn Mutter Natur ein Tier benachteiligt hat, dann die!
};

INSTANCE Info_Mod_Bramrad_Nahrungsversorgung (C_INFO)
{
	npc		= Mod_1019_KGD_Bamrad_MT;
	nr		= 1;
	condition	= Info_Mod_Bramrad_Nahrungsversorgung_Condition;
	information	= Info_Mod_Bramrad_Nahrungsversorgung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ole hat mir gesagt, dass ich dir bei deiner Aufgabe helfen soll. ";
};

FUNC INT Info_Mod_Bramrad_Nahrungsversorgung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ole_Vorbereitungen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bramrad_Nahrungsversorgung_Info()
{
	AI_Output(hero, self, "Info_Mod_Bramrad_Nahrungsversorgung_15_00"); //Ole hat mir gesagt, dass ich dir bei deiner Aufgabe helfen soll. 
	AI_Output(self, hero, "Info_Mod_Bramrad_Nahrungsversorgung_07_01"); //Gut, ich soll die Nahrungsversorgen der Mine sichern. Allerdings muss ich noch eine Menge Fleisch auftreiben und eine Koch bräuchten wir auch noch.
	AI_Output(self, hero, "Info_Mod_Bramrad_Nahrungsversorgung_07_02"); //Ich habe gehört im Hafenviertel gibt es einige Leute, die Kochen können.
	AI_Output(self, hero, "Info_Mod_Bramrad_Nahrungsversorgung_07_03"); //Vielleicht kannst du ja dort jemanden von unserem Vorhaben überzeugen.
	AI_Output(self, hero, "Info_Mod_Bramrad_Nahrungsversorgung_07_04"); //Und wegen dem Fleisch: Ich würde sagen 25 Keulen sollten reichen.
	AI_Output(hero, self, "Info_Mod_Bramrad_Nahrungsversorgung_15_05"); //Dann werde ich mal sehen, wo ich deinen Koch und das Fleisch auftreibe.

	Log_CreateTopic	(TOPIC_MOD_KG_NAHRUNGSVERSORGUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KG_NAHRUNGSVERSORGUNG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KG_NAHRUNGSVERSORGUNG, "Bramrad ist für die Nahrungsversorgung eingeteilt. Er braucht noch 25 Keulen. Außerdem soll ich noch einen Koch für das Lager organisieren. Bramrad meint ich solle mal im Hafen von Khorinis nachschauen ...");
};

INSTANCE Info_Mod_Bramrad_Nahrungsversorgung2 (C_INFO)
{
	npc		= Mod_1019_KGD_Bamrad_MT;
	nr		= 1;
	condition	= Info_Mod_Bramrad_Nahrungsversorgung2_Condition;
	information	= Info_Mod_Bramrad_Nahrungsversorgung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, ich hab das nötige Fleisch aufgetrieben.";
};

FUNC INT Info_Mod_Bramrad_Nahrungsversorgung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bramrad_Nahrungsversorgung))
	&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= 25)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bramrad_Nahrungsversorgung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Bramrad_Nahrungsversorgung2_15_00"); //Hier, ich hab das nötige Fleisch aufgetrieben.

	B_GiveInvItems	(hero, self, ItFo_MuttonRaw, 25);

	AI_Output(self, hero, "Info_Mod_Bramrad_Nahrungsversorgung2_07_01"); //Danke, jetzt hab ich eine Sorge weniger.
	
	B_LogEntry	(TOPIC_MOD_KG_NAHRUNGSVERSORGUNG, "Ich habe Bramrad das Fleisch gegeben.");

	if (Npc_KnowsInfo(hero, Info_Mod_Bramrad_Nahrungsversorgung3))
	{
		B_SetTopicStatus	(TOPIC_MOD_KG_NAHRUNGSVERSORGUNG, LOG_SUCCESS);

		AI_Output(hero, self, "Info_Mod_Bramrad_Nahrungsversorgung4_15_02"); //Ich habe alles, was du wolltest, erledigt.
		AI_Output(self, hero, "Info_Mod_Bramrad_Nahrungsversorgung4_07_03"); //Endlich macht mal wieder jemand was im Lager. Hier nimm das als Entschädigung für denen Mühen.

		CreateInvItems	(hero, ItRw_Bolt, 25);
		CreateInvItems	(hero, ItRw_Arrow, 25);

		B_ShowGivenThings	("25 Bolzen und Pfeile erhalten");

		B_LogEntry_NS (TOPIC_MOD_KG_VORBEREITUNGEN, "Bramrad ist geholfen und die Versorgungsprobleme gelöst.");
	};

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Bramrad_Nahrungsversorgung3 (C_INFO)
{
	npc		= Mod_1019_KGD_Bamrad_MT;
	nr		= 1;
	condition	= Info_Mod_Bramrad_Nahrungsversorgung3_Condition;
	information	= Info_Mod_Bramrad_Nahrungsversorgung3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab dir einen Koch besorgt.";
};

FUNC INT Info_Mod_Bramrad_Nahrungsversorgung3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bramrad_Nahrungsversorgung))
	&& (Mod_KG_Glenn == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bramrad_Nahrungsversorgung3_Info()
{
	AI_Output(hero, self, "Info_Mod_Bramrad_Nahrungsversorgung3_15_00"); //Ich hab dir einen Koch besorgt. Er wartet vor der Mine auf seinen Einsatz.
	AI_Output(self, hero, "Info_Mod_Bramrad_Nahrungsversorgung3_07_01"); //Sehr schön, ich hoffe er beherrscht das kochen.
	
	B_LogEntry	(TOPIC_MOD_KG_NAHRUNGSVERSORGUNG, "Ich habe Bramrad wegen Glenn informiert");

	if (Npc_KnowsInfo(hero, Info_Mod_Bramrad_Nahrungsversorgung2))
	{
		B_SetTopicStatus	(TOPIC_MOD_KG_NAHRUNGSVERSORGUNG, LOG_SUCCESS);

		AI_Output(hero, self, "Info_Mod_Bramrad_Nahrungsversorgung4_15_02"); //Ich habe alles, was du wolltest, erledigt.
		AI_Output(self, hero, "Info_Mod_Bramrad_Nahrungsversorgung4_07_03"); //Endlich macht mal wieder jemand was im Lager. Hier nimm das als Entschädigung für denen Mühen.

		CreateInvItems	(hero, ItRw_Bolt, 25);
		CreateInvItems	(hero, ItRw_Arrow, 25);

		B_ShowGivenThings	("25 Bolzen und Pfeile erhalten");

		B_LogEntry_NS (TOPIC_MOD_KG_VORBEREITUNGEN, "Bramrad ist geholfen und die Versorgungsprobleme gelöst.");
	};

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Bramrad_Pickpocket (C_INFO)
{
	npc		= Mod_1019_KGD_Bamrad_MT;
	nr		= 1;
	condition	= Info_Mod_Bramrad_Pickpocket_Condition;
	information	= Info_Mod_Bramrad_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Bramrad_Pickpocket_Condition()
{
	C_Beklauen	(71, ItMi_Gold, 23);
};

FUNC VOID Info_Mod_Bramrad_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bramrad_Pickpocket);

	Info_AddChoice	(Info_Mod_Bramrad_Pickpocket, DIALOG_BACK, Info_Mod_Bramrad_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bramrad_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bramrad_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bramrad_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bramrad_Pickpocket);
};

FUNC VOID Info_Mod_Bramrad_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Bramrad_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Bramrad_Pickpocket);

		Info_AddChoice	(Info_Mod_Bramrad_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Bramrad_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Bramrad_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Bramrad_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Bramrad_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Bramrad_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Bramrad_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Bramrad_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Bramrad_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Bramrad_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Bramrad_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Bramrad_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Bramrad_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Bramrad_EXIT (C_INFO)
{
	npc		= Mod_1019_KGD_Bamrad_MT;
	nr		= 1;
	condition	= Info_Mod_Bramrad_EXIT_Condition;
	information	= Info_Mod_Bramrad_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bramrad_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bramrad_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};