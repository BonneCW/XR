INSTANCE Info_Mod_Bret_Hi (C_INFO)
{
	npc		= Mod_7414_JG_Bret_NW;
	nr		= 1;
	condition	= Info_Mod_Bret_Hi_Condition;
	information	= Info_Mod_Bret_Hi_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Bret_Hi_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Jäger_Dabei == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bret_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Bret_Hi_08_00"); //Wenn du was von uns möchtest, geh zu Dragomir.
};

INSTANCE Info_Mod_Bret_PreJaeger (C_INFO)
{
	npc		= Mod_7414_JG_Bret_NW;
	nr		= 1;
	condition	= Info_Mod_Bret_PreJaeger_Condition;
	information	= Info_Mod_Bret_PreJaeger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mach ich. Aber ich möchte auch was von dir wissen.";
};

FUNC INT Info_Mod_Bret_PreJaeger_Condition()
{
	if (Jäger_Dabei == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bret_PreJaeger_Info()
{
	AI_Output(hero, self, "Info_Mod_Bret_PreJaeger_15_00"); //Mach ich. Aber ich möchte auch was von dir wissen.
	AI_Output(self, hero, "Info_Mod_Bret_PreJaeger_08_01"); //Und das wäre?
	AI_Output(hero, self, "Info_Mod_Bret_PreJaeger_15_02"); //Wie kommst du hierher?
	AI_Output(self, hero, "Info_Mod_Bret_PreJaeger_08_03"); //Dumme Frage. Bin von der Stadt hergelaufen.
	AI_Output(hero, self, "Info_Mod_Bret_PreJaeger_15_04"); //Das meine ich nicht. Warum bist du in diesem Lager?
	AI_Output(self, hero, "Info_Mod_Bret_PreJaeger_08_05"); //Als ich alt genug war, hat mich Meister Bosper in die Lehre genommen.
	AI_Output(self, hero, "Info_Mod_Bret_PreJaeger_08_06"); //Genau so, wie meinen Bruder und früher meinen Vater.
	AI_Output(hero, self, "Info_Mod_Bret_PreJaeger_15_07"); //Dann bist du hier geboren?
	AI_Output(self, hero, "Info_Mod_Bret_PreJaeger_08_08"); //Ja, wie die meisten Jäger auf der Insel.
	AI_Output(self, hero, "Info_Mod_Bret_PreJaeger_08_09"); //Und nach der Lehre hab ich mich dem Trupp von Dragomir hier angeschlossen. Ist noch gar nicht so lange her.
	AI_Output(self, hero, "Info_Mod_Bret_PreJaeger_08_10"); //Willst du denn auch zu den Jägern?
	AI_Output(hero, self, "Info_Mod_Bret_PreJaeger_15_11"); //Weiß ich noch nicht. Mal sehen.
};

INSTANCE Info_Mod_Bret_Ambient (C_INFO)
{
	npc		= Mod_7414_JG_Bret_NW;
	nr		= 1;
	condition	= Info_Mod_Bret_Ambient_Condition;
	information	= Info_Mod_Bret_Ambient_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jetzt bin ich bei den Jägern aufgenommen worden.";
};

FUNC INT Info_Mod_Bret_Ambient_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Jäger_Dabei == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bret_Ambient_Info()
{
	AI_Output(hero, self, "Info_Mod_Bret_Ambient_15_00"); //Jetzt bin ich bei den Jägern aufgenommen worden.
	AI_Output(self, hero, "Info_Mod_Bret_Ambient_08_01"); //(unmotiviert) Ich seh's. Willkommen.
	AI_Output(hero, self, "Info_Mod_Bret_Ambient_15_02"); //Irgendwelche Tipps, die du mir mit auf den Weg geben willst?
	AI_Output(self, hero, "Info_Mod_Bret_Ambient_08_03"); //Geh zu Dragomir, er wird bestimmt einen Auftrag für dich haben.
	AI_Output(hero, self, "Info_Mod_Bret_Ambient_15_04"); //Ach ja.
};

INSTANCE Info_Mod_Bret_Pickpocket (C_INFO)
{
	npc		= Mod_7414_JG_Bret_NW;
	nr		= 1;
	condition	= Info_Mod_Bret_Pickpocket_Condition;
	information	= Info_Mod_Bret_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Bret_Pickpocket_Condition()
{
	C_Beklauen	(60, ItMi_Gold, 230);
};

FUNC VOID Info_Mod_Bret_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bret_Pickpocket);

	Info_AddChoice	(Info_Mod_Bret_Pickpocket, DIALOG_BACK, Info_Mod_Bret_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bret_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bret_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bret_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bret_Pickpocket);
};

FUNC VOID Info_Mod_Bret_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Bret_Pickpocket);
};

INSTANCE Info_Mod_Bret_EXIT (C_INFO)
{
	npc		= Mod_7414_JG_Bret_NW;
	nr		= 1;
	condition	= Info_Mod_Bret_EXIT_Condition;
	information	= Info_Mod_Bret_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bret_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bret_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};