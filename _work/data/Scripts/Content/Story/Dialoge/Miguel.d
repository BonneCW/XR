INSTANCE Info_Mod_Miguel_Hi (C_INFO)
{
	npc		= Mod_958_BDT_Miguel_MT;
	nr		= 1;
	condition	= Info_Mod_Miguel_Hi_Condition;
	information	= Info_Mod_Miguel_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Miguel_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Miguel_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Miguel_Hi_11_00"); //Hey, ein neuer im Lager. Brauchst du etwas?
	AI_Output(hero, self, "Info_Mod_Miguel_Hi_15_01"); //Hallo. Etwas brauchen? Was hast du anzubieten?
	AI_Output(self, hero, "Info_Mod_Miguel_Hi_11_02"); //Nun, als Lageralchemist habe ich so einige Tränke auf Lager.
	AI_Output(self, hero, "Info_Mod_Miguel_Hi_11_03"); //Außerdem verwalte ich die überschüssige Hehlerware, die wir gerade nicht loswerden.
	AI_Output(self, hero, "Info_Mod_Miguel_Hi_11_04"); //Du kannst also manch interessante Handelsgüter bei mir finden ... und viel günstiger, als bei den Wucherern die sich Händler nennen.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_BANDITEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_BANDITEN, "Miguel scheint mit Tränken zu handeln.");

	Npc_SetRefuseTalk	(self, 240);
};

INSTANCE Info_Mod_Miguel_Aufgabe (C_INFO)
{
	npc		= Mod_958_BDT_Miguel_MT;
	nr		= 1;
	condition	= Info_Mod_Miguel_Aufgabe_Condition;
	information	= Info_Mod_Miguel_Aufgabe_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Miguel_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Miguel_Hi))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Miguel_Aufgabe_Info()
{
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe_11_00"); //Hey, du bist ja viel draußen unterwegs. Du könntest mir da bei einer Sache helfen.
	AI_Output(hero, self, "Info_Mod_Miguel_Aufgabe_15_01"); //Ja, worum geht es?
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe_11_02"); //Ein Kunde von mir möchte ein Gebräu, ein ganz spezielles. Leider fehlen mir einige Zutaten ...
	AI_Output(hero, self, "Info_Mod_Miguel_Aufgabe_15_03"); //Was soll ich dir besorgen?
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe_11_04"); //Zum einen bräuchte ich drei Fliegenpilze. Mit etwas Glück solltest du sie gleich im Wald unterhalb des Lagers finden.
	AI_Output(hero, self, "Info_Mod_Miguel_Aufgabe_15_05"); //Was noch?
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe_11_06"); //Und dann noch das schleimige Sekret, welches die Haut von jungen Lurkern abgibt.
	AI_Output(hero, self, "Info_Mod_Miguel_Aufgabe_15_07"); //Wie?
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe_11_08"); //Ja, bei Gefahr sondert ihre Haut Gift ab.
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe_11_09"); //Dieses musst du, nachdem du sie erledigt hast, abschaben… ach, bring mir einfach gleich die ganze Häute mit.
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe_11_10"); //Diese lässt sich bei jungen Tieren noch problemlos mit einem Rasiermesser entfernen.
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe_11_11"); //Unten am Fluss solltest du zu dieser Jahreszeit bestimmt genug junge Lurker finden. Zwei Häute sollten genügen. Viel Glück.
	
	Log_CreateTopic	(TOPIC_MOD_BDT_FLIEGENPILZLURKERSCHLEIM, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BDT_FLIEGENPILZLURKERSCHLEIM, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BDT_FLIEGENPILZLURKERSCHLEIM, "Miguel benötigt für ein Gebräu drei Fliegenpilze und zwei Häute junger Lurker, die ihren giftigen Schleim abgesondert haben. Die Sachen werde ich im Wald und am Fluss unterhalb des Lagers finden. Hmm, welche üblen Pläne hat jemand wohl mit so einem Trank ...");

	Wld_InsertNpc	(Lurker_Young,	"FP_ROAM_OW_RIVER_LURKER_02");
	Wld_InsertNpc	(Lurker_Young,	"FP_ROAM_OW_RIVER_LURKER_02");

	Wld_InsertNpc	(Lurker_Young,	"FP_ROAM_OW_BLOODFLY_C4");
	Wld_InsertNpc	(Lurker_Young,	"FP_ROAM_OW_BLOODFLY_C4");

	Wld_InsertNpc	(Lurker_Young,	"FP_ROAM_OW_BLOODFLY_07_02");
	Wld_InsertNpc	(Lurker_Young,	"FP_ROAM_OW_BLOODFLY_07_02");
};

INSTANCE Info_Mod_Miguel_Aufgabe2 (C_INFO)
{
	npc		= Mod_958_BDT_Miguel_MT;
	nr		= 1;
	condition	= Info_Mod_Miguel_Aufgabe2_Condition;
	information	= Info_Mod_Miguel_Aufgabe2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe die Pilze und den Schleim.";
};

