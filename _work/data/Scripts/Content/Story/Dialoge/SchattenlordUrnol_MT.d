INSTANCE Info_Mod_Urnol_MT_Hi (C_INFO)
{
	npc		= Schattenlord_877_Urnol;
	nr		= 1;
	condition	= Info_Mod_Urnol_MT_Hi_Condition;
	information	= Info_Mod_Urnol_MT_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Urnol_MT_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Urnol_MT_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Urnol_MT_Hi_14_00"); //So sieht man sich wieder. Du hast es geschafft, du hast meinen Meister aus der Unterwelt befreit.
	AI_Output(self, hero, "Info_Mod_Urnol_MT_Hi_14_01"); //Geh ruhig zu ihm, er wartet schon auf dich.

	B_Say	(hero, self, "$WOFINDEICHIHN");

	AI_Output(self, hero, "Info_Mod_Urnol_MT_Hi_14_03"); //Auf dem Weg in Richtung des unterirdischen Teils der Stadt. Du kannst ihn gar nicht verfehlen. (lacht)

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Urnol_MT_EXIT (C_INFO)
{
	npc		= Schattenlord_877_Urnol;
	nr		= 1;
	condition	= Info_Mod_Urnol_MT_EXIT_Condition;
	information	= Info_Mod_Urnol_MT_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Urnol_MT_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Urnol_MT_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};