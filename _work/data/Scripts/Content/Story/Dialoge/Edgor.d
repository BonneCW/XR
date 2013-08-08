INSTANCE Info_Mod_Edgor_Hi (C_INFO)
{
	npc		= Mod_946_BDT_Edgor_NW;
	nr		= 1;
	condition	= Info_Mod_Edgor_Hi_Condition;
	information	= Info_Mod_Edgor_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Edgor_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Edgor_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Edgor_Hi_31_00"); //Was willst du hier? Verschwinde.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Edgor_Ring (C_INFO)
{
	npc		= Mod_946_BDT_Edgor_NW;
	nr		= 1;
	condition	= Info_Mod_Edgor_Ring_Condition;
	information	= Info_Mod_Edgor_Ring_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Edgor_Ring_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tom_Belohnung))
	&& (Npc_HasItems(hero, Mod_Banditenring) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edgor_Ring_Info()
{
	AI_Output(self, hero, "Info_Mod_Edgor_Ring_31_00"); //Woher hast du diesen Ring?
};

INSTANCE Info_Mod_Edgor_Tom (C_INFO)
{
	npc		= Mod_946_BDT_Edgor_NW;
	nr		= 1;
	condition	= Info_Mod_Edgor_Tom_Condition;
	information	= Info_Mod_Edgor_Tom_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tom hat ihn mir gegeben.";
};

FUNC INT Info_Mod_Edgor_Tom_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Edgor_Ring))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edgor_Tom_Info()
{
	AI_Output(hero, self, "Info_Mod_Edgor_Tom_15_00"); //Tom hat ihn mir gegeben. Er hat mich damit zu dir geschickt, damit du mir die erste Hälfte des Losungswortes gibst.
	AI_Output(self, hero, "Info_Mod_Edgor_Tom_31_01"); //Und du denkst, ich verrate es dir jetzt einfach so? Das hättest du wohl gerne.
	AI_Output(self, hero, "Info_Mod_Edgor_Tom_31_02"); //Wenn du die erste Hälfte haben willst, dann musst du auch was dafür machen.

	B_LogEntry	(TOPIC_MOD_AUFNAHME_BANDITEN, "Edgor will mir die erste Hälfte des Losungswortes nicht verraten. Ich soll erst etwas für ihn machen.");
};

INSTANCE Info_Mod_Edgor_Aufgabe (C_INFO)
{
	npc		= Mod_946_BDT_Edgor_NW;
	nr		= 1;
	condition	= Info_Mod_Edgor_Aufgabe_Condition;
	information	= Info_Mod_Edgor_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was soll ich für dich machen?";
};

FUNC INT Info_Mod_Edgor_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Edgor_Tom))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edgor_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Edgor_Aufgabe_15_00"); //Was soll ich für dich machen?
	AI_Output(self, hero, "Info_Mod_Edgor_Aufgabe_31_01"); //Besorge mir, ähh ... zwölf Stängel Sumpfkraut, sechs Flaschen Wacholder, vier Flaschen Wein, drei Bier, einen Schinken, fünf gebratene Fleischstücke, drei Stück Käse, zwei Flaschen Milch ... und ...
	AI_Output(hero, self, "Info_Mod_Edgor_Aufgabe_15_02"); //(ungläubig) Sonst noch was?
	AI_Output(self, hero, "Info_Mod_Edgor_Aufgabe_31_03"); //Wo du schon fragst ... 300 Goldmünzen wären auch nicht schlecht ...
	AI_Output(hero, self, "Info_Mod_Edgor_Aufgabe_15_04"); //...
	AI_Output(self, hero, "Info_Mod_Edgor_Aufgabe_31_05"); //Hey, jetzt sieh mich nicht so an. Von irgendwas muss ich ja auch leben.
	AI_Output(self, hero, "Info_Mod_Edgor_Aufgabe_31_06"); //Habe schon damals nur wenig aus dem Minental mitbringen können ... und zudem haben sich noch diese verdammten Räuber um Khorinis breit gemacht und lassen uns Banditen nur wenig zum Plündern übrig.

	Log_CreateTopic	(TOPIC_MOD_EDGORSGOLD, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EDGORSGOLD, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_EDGORSGOLD, "Ich soll Edgor zwölf Stängel Sumpfkraut, sechs Flaschen Wacholder, vier Flaschen Wein, drei Bier, einen Schinken, fünf gebratene Fleischstücke, drei Stück Käse, zwei Flaschen Milch und 300 Goldmünzen bringen, dann verrät er mir die erste Hälfte des Losungswortes.");
};

