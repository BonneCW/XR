INSTANCE Info_Mod_Jana_BerndTot (C_INFO)
{
	npc		= Mod_1064_VLK_Jana_NW;
	nr		= 1;
	condition	= Info_Mod_Jana_BerndTot_Condition;
	information	= Info_Mod_Jana_BerndTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jana_BerndTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Bernd))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jana_BerndTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Jana_BerndTot_16_00"); //AAAAAAAAAAAAAAHHHHH!!!
	AI_Output(hero, self, "Info_Mod_Jana_BerndTot_15_01"); //Beruhige dich, ist ja schon gut! Ich bin von der Miliz.
	AI_Output(self, hero, "Info_Mod_Jana_BerndTot_16_02"); //Das hab ich mir bei IHM auch gedacht!
	AI_Output(hero, self, "Info_Mod_Jana_BerndTot_15_03"); //Wovon redest du?
	AI_Output(self, hero, "Info_Mod_Jana_BerndTot_16_04"); //Na von dem Typ, der Bernd abgeschlachtet hat!
	AI_Output(hero, self, "Info_Mod_Jana_BerndTot_15_05"); //Das war ein Milize?
	AI_Output(self, hero, "Info_Mod_Jana_BerndTot_16_06"); //Ja, hörst du mir eigentlich nicht zu, dass du alles nochmal fragst? Das war so 'n dunkler Typ, der eine Milizuniform trug!
	AI_Output(hero, self, "Info_Mod_Jana_BerndTot_15_07"); //Der ist einfach rein spaziert und hat Bernd niedergestreckt?
	AI_Output(self, hero, "Info_Mod_Jana_BerndTot_16_08"); //Ja, glaubt du ich hätte mich ihm in den Weg gestellt? War ja selbst damit beschäftigt mich Bernd zu erwehren und der Typ sah um einiges gefährlicher aus.
	AI_Output(hero, self, "Info_Mod_Jana_BerndTot_15_09"); //Geht’s auch etwas genauer als "Dunkler Typ mit Milizuniform"?
	AI_Output(self, hero, "Info_Mod_Jana_BerndTot_16_10"); //Nein, das ist alles was ich noch weiß, ich hätte ja beinahe 'nen Herzinfarkt bekommen.
	AI_Output(hero, self, "Info_Mod_Jana_BerndTot_15_11"); //Na gut ... Ich werde dem Hauptmann Bescheid sagen. Kannst du dich sonst noch an etwas erinnern?
	AI_Output(self, hero, "Info_Mod_Jana_BerndTot_16_12"); //Jetzt wo du’s sagst ... er hat irgendein komisches Zeug gelabert. Irgendwas von wegen "Ein Guter Milize schützt stets die Schwächeren.", das hat er immer wieder wiederholt.
	AI_Output(hero, self, "Info_Mod_Jana_BerndTot_15_13"); //Hmm ... Danke für die Information.

	B_LogEntry	(TOPIC_MOD_PAL_RL, "Bernd wurde von einer dunklen Gestalt in Milizuniform ermordet. Jana konnte sich nur an einen Satz erinnern, welchen der Täter ständig wiederholt hat: 'Ein Guter Milize schützt stets die Schwächeren.'");
};

INSTANCE Info_Mod_Jana_Shakir (C_INFO)
{
	npc		= Mod_1064_VLK_Jana_NW;
	nr		= 1;
	condition	= Info_Mod_Jana_Shakir_Condition;
	information	= Info_Mod_Jana_Shakir_Info;
	permanent	= 0;
	important	= 0;
	description	= "Guten Tag, schöne Frau. Worauf wartest du?";
};

FUNC INT Info_Mod_Jana_Shakir_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Edda_Shakir))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jana_Shakir_Info()
{
	AI_Output(hero, self, "Info_Mod_Jana_Shakir_15_00"); //Guten Tag, schöne Frau. Worauf wartest du?
	AI_Output(self, hero, "Info_Mod_Jana_Shakir_16_01"); //Auf dich sicher nicht. Und was geht's dich an?
	AI_Output(hero, self, "Info_Mod_Jana_Shakir_15_02"); //Nun, ich suche eine Dame für ... gewissermaßen ... zur Entspannung ...
	AI_Output(self, hero, "Info_Mod_Jana_Shakir_16_03"); //(laut) Scher dich, du Strolch, und mach's dir selber!
	AI_Output(self, hero, "Info_Mod_Jana_Shakir_16_04"); //Ich bin eine ehrbare Frau, die auf ihren Mann wartet.
	AI_Output(self, hero, "Info_Mod_Jana_Shakir_16_05"); //Wenn der zurückkommt, kannst du was erleben!
	AI_Output(hero, self, "Info_Mod_Jana_Shakir_15_06"); //Bitte vielmals um Entschuldigung. Ich dachte nur ...
	AI_Output(self, hero, "Info_Mod_Jana_Shakir_16_07"); //Ist offensichtlich nicht deine starke Seite.
	AI_Output(self, hero, "Info_Mod_Jana_Shakir_16_08"); //Probiers oben in der Unterstadt. Die Nichte von Thorben, die Gritta, braucht immer Geld. Hat überall Schulden.
	AI_Output(self, hero, "Info_Mod_Jana_Shakir_16_09"); //(laut) Aber sag nicht, dass ich das gesagt habe!
	AI_Output(hero, self, "Info_Mod_Jana_Shakir_15_10"); //Entschuldigung nochmal.

	B_LogEntry	(TOPIC_MOD_ASS_SHAKIR_FRAU, "Jana war stinksauer. Sie sei eine ehrbare Frau. Was man von Gritta, Thorbens Nichte, nicht behaupten könne. Mal sehen.");
};

