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

FUNC VOID Info_Mod_Hans_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Hans_Pickpocket);
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