INSTANCE Info_Mod_Edgor_Raeuber (C_INFO)
{
	npc		= Mod_946_BDT_Edgor_NW;
	nr		= 1;
	condition	= Info_Mod_Edgor_Raeuber_Condition;
	information	= Info_Mod_Edgor_Raeuber_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Räuber sind Geschichte ...";
};

FUNC INT Info_Mod_Edgor_Raeuber_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Edgor_Aufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Edgor_Gold))
	&& (Npc_IsDead(Mod_7772_BDT_Bandit_NW))
	&& (Npc_IsDead(Mod_7773_BDT_Bandit_NW))
	&& (Npc_IsDead(Mod_7774_BDT_Bandit_NW))
	&& (Npc_IsDead(Mod_7775_BDT_Bandit_NW))
	&& (Npc_IsDead(Mod_7776_BDT_Bandit_NW))
	&& (Npc_IsDead(Mod_7777_BDT_Bandit_NW))
	&& (Npc_IsDead(Mod_7778_BDT_Bandit_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edgor_Raeuber_Info()
{
	AI_Output(hero, self, "Info_Mod_Edgor_Raeuber_15_00"); //Die Räuber sind Geschichte ...
	AI_Output(self, hero, "Info_Mod_Edgor_Raeuber_31_01"); //Echt? Na, ist die Miliz ja also doch zu was zu gebrauchen. (lacht)
	AI_Output(hero, self, "Info_Mod_Edgor_Raeuber_15_02"); //Ähm ...
	AI_Output(self, hero, "Info_Mod_Edgor_Raeuber_31_03"); //Dann werde ich auch bald wieder die vollen Taschen und Wägen der fetten Händler plündern können, die hier vorbeiziehen. (lacht)

	if (Npc_KnowsInfo(hero, Info_Mod_Edgor_Gold))
	{
		AI_Output(self, hero, "Info_Mod_Edgor_Raeuber_31_04"); //Nichts für ungut. Hier, nimm für die tolle Neuigkeit den fetten Schinken, der mir noch geblieben ist, 'n Bier und die 2 Stängel.

		B_ShowGivenThings	("Schinken, Bier und 2 Stängel Sumpfkraut erhalten");

		CreateInvItems	(hero, ItFo_Bacon, 1);
		CreateInvItems	(hero, ItFo_Beer, 1);
		CreateInvItems	(hero, ItMi_Joint, 2);

		AI_Output(self, hero, "Info_Mod_Edgor_Raeuber_31_05"); //Viel Spaß damit.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Edgor_Raeuber_31_06"); //Für diese tolle Nachricht verrate ich dir die erste Hälfte des Losungswortes. Sie heißt: Dex.
		AI_Output(self, hero, "Info_Mod_Edgor_Raeuber_31_07"); //Die zweite Hälfte wird dir Senyan geben. Er befindet sich in der Nähe von Sekobs Hof.

		B_LogEntry_More	(TOPIC_MOD_AUFNAHME_BANDITEN, TOPIC_MOD_EDGORSGOLD, "Die erste Hälfte heißt: Dex. Die zweite Hälfte hat Senyan, der sich in der Nähe von Sekobs Hof befindet.", "Ich hab Edgor von den erledigten Räubern berichtet. Das hat ihm offenbar gereicht ...");
		B_SetTopicStatus	(TOPIC_MOD_EDGORSGOLD, LOG_SUCCESS);

		B_Göttergefallen(3, 1);
	};

	B_GivePlayerXP	(400);
};

INSTANCE Info_Mod_Edgor_Gold (C_INFO)
{
	npc		= Mod_946_BDT_Edgor_NW;
	nr		= 1;
	condition	= Info_Mod_Edgor_Gold_Condition;
	information	= Info_Mod_Edgor_Gold_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab die Sachen.";
};

FUNC INT Info_Mod_Edgor_Gold_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Edgor_Aufgabe))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 400)
	&& (Npc_HasItems(hero, ItMi_Joint) >= 12)
	&& (Npc_HasItems(hero, ItFo_Booze) >= 6)
	&& (Npc_HasItems(hero, ItFo_Wine) >= 4)
	&& (Npc_HasItems(hero, ItFo_Beer) >= 3)
	&& (Npc_HasItems(hero, ItFo_Bacon) >= 1)
	&& (Npc_HasItems(hero, ItFo_Mutton) >= 5)
	&& (Npc_HasItems(hero, ItFo_Cheese) >= 3)
	&& (Npc_HasItems(hero, ItFo_Milk) >= 2)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Edgor_Raeuber))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edgor_Gold_Info()
{
	AI_Output(hero, self, "Info_Mod_Edgor_Gold_15_00"); //Ich hab die Sachen.

	Npc_RemoveInvItems	(hero, ItFo_Booze, 6);
	Npc_RemoveInvItems	(hero, ItMi_Gold, 400);
	Npc_RemoveInvItems	(hero, ItMi_Joint, 12);
	Npc_RemoveInvItems	(hero, ItFo_Wine, 4);
	Npc_RemoveInvItems	(hero, ItFo_Beer, 3);
	Npc_RemoveInvItems	(hero, ItFo_Bacon, 1);
	Npc_RemoveInvItems	(hero, ItFo_Mutton, 5);
	Npc_RemoveInvItems	(hero, ItFo_Cheese, 3);
	Npc_RemoveInvItems	(hero, ItFo_Milk, 2);

	B_ShowGivenThings	("Edgors Sachen gegeben");

	AI_Output(self, hero, "Info_Mod_Edgor_Gold_31_01"); //Endlich wieder ein wenig was zu essen und zu trinken.
	AI_Output(hero, self, "Info_Mod_Edgor_Gold_15_02"); //Verrätst du mir jetzt den ersten Teil?
	AI_Output(self, hero, "Info_Mod_Edgor_Gold_31_03"); //Gut, du hast mir meine Sachen gebracht und dafür werde ich dir jetzt helfen.
	AI_Output(self, hero, "Info_Mod_Edgor_Gold_31_04"); //Die erste Hälfte heißt: Dex. Die zweite Hälfte wird dir Senyan geben. Er befindet sich in der Nähe von Sekobs Hof.

	B_GivePlayerXP	(300);

	B_LogEntry_More	(TOPIC_MOD_AUFNAHME_BANDITEN, TOPIC_MOD_EDGORSGOLD, "Die erste Hälfte heißt: Dex. Die zweite Hälfte hat Senyan, der sich in der Nähe von Sekobs Hof befindet.", "Ich hab Edgor seine Sachen gegeben.");
	B_SetTopicStatus	(TOPIC_MOD_EDGORSGOLD, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Edgor_Skinner (C_INFO)
{
	npc		= Mod_946_BDT_Edgor_NW;
	nr		= 1;
	condition	= Info_Mod_Edgor_Skinner_Condition;
	information	= Info_Mod_Edgor_Skinner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier etwas für dich. Mit schönem Gruß von Skinner.";
};

FUNC INT Info_Mod_Edgor_Skinner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	&& (Npc_HasItems(hero, ItMi_Addon_Joint_01) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edgor_Skinner_Info()
{
	AI_Output(hero, self, "Info_Mod_Edgor_Skinner_15_00"); //Ich habe hier etwas für dich. Mit schönem Gruß von Skinner.
	AI_Output(self, hero, "Info_Mod_Edgor_Skinner_31_01"); //Dieser dreckige Hundesohn. Erst raucht er mir nachts vor meiner Abreise mein halbes Sumpfkraut weg, säuft meine Schnapsreserven leer und jetzt schickt er einen Laufburschen mit drei lumpigen Stängeln Sumpfkraut.
	AI_Output(hero, self, "Info_Mod_Edgor_Skinner_15_02"); //Willst du jetzt das Sumpfkraut oder nicht?
	AI_Output(self, hero, "Info_Mod_Edgor_Skinner_31_03"); //Ach, gib schon her.

	B_GiveInvItems	(hero, self, ItMi_Addon_Joint_01, 3);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "Edgor hat seine Stängel bekommen.");
};

INSTANCE Info_Mod_Edgor_IstBandit (C_INFO)
{
	npc		= Mod_946_BDT_Edgor_NW;
	nr		= 1;
	condition	= Info_Mod_Edgor_IstBandit_Condition;
	information	= Info_Mod_Edgor_IstBandit_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Edgor_IstBandit_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_Hi))
	&& (Wld_IsTime(22,15,02,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edgor_IstBandit_Info()
{
	AI_Output(self, hero, "Info_Mod_Edgor_IstBandit_31_00"); //Mann, wie langweilig, die ganze Zeit nur am Lagerfeuer rumsitzen. Es muss endlich mal wieder ein Überfall her.
	AI_Output(self, hero, "Info_Mod_Edgor_IstBandit_31_01"); //Jetzt wäre ein guter Zeitpunkt, um die Schafe auf dem Weidenplateau abzuschlachten. Mit dem Hirten und seinem Hund sollten wir locker fertigwerden. Bist du dabei?
	
	Info_ClearChoices	(Info_Mod_Edgor_IstBandit);

	Info_AddChoice	(Info_Mod_Edgor_IstBandit, "Ich habe wirklich Besseres zu tun (...)", Info_Mod_Edgor_IstBandit_B);
	Info_AddChoice	(Info_Mod_Edgor_IstBandit, "Ja, natürlich, den Spaß lasse ich mir nicht entgehen.", Info_Mod_Edgor_IstBandit_A);
};

FUNC VOID Info_Mod_Edgor_IstBandit_B()
{
	AI_Output(hero, self, "Info_Mod_Edgor_IstBandit_B_15_00"); //Ich habe wirklich Besseres zu tun, als einem Bauern die Schafe auf der Weide abzuschlachten.
	AI_Output(self, hero, "Info_Mod_Edgor_IstBandit_B_31_01"); //Dann eben nicht.
	
	Info_ClearChoices	(Info_Mod_Edgor_IstBandit);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Edgor_IstBandit_A()
{
	AI_Output(hero, self, "Info_Mod_Edgor_IstBandit_A_15_00"); //Ja, natürlich, den Spaß lasse ich mir nicht entgehen.
	AI_Output(self, hero, "Info_Mod_Edgor_IstBandit_A_31_01"); //Na, dann lass uns losziehen.
	
	Info_ClearChoices	(Info_Mod_Edgor_IstBandit);

	Mod_Edgor_SchafeSchlachten = 1;

	Log_CreateTopic	(TOPIC_MOD_BDT_EDGOR, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BDT_EDGOR, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BDT_EDGOR, "Da Edgor langweilig ist, werde ich mit ihm und Franco die Schafe auf dem Weideplateau abschlachten.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "MALAK");
	B_StartOtherRoutine	(Mod_952_BDT_Franco_NW, "MALAK");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_952_BDT_Franco_NW.aivar[AIV_PARTYMEMBER] = TRUE;
};

INSTANCE Info_Mod_Edgor_SchafeTot (C_INFO)
{
	npc		= Mod_946_BDT_Edgor_NW;
	nr		= 1;
	condition	= Info_Mod_Edgor_SchafeTot_Condition;
	information	= Info_Mod_Edgor_SchafeTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Edgor_SchafeTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Edgor_IstBandit))
	&& (Mod_Edgor_Schafeschlachten == 2)
	&& (Npc_IsDead(Sheep_Bengar_04))
	&& (Npc_IsDead(Sheep_Bengar_05))
	&& (Npc_GetDistToWP(Mod_946_BDT_Edgor_NW, "NW_FARM3_MOUNTAINLAKE_05") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Edgor_SchafeTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Edgor_SchafeTot_31_00"); //Na, das war ein Spaß. Die Schafskeulen lassen wir uns jetzt gut schmecken und die Felle werden wir bestimmt irgendwo für ein paar Goldmünzen los. Hier ist dein Anteil.
	
	CreateInvItems	(hero, ItFo_MuttonRaw, 3);
	CreateInvItems	(hero, ItAt_SheepFur, 2);
	
	B_GivePlayerXP	(200);

	Mod_Edgor_SchafeSchlachten = 3;

	B_SetTopicStatus	(TOPIC_MOD_BDT_EDGOR, LOG_SUCCESS);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_952_BDT_Franco_NW, "BEIFRANCO");

	CurrentNQ += 1;

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_952_BDT_Franco_NW.aivar[AIV_PARTYMEMBER] = FALSE;
};

INSTANCE Info_Mod_Edgor_Pickpocket (C_INFO)
{
	npc		= Mod_946_BDT_Edgor_NW;
	nr		= 1;
	condition	= Info_Mod_Edgor_Pickpocket_Condition;
	information	= Info_Mod_Edgor_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Edgor_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 140);
};

FUNC VOID Info_Mod_Edgor_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Edgor_Pickpocket);

	Info_AddChoice	(Info_Mod_Edgor_Pickpocket, DIALOG_BACK, Info_Mod_Edgor_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Edgor_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Edgor_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Edgor_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Edgor_Pickpocket);
};

FUNC VOID Info_Mod_Edgor_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Edgor_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Edgor_Pickpocket);

		Info_AddChoice	(Info_Mod_Edgor_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Edgor_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Edgor_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Edgor_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Edgor_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Edgor_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Edgor_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Edgor_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Edgor_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Edgor_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Edgor_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Edgor_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Edgor_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Edgor_EXIT (C_INFO)
{
	npc		= Mod_946_BDT_Edgor_NW;
	nr		= 1;
	condition	= Info_Mod_Edgor_EXIT_Condition;
	information	= Info_Mod_Edgor_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Edgor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Edgor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};