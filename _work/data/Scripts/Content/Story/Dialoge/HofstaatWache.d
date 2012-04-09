INSTANCE Info_Mod_HofstaatWache_Hi (C_INFO)
{
	npc		= Mod_7014_HS_Wache_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatWache_Hi_Condition;
	information	= Info_Mod_HofstaatWache_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatWache_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatWache_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatWache_Hi_07_00"); //Hey! Was machst du hier?

	Info_ClearChoices	(Info_Mod_HofstaatWache_Hi);

	Info_AddChoice	(Info_Mod_HofstaatWache_Hi, "Was war denn das eben?", Info_Mod_HofstaatWache_Hi_C);
	Info_AddChoice	(Info_Mod_HofstaatWache_Hi, "Ich will da rein!", Info_Mod_HofstaatWache_Hi_B);
	Info_AddChoice	(Info_Mod_HofstaatWache_Hi, "Ich ... habe keine Ahnung.", Info_Mod_HofstaatWache_Hi_A);
};

FUNC VOID Info_Mod_HofstaatWache_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_HofstaatWache_Hi_C_15_00"); //Was war denn das eben?
	AI_Output(self, hero, "Info_Mod_HofstaatWache_Hi_C_07_01"); //Das? Fluffy's Mittagessen.

	Info_ClearChoices	(Info_Mod_HofstaatWache_Hi);
};

FUNC VOID Info_Mod_HofstaatWache_Hi_C()
{
	AI_Output(self, hero, "Info_Mod_HofstaatWache_Hi_D_07_00"); //Ach übrigens, du bist jetzt königlicher Pöbel!
	AI_Output(hero, self, "Info_Mod_HofstaatWache_Hi_D_15_01"); //Pöbel?
	AI_Output(self, hero, "Info_Mod_HofstaatWache_Hi_D_07_02"); //KÖNIGLICHER PÖBEL! Und jetzt hau ab.
};

FUNC VOID Info_Mod_HofstaatWache_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_HofstaatWache_Hi_B_15_00"); //Ich will da rein!
	AI_Output(self, hero, "Info_Mod_HofstaatWache_Hi_B_07_01"); //Dazu brauchst du einen Pass.
	AI_Output(hero, self, "Info_Mod_HofstaatWache_Hi_B_15_02"); //Woher bekomme ich einen Pass.

	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		AI_Output(self, hero, "Info_Mod_HofstaatWache_Hi_B_07_03"); //Das macht 100 Goldstücke.

		B_GiveInvItems	(hero, self, ItMi_Gold, 100);
	};

	AI_Output(self, hero, "Info_Mod_HofstaatWache_Hi_B_07_04"); //Hier.

	B_GiveInvItems	(self, hero, ItWr_Passierschein_HS, 1);

	Info_Mod_HofstaatWache_Hi_D();
};

FUNC VOID Info_Mod_HofstaatWache_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_HofstaatWache_Hi_A_15_00"); //Ich ... habe keine Ahnung.
	AI_Output(self, hero, "Info_Mod_HofstaatWache_Hi_A_07_01"); //Dann bist du einer von uns. Du darfst passieren.

	Info_Mod_HofstaatWache_Hi_D();
};

INSTANCE Info_Mod_HofstaatWache_Pickpocket (C_INFO)
{
	npc		= Mod_7014_HS_Wache_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatWache_Pickpocket_Condition;
	information	= Info_Mod_HofstaatWache_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_HofstaatWache_Pickpocket_Condition()
{
	C_Beklauen	(95, ItMi_Gold, 550);
};

FUNC VOID Info_Mod_HofstaatWache_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatWache_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatWache_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatWache_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatWache_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatWache_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatWache_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatWache_Pickpocket);
};

FUNC VOID Info_Mod_HofstaatWache_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_HofstaatWache_Pickpocket);
};

INSTANCE Info_Mod_HofstaatWache_EXIT (C_INFO)
{
	npc		= Mod_7014_HS_Wache_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatWache_EXIT_Condition;
	information	= Info_Mod_HofstaatWache_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatWache_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatWache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};