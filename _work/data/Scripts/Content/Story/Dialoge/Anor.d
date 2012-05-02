INSTANCE Info_Mod_Anor_Hi (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Hi_Condition;
	information	= Info_Mod_Anor_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du hier?";
};

FUNC INT Info_Mod_Anor_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Anor_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Anor_Hi_15_00"); //Was machst du hier?
	AI_Output(self, hero, "Info_Mod_Anor_Hi_02_01"); //Ich bin Händler und verkaufe Tränke. Wieso willst du das wissen?

	Info_ClearChoices	(Info_Mod_Anor_Hi);

	Info_AddChoice	(Info_Mod_Anor_Hi, "Ich will wissen, wen ich töte, wenn ich hier alle niedermetzle.", Info_Mod_Anor_Hi_B);
	Info_AddChoice	(Info_Mod_Anor_Hi, "Ich möchte mehr über euch Verwandlungsmagier erfahren.", Info_Mod_Anor_Hi_A);
};

FUNC VOID Info_Mod_Anor_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Anor_Hi_B_15_00"); //Ich will wissen, wen ich töte, wenn ich hier alle niedermetzle.
	AI_Output(self, hero, "Info_Mod_Anor_Hi_B_02_01"); //Tut mir Leid, aber für so etwas bin ich nicht zu haben.

	Info_ClearChoices	(Info_Mod_Anor_Hi);
};

FUNC VOID Info_Mod_Anor_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Anor_Hi_A_15_00"); //Ich möchte mehr über euch Verwandlungsmagier erfahren.
	AI_Output(self, hero, "Info_Mod_Anor_Hi_A_02_01"); //Ich weiß nicht, ob ich dir vertrauen kann.
	AI_Output(self, hero, "Info_Mod_Anor_Hi_A_02_02"); //Wenn du Tränke kaufen willst, komm wieder, wenn du gezeigt hast, dass du dich wirklich für uns interessierst.

	Info_ClearChoices	(Info_Mod_Anor_Hi);
};

