INSTANCE Info_Mod_Brandick_Hi (C_INFO)
{
	npc		= Mod_7799_SMK_Brandick_OM;
	nr		= 1;
	condition	= Info_Mod_Brandick_Hi_Condition;
	information	= Info_Mod_Brandick_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und wie läuft die Arbeit in der Mine?";
};

FUNC INT Info_Mod_Brandick_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brandick_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Brandick_Hi_15_01"); //Und wie läuft die Arbeit in der Mine?
	AI_Output(self, hero, "Info_Mod_Brandick_Hi_11_02"); //Ach, war schon mal besser. Früher hatte ich mehr Erz in der Tasche ... als Aleph noch da war ...
	AI_Output(hero, self, "Info_Mod_Brandick_Hi_15_03"); //Was meinst du?
	AI_Output(self, hero, "Info_Mod_Brandick_Hi_11_04"); //Nunja ... er war ... ziemlich geschickt in einigen Dingen und hat mir gutes Erz dafür gezahlt, dass ich mal ein Auge zugedrückt, wenn er nicht geackert hat. Aber beim Beben hat es ihn dann erwischt.
	AI_Output(hero, self, "Info_Mod_Brandick_Hi_15_03"); //Was ist passiert.
	AI_Output(self, hero, "Info_Mod_Brandick_Hi_11_04"); //Nur paar Meter von uns entfernt ist er hinabgestürzt. Muss sofort tot gewesen sein ... sein Glück. Blieb im einiges erspart ...
	AI_Output(self, hero, "Info_Mod_Brandick_Hi_11_04"); //Nur schade, dass ich nicht einen Tag vorher bei ihm abkassiert hatte ... und mit dem verschwundenen Schlüssel von Santino habe ich auch so meinen Verdacht.
};

INSTANCE Info_Mod_Brandick_Pickpocket (C_INFO)
{
	npc		= Mod_7799_SMK_Brandick_OM;
	nr		= 1;
	condition	= Info_Mod_Brandick_Pickpocket_Condition;
	information	= Info_Mod_Brandick_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Brandick_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Nugget, 4);
};

FUNC VOID Info_Mod_Brandick_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Brandick_Pickpocket);

	Info_AddChoice	(Info_Mod_Brandick_Pickpocket, DIALOG_BACK, Info_Mod_Brandick_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Brandick_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Brandick_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Brandick_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Brandick_Pickpocket);
};

FUNC VOID Info_Mod_Brandick_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Brandick_Pickpocket);
};

INSTANCE Info_Mod_Brandick_EXIT (C_INFO)
{
	npc		= Mod_7799_SMK_Brandick_OM;
	nr		= 1;
	condition	= Info_Mod_Brandick_EXIT_Condition;
	information	= Info_Mod_Brandick_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brandick_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brandick_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};