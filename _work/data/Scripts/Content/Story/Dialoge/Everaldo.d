INSTANCE Info_Mod_Everaldo_Hi (C_INFO)
{
	npc		= Mod_1530_WKR_Everaldo_NW;
	nr		= 1;
	condition	= Info_Mod_Everaldo_Hi_Condition;
	information	= Info_Mod_Everaldo_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich komme von Vanas.";
};

FUNC INT Info_Mod_Everaldo_Hi_Condition()
{
	if (Mod_SLD_Engardo == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Everaldo_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Everaldo_Hi_15_00"); //Ich komme von Vanas.
	AI_Output(self, hero, "Info_Mod_Everaldo_Hi_04_01"); //Ohh, ja, ich weiß, worum es geht. Es ist ein Schmiedebauplan von hohem Wert, dessen solltest du dir bewusst sein, weit wertvoller, als die paar Erz und Sumpfkraut ...
	AI_Output(hero, self, "Info_Mod_Everaldo_Hi_15_02"); //(unterbricht) Bekomme ich jetzt den Bauplan?
	AI_Output(self, hero, "Info_Mod_Everaldo_Hi_04_03"); //Ähh, ja, natürlich, hier. (zu sich selbst) Hoffentlich bekommt Saturas das nie heraus.

	B_GiveInvItems	(self, hero, ItWr_Bauplan_Erzschwert_Wasser, 1);

	B_LogEntry	(TOPIC_MOD_SLD_ENGARDO, "Ich habe den Schmiedebauplan von Everaldo.");
};

INSTANCE Info_Mod_Everaldo_Pickpocket (C_INFO)
{
	npc		= Mod_1530_WKR_Everaldo_NW;
	nr		= 1;
	condition	= Info_Mod_Everaldo_Pickpocket_Condition;
	information	= Info_Mod_Everaldo_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Everaldo_Pickpocket_Condition()
{
	C_Beklauen	(78, ItMi_Gold, 300);
};

FUNC VOID Info_Mod_Everaldo_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Everaldo_Pickpocket);

	Info_AddChoice	(Info_Mod_Everaldo_Pickpocket, DIALOG_BACK, Info_Mod_Everaldo_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Everaldo_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Everaldo_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Everaldo_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Everaldo_Pickpocket);
};

FUNC VOID Info_Mod_Everaldo_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Everaldo_Pickpocket);
};

INSTANCE Info_Mod_Everaldo_EXIT (C_INFO)
{
	npc		= Mod_1530_WKR_Everaldo_NW;
	nr		= 1;
	condition	= Info_Mod_Everaldo_EXIT_Condition;
	information	= Info_Mod_Everaldo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Everaldo_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Everaldo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};