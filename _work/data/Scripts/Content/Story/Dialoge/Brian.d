INSTANCE Info_Mod_Brian_Hi (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_Hi_Condition;
	information	= Info_Mod_Brian_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Harads Lehrling, nehme ich an?";
};

FUNC INT Info_Mod_Brian_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brian_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Brian_Hi_15_00"); //Harads Lehrling, nehme ich an?
	AI_Output(self, hero, "Info_Mod_Brian_Hi_04_01"); //(wütend) Gerade eben noch, ja!
	AI_Output(hero, self, "Info_Mod_Brian_Hi_15_02"); //Gerade eben noch?
	AI_Output(self, hero, "Info_Mod_Brian_Hi_04_03"); //Sollte noch die geringste Kleinigkeit vorfallen, bin ich die längste Zeit sein Lehrling gewesen. Dann kann er mich mal.
	AI_Output(hero, self, "Info_Mod_Brian_Hi_15_04"); //Wieso bist du so erbost?
	AI_Output(self, hero, "Info_Mod_Brian_Hi_04_05"); //Weil Harad ein komplettes Arschloch ist, jawohl.
	AI_Output(self, hero, "Info_Mod_Brian_Hi_04_06"); //Heult mich den ganzen Tag mit seinen Wehwehchen voll und kritisiert im gleichen Atemzug alles, was ich mache.
	AI_Output(self, hero, "Info_Mod_Brian_Hi_04_07"); //Dem Egoisten kann man einfach nichts recht machen!
};

INSTANCE Info_Mod_Brian_HaradLehrling (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_HaradLehrling_Condition;
	information	= Info_Mod_Brian_HaradLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich würde gern Schmiedelehrling werden.";
};

FUNC INT Info_Mod_Brian_HaradLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brian_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Harad_DeinLehrlingStattBrian))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brian_HaradLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Brian_HaradLehrling_15_00"); //Ich würde gern Schmiedelehrling werden.
	AI_Output(hero, self, "Info_Mod_Brian_HaradLehrling_15_01"); //Aber Harad meint, dass er nur einen Lehrling gleichzeitig unterrichten will.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_04_02"); //Ha! Da kenne ich doch eine ganz einfache Lösung!
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_04_03"); //Lieber werde ich Fischer, als dass ich mich hier noch länger ausnutzen lasse.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_04_04"); //Also - werd ruhig sein Lehrling. Ich wünsche dir viel Erfolg und dass du ihm von mir ein paar aufs Maul gibst.

	Mod_Brian_KeinLehrling_Day = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Brian_HaradLehrling);

	Info_AddChoice	(Info_Mod_Brian_HaradLehrling, "Willst du es dir nicht noch mal überlegen?", Info_Mod_Brian_HaradLehrling_B);
	Info_AddChoice	(Info_Mod_Brian_HaradLehrling, "Äh... danke.", Info_Mod_Brian_HaradLehrling_A);
};

FUNC VOID Info_Mod_Brian_HaradLehrling_B()
{
	AI_Output(hero, self, "Info_Mod_Brian_HaradLehrling_B_15_00"); //Willst du es dir nicht noch mal überlegen?
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_B_04_01"); //Da gibt es nichts mehr zu überdenken. Jeden Tag habe ich mir gewünscht, eine andere Lehre begonnen zu haben.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_B_04_02"); //Und dazu gibst du mir jetzt die Möglichkeit. Das lasse ich nicht einfach verstreichen.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_B_04_03"); //Noch heute Abend bin ich ein freier Mann!

	Info_ClearChoices	(Info_Mod_Brian_HaradLehrling);
};

FUNC VOID Info_Mod_Brian_HaradLehrling_A()
{
	AI_Output(hero, self, "Info_Mod_Brian_HaradLehrling_A_15_00"); //Äh... danke.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_A_04_01"); //Du musst mir nicht danken.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_A_04_02"); //Wenn ich dir wirklich helfen wollte, würde ich dich mit Händen und Füßen davon abhalten, Harads Lehrling zu werden.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_A_04_03"); //Aber mir ist es ziemlich egal. Entweder bist du leidensfähig, setzt dich gegen ihn durch oder hörst nach kurzer Zeit entnervt auf.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_A_04_04"); //Mir ist es egal. Ich werde jetzt sofort kündigen.

	Info_ClearChoices	(Info_Mod_Brian_HaradLehrling);
};

