INSTANCE Info_Mod_Girion_Hi (C_INFO)
{
	npc		= Mod_579_RIT_Girion_NW;
	nr		= 1;
	condition	= Info_Mod_Girion_Hi_Condition;
	information	= Info_Mod_Girion_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Girion_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Girion_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	if (Kapitel < 5)
	{
		AI_Output(self, hero, "Info_Mod_Girion_Hi_08_01"); //Ich bin Girion, Ritter der Stadt.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Girion_Hi_08_02"); //Ich bin der Söldner Girion.
	};
};

INSTANCE Info_Mod_Girion_Pickpocket (C_INFO)
{
	npc		= Mod_579_RIT_Girion_NW;
	nr		= 1;
	condition	= Info_Mod_Girion_Pickpocket_Condition;
	information	= Info_Mod_Girion_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Girion_Pickpocket_Condition()
{
	C_Beklauen	(79, ItMi_Gold, 430);
};

FUNC VOID Info_Mod_Girion_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Girion_Pickpocket);

	Info_AddChoice	(Info_Mod_Girion_Pickpocket, DIALOG_BACK, Info_Mod_Girion_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Girion_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Girion_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Girion_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Girion_Pickpocket);
};

FUNC VOID Info_Mod_Girion_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Girion_Pickpocket);
};

INSTANCE Info_Mod_Girion_EXIT (C_INFO)
{
	npc		= Mod_579_RIT_Girion_NW;
	nr		= 1;
	condition	= Info_Mod_Girion_EXIT_Condition;
	information	= Info_Mod_Girion_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Girion_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Girion_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};