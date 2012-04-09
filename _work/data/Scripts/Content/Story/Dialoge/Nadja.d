INSTANCE Info_Mod_Nadja_Hi (C_INFO)
{
	npc		= Mod_7115_NONE_Nadja_NW;
	nr		= 1;
	condition	= Info_Mod_Nadja_Hi_Condition;
	information	= Info_Mod_Nadja_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Nadja_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nadja_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Nadja_Hi_16_00"); //Nadja.
};

INSTANCE Info_Mod_Nadja_LuteroHochzeit (C_INFO)
{
	npc		= Mod_7115_NONE_Nadja_NW;
	nr		= 1;
	condition	= Info_Mod_Nadja_LuteroHochzeit_Condition;
	information	= Info_Mod_Nadja_LuteroHochzeit_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lutero hat dir versprochen, dich zu heiraten?";
};

FUNC INT Info_Mod_Nadja_LuteroHochzeit_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nadja_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Lutero_SonjaFreier))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nadja_LuteroHochzeit_Info()
{
	AI_Output(hero, self, "Info_Mod_Nadja_LuteroHochzeit_15_00"); //Lutero hat dir versprochen, dich zu heiraten?
	AI_Output(self, hero, "Info_Mod_Nadja_LuteroHochzeit_16_01"); //Mach dir darum mal keinen Kopf. Ich habe in meinem Leben schon Dutzende Heiratsanträge bekommen.
	AI_Output(self, hero, "Info_Mod_Nadja_LuteroHochzeit_16_02"); //Es gibt Situationen, in denen Männer ihr gesamtes rationales Denken über Bord werfen.
	AI_Output(self, hero, "Info_Mod_Nadja_LuteroHochzeit_16_03"); //Ich würde ja unglücklich werden, wenn ich all ihre Versprechungen für bare Münze nehmen würde.
};

INSTANCE Info_Mod_Nadja_Pickpocket (C_INFO)
{
	npc		= Mod_7115_NONE_Nadja_NW;
	nr		= 1;
	condition	= Info_Mod_Nadja_Pickpocket_Condition;
	information	= Info_Mod_Nadja_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Nadja_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 250);
};

FUNC VOID Info_Mod_Nadja_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Nadja_Pickpocket);

	Info_AddChoice	(Info_Mod_Nadja_Pickpocket, DIALOG_BACK, Info_Mod_Nadja_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Nadja_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Nadja_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Nadja_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Nadja_Pickpocket);
};

FUNC VOID Info_Mod_Nadja_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Nadja_Pickpocket);
};

INSTANCE Info_Mod_Nadja_EXIT (C_INFO)
{
	npc		= Mod_7115_NONE_Nadja_NW;
	nr		= 1;
	condition	= Info_Mod_Nadja_EXIT_Condition;
	information	= Info_Mod_Nadja_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Nadja_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nadja_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};