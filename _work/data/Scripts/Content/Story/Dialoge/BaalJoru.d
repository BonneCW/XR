INSTANCE Info_Mod_Joru_Hi (C_INFO)
{
	npc		= Mod_2013_PSINOV_Joru_MT;
	nr		= 1;
	condition	= Info_Mod_Joru_Hi_Condition;
	information	= Info_Mod_Joru_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Joru_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Joru_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Joru_Hi_07_00"); //Oh, du bist zurück? Hier hat sich einiges getan, seit du das letzte Mal da warst.
};

INSTANCE Info_Mod_Joru_GotoTempel (C_INFO)
{
	npc		= Mod_2013_PSINOV_Joru_MT;
	nr		= 1;
	condition	= Info_Mod_Joru_GotoTempel_Condition;
	information	= Info_Mod_Joru_GotoTempel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du wirst am Tempel erwartet.";
};

FUNC INT Info_Mod_Joru_GotoTempel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_KarrasDa))
	&& (Npc_KnowsInfo(hero, Info_Mod_Joru_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joru_GotoTempel_Info()
{
	AI_Output(hero, self, "Info_Mod_Joru_GotoTempel_15_00"); //Du wirst am Tempel erwartet.

	AI_StopProcessInfos	(hero);

	B_StartOtherRoutine	(self, "TEMPEL");
};

INSTANCE Info_Mod_Joru_Woher (C_INFO)
{
	npc		= Mod_2013_PSINOV_Joru_MT;
	nr		= 1;
	condition	= Info_Mod_Joru_Woher_Condition;
	information	= Info_Mod_Joru_Woher_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wieso haben sie dich in die Kolonie gesteckt?";
};

FUNC INT Info_Mod_Joru_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joru_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joru_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Joru_Woher_15_00"); //Wieso haben sie dich in die Kolonie gesteckt?
	AI_Output(self, hero, "Info_Mod_Joru_Woher_07_01"); //Weil ich damals, als ich die Prüfung des Feuers abgelegt habe, einen meiner Mitstreiter getötet habe.
	AI_Output(self, hero, "Info_Mod_Joru_Woher_07_02"); //In der Kolonie hab ich mich dann mit Tondral angefreundet und bin mit ihm zusammen dann in die Bruderschaft eingetreten.
	AI_Output(self, hero, "Info_Mod_Joru_Woher_07_03"); //Tondral wurde schon bald zum Baal, ich musste bis zum Tode Y'Berions warten.
};

INSTANCE Info_Mod_Joru_Pickpocket (C_INFO)
{
	npc		= Mod_2013_PSINOV_Joru_MT;
	nr		= 1;
	condition	= Info_Mod_Joru_Pickpocket_Condition;
	information	= Info_Mod_Joru_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Joru_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_Joru_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Joru_Pickpocket);

	Info_AddChoice	(Info_Mod_Joru_Pickpocket, DIALOG_BACK, Info_Mod_Joru_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Joru_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Joru_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Joru_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Joru_Pickpocket);
};

FUNC VOID Info_Mod_Joru_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Joru_Pickpocket);
};

INSTANCE Info_Mod_Joru_EXIT (C_INFO)
{
	npc		= Mod_2013_PSINOV_Joru_MT;
	nr		= 1;
	condition	= Info_Mod_Joru_EXIT_Condition;
	information	= Info_Mod_Joru_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Joru_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Joru_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};