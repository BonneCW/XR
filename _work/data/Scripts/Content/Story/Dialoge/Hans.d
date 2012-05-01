INSTANCE Info_Mod_Hans_Hi (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Hi_Condition;
	information	= Info_Mod_Hans_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Handelst du?";
};

FUNC INT Info_Mod_Hans_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hans_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Hi_15_00"); //Handelst du?
	AI_Output(self, hero, "Info_Mod_Hans_Hi_06_01"); //Herrje, warum sollte ich mir hier sonst die Beine in den Arsch stehen?
	AI_Output(hero, self, "Info_Mod_Hans_Hi_15_02"); //Das ist aber nicht sehr kundenfreundlich ...
	AI_Output(self, hero, "Info_Mod_Hans_Hi_06_03"); //Es gibt tollere Jobs als meinen. Ich würde viel lieber selbst mal in der Welt umherziehen als nur den Abenteurerkram zu verkaufen.
	AI_Output(hero, self, "Info_Mod_Hans_Hi_15_04"); //Aber ...
	AI_Output(self, hero, "Info_Mod_Hans_Hi_06_05"); //Wieso ich nicht einfach meinen Job an den Nagel hänge?
	AI_Output(self, hero, "Info_Mod_Hans_Hi_06_06"); //Weil ich ein Krüppel bin, Junge, ein verdammter Krüppel.
	AI_Output(self, hero, "Info_Mod_Hans_Hi_06_07"); //Ich seh die Hand vor Augen nicht mehr, nur noch verschwommenen Mist. (Pause) Willst du jetzt eigentlich was kaufen oder nicht?

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KHORATA, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KHORATA, "Hans handelt auf dem Marktplatz mit Waffen.");
};

INSTANCE Info_Mod_Hans_Nagelnachschub (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Nagelnachschub_Condition;
	information	= Info_Mod_Hans_Nagelnachschub_Info;
	permanent	= 0;
	important	= 0;
	description 	= "(Feilschen) Für die Hälfte nehm ich's.";
};                       

FUNC INT Info_Mod_Hans_Nagelnachschub_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hans_Buerger))
	&& (Mod_Verhandlungsgeschick > 0)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 25)
	&& (Mod_REL_Nagelnachschub_Hans == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Nagelnachschub_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Nagelnachschub_15_00"); //Für die Hälfte nehm ich's.

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Hans_Nagelnachschub_06_01"); //Abgemacht.

		Npc_RemoveInvItems	(hero, ItMi_Gold, 25);

		CreateInvItems	(hero, ItMi_Nagelpaket, 1);

		B_ShowGivenThings	("25 Gold gegeben und Nagelpaket erhalten");

		B_RaiseHandelsgeschick (2);

		Mod_REL_Nagelnachschub_Hans = 1;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Hans_Nagelnachschub_06_02"); //Entweder für 50 Gold oder gar nicht.
	};
};

INSTANCE Info_Mod_Hans_Nagelnachschub2 (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Nagelnachschub2_Condition;
	information	= Info_Mod_Hans_Nagelnachschub2_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Hier ist das Gold.";
};                       

FUNC INT Info_Mod_Hans_Nagelnachschub2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hans_Buerger))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 50)
	&& (Mod_REL_Nagelnachschub_Hans == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Nagelnachschub2_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Nagelnachschub2_15_00"); //Hier ist das Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Hans_Nagelnachschub2_06_01"); //... und hier die Nägel.

	B_GiveInvItems	(self, hero, ItMi_Nagelpaket, 1);

	Mod_REL_Nagelnachschub_Hans = 1;
};

INSTANCE Info_Mod_Hans_Nagelnachschub3 (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Nagelnachschub3_Condition;
	information	= Info_Mod_Hans_Nagelnachschub3_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_Hans_Nagelnachschub3_Condition()
{
	if (Mod_REL_Buerger == 1)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Nagelnachschub3_Info()
{
	AI_Output(self, hero, "Info_Mod_Hans_Nagelnachschub3_06_00"); //Da ist ja der neue Bürger! Willkommen bei uns.

	B_GiveInvItems	(self, hero, ItMi_Freudenspender, 1);
};

INSTANCE Info_Mod_Hans_Buerger (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Buerger_Condition;
	information	= Info_Mod_Hans_Buerger_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Ich bin auf der Suche nach Nägeln.";
};                       

FUNC INT Info_Mod_Hans_Buerger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Wettstreit))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Buerger_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Buerger_15_00"); //Ich bin auf der Suche nach Nägeln.
	AI_Output(self, hero, "Info_Mod_Hans_Buerger_06_01"); //Hmm, eine Packung habe ich noch. Kostet allerdings 50 Gold.
};

INSTANCE Info_Mod_Hans_Kissen (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Kissen_Condition;
	information	= Info_Mod_Hans_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Hast du noch was anderes als Waffen?";
};                       

FUNC INT Info_Mod_Hans_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hans_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Malik_Aufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kissen))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Kissen_15_00"); //Hast du noch was anderes als Waffen?
	AI_Output(self, hero, "Info_Mod_Hans_Kissen_06_01"); //Eigentlich nicht. Außer Moleratfett.
	AI_Output(hero, self, "Info_Mod_Hans_Kissen_15_02"); //Moleratfett? Hmm ... Nein, das stinkt. Wiedersehen.
};

