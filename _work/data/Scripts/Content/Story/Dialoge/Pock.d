INSTANCE Info_Mod_Pock_Hi (C_INFO)
{
	npc		= Mod_1081_BAU_Pock_MT;
	nr		= 1;
	condition	= Info_Mod_Pock_Hi_Condition;
	information	= Info_Mod_Pock_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Pock_Hi_Condition()
{
	if (Mod_LeftysBauern == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pock_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Pock_Hi_04_00"); //Hey, ich habe gehört, dass du Leftys Angebot abgeschlagen hast, uns Bauern zu verprügeln.
	AI_Output(self, hero, "Info_Mod_Pock_Hi_04_01"); //Hier, nimm diesen Schlüssel. Ich habe ihn mal im Morast des Reisfeldes gefunden. Der muss dem Reislord, oder einem seiner Schläger aus der Tasche gefallen sein.

	B_GiveInvItems	(self, hero, ItKe_ReislordVonPock, 1);

	B_GivePlayerXP	(250);

	Mod_Reislord_DayChecker = Wld_GetDay();

	Mod_LeftysBauern = 4;
};

INSTANCE Info_Mod_Pock_Pickpocket (C_INFO)
{
	npc		= Mod_1081_BAU_Pock_MT;
	nr		= 1;
	condition	= Info_Mod_Pock_Pickpocket_Condition;
	information	= Info_Mod_Pock_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Pock_Pickpocket_Condition()
{
	C_Beklauen	(15, ItMi_OldCoin, 10);
};

FUNC VOID Info_Mod_Pock_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Pock_Pickpocket);

	Info_AddChoice	(Info_Mod_Pock_Pickpocket, DIALOG_BACK, Info_Mod_Pock_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Pock_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Pock_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Pock_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Pock_Pickpocket);
};

FUNC VOID Info_Mod_Pock_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Pock_Pickpocket);
};

INSTANCE Info_Mod_Pock_EXIT (C_INFO)
{
	npc		= Mod_1081_BAU_Pock_MT;
	nr		= 1;
	condition	= Info_Mod_Pock_EXIT_Condition;
	information	= Info_Mod_Pock_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Pock_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Pock_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};