INSTANCE Info_Mod_HofstaatBarde_Hi (C_INFO)
{
	npc		= Mod_7269_HS_Barde_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatBarde_Hi_Condition;
	information	= Info_Mod_HofstaatBarde_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatBarde_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatWache_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatBarde_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Hi_31_00"); //Ein schwarzer Geselle betritt unser Reich,
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Hi_31_01"); //Die Haare sind blond, das Gesicht ist bleich.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Hi_31_02"); //Die Narben seiner Seele, die sieht man nicht,
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Hi_31_03"); //Nur den Schrecken in seinem Gesicht.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Hi_31_04"); //Bringt er uns Freude oder bringt er uns Leid?
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Hi_31_05"); //Kommt er aus Gunst oder kommt er aus Neid?

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_HofstaatBarde_Sporen (C_INFO)
{
	npc		= Mod_7269_HS_Barde_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatBarde_Sporen_Condition;
	information	= Info_Mod_HofstaatBarde_Sporen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatBarde_Sporen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alex_Pilzsporen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatBarde_Sporen_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_00"); //Wer schleicht mit verbotenem Wissen herum?
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_01"); //Wer verkauft den hiesigen K�nig f�r dumm?
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_02"); //Wer ist er, der er unser Schicksal tr�gt,
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_03"); //Und noch seine Entscheidung abw�gt.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_04"); //Ich habe dich durchschaut. Vom ersten Tag an war mir klar, was du willst, doch ist es dir jetzt klar?
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_05"); //Du wurdest geschickt uns zu zerst�ren,
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_06"); //Stattdessen begannst du uns anzugeh�ren.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_07"); //In der einen Hand h�ltst du die Klinge,
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_08"); //In der andren meine Kehle.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_09"); //Und w�hrend ich noch hier singe,
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_10"); //Hast du nur eine Wahl: W�HLE!
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_11"); //Willst du Sturm in unsrem Garten s�en
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_12"); //Oder ihn gar selbst bebauen?
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_13"); //�ber unsre Leichen gehen
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_14"); //Oder aus unsrer Mitte schaun?
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_15"); //Entscheide dich, und w�hle gut,
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_16"); //Gib uns Hoffnung, gib uns Mut
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_17"); //Oder aber: Nimm sie uns
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_18"); //Und bring das S�ckchen in den Sumpf.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_19"); //Entscheide dich, welcher Seite du angeh�ren willst.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_20"); //Willst du bei deiner alten Gemeinschaft im Sumpf bleiben, so bring ihnen dieses Pulver.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_31_21"); //Willst du aber einer neuen Gemeinschaft nicht alle Hoffnung nehmen, so bringe dieses Pulver dem Alchemisten.

	AI_StopProcessInfos	(self);

	B_SetTopicStatus	(TOPIC_MOD_SEKTE_FREUDENSPENDER, LOG_SUCCESS);

	Log_CreateTopic	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Der Barde hat mich durchschaut und mich vor die Wahl gestellt. Entweder entscheide ich mich f�r das Sumpflager, indem ich die Sporen zu Baal Namib bringe, oder aber f�r den Hofstaat, dann muss ich den k�niglichen J�ger aufsuchen.");
};

INSTANCE Info_Mod_HofstaatBarde_Pickpocket (C_INFO)
{
	npc		= Mod_7269_HS_Barde_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatBarde_Pickpocket_Condition;
	information	= Info_Mod_HofstaatBarde_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_HofstaatBarde_Pickpocket_Condition()
{
	C_Beklauen	(65, ItMi_Freudenspender, 1);
};

FUNC VOID Info_Mod_HofstaatBarde_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatBarde_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatBarde_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatBarde_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatBarde_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatBarde_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatBarde_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatBarde_Pickpocket);
};

FUNC VOID Info_Mod_HofstaatBarde_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_HofstaatBarde_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_HofstaatBarde_Pickpocket);

		Info_AddChoice	(Info_Mod_HofstaatBarde_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_HofstaatBarde_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_HofstaatBarde_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_HofstaatBarde_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_HofstaatBarde_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_HofstaatBarde_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_HofstaatBarde_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_HofstaatBarde_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_HofstaatBarde_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_HofstaatBarde_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_HofstaatBarde_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_HofstaatBarde_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_HofstaatBarde_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_HofstaatBarde_EXIT (C_INFO)
{
	npc		= Mod_7269_HS_Barde_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatBarde_EXIT_Condition;
	information	= Info_Mod_HofstaatBarde_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatBarde_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatBarde_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};