INSTANCE Info_Mod_Brian_KeinLehrlingMehr01 (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_KeinLehrlingMehr01_Condition;
	information	= Info_Mod_Brian_KeinLehrlingMehr01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was macht die Arbeit?";
};

FUNC INT Info_Mod_Brian_KeinLehrlingMehr01_Condition()
{
	if (Mod_Brian_KeinLehrling == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brian_KeinLehrlingMehr01_Info()
{
	AI_Output(hero, self, "Info_Mod_Brian_KeinLehrlingMehr01_15_00"); //Was macht die Arbeit?
	AI_Output(self, hero, "Info_Mod_Brian_KeinLehrlingMehr01_04_01"); //Ich liebe die Ruhe beim Fischfang. Einfach zu warten und die Gedanken schweifen zu lassen ...
};

INSTANCE Info_Mod_Brian_KeinLehrlingMehr02 (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_KeinLehrlingMehr02_Condition;
	information	= Info_Mod_Brian_KeinLehrlingMehr02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Handelst du noch?";
};

FUNC INT Info_Mod_Brian_KeinLehrlingMehr02_Condition()
{
	if (Mod_Brian_KeinLehrling == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brian_KeinLehrlingMehr02_Info()
{
	AI_Output(hero, self, "Info_Mod_Brian_KeinLehrlingMehr02_15_00"); //Handelst du noch?
	AI_Output(self, hero, "Info_Mod_Brian_KeinLehrlingMehr02_04_01"); //Da Harad mich nach unserem Gespräch rausgeworfen hat, habe ich noch einigen Krempel von früher bei mir.
	AI_Output(self, hero, "Info_Mod_Brian_KeinLehrlingMehr02_04_02"); //Den kannst du mir gern abkaufen.
};

INSTANCE Info_Mod_Brian_Daemonisch (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_Daemonisch_Condition;
	information	= Info_Mod_Brian_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brian_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brian_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Brian_Daemonisch_04_00"); //(aufgeregt) Wie, was machst du hier? Du bist doch nicht einer von ihnen? Sei gewarnt, ich werde bis zum Tode kämpfen.
	AI_Output(hero, self, "Info_Mod_Brian_Daemonisch_15_01"); //Beruhig dich erst einmal. Wovon sprichst du?
	AI_Output(self, hero, "Info_Mod_Brian_Daemonisch_04_02"); //(etwas ruhiger) Du scheinst nicht zu ihnen zu gehören.
	AI_Output(self, hero, "Info_Mod_Brian_Daemonisch_04_03"); //Die schwarzen Schatten ... du musst wissen, dass die Stadt ...
	AI_Output(self, hero, "Info_Mod_Brian_Daemonisch_04_04"); //(mit verklingender Stimme) Rupert, er ... Hüte dich vor der Finsternis ...

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_1248_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1249_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1250_RIT_Ritter_NW, "DAEMONISCH");
};

INSTANCE Info_Mod_Brian_Trade (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_Trade_Condition;
	information	= Info_Mod_Brian_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Brian_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brian_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brian_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Brian_Pickpocket (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_Pickpocket_Condition;
	information	= Info_Mod_Brian_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_40;
};

FUNC INT Info_Mod_Brian_Pickpocket_Condition()
{
	C_Beklauen	(40, ItMi_Gold, 80);
};

FUNC VOID Info_Mod_Brian_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Brian_Pickpocket);

	Info_AddChoice	(Info_Mod_Brian_Pickpocket, DIALOG_BACK, Info_Mod_Brian_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Brian_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Brian_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Brian_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Brian_Pickpocket);
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

INSTANCE Info_Mod_Brian_EXIT (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_EXIT_Condition;
	information	= Info_Mod_Brian_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brian_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brian_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};