FUNC INT Info_Mod_Miguel_Aufgabe2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Miguel_Aufgabe))
	&& (Npc_HasItems(hero, ItPl_Mushroom_03) >= 3)
	&& (Npc_HasItems(hero, ItAt_LurkerSkin_Young) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Miguel_Aufgabe2_Info()
{
	AI_Output(hero, self, "Info_Mod_Miguel_Aufgabe2_15_00"); //Ich habe die Pilze und den Schleim.
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe2_11_01"); //Ausgezeichnet. Dann mache ich mich mal daran ihn zu brauen. In einigen Stunden sollte ich damit fertig sein.
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe2_11_02"); //Falls du Zeit hast kannst du dem Kunden gleich das Gebräu bringen. 
	
	Npc_SetRefuseTalk	(self, 240);

	B_GivePlayerXP	(400);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "BRAUEN");
};

INSTANCE Info_Mod_Miguel_Aufgabe3 (C_INFO)
{
	npc		= Mod_958_BDT_Miguel_MT;
	nr		= 1;
	condition	= Info_Mod_Miguel_Aufgabe3_Condition;
	information	= Info_Mod_Miguel_Aufgabe3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Miguel_Aufgabe3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Miguel_Aufgabe2))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Miguel_Aufgabe3_Info()
{
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe3_11_00"); //So, ich bin fertig mit der Giftmischung. Hier hast du das Gebräu.

	B_GiveInvItems	(self, hero, ItPo_MiguelForDar, 1);

	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe3_11_01"); //Der Kunde wartet im neuen Lager und heißt Dar.
	
	B_LogEntry	(TOPIC_MOD_BDT_FLIEGENPILZLURKERSCHLEIM, "Miguel will, dass ich dem Kunden sein Gebräu bringe. Dieser wartet im neuen Lager und heißt Dar. Ganz wohl ist mir bei der Sache ja nicht ...");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "BRAUEN");
};

INSTANCE Info_Mod_Miguel_Aufgabe4 (C_INFO)
{
	npc		= Mod_958_BDT_Miguel_MT;
	nr		= 1;
	condition	= Info_Mod_Miguel_Aufgabe4_Condition;
	information	= Info_Mod_Miguel_Aufgabe4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Dar den Trank übergeben ...";
};

FUNC INT Info_Mod_Miguel_Aufgabe4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dar_Miguel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Miguel_Aufgabe4_Info()
{
	AI_Output(hero, self, "Info_Mod_Miguel_Aufgabe4_15_00"); //Ich habe Dar den Trank übergeben ... Und er hat tatsächlich ...
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe4_11_01"); //... ja, er hat sich bestimmt gut amüsiert.
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe4_11_02"); //So ein schönes halluzinogenes Giftgemisch lässt jeden harzigen Stängel blass dagegen erscheinen ...
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe4_11_03"); //Achja, gute Arbeit. Hier ist dein Anteil.

	B_ShowGivenThings	("100 Gold und 12 Erz erhalten");

	CreateInvItems	(hero, ItMi_Gold, 100);
	CreateInvItems	(hero, ItMi_Nugget, 12);

	B_GivePlayerXP	(400);
	
	B_SetTopicStatus	(TOPIC_MOD_BDT_FLIEGENPILZLURKERSCHLEIM, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Miguel_Trade (C_INFO)
{
	npc		= Mod_958_BDT_Miguel_MT;
	nr		= 1;
	condition	= Info_Mod_Miguel_Trade_Condition;
	information	= Info_Mod_Miguel_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Miguel_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Miguel_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Miguel_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Miguel_Pickpocket (C_INFO)
{
	npc		= Mod_958_BDT_Miguel_MT;
	nr		= 1;
	condition	= Info_Mod_Miguel_Pickpocket_Condition;
	information	= Info_Mod_Miguel_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Miguel_Pickpocket_Condition()
{
	C_Beklauen	(46, ItPo_Perm_Dex, 1);
};

FUNC VOID Info_Mod_Miguel_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Miguel_Pickpocket);

	Info_AddChoice	(Info_Mod_Miguel_Pickpocket, DIALOG_BACK, Info_Mod_Miguel_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Miguel_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Miguel_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Miguel_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Miguel_Pickpocket);
};

FUNC VOID Info_Mod_Miguel_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Miguel_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Miguel_Pickpocket);

		Info_AddChoice	(Info_Mod_Miguel_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Miguel_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Miguel_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Miguel_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Miguel_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Miguel_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Miguel_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Miguel_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Miguel_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Miguel_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Miguel_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Miguel_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Miguel_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Miguel_EXIT (C_INFO)
{
	npc		= Mod_958_BDT_Miguel_MT;
	nr		= 1;
	condition	= Info_Mod_Miguel_EXIT_Condition;
	information	= Info_Mod_Miguel_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Miguel_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Miguel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};