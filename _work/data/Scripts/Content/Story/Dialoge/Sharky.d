INSTANCE Info_Mod_Sharky_Hi (C_INFO)
{
	npc		= Mod_1293_SLD_Sharky_MT;
	nr		= 1;
	condition	= Info_Mod_Sharky_Hi_Condition;
	information	= Info_Mod_Sharky_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, hast du was für mich?";
};

FUNC INT Info_Mod_Sharky_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sharky_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Sharky_Hi_15_00"); //Hey, hast du was für mich?
	AI_Output(self, hero, "Info_Mod_Sharky_Hi_10_01"); //Ja, für gutes Erz und Gold kann du paar nützliche Sachen bei mir kaufen.
};

INSTANCE Info_Mod_Sharky_Trade (C_INFO)
{
	npc		= Mod_1293_SLD_Sharky_MT;
	nr		= 1;
	condition	= Info_Mod_Sharky_Trade_Condition;
	information	= Info_Mod_Sharky_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Sharky_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sharky_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sharky_Trade_Info()
{
	AI_Output(hero, self, "Info_Mod_Sharky_Trade_15_00"); //Lass mal sehen, was du im Angebot hast.
	AI_Output(self, hero, "Info_Mod_Sharky_Trade_10_01"); //Alles, was du zum Überleben brauchst.

	Backup_Questitems();

	B_GiveTradeInv (self);
};

INSTANCE Info_Mod_Sharky_Pickpocket (C_INFO)
{
	npc		= Mod_1293_SLD_Sharky_MT;
	nr		= 1;
	condition	= Info_Mod_Sharky_Pickpocket_Condition;
	information	= Info_Mod_Sharky_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Sharky_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Sharky_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sharky_Pickpocket);

	Info_AddChoice	(Info_Mod_Sharky_Pickpocket, DIALOG_BACK, Info_Mod_Sharky_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sharky_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sharky_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sharky_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sharky_Pickpocket);
};

FUNC VOID Info_Mod_Sharky_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Sharky_Pickpocket);
};

INSTANCE Info_Mod_Sharky_EXIT (C_INFO)
{
	npc		= Mod_1293_SLD_Sharky_MT;
	nr		= 1;
	condition	= Info_Mod_Sharky_EXIT_Condition;
	information	= Info_Mod_Sharky_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sharky_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sharky_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};