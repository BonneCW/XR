INSTANCE Info_Mod_HofstaatRaufbold_Hi (C_INFO)
{
	npc		= Mod_7284_HS_Raufbold_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatRaufbold_Hi_Condition;
	information	= Info_Mod_HofstaatRaufbold_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatRaufbold_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatRaufbold_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_Hi_13_00"); //Hallo!

	AI_StopProcessInfos	(self);

	Mod_HS_Raufbold = 1;

	B_Attack	(self, hero, AR_None, 0);
};

INSTANCE Info_Mod_HofstaatRaufbold_KoenigSorge (C_INFO)
{
	npc		= Mod_7284_HS_Raufbold_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatRaufbold_KoenigSorge_Condition;
	information	= Info_Mod_HofstaatRaufbold_KoenigSorge_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatRaufbold_KoenigSorge_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatArsch_Drogenminister))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatRaufbold_KoenigSorge_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_KoenigSorge_13_00"); //Halt, hier kannst du nicht weiter. Der König ist am Fluss und sorgt sich.
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_KoenigSorge_13_01"); //Er will dabei nicht gestört werden, schon gar nicht von einem Mädchen für alles.
	AI_Output(hero, self, "Info_Mod_HofstaatRaufbold_KoenigSorge_15_02"); //Königliches Mädchen für alles, wenn ich bitten darf, und das bin ich nicht mehr. Ich bin mittlerweile königlicher Kehrwisch!
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_KoenigSorge_13_03"); //Egal, du kommst hier nicht durch, das ist königlicher Befehl.
	AI_Output(hero, self, "Info_Mod_HofstaatRaufbold_KoenigSorge_15_04"); //Ich hab dir schon einmal den Hintern versohlt, ich mach es auch gerne nochmal.
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_KoenigSorge_13_05"); //Pass dir bloß auf, ich habe im Moment nur drei verschiedene Rauschmittel intus.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

INSTANCE Info_Mod_HofstaatRaufbold_KoenigHilfe (C_INFO)
{
	npc		= Mod_7284_HS_Raufbold_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatRaufbold_KoenigHilfe_Condition;
	information	= Info_Mod_HofstaatRaufbold_KoenigHilfe_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatRaufbold_KoenigHilfe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatKoenig_Sorge))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatRaufbold_KoenigHilfe_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_KoenigHilfe_13_00"); //Der König sorgt sich ... Wir müssen was unternehmen.
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_KoenigHilfe_13_01"); //Du solltest das königliche Orakel aufsuchen, es wird dir bestimmt sagen, wie du den König wieder glücklich machen kannst!
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_KoenigHilfe_13_02"); //Ich werde mir inzwischen den Fluss vorknöpfen der den König traurig macht!
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_KoenigHilfe_13_03"); //Einer von uns muss Erfolg haben und glaub' mir, dieser Fluss wird sich wünschen, nie geboren worden zu sein.

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Der Raufbold riet mir, das königliche Orakel aufzusuchen. Wo ich das wohl finde?");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FLUSSFIGHT");
};

