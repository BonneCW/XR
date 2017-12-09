INSTANCE Info_Mod_Shrike_Hi (C_INFO)
{
	npc		= Mod_1292_SLD_Shrike_MT;
	nr		= 1;
	condition	= Info_Mod_Shrike_Hi_Condition;
	information	= Info_Mod_Shrike_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, Patrick meinte, du sollst mal wieder bei ihm zum Training vorbeischauen.";
};

FUNC INT Info_Mod_Shrike_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Patrick_Training))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shrike_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Shrike_Hi_15_00"); //Hey, Patrick meinte, du sollst mal wieder bei ihm zum Training vorbeischauen.
	AI_Output(self, hero, "Info_Mod_Shrike_Hi_07_01"); //(genervt) Ich habe aber keine Lust.

	Info_ClearChoices	(Info_Mod_Shrike_Hi);

	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		Info_AddChoice	(Info_Mod_Shrike_Hi, "Du bekommst auch 100 Goldmünzen.", Info_Mod_Shrike_Hi_B);
	};
	Info_AddChoice	(Info_Mod_Shrike_Hi, "Dann muss ich dich mit Schlägen zu ihm hintreiben.", Info_Mod_Shrike_Hi_A);
};

FUNC VOID Info_Mod_Shrike_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Shrike_Hi_B_15_00"); //Du bekommst auch 100 Goldmünzen.
	AI_Output(self, hero, "Info_Mod_Shrike_Hi_B_07_01"); //Für 100 Goldmünzen setze ich doch nicht mal meinen Fuß vor die Höhle.

	Info_ClearChoices	(Info_Mod_Shrike_Hi);

	if (Npc_HasItems(hero, ItMi_Gold) >= 200)
	{
		Info_AddChoice	(Info_Mod_Shrike_Hi, "Ok, wie wäre es mit 200 Goldmünzen.", Info_Mod_Shrike_Hi_C);
	};
	Info_AddChoice	(Info_Mod_Shrike_Hi, "Dann muss ich dich mit Schlägen zu ihm hintreiben.", Info_Mod_Shrike_Hi_A);
};

FUNC VOID Info_Mod_Shrike_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Shrike_Hi_A_15_00"); //Dann muss ich dich mit Schlägen zu ihm hintreiben.
	AI_Output(self, hero, "Info_Mod_Shrike_Hi_A_07_01"); //Achja?! Kannst es ja mal versuchen.

	Info_ClearChoices	(Info_Mod_Shrike_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

FUNC VOID Info_Mod_Shrike_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Shrike_Hi_C_15_00"); //Ok, wie wäre es mit 200 Goldmünzen.
	AI_Output(self, hero, "Info_Mod_Shrike_Hi_C_07_01"); //200 Goldmünzen?! Ok, gib her!

	B_GiveInvItems	(hero, self, ItMi_Gold, 200);

	AI_Output(hero, self, "Info_Mod_Shrike_Hi_C_15_02"); //Und was ist jetzt?
	AI_Output(self, hero, "Info_Mod_Shrike_Hi_C_07_03"); //Nichts ist. Ich habe dein Gold, gehe aber trotzdem nicht auf den Felsen.

	Info_Mod_Shrike_Hi_A();
};

INSTANCE Info_Mod_Shrike_Umgehauen (C_INFO)
{
	npc		= Mod_1292_SLD_Shrike_MT;
	nr		= 1;
	condition	= Info_Mod_Shrike_Umgehauen_Condition;
	information	= Info_Mod_Shrike_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Shrike_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Shrike_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shrike_Umgehauen_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Shrike_Umgehauen_07_00"); //Ohh, meine Knochen. Du Mistkerl ...
			AI_Output(hero, self, "Info_Mod_Shrike_Umgehauen_15_01"); //Na, Lust auf weitere Sperenzchen?
			AI_Output(self, hero, "Info_Mod_Shrike_Umgehauen_07_02"); //(widerwillig) Ja, ich gehe ja schon ...

			Mod_SLD_Shrike = 1;

			B_LogEntry	(TOPIC_MOD_SLD_PATRICK, "Ok, Shrike hat eine Abreibung erhalten und ist unterwegs zu Patrick.");

			B_StartOtherRoutine	(self, "SMOKING");
		}
		else if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Shrike_Umgehauen_07_03"); //Schwächling.
		};
							
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};
};

INSTANCE Info_Mod_Shrike_NoSmokingNow (C_INFO)
{
	npc		= Mod_1292_SLD_Shrike_MT;
	nr		= 1;
	condition	= Info_Mod_Shrike_NoSmokingNow_Condition;
	information	= Info_Mod_Shrike_NoSmokingNow_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hatte ich dir nicht gesagt, dass du zum Training sollst?!";
};

FUNC INT Info_Mod_Shrike_NoSmokingNow_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Patrick_SindAlleDa))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shrike_NoSmokingNow_Info()
{
	AI_Output(hero, self, "Info_Mod_Shrike_NoSmokingNow_15_00"); //Hatte ich dir nicht gesagt, dass du zum Training sollst?!
	AI_Output(self, hero, "Info_Mod_Shrike_NoSmokingNow_07_01"); //Was?! Ohh, scheiße, du bist es. Ja, ich mach mich sofort auf den Weg.

	AI_StopProcessInfos	(self);

	Mod_SLD_Shrike = 2;

	B_StartOtherRoutine	(self, "PATRICK");
};

INSTANCE Info_Mod_Shrike_Pickpocket (C_INFO)
{
	npc		= Mod_1292_SLD_Shrike_MT;
	nr		= 1;
	condition	= Info_Mod_Shrike_Pickpocket_Condition;
	information	= Info_Mod_Shrike_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Shrike_Pickpocket_Condition()
{
	C_Beklauen	(45, ItMi_Gold, 16);
};

FUNC VOID Info_Mod_Shrike_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Shrike_Pickpocket);

	Info_AddChoice	(Info_Mod_Shrike_Pickpocket, DIALOG_BACK, Info_Mod_Shrike_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Shrike_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Shrike_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Shrike_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Shrike_Pickpocket);
};

FUNC VOID Info_Mod_Shrike_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Shrike_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Shrike_Pickpocket);

		Info_AddChoice	(Info_Mod_Shrike_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Shrike_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Shrike_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Shrike_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Shrike_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Shrike_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Shrike_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Shrike_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Shrike_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Shrike_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Shrike_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Shrike_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Shrike_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Shrike_EXIT (C_INFO)
{
	npc		= Mod_1292_SLD_Shrike_MT;
	nr		= 1;
	condition	= Info_Mod_Shrike_EXIT_Condition;
	information	= Info_Mod_Shrike_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Shrike_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Shrike_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};