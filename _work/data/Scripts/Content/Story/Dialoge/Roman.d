INSTANCE Info_Mod_Roman_Hi (C_INFO)
{
	npc		= Mod_7478_OUT_Roman_REL;
	nr		= 1;
	condition	= Info_Mod_Roman_Hi_Condition;
	information	= Info_Mod_Roman_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie läuft's?";
};

FUNC INT Info_Mod_Roman_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Roman_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Roman_Hi_15_00"); //Wie läuft's?
	AI_Output(self, hero, "Info_Mod_Roman_Hi_08_01"); //(unfreundlich) Du weißt wohl nicht, was hier abgeht, hä? Bleib mir vom Leib! (hustet)
};

INSTANCE Info_Mod_Roman_Endres (C_INFO)
{
	npc		= Mod_7478_OUT_Roman_REL;
	nr		= 1;
	condition	= Info_Mod_Roman_Endres_Condition;
	information	= Info_Mod_Roman_Endres_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was denkst du über Endres?";
};

FUNC INT Info_Mod_Roman_Endres_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Roman_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Heiler_Endres))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Roman_Endres_Info()
{
	AI_Output(hero, self, "Info_Mod_Roman_Endres_15_00"); //Was denkst du über Endres?
	AI_Output(self, hero, "Info_Mod_Roman_Endres_08_01"); //(zieht die Luft scharf ein) Sein Vater war ein räudiger Hund, denke ich.
	AI_Output(self, hero, "Info_Mod_Roman_Endres_08_02"); //Und seine Mutter eine dreckige ... (leichter Hustenanfall)

	Info_ClearChoices	(Info_Mod_Roman_Endres);

	Info_AddChoice	(Info_Mod_Roman_Endres, "Endres ist tot.", Info_Mod_Roman_Endres_B);
	Info_AddChoice	(Info_Mod_Roman_Endres, "Wieso kannst du Endres nicht leiden?", Info_Mod_Roman_Endres_A);
};

FUNC VOID Info_Mod_Roman_Endres_C()
{
	AI_Output(self, hero, "Info_Mod_Roman_Endres_C_08_00"); //Bevor du wieder Luft holst, um mich weiter auszufragen: Ich muss wieder an die Arbeit.
	AI_Output(self, hero, "Info_Mod_Roman_Endres_C_08_01"); //'Ne Lohnkürzung wegen Faulheit muss ich nicht auch noch haben.

	Info_ClearChoices	(Info_Mod_Roman_Endres);
};

FUNC VOID Info_Mod_Roman_Endres_B()
{
	AI_Output(hero, self, "Info_Mod_Roman_Endres_B_15_00"); //Endres ist tot.
	AI_Output(self, hero, "Info_Mod_Roman_Endres_B_08_01"); //Ja, ich weiß. Verdammt, aber das bringt uns nix. Uns wurde gesagt, das Schürfen geht weiter.	
	AI_Output(hero, self, "Info_Mod_Roman_Endres_B_15_02"); //Jemand übernimmt also die Leitung des Projekts?
	AI_Output(self, hero, "Info_Mod_Roman_Endres_B_08_03"); //Muss wohl. Hab' ich davon 'ne Ahnung? (hustet)

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Der Bergarbeiter Roman ist nicht gut auf Endres zu sprechen. Und wer hat nun bei dem Projekt das Ruder in der Hand?");

	Mod_Roman_Endres_02 = 1;

	if (Mod_Roman_Endres_01 == 1)
	{
		Info_Mod_Roman_Endres_C();
	};
};

FUNC VOID Info_Mod_Roman_Endres_A()
{
	AI_Output(hero, self, "Info_Mod_Roman_Endres_A_15_00"); //Wieso kannst du Endres nicht leiden?
	AI_Output(self, hero, "Info_Mod_Roman_Endres_A_08_01"); //Das will ich dir mal erklären. Der Kerl meinte, wir schuften für einen Hungerlohn, damit er sein Erz für wasweißich zusammenkriegt.
	AI_Output(self, hero, "Info_Mod_Roman_Endres_A_08_02"); //Und als wir das nicht wollten, geht der einfach zu Anselm und boxt sein Anliegen durch! (hustet)
	AI_Output(self, hero, "Info_Mod_Roman_Endres_A_08_03"); //Alle Arbeitslosen und Sä ... song ... helfer, die er auftreiben konnte, müssen jetzt hier ihr Leben verkürzen.
	AI_Output(self, hero, "Info_Mod_Roman_Endres_A_08_04"); //Die Arbeit schlägt auf die Lunge, Junge, ich sag's dir.

	Mod_Roman_Endres_01 = 1;

	if (Mod_Roman_Endres_02 == 1)
	{
		Info_Mod_Roman_Endres_C();
	};
};

INSTANCE Info_Mod_Roman_Pickpocket (C_INFO)
{
	npc		= Mod_7478_OUT_Roman_REL;
	nr		= 1;
	condition	= Info_Mod_Roman_Pickpocket_Condition;
	information	= Info_Mod_Roman_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Roman_Pickpocket_Condition()
{
	C_Beklauen	(51, ItMi_Gold, 350);
};

FUNC VOID Info_Mod_Roman_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Roman_Pickpocket);

	Info_AddChoice	(Info_Mod_Roman_Pickpocket, DIALOG_BACK, Info_Mod_Roman_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Roman_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Roman_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Roman_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Roman_Pickpocket);
};

FUNC VOID Info_Mod_Roman_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Roman_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Roman_Pickpocket);

		Info_AddChoice	(Info_Mod_Roman_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Roman_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Roman_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Roman_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Roman_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Roman_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Roman_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Roman_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Roman_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Roman_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Roman_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Roman_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Roman_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Roman_EXIT (C_INFO)
{
	npc		= Mod_7478_OUT_Roman_REL;
	nr		= 1;
	condition	= Info_Mod_Roman_EXIT_Condition;
	information	= Info_Mod_Roman_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Roman_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Roman_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};