INSTANCE Info_Mod_HofstaatRaufbold_Meer (C_INFO)
{
	npc		= Mod_7284_HS_Raufbold_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatRaufbold_Meer_Condition;
	information	= Info_Mod_HofstaatRaufbold_Meer_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatRaufbold_Meer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Meer_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatRaufbold_Meer_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_Meer_13_00"); //Du hast gewonnen ... Hast du die Antwort gefunden?
	AI_Output(hero, self, "Info_Mod_HofstaatRaufbold_Meer_15_01"); //Moment mal, wie bist du aus dem Fluss gekommen?
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_Meer_13_02"); //Eine Otterfamilie hat mich gerettet! Aber das tut jetzt doch nichts zur Sache. Sprich schon, was hast du gesehen?
	AI_Output(hero, self, "Info_Mod_HofstaatRaufbold_Meer_15_03"); //Der Sumpf. Im alten Minental. Er behauptete die Antwort zu sein.
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_Meer_13_04"); //Natürlich! Es ist alles sonnenklar! Der Sumpf ist die Antwort. Auf was eigentlich?
	AI_Output(hero, self, "Info_Mod_HofstaatRaufbold_Meer_15_05"); //Der König hat sich ein Meer gewünscht. Vielleicht gibt es eine Möglichkeit, den Sumpf zu einem Teil des Staates zu machen.
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_Meer_13_06"); //WIR EROBERN IHN! Wenn das den König wieder glücklich macht dann metzeln wir dort alles nieder was und im Weg ist und nehmen den Sumpf mit hierher.

	Info_ClearChoices	(Info_Mod_HofstaatRaufbold_Meer);

	Info_AddChoice	(Info_Mod_HofstaatRaufbold_Meer, "Der Fluss hat gesagt du stinkst.", Info_Mod_HofstaatRaufbold_Meer_D);
	Info_AddChoice	(Info_Mod_HofstaatRaufbold_Meer, "Was immer du nimmst, nimm weniger ... oder mehr.", Info_Mod_HofstaatRaufbold_Meer_C);
	Info_AddChoice	(Info_Mod_HofstaatRaufbold_Meer, "Wie schnell kannst du eigentlich von hier bis zur Stadt rennen?", Info_Mod_HofstaatRaufbold_Meer_B);
	Info_AddChoice	(Info_Mod_HofstaatRaufbold_Meer, "Sei still und lass mich das machen.", Info_Mod_HofstaatRaufbold_Meer_A);
};

FUNC VOID Info_Mod_HofstaatRaufbold_Meer_D()
{
	AI_Output(hero, self, "Info_Mod_HofstaatRaufbold_Meer_D_15_00"); //Der Fluss hat gesagt du stinkst.
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_Meer_D_13_01"); //Hast du immer noch nicht genug, verdammter Fluss?
	
	Info_ClearChoices	(Info_Mod_HofstaatRaufbold_Meer);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_HofstaatRaufbold_Meer_C()
{
	AI_Output(hero, self, "Info_Mod_HofstaatRaufbold_Meer_C_15_00"); //Was immer du nimmst, nimm weniger ... oder mehr.
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_Meer_C_13_01"); //Ich fang gleich damit an!
	
	Info_ClearChoices	(Info_Mod_HofstaatRaufbold_Meer);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

FUNC VOID Info_Mod_HofstaatRaufbold_Meer_B()
{
	AI_Output(hero, self, "Info_Mod_HofstaatRaufbold_Meer_B_15_00"); //Wie schnell kannst du eigentlich von hier bis zur Stadt rennen? Renn' mal rauf, ich stopp deine Zeit!
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_Meer_B_13_01"); //Glaubst du ich bin so blöd auf sowas anzuspringen oder was?
	AI_Output(hero, self, "Info_Mod_HofstaatRaufbold_Meer_B_15_02"); //Eins, zwei, drei, vier ...
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_Meer_B_13_03"); //Haaalt, ich bin noch gar nicht losgelaufen!
	
	Info_ClearChoices	(Info_Mod_HofstaatRaufbold_Meer);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "RENNEN");
};

FUNC VOID Info_Mod_HofstaatRaufbold_Meer_A()
{
	AI_Output(hero, self, "Info_Mod_HofstaatRaufbold_Meer_A_15_00"); //Sei still und lass mich das machen.
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_Meer_A_13_01"); //Welche Unverfrorenheit! Zur Strafe musst du auf meine weitere Gesellschaft verzichten!
	
	Info_ClearChoices	(Info_Mod_HofstaatRaufbold_Meer);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_HofstaatRaufbold_Pickpocket (C_INFO)
{
	npc		= Mod_7284_HS_Raufbold_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatRaufbold_Pickpocket_Condition;
	information	= Info_Mod_HofstaatRaufbold_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_HofstaatRaufbold_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_HofstaatRaufbold_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatRaufbold_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatRaufbold_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatRaufbold_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatRaufbold_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatRaufbold_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatRaufbold_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatRaufbold_Pickpocket);
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

INSTANCE Info_Mod_HofstaatRaufbold_EXIT (C_INFO)
{
	npc		= Mod_7284_HS_Raufbold_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatRaufbold_EXIT_Condition;
	information	= Info_Mod_HofstaatRaufbold_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatRaufbold_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatRaufbold_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};