INSTANCE Info_Mod_Hans_Kimon (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Kimon_Condition;
	information	= Info_Mod_Hans_Kimon_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Wie geht es dir?";
};                       

FUNC INT Info_Mod_Hans_Kimon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hans_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Penner_Kimon))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kimon))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Kimon_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Kimon_15_00"); //Wie geht es dir?
	AI_Output(self, hero, "Info_Mod_Hans_Kimon_06_01"); //Schlecht wie immer.
	AI_Output(hero, self, "Info_Mod_Hans_Kimon_15_02"); //Dann solltest du mal den Freudenspender trinken.
	AI_Output(self, hero, "Info_Mod_Hans_Kimon_06_03"); //Bei Adanos! Ich hasse das Zeug! Macht die Leute hier verrückt. Aber nicht mit mir.
	AI_Output(hero, self, "Info_Mod_Hans_Kimon_15_04"); //Weißt du, wo ich welchen bekommen kann?
	AI_Output(self, hero, "Info_Mod_Hans_Kimon_06_05"); //Nein. Und mach dich fort. Auf deine Ratschläge kann ich verzichten.
	AI_Output(hero, self, "Info_Mod_Hans_Kimon_15_06"); //Entschuldigung.
};

INSTANCE Info_Mod_Hans_Theodorus (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Theodorus_Condition;
	information	= Info_Mod_Hans_Theodorus_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_Hans_Theodorus_Condition()
{
	if(Npc_KnowsInfo(hero, Info_Mod_Theodorus_Unruhen7))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Theodorus_Info()
{
	AI_Output(self, hero, "Info_Mod_Hans_Theodorus_06_00"); //Was fällt dir bloß einen, diesen Schwafler, diesen Nichtsnutz als Stadthalter zu bestimmen?!
	AI_Output(self, hero, "Info_Mod_Hans_Theodorus_06_01"); //Und wieso durftest du das überhaupt entscheiden?
	AI_Output(hero, self, "Info_Mod_Hans_Theodorus_15_02"); //Damit die Entscheidung nicht an Leuten wie dir hängt.
	AI_Output(self, hero, "Info_Mod_Hans_Theodorus_06_03"); //(brüllt) Reiß dein Maul nicht so weit auf, kapiert? Wegen dir und solcher Besserwisser sitzen wir hier doch in der Scheiße!
	AI_Output(hero, self, "Info_Mod_Hans_Theodorus_15_04"); //Ich glaube, es hat wenig Sinn, noch weiter darüber zu diskutieren.
};

INSTANCE Info_Mod_Hans_Unruhen (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Unruhen_Condition;
	information	= Info_Mod_Hans_Unruhen_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_Hans_Unruhen_Condition()
{
	if (Mod_REL_Stadthalter == 3)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Unruhen_Info()
{
	AI_Output(self, hero, "Info_Mod_Hans_Unruhen_06_00"); //Da bist du ja. Ich wollte dir zu deiner Entscheidung gratulieren.
	AI_Output(self, hero, "Info_Mod_Hans_Unruhen_06_01"); //Ich kenne Lukas schon lange, und er ist ein ordentlicher Bursche. Nebenbei habe ich als sein langjähriger Freund natürlich ein paar Handelsprivilegien erhalten.
	AI_Output(hero, self, "Info_Mod_Hans_Unruhen_15_02"); //(ironisch) Natürlich.
	AI_Output(self, hero, "Info_Mod_Hans_Unruhen_06_03"); //Diese Privilegien sollen meine Benachteiligungen ausgleichen. Wegen meiner Augen.
	AI_Output(self, hero, "Info_Mod_Hans_Unruhen_06_04"); //Ich konnte deswegen mein Angebot etwas aufstocken. Sieh dich ruhig um.
};

INSTANCE Info_Mod_Hans_Freudenspender (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Freudenspender_Condition;
	information	= Info_Mod_Hans_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Etwas Freudenspender gegen den harten Alltag gefällig?";
};                       

FUNC INT Info_Mod_Hans_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Freudenspender_15_00"); //Etwas Freudenspender gegen den harten Alltag gefällig?
	AI_Output(self, hero, "Info_Mod_Hans_Freudenspender_06_01"); //Willst du dich über mich lustig machen?
	AI_Output(self, hero, "Info_Mod_Hans_Freudenspender_06_02"); //(leise) Ich nehm nichts mehr, seit mir ein Halunke gepressten Skavengerdung untergejubelt hat.
	AI_Output(self, hero, "Info_Mod_Hans_Freudenspender_06_03"); //Und hey, man kommt wirklich auch ohne klar.
};

INSTANCE Info_Mod_Hans_Trade (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Trade_Condition;
	information	= Info_Mod_Hans_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Hans_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hans_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Hans_Theodorus))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hans_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Hans_Pickpocket (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Pickpocket_Condition;
	information	= Info_Mod_Hans_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Hans_Pickpocket_Condition()
{
	C_Beklauen	(53, ItMi_Gold, 550);
};

FUNC VOID Info_Mod_Hans_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hans_Pickpocket);

	Info_AddChoice	(Info_Mod_Hans_Pickpocket, DIALOG_BACK, Info_Mod_Hans_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hans_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hans_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hans_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hans_Pickpocket);
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

INSTANCE Info_Mod_Hans_EXIT (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_EXIT_Condition;
	information	= Info_Mod_Hans_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hans_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hans_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};