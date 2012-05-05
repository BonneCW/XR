INSTANCE Info_Mod_Erntehelfer_01_Hi (C_INFO)
{
	npc		= Mod_7638_OUT_Erntehelfer_REL;
	nr		= 1;
	condition	= Info_Mod_Erntehelfer_01_Hi_Condition;
	information	= Info_Mod_Erntehelfer_01_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was sagt die Arbeit?";
};

FUNC INT Info_Mod_Erntehelfer_01_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erntehelfer_01_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Erntehelfer_01_Hi_15_00"); //Was sagt die Arbeit?
	AI_Output(self, hero, "Info_Mod_Erntehelfer_01_Hi_06_01"); //Nichts Besonderes. Man macht sie und ist damit durch.
};

INSTANCE Info_Mod_Erntehelfer_01_AndererJob (C_INFO)
{
	npc		= Mod_7638_OUT_Erntehelfer_REL;
	nr		= 1;
	condition	= Info_Mod_Erntehelfer_01_AndererJob_Condition;
	information	= Info_Mod_Erntehelfer_01_AndererJob_Info;
	permanent	= 0;
	important	= 0;
	description	= "Noch nie davon geträumt, einen anderen Beruf auszuüben?";
};

FUNC INT Info_Mod_Erntehelfer_01_AndererJob_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erntehelfer_01_AndererJob_Info()
{
	AI_Output(hero, self, "Info_Mod_Erntehelfer_01_AndererJob_15_00"); //Noch nie davon geträumt, einen anderen Beruf auszuüben?
	AI_Output(self, hero, "Info_Mod_Erntehelfer_01_AndererJob_06_01"); //Doch. Ich wollte immer ein Wächter in Khorata werden. Aber Anselm hat mich nicht genommen.
	AI_Output(hero, self, "Info_Mod_Erntehelfer_01_AndererJob_15_02"); //Und wieso wurdest du nicht eingestellt?
	AI_Output(self, hero, "Info_Mod_Erntehelfer_01_AndererJob_06_03"); //Er meinte, er hätte einen schlechten Tag und wolle sich so einen Scheiß nicht anhören.
};

INSTANCE Info_Mod_Erntehelfer_01_Pickpocket (C_INFO)
{
	npc		= Mod_7638_OUT_Erntehelfer_REL;
	nr		= 1;
	condition	= Info_Mod_Erntehelfer_01_Pickpocket_Condition;
	information	= Info_Mod_Erntehelfer_01_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_Erntehelfer_01_Pickpocket_Condition()
{
	C_Beklauen	(27, ItMi_Gold, 57);
};

FUNC VOID Info_Mod_Erntehelfer_01_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Erntehelfer_01_Pickpocket);

	Info_AddChoice	(Info_Mod_Erntehelfer_01_Pickpocket, DIALOG_BACK, Info_Mod_Erntehelfer_01_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Erntehelfer_01_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Erntehelfer_01_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Erntehelfer_01_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Erntehelfer_01_Pickpocket);
};

FUNC VOID Info_Mod_Erntehelfer_01_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Erntehelfer_01_Pickpocket);
};

INSTANCE Info_Mod_Erntehelfer_01_EXIT (C_INFO)
{
	npc		= Mod_7638_OUT_Erntehelfer_REL;
	nr		= 1;
	condition	= Info_Mod_Erntehelfer_01_EXIT_Condition;
	information	= Info_Mod_Erntehelfer_01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Erntehelfer_01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erntehelfer_01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};