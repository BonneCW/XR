INSTANCE Info_Mod_Diana_Hi (C_INFO)
{
	npc		= Mod_7637_OUT_Diana_REL;
	nr		= 1;
	condition	= Info_Mod_Diana_Hi_Condition;
	information	= Info_Mod_Diana_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alles in Ordnung?";
};

FUNC INT Info_Mod_Diana_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Diana_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Diana_Hi_15_00"); //Alles in Ordnung?
	AI_Output(self, hero, "Info_Mod_Diana_Hi_16_01"); //Ich hoffe es, aber langsam mache ich mir Sorgen.
	AI_Output(hero, self, "Info_Mod_Diana_Hi_15_02"); //Vermisst du jemanden?
	AI_Output(self, hero, "Info_Mod_Diana_Hi_16_03"); //Unsere Tochter ist heute Morgen zum Pilzesammeln aufgebrochen, aber bisher nicht zurückgekehrt.
	AI_Output(self, hero, "Info_Mod_Diana_Hi_16_04"); //Nicht, dass sie nicht alt genug wäre, um selbst auf sich aufpassen zu können, aber es lässt mir doch keine Ruhe, nichts von ihr zu hören.
	AI_Output(self, hero, "Info_Mod_Diana_Hi_16_05"); //Wenn du ihr begegnest, sag ihr ruhig Bescheid, dass sie sich langsam mal wieder auf den Rückweg machen könnte.
	AI_Output(self, hero, "Info_Mod_Diana_Hi_16_06"); //Du kannst sie an ihrer eigenwilligen roten Mütze erkennen.
};

INSTANCE Info_Mod_Diana_Eintopf (C_INFO)
{
	npc		= Mod_7637_OUT_Diana_REL;
	nr		= 1;
	condition	= Info_Mod_Diana_Eintopf_Condition;
	information	= Info_Mod_Diana_Eintopf_Info;
	permanent	= 0;
	important	= 0;
	description	= "Machst du auch leckere Eintöpfe?";
};

FUNC INT Info_Mod_Diana_Eintopf_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Diana_Eintopf_Info()
{
	AI_Output(hero, self, "Info_Mod_Diana_Eintopf_15_00"); //Machst du auch leckere Eintöpfe?
	AI_Output(self, hero, "Info_Mod_Diana_Eintopf_16_01"); //Sieh dir doch die gutgenährten Buben auf dem Hof an! Das Fleischwanzenragout reißen sie mir förmlich aus den Händen.
	AI_Output(self, hero, "Info_Mod_Diana_Eintopf_16_02"); //(verschwörerisch) Mein Geheimnis sind kleine Melonenstückchen.
	AI_Output(hero, self, "Info_Mod_Diana_Eintopf_15_03"); //Aha. Ist ja interessant.
};

INSTANCE Info_Mod_Diana_Pickpocket (C_INFO)
{
	npc		= Mod_7637_OUT_Diana_REL;
	nr		= 1;
	condition	= Info_Mod_Diana_Pickpocket_Condition;
	information	= Info_Mod_Diana_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Diana_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Diana_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Diana_Pickpocket);

	Info_AddChoice	(Info_Mod_Diana_Pickpocket, DIALOG_BACK, Info_Mod_Diana_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Diana_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Diana_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Diana_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Diana_Pickpocket);
};

FUNC VOID Info_Mod_Diana_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Diana_Pickpocket);
};

INSTANCE Info_Mod_Diana_EXIT (C_INFO)
{
	npc		= Mod_7637_OUT_Diana_REL;
	nr		= 1;
	condition	= Info_Mod_Diana_EXIT_Condition;
	information	= Info_Mod_Diana_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Diana_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Diana_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};