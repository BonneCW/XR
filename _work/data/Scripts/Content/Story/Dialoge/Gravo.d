INSTANCE Info_Mod_Gravo_KGBuddler (C_INFO)
{
	npc		= Mod_1430_BUD_Gravo_MT;
	nr		= 1;
	condition	= Info_Mod_Gravo_KGBuddler_Condition;
	information	= Info_Mod_Gravo_KGBuddler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du Lust als Buddler zu arbeiten?";
};

FUNC INT Info_Mod_Gravo_KGBuddler_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Melcador_Buddler2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Costa_Buddler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gravo_KGBuddler_Info()
{
	AI_Output(hero, self, "Info_Mod_Gravo_KGBuddler_15_00"); //Hast du Lust als Buddler zu arbeiten?
	AI_Output(self, hero, "Info_Mod_Gravo_KGBuddler_04_01"); //Ich habe mich schon davor gedrückt, als die Barriere noch da war, da werde ich jetzt bestimmt nicht damit anfangen ...
};

INSTANCE Info_Mod_Gravo_Pickpocket (C_INFO)
{
	npc		= Mod_1430_BUD_Gravo_MT;
	nr		= 1;
	condition	= Info_Mod_Gravo_Pickpocket_Condition;
	information	= Info_Mod_Gravo_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Gravo_Pickpocket_Condition()
{
	C_Beklauen	(51, ItMi_Gold, 20);
};

FUNC VOID Info_Mod_Gravo_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gravo_Pickpocket);

	Info_AddChoice	(Info_Mod_Gravo_Pickpocket, DIALOG_BACK, Info_Mod_Gravo_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gravo_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gravo_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gravo_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gravo_Pickpocket);
};

FUNC VOID Info_Mod_Gravo_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Gravo_Pickpocket);
};

INSTANCE Info_Mod_Gravo_EXIT (C_INFO)
{
	npc		= Mod_1430_BUD_Gravo_MT;
	nr		= 1;
	condition	= Info_Mod_Gravo_EXIT_Condition;
	information	= Info_Mod_Gravo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gravo_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gravo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};