INSTANCE Info_Mod_Jana_Beutel (C_INFO)
{
	npc		= Mod_1064_VLK_Jana_NW;
	nr		= 1;
	condition	= Info_Mod_Jana_Beutel_Condition;
	information	= Info_Mod_Jana_Beutel_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jana_Beutel_Condition()
{
	if (Mod_Jana_Beutel == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jana_Beutel_Info()
{
	AI_Output(self, hero, "Info_Mod_Jana_Beutel_16_00"); //Junger Mann, bleib' doch kurz stehen.

	Info_ClearChoices	(Info_Mod_Jana_Beutel);

	Info_AddChoice	(Info_Mod_Jana_Beutel, "Keine Zeit.", Info_Mod_Jana_Beutel_B);
	Info_AddChoice	(Info_Mod_Jana_Beutel, "Was gibt's?", Info_Mod_Jana_Beutel_A);
};

FUNC VOID Info_Mod_Jana_Beutel_B()
{
	AI_Output(hero, self, "Info_Mod_Jana_Beutel_B_15_00"); //Keine Zeit.

	Info_ClearChoices	(Info_Mod_Jana_Beutel);
};

FUNC VOID Info_Mod_Jana_Beutel_A()
{
	AI_Output(hero, self, "Info_Mod_Jana_Beutel_A_15_00"); //Was gibt's?
	AI_Output(self, hero, "Info_Mod_Jana_Beutel_A_16_01"); //Ich war gerade einkaufen, und nun ist mein Einkaufsbeutel so schwer, dass ich ihn nicht mehr tragen kann.
	AI_Output(self, hero, "Info_Mod_Jana_Beutel_A_16_02"); //Wärst du so freundlich, ihn mir nach Hause zu bringen?

	Info_ClearChoices	(Info_Mod_Jana_Beutel);

	Info_AddChoice	(Info_Mod_Jana_Beutel, "Ich bin doch kein Packesel!", Info_Mod_Jana_Beutel_D);
	Info_AddChoice	(Info_Mod_Jana_Beutel, "Kein Problem. Wo wohnst du denn?", Info_Mod_Jana_Beutel_C);
};

FUNC VOID Info_Mod_Jana_Beutel_D()
{
	AI_Output(hero, self, "Info_Mod_Jana_Beutel_D_15_00"); //Ich bin doch kein Packesel!

	Info_ClearChoices	(Info_Mod_Jana_Beutel);
};

FUNC VOID Info_Mod_Jana_Beutel_C()
{
	AI_Output(hero, self, "Info_Mod_Jana_Beutel_C_15_00"); //Kein Problem. Wo wohnst du denn?
	AI_Output(self, hero, "Info_Mod_Jana_Beutel_C_16_01"); //Im Hafenviertel, im Haus zwischen Fellan und der Lagerhalle.
	AI_Output(self, hero, "Info_Mod_Jana_Beutel_C_16_02"); //Stell den Beutel einfach irgendwo ab.

	B_GiveInvItems	(self, hero, ItMi_JanaBeutel, 1);

	Mod_Jana_Beutel = 2;

	Log_CreateTopic	(TOPIC_MOD_JANA_BEUTEL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JANA_BEUTEL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JANA_BEUTEL, "Mann, das Ding ist wirklich verdammt schwer. Ich sollte sehen, dass ich es möglichst schnell in der Hütte zwischen Fellan und der Lagerhalle ablege.");

	AI_SetWalkMode	(hero, NPC_WALK);

	Info_ClearChoices	(Info_Mod_Jana_Beutel);

};

INSTANCE Info_Mod_Jana_Beutel2 (C_INFO)
{
	npc		= Mod_1064_VLK_Jana_NW;
	nr		= 1;
	condition	= Info_Mod_Jana_Beutel2_Condition;
	information	= Info_Mod_Jana_Beutel2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Einkaufsbeutel befindet sich nun in deinem Haus.";
};

FUNC INT Info_Mod_Jana_Beutel2_Condition()
{
	if (Mod_Jana_Beutel == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jana_Beutel2_Info()
{
	AI_Output(hero, self, "Info_Mod_Jana_Beutel2_15_00"); //Der Einkaufsbeutel befindet sich nun in deinem Haus.
	AI_Output(self, hero, "Info_Mod_Jana_Beutel2_16_01"); //Ich danke dir, junger Mann. Nimm diese Münzen als Dank.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	B_GivePlayerXP	(100);

	B_SetTopicStatus	(TOPIC_MOD_JANA_BEUTEL, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Jana_Pickpocket (C_INFO)
{
	npc		= Mod_1064_VLK_Jana_NW;
	nr		= 1;
	condition	= Info_Mod_Jana_Pickpocket_Condition;
	information	= Info_Mod_Jana_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Jana_Pickpocket_Condition()
{
	C_Beklauen	(53, ItMi_Gold, 80);
};

FUNC VOID Info_Mod_Jana_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Jana_Pickpocket);

	Info_AddChoice	(Info_Mod_Jana_Pickpocket, DIALOG_BACK, Info_Mod_Jana_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Jana_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Jana_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Jana_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Jana_Pickpocket);
};

FUNC VOID Info_Mod_Jana_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Jana_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Jana_Pickpocket);

		Info_AddChoice	(Info_Mod_Jana_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Jana_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Jana_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Jana_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Jana_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Jana_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Jana_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Jana_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Jana_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Jana_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Jana_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Jana_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Jana_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Jana_EXIT (C_INFO)
{
	npc		= Mod_1064_VLK_Jana_NW;
	nr		= 1;
	condition	= Info_Mod_Jana_EXIT_Condition;
	information	= Info_Mod_Jana_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Jana_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jana_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};