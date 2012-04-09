INSTANCE Info_Mod_HofstaatHaendler02_Hi (C_INFO)
{
	npc		= Mod_7273_HS_Haendler_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatHaendler02_Hi_Condition;
	information	= Info_Mod_HofstaatHaendler02_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gehört dieser Laden dir?";
};

FUNC INT Info_Mod_HofstaatHaendler02_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatTuersteher_Hi))
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatHaendler02_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_HofstaatHaendler02_Hi_15_00"); //Gehört dieser Laden dir?
	AI_Output(self, hero, "Info_Mod_HofstaatHaendler02_Hi_01_01"); //Ja.
	AI_Output(hero, self, "Info_Mod_HofstaatHaendler02_Hi_15_02"); //Gib ihn mir.

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_HofstaatHaendler02_Hi_01_03"); //Okay.

		Mod_Sekte_TraderHaus02 = 1;

		Mod_HS_DarfZuKing = 1;

		B_StartOtherRoutine	(Mod_7020_HS_Tuersteher_REL, "DARFREIN");

		Mod_7020_HS_Tuersteher_REL.aivar[AIV_Passgate] = TRUE;

		B_LogEntry	(TOPIC_MOD_SEKTE_FREUDENSPENDER, "Ich habe jetzt das Haus eines Händlers. Ich sollte nun am Türsteher vorbei kommen.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_HofstaatHaendler02_Hi_01_04"); //Nein, lieber nicht.
	};
};

INSTANCE Info_Mod_HofstaatHaendler02_Pickpocket (C_INFO)
{
	npc		= Mod_7273_HS_Haendler_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatHaendler02_Pickpocket_Condition;
	information	= Info_Mod_HofstaatHaendler02_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_HofstaatHaendler02_Pickpocket_Condition()
{
	C_Beklauen	(64, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_HofstaatHaendler02_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatHaendler02_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatHaendler02_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatHaendler02_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatHaendler02_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatHaendler02_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatHaendler02_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatHaendler02_Pickpocket);
};

FUNC VOID Info_Mod_HofstaatHaendler02_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_HofstaatHaendler02_Pickpocket);
};

INSTANCE Info_Mod_HofstaatHaendler02_EXIT (C_INFO)
{
	npc		= Mod_7273_HS_Haendler_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatHaendler02_EXIT_Condition;
	information	= Info_Mod_HofstaatHaendler02_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatHaendler02_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatHaendler02_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};