INSTANCE Info_Mod_Anor_Abwimmeln (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Abwimmeln_Condition;
	information	= Info_Mod_Anor_Abwimmeln_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Anor_Abwimmeln_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Mod_Brad_Quest != 3)
	&& (Npc_KnowsInfo(hero, Info_Mod_Anor_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Abwimmeln_Info()
{
	AI_Output(self, hero, "Info_Mod_Anor_Abwimmeln_02_00"); //Was willst du?
};

INSTANCE Info_Mod_Anor_Faice01 (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Faice01_Condition;
	information	= Info_Mod_Anor_Faice01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist dir in letzter Zeit irgendetwas merkwürdig vorgekommen?";
};

FUNC INT Info_Mod_Anor_Faice01_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Faice01_Info()
{
	AI_Output(hero, self, "Info_Mod_Anor_Faice01_15_00"); //Ist dir in letzter Zeit irgendetwas merkwürdig vorgekommen?
	AI_Output(self, hero, "Info_Mod_Anor_Faice01_02_01"); //Nein, eigentlich nicht. Rede mal mit den anderen.
};

INSTANCE Info_Mod_Anor_Faice02 (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Faice02_Condition;
	information	= Info_Mod_Anor_Faice02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du etwas über die Vergiftung der Spruchrolle von Faice gehört?";
};

FUNC INT Info_Mod_Anor_Faice02_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Faice02_Info()
{
	AI_Output(hero, self, "Info_Mod_Anor_Faice02_15_00"); //Hast du etwas über die Vergiftung der Spruchrolle von Faice gehört?
	AI_Output(self, hero, "Info_Mod_Anor_Faice02_02_01"); //Nein, tut mir Leid.
};

INSTANCE Info_Mod_Anor_Faice03 (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Faice03_Condition;
	information	= Info_Mod_Anor_Faice03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist dir sonst noch irgendetwas aufgefallen?";
};

FUNC INT Info_Mod_Anor_Faice03_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Faice03_Info()
{
	AI_Output(hero, self, "Info_Mod_Anor_Faice03_15_00"); //Ist dir sonst noch irgendetwas aufgefallen?
	AI_Output(self, hero, "Info_Mod_Anor_Faice03_02_01"); //Alles normal, mir ist nichts aufgefallen.
};

INSTANCE Info_Mod_Anor_Nick (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Nick_Condition;
	information	= Info_Mod_Anor_Nick_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du vielleicht eine Aufgabe für mich?";
};

FUNC INT Info_Mod_Anor_Nick_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_Furt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Nick_Info()
{
	AI_Output(hero, self, "Info_Mod_Anor_Nick_15_00"); //Hast du vielleicht eine Aufgabe für mich?
	AI_Output(self, hero, "Info_Mod_Anor_Nick_02_01"); //Es gibt tatsächlich etwas, das du für mich, und für die Gemeinde wohlgemerkt, tun könntest.
	AI_Output(self, hero, "Info_Mod_Anor_Nick_02_02"); //Mir ist aufgefallen, dass in der Nähe des Sumpflagers, in etwa dort, wo einst einer dieser Fokussteine war, vermehrt Tiere sterben.
	AI_Output(self, hero, "Info_Mod_Anor_Nick_02_03"); //Du könntest der Sache auf den Grund gehen, denn ich kann im Moment hier nicht weg.
	AI_Output(self, hero, "Info_Mod_Anor_Nick_02_04"); //Falls einer dieser Sektenspinner dahintersteckt, können die was von uns erleben!

	Info_ClearChoices	(Info_Mod_Anor_Nick);

	Info_AddChoice	(Info_Mod_Anor_Nick, "Was springt für mich dabei raus?", Info_Mod_Anor_Nick_B);
	Info_AddChoice	(Info_Mod_Anor_Nick, "Ich bin dabei.", Info_Mod_Anor_Nick_A);
};

FUNC VOID Info_Mod_Anor_Nick_A()
{
	AI_Output(hero, self, "Info_Mod_Anor_Nick_A_15_00"); //Ich bin dabei.
	AI_Output(self, hero, "Info_Mod_Anor_Nick_A_02_01"); //Das freut mich zu hören. Mach dich am besten sofort auf den Weg.
	AI_Output(self, hero, "Info_Mod_Anor_Nick_A_02_02"); //Hier hast du einen Heiltrank, falls dir etwas zustoßen sollte.

	B_GiveInvItems	(self, hero, ItPo_Health_01, 1);

	Log_CreateTopic	(TOPIC_MOD_ANOR_NICK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ANOR_NICK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ANOR_NICK, "Anor wünscht, dass ich einem merkwürdigen Tiersterben in der Nähe des Sumpflagers auf den Grund gehe. Ich sollte mich dort umsehen, wo mich damals Nyras der Novize angefallen hat.");

	Wld_InsertNpc	(Mod_7050_ZOM_Nick_MT, "OC2");
	
	Info_ClearChoices	(Info_Mod_Anor_Nick);
};

FUNC VOID Info_Mod_Anor_Nick_B()
{
	AI_Output(hero, self, "Info_Mod_Anor_Nick_B_15_00"); //Was springt für mich dabei raus?
	AI_Output(self, hero, "Info_Mod_Anor_Nick_B_02_01"); //Lass mich nur so viel sagen: Es soll dein Schaden nicht sein.
	
	Info_Mod_Anor_Nick_A();
};

INSTANCE Info_Mod_Anor_NickTot (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_NickTot_Condition;
	information	= Info_Mod_Anor_NickTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Anor_NickTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nick_Kopf))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_NickTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Anor_NickTot_02_00"); //Was gibt es Neues?
	AI_Output(hero, self, "Info_Mod_Anor_NickTot_15_01"); //Das Tiersterben hat aufgehört. Ein kopfloser Zombie war dafür verantwortlich, aber ich habe ihn erlöst.
	AI_Output(self, hero, "Info_Mod_Anor_NickTot_02_02"); //Sehr gut. Hier hast du deine Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_RemoveNpc	(Mod_7050_ZOM_Nick_MT);

	Info_ClearChoices	(Info_Mod_Anor_NickTot);

	Info_AddChoice	(Info_Mod_Anor_NickTot, "Ich musste mit einem Minotauren verhandeln ...", Info_Mod_Anor_NickTot_B);
	Info_AddChoice	(Info_Mod_Anor_NickTot, "Vielen Dank. Ich mache mich nun wieder auf den Weg.", Info_Mod_Anor_NickTot_A);
};

