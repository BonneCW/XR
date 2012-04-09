INSTANCE Info_Mod_Wild_Hi (C_INFO)
{
	npc		= Mod_7413_JG_Wild_NW;
	nr		= 1;
	condition	= Info_Mod_Wild_Hi_Condition;
	information	= Info_Mod_Wild_Hi_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Wild_Hi_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Jäger_Dabei == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wild_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Wild_Hi_06_00"); //Wenn du was von uns möchtes, geh zu Dragomir.
};

INSTANCE Info_Mod_Wild_BretTot (C_INFO)
{
	npc		= Mod_7413_JG_Wild_NW;
	nr		= 1;
	condition	= Info_Mod_Wild_BretTot_Condition;
	information	= Info_Mod_Wild_BretTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du machst keinen glücklichen Eindruck.";
};

FUNC INT Info_Mod_Wild_BretTot_Condition()
{
	if (Mod_Drago >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wild_BretTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Wild_BretTot_15_00"); //Du machst keinen glücklichen Eindruck.
	AI_Output(self, hero, "Info_Mod_Wild_BretTot_06_01"); //Wie könnte ich? Wo doch mein Bruder gefallen ist.
	AI_Output(hero, self, "Info_Mod_Wild_BretTot_15_02"); //Bret war dein Bruder? Das wusste ich nicht.
	AI_Output(self, hero, "Info_Mod_Wild_BretTot_06_03"); //Woher auch. Nicht mal begraben konnten wir ihn. So ein verdammtes Pack.
	AI_Output(self, hero, "Info_Mod_Wild_BretTot_06_04"); //Wir Jäger tun doch niemandem etwas.
	AI_Output(hero, self, "Info_Mod_Wild_BretTot_15_05"); //Da muss irgend was dahinterstecken. Aber die Leute in der Taverne werden ihn sicher begraben.
	AI_Output(self, hero, "Info_Mod_Wild_BretTot_06_06"); //Adanos sei Dank! Wenigstens etwas.
};

INSTANCE Info_Mod_Wild_Pickpocket (C_INFO)
{
	npc		= Mod_7413_JG_Wild_NW;
	nr		= 1;
	condition	= Info_Mod_Wild_Pickpocket_Condition;
	information	= Info_Mod_Wild_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Wild_Pickpocket_Condition()
{
	C_Beklauen	(72, ItMi_Gold, 400);
};

FUNC VOID Info_Mod_Wild_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Wild_Pickpocket);

	Info_AddChoice	(Info_Mod_Wild_Pickpocket, DIALOG_BACK, Info_Mod_Wild_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Wild_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Wild_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Wild_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Wild_Pickpocket);
};

FUNC VOID Info_Mod_Wild_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Wild_Pickpocket);
};

INSTANCE Info_Mod_Wild_EXIT (C_INFO)
{
	npc		= Mod_7413_JG_Wild_NW;
	nr		= 1;
	condition	= Info_Mod_Wild_EXIT_Condition;
	information	= Info_Mod_Wild_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Wild_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wild_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};