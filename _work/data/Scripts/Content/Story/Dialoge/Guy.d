INSTANCE Info_Mod_Guy_Hi (C_INFO)
{
	npc		= Mod_1427_BUD_Guy_MT;
	nr		= 1;
	condition	= Info_Mod_Guy_Hi_Condition;
	information	= Info_Mod_Guy_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du noch mal?";
};

FUNC INT Info_Mod_Guy_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Guy_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Guy_Hi_15_00"); //Wer bist du noch mal?
	AI_Output(self, hero, "Info_Mod_Guy_Hi_03_01"); //Nur so 'n Typ. Kümmer dich nicht um mich.
};

INSTANCE Info_Mod_Guy_AllesKlar (C_INFO)
{
	npc		= Mod_1427_BUD_Guy_MT;
	nr		= 1;
	condition	= Info_Mod_Guy_AllesKlar_Condition;
	information	= Info_Mod_Guy_AllesKlar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alles beim Alten bei dir?";
};

FUNC INT Info_Mod_Guy_AllesKlar_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Guy_AllesKlar_Info()
{
	AI_Output(hero, self, "Info_Mod_Guy_AllesKlar_15_00"); //Alles beim Alten bei dir?
	AI_Output(self, hero, "Info_Mod_Guy_AllesKlar_03_01"); //Ja, mir geht's bestens. Solange mich alle in Ruhe lassen, geht's mir bestens.
};

INSTANCE Info_Mod_Guy_KGBuddler (C_INFO)
{
	npc		= Mod_1427_BUD_Guy_MT;
	nr		= 1;
	condition	= Info_Mod_Guy_KGBuddler_Condition;
	information	= Info_Mod_Guy_KGBuddler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hätte da eine neue Aufgabe für dich ...";
};

FUNC INT Info_Mod_Guy_KGBuddler_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Melcador_Buddler2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Costa_Buddler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Guy_KGBuddler_Info()
{
	AI_Output(hero, self, "Info_Mod_Guy_KGBuddler_15_00"); //Ich hätte da eine neue Aufgabe für dich ...
	AI_Output(self, hero, "Info_Mod_Guy_KGBuddler_03_01"); //... die ich gar nicht brauche. Wenn ich was arbeiten will, kann ich auch aufs Feld gehen.
};

INSTANCE Info_Mod_Guy_Pickpocket (C_INFO)
{
	npc		= Mod_1427_BUD_Guy_MT;
	nr		= 1;
	condition	= Info_Mod_Guy_Pickpocket_Condition;
	information	= Info_Mod_Guy_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Guy_Pickpocket_Condition()
{
	C_Beklauen	(51, ItMi_Gold, 20);
};

FUNC VOID Info_Mod_Guy_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Guy_Pickpocket);

	Info_AddChoice	(Info_Mod_Guy_Pickpocket, DIALOG_BACK, Info_Mod_Guy_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Guy_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Guy_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Guy_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Guy_Pickpocket);
};

FUNC VOID Info_Mod_Guy_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Guy_Pickpocket);
};

INSTANCE Info_Mod_Guy_EXIT (C_INFO)
{
	npc		= Mod_1427_BUD_Guy_MT;
	nr		= 1;
	condition	= Info_Mod_Guy_EXIT_Condition;
	information	= Info_Mod_Guy_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Guy_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Guy_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};