FUNC VOID Info_Mod_Anor_NickTot_A()
{
	AI_Output(hero, self, "Info_Mod_Anor_NickTot_A_15_00"); //Vielen Dank. Ich mache mich nun wieder auf den Weg.
	AI_Output(self, hero, "Info_Mod_Anor_NickTot_A_02_01"); //Wir sehen uns.
	
	B_LogEntry	(TOPIC_MOD_ANOR_NICK, "Ich habe von Anor meine Belohnung erhalten.");
	B_SetTopicStatus	(TOPIC_MOD_ANOR_NICK, LOG_SUCCESS);

	B_GivePlayerXP	(650);

	Info_ClearChoices	(Info_Mod_Anor_NickTot);
};

FUNC VOID Info_Mod_Anor_NickTot_B()
{
	AI_Output(hero, self, "Info_Mod_Anor_NickTot_B_15_00"); //Ich musste mit einem Minotauren verhandeln ...
	AI_Output(self, hero, "Info_Mod_Anor_NickTot_B_02_01"); //Hmpf. Hier hast du etwas Extrageld.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	Info_ClearChoices	(Info_Mod_Anor_NickTot);

	Info_AddChoice	(Info_Mod_Anor_NickTot, "Ich musste zwanzig Wölfe und ein Dutzend Snapper umlegen ...", Info_Mod_Anor_NickTot_C);
	Info_AddChoice	(Info_Mod_Anor_NickTot, "Vielen Dank. Ich mache mich nun wieder auf den Weg.", Info_Mod_Anor_NickTot_A);
};

FUNC VOID Info_Mod_Anor_NickTot_C()
{
	AI_Output(hero, self, "Info_Mod_Anor_NickTot_C_15_00"); //Ich musste zwanzig Wölfe und ein Dutzend Snapper umlegen ...
	AI_Output(self, hero, "Info_Mod_Anor_NickTot_C_02_01"); //Okay, hier. Mehr gibt es aber nicht.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	Info_Mod_Anor_NickTot_A();
};

INSTANCE Info_Mod_Anor_Trade (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Trade_Condition;
	information	= Info_Mod_Anor_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Anor_Trade_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Anor_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Anor_Pickpocket (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Pickpocket_Condition;
	information	= Info_Mod_Anor_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Anor_Pickpocket_Condition()
{
	C_Beklauen	(64, ItMi_Gold, 90);
};

FUNC VOID Info_Mod_Anor_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Anor_Pickpocket);

	Info_AddChoice	(Info_Mod_Anor_Pickpocket, DIALOG_BACK, Info_Mod_Anor_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Anor_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Anor_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Anor_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Anor_Pickpocket);
};

FUNC VOID Info_Mod_Anor_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Anor_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Anor_Pickpocket);

		Info_AddChoice	(Info_Mod_Anor_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Anor_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Anor_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Anor_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Anor_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Anor_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Anor_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Anor_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Anor_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Anor_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Anor_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Anor_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Anor_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Anor_EXIT (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_EXIT_Condition;
	information	= Info_Mod_Anor_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Anor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Anor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};