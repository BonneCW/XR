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
	AI_Output(self, hero, "Info_Mod_Edgor_Hi_06_00"); //Was willst du hier? Verschwinde.

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
	AI_Output(self, hero, "Info_Mod_Edgor_Ring_06_00"); //Woher hast du diesen Ring?
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
	AI_Output(hero, self, "Info_Mod_Edgor_Tom_15_00"); //Tom hat ihn mir gegeben. Er hat mich damit zu dir geschickt damit du mir die erste Hälfte des Losungswortes gibst.
	AI_Output(self, hero, "Info_Mod_Edgor_Tom_06_01"); //Und du denkst ich verrate es dir jetzt einfach so? Das hättest du wohl gerne.
	AI_Output(self, hero, "Info_Mod_Edgor_Tom_06_02"); //Wenn du die erste Hälfte haben willst, dann musst du auch was dafür machen.

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
	AI_Output(self, hero, "Info_Mod_Edgor_Aufgabe_06_01"); //Besorge mir, ähh ... zwölf Stengel Sumpfkraut, sechs Flaschen Wacholder, vier Flaschen Wein, drei Bier, einen Schinken, fünf gebratene Fleischstücke, drei Stück Käse, zwei Flaschen Milch ... und ...
	AI_Output(hero, self, "Info_Mod_Edgor_Aufgabe_15_02"); //Was noch?
	AI_Output(self, hero, "Info_Mod_Edgor_Aufgabe_06_03"); //... 400 Goldmünzen wären auch nicht schlecht.

	Log_CreateTopic	(TOPIC_MOD_EDGORSGOLD, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EDGORSGOLD, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_EDGORSGOLD, "Ich soll Edgor zwölf Stengel Sumpfkraut, sechs Flaschen Wacholder, vier Flaschen Wein, drei Bier, einen Schinken, fünf gebratene Fleischstücke, drei Stück Käse, zwei Flaschen Milch und 400 Goldmünzen bringen, dann verrät er mir die erste Hälfte des Losungswortes.");
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

	AI_Output(self, hero, "Info_Mod_Edgor_Gold_06_01"); //Endlich wieder ein wenig was zu Essen und zu Trinken.
	AI_Output(hero, self, "Info_Mod_Edgor_Gold_15_02"); //Verräts du mir jetzt den ersten Teil?
	AI_Output(self, hero, "Info_Mod_Edgor_Gold_06_03"); //Gut, du hast mir meine Sachen gebracht und dafür werde ich dir jetzt helfen.
	AI_Output(self, hero, "Info_Mod_Edgor_Gold_06_04"); //Die erste Hälfte heißt: Dex. Die zweite Hälfte wird dir Senyan geben. Er befindet sich in der Nähe von Sekobs Hof.

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
	description	= "Ich habe hier etwas für dich. Mit schönen Gruß von Skinner.";
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
	AI_Output(hero, self, "Info_Mod_Edgor_Skinner_15_00"); //Ich habe hier etwas für dich. Mit schönen Gruß von Skinner.
	AI_Output(self, hero, "Info_Mod_Edgor_Skinner_06_01"); //Dieser dreckige Hundesohn. Erst raucht er mir nachts vor meiner Abreise mein halbes Sumpfkraut weg, säuft meine Schnapsreserven leer und jetzt schickt er einen Laufburschen mit drei lumpigen Stengeln Sumpfkraut.
	AI_Output(hero, self, "Info_Mod_Edgor_Skinner_15_02"); //Willst du jetzt das Sumpfkraut oder nicht?
	AI_Output(self, hero, "Info_Mod_Edgor_Skinner_06_03"); //Ach, gib schon her.

	B_GiveInvItems	(hero, self, ItMi_Addon_Joint_01, 3);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "Edgor hat seine Stengel bekommen.");
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
	AI_Output(self, hero, "Info_Mod_Edgor_IstBandit_06_00"); //Man, wie langweilig, die ganze Zeit nur am Lagerfeuer rumsitzen. Es muss endlich mal wieder ein Überfall her.
	AI_Output(self, hero, "Info_Mod_Edgor_IstBandit_06_01"); //Jetzt wäre ein guter Zeitpunkt, um die Schafe auf dem Weidenplateau abzuschlachten. Mit dem Hirten und seinem Hund sollten wir locker fertigwerden. Bist du dabei?
	
	Info_ClearChoices	(Info_Mod_Edgor_IstBandit);

	Info_AddChoice	(Info_Mod_Edgor_IstBandit, "Ich habe wirklich besseres zu tun (...)", Info_Mod_Edgor_IstBandit_B);
	Info_AddChoice	(Info_Mod_Edgor_IstBandit, "Ja, natürlich, den Spaß lasse ich mir nicht entgehen.", Info_Mod_Edgor_IstBandit_A);
};

FUNC VOID Info_Mod_Edgor_IstBandit_B()
{
	AI_Output(hero, self, "Info_Mod_Edgor_IstBandit_B_15_00"); //Ich habe wirklich besseres zu tun, als einem Bauern die Schafe auf der Weide abzuschlachten.
	AI_Output(self, hero, "Info_Mod_Edgor_IstBandit_B_06_01"); //Dann eben nicht.
	
	Info_ClearChoices	(Info_Mod_Edgor_IstBandit);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Edgor_IstBandit_A()
{
	AI_Output(hero, self, "Info_Mod_Edgor_IstBandit_A_15_00"); //Ja, natürlich, den Spaß lasse ich mir nicht entgehen.
	AI_Output(self, hero, "Info_Mod_Edgor_IstBandit_A_06_01"); //Na dann lass uns losziehen.
	
	Info_ClearChoices	(Info_Mod_Edgor_IstBandit);

	Mod_Edgor_SchafeSchlachten = 1;

	Log_CreateTopic	(TOPIC_MOD_BDT_EDGOR, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BDT_EDGOR, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BDT_EDGOR, "Da Edgor langweilig ist, werde ich mit ihm und Franco die Schafe auf dem Weideplateau abschlachten.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "MALAK");
	B_StartOtherRoutine	(Mod_952_BDT_Franco_NW, "MALAK");
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
	AI_Output(self, hero, "Info_Mod_Edgor_SchafeTot_06_00"); //Na das war ein Spaß. Die Schafskeulen lassen wir uns jetzt gut schmecken und die Felle werden wir bestimmt irgendwo für ein paar Goldmünzen los. Hier ist dein Anteil.
	
	CreateInvItems	(hero, ItFo_MuttonRaw, 3);
	CreateInvItems	(hero, ItAt_SheepFur, 2);
	
	B_GivePlayerXP	(200);

	Mod_Edgor_SchafeSchlachten = 3;

	B_SetTopicStatus	(TOPIC_MOD_BDT_EDGOR, LOG_SUCCESS);

	B_StartOtherRoutine	(Mod_946_BDT_Edgor_NW, "START");
	B_StartOtherRoutine	(Mod_952_BDT_Franco_NW, "BEIFRANCO");

	CurrentNQ += 1;
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
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Edgor_Pickpocket);
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