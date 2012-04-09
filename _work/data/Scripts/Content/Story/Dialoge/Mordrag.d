INSTANCE Info_Mod_Mordrag_Hi (C_INFO)
{
	npc		= Mod_1122_SLD_Mordrag_MT;
	nr		= 1;
	condition	= Info_Mod_Mordrag_Hi_Condition;
	information	= Info_Mod_Mordrag_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich komme von Lee.";
};

FUNC INT Info_Mod_Mordrag_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_Aufgabe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mordrag_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Mordrag_Hi_15_00"); //Ich komme von Lee. Du sollst mir die Schattenrüstung geben.
	AI_Output(self, hero, "Info_Mod_Mordrag_Hi_11_01"); //Klar. Einen Augenblick, ich muss sie nur gerade aus meinen Sachen herauskramen ... ja, hier ist sie.

	B_ShowGivenThings	("Schattenrüstung erhalten");

	CreateInvItems	(hero, ItAr_Stt_Mordrag, 1);

	AI_Output(self, hero, "Info_Mod_Mordrag_Hi_11_02"); //Ein gutes Stück. Habe sie damals beim Glücksspiel einem Schatten abgenommen und dann einigen Ärger mit den Gardisten bekommen.
};

INSTANCE Info_Mod_Mordrag_Pickpocket (C_INFO)
{
	npc		= Mod_1122_SLD_Mordrag_MT;
	nr		= 1;
	condition	= Info_Mod_Mordrag_Pickpocket_Condition;
	information	= Info_Mod_Mordrag_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Mordrag_Pickpocket_Condition()
{
	C_Beklauen	(51, ItMi_Gold, 130);
};

FUNC VOID Info_Mod_Mordrag_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Mordrag_Pickpocket);

	Info_AddChoice	(Info_Mod_Mordrag_Pickpocket, DIALOG_BACK, Info_Mod_Mordrag_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Mordrag_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Mordrag_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Mordrag_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Mordrag_Pickpocket);
};

FUNC VOID Info_Mod_Mordrag_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Mordrag_Pickpocket);
};

INSTANCE Info_Mod_Mordrag_EXIT (C_INFO)
{
	npc		= Mod_1122_SLD_Mordrag_MT;
	nr		= 1;
	condition	= Info_Mod_Mordrag_EXIT_Condition;
	information	= Info_Mod_Mordrag_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Mordrag_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mordrag_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};