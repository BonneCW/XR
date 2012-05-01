INSTANCE Info_Mod_Aadel_Hi (C_INFO)
{
	npc		= Mod_7145_ASS_Aadel_NW;
	nr		= 1;
	condition	= Info_Mod_Aadel_Hi_Condition;
	information	= Info_Mod_Aadel_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist Aadel?";
};

FUNC INT Info_Mod_Aadel_Hi_Condition()
{
	if (Mod_ASS_Magier == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aadel_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_00"); //Du bist Aadel?
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_01"); //Klar. Was willst du?
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_02"); //Ich soll mich bei dir melden.
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_03"); //Wer sagt das?
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_04"); //Masut sagt das. Ich will Magier werden.
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_05"); //Hört, hört! Da könnte ja jeder kommen.
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_06"); //Ich bin nicht jeder. Ich habe immerhin einige Gaunereien hinter mir.
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_07"); //Hoppla! Ehrlich?
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_08"); //Logisch. Sonst wäre ich ja nicht bis hierher gekommen.
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_09"); //Auch wahr. Also höre: Du musst auch bei uns Prüfungen ablegen. Nicht jeder dahergelaufene Gauner kann sich uns anschließen.
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_10"); //Was also muss ich tun.
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_11"); //Novize werden.
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_12"); //Das heißt?
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_13"); //Paar kleine Aufgaben für die Magier erledigen. Deine Hilfe anbieten. Ihnen Honig ums Maul schmieren, wenn du weißt, was ich meine.
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_14"); //Gewiss. Und wo soll ich anfangen?
	AI_Output(self, hero, "Info_Mod_Aadel_Hi_02_15"); //Geh mal zu Kamal da hinten. Das ist der Quacksalber in unserem Verein. Der braucht immer was.
	AI_Output(hero, self, "Info_Mod_Aadel_Hi_15_16"); //Wie ihr wünscht, Meister.
};

INSTANCE Info_Mod_Aadel_Later (C_INFO)
{
	npc		= Mod_7145_ASS_Aadel_NW;
	nr		= 1;
	condition	= Info_Mod_Aadel_Later_Condition;
	information	= Info_Mod_Aadel_Later_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bin zurück. Liegt etwas an?";
};

FUNC INT Info_Mod_Aadel_Later_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kais_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Kais_Blutkelch))
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aadel_Later_Info()
{
	AI_Output(hero, self, "Info_Mod_Aadel_Later_15_00"); //Bin zurück. Liegt etwas an?
	AI_Output(self, hero, "Info_Mod_Aadel_Later_02_01"); //Man hat dich doch zu Kais geschickt.
	AI_Output(hero, self, "Info_Mod_Aadel_Later_15_02"); //Der wollte letztens nichts von mir.
	AI_Output(self, hero, "Info_Mod_Aadel_Later_02_03"); //Quatsch! Der braucht dringend Hilfe. Mach hin!
};

INSTANCE Info_Mod_Aadel_Pickpocket (C_INFO)
{
	npc		= Mod_7145_ASS_Aadel_NW;
	nr		= 1;
	condition	= Info_Mod_Aadel_Pickpocket_Condition;
	information	= Info_Mod_Aadel_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Aadel_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Aadel_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);

	Info_AddChoice	(Info_Mod_Aadel_Pickpocket, DIALOG_BACK, Info_Mod_Aadel_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Aadel_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Aadel_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Aadel_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);
};

FUNC VOID Info_Mod_Aadel_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);

		Info_AddChoice	(Info_Mod_Aadel_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aadel_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aadel_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aadel_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aadel_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aadel_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aadel_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aadel_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aadel_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aadel_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Aadel_EXIT (C_INFO)
{
	npc		= Mod_7145_ASS_Aadel_NW;
	nr		= 1;
	condition	= Info_Mod_Aadel_EXIT_Condition;
	information	= Info_Mod_Aadel_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Aadel_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aadel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};