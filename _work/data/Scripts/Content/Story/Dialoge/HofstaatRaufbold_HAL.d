INSTANCE Info_Mod_HofstaatRaufbold_HAL_Hi (C_INFO)
{
	npc		= Mod_7329_HS_Raufbold_HAL;
	nr		= 1;
	condition	= Info_Mod_HofstaatRaufbold_HAL_Hi_Condition;
	information	= Info_Mod_HofstaatRaufbold_HAL_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatRaufbold_HAL_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatRaufbold_HAL_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_HAL_Hi_13_00"); //Hm?
	AI_Output(hero, self, "Info_Mod_HofstaatRaufbold_HAL_Hi_15_01"); //Raufbold?! Was machst du hier? Hast du auch die Orakeldroge genommen?
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_HAL_Hi_13_02"); //Nein, ich bin in den Fluss gefallen ... Sauerstoffmangel.
	AI_Output(hero, self, "Info_Mod_HofstaatRaufbold_HAL_Hi_15_03"); //Was hat das alles zu bedeuten?
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_HAL_Hi_13_04"); //Das ist eine Prüfung! Dies hier muss eine OFFENBARUNG sein! Doch eine Prüfung steht uns noch bevor.
	AI_Output(self, hero, "Info_Mod_HofstaatRaufbold_HAL_Hi_13_05"); //Ein letztes Duell zwischen uns! Der Gewinner wird die Antwort erhalten! Der Verlierer wird in SCHAAAAAAM ersaufen! Los jetzt!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};