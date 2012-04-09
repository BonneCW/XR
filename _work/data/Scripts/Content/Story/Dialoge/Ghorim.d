INSTANCE Info_Mod_Ghorim_Hi (C_INFO)
{
	npc		= Mod_2008_PSINOV_Ghorim_MT;
	nr		= 1;
	condition	= Info_Mod_Ghorim_Hi_Condition;
	information	= Info_Mod_Ghorim_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ghorim_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ghorim_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Ghorim_Hi_02_00"); //Du lebst noch? Danke nochmal, dass du mir damals geholfen hast.
};

INSTANCE Info_Mod_Ghorim_Woher (C_INFO)
{
	npc		= Mod_2008_PSINOV_Ghorim_MT;
	nr		= 1;
	condition	= Info_Mod_Ghorim_Woher_Condition;
	information	= Info_Mod_Ghorim_Woher_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wie kommst du eigentlich in dieses Lager?";
};

FUNC INT Info_Mod_Ghorim_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ghorim_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ghorim_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Ghorim_Woher_15_00"); //Wie kommst du eigentlich in dieses Lager?
	AI_Output(self, hero, "Info_Mod_Ghorim_Woher_02_01"); //Nachdem ich in Khorinis erfolglos mein Wirtshaus geführt habe, musste ich wegen Goldmangel den Wein mit Wasser verdünnen.
	AI_Output(self, hero, "Info_Mod_Ghorim_Woher_02_02"); //Als das rauskam haben sie mich in die Kolonie geworfen.
	AI_Output(self, hero, "Info_Mod_Ghorim_Woher_02_03"); //Ich war erst Buddler, hab mich dann aber doch der Bruderschaft angeschlossen, da das Leben hier wesentlich angenehmer ist.
};

INSTANCE Info_Mod_Ghorim_Pickpocket (C_INFO)
{
	npc		= Mod_2008_PSINOV_Ghorim_MT;
	nr		= 1;
	condition	= Info_Mod_Ghorim_Pickpocket_Condition;
	information	= Info_Mod_Ghorim_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_40;
};

FUNC INT Info_Mod_Ghorim_Pickpocket_Condition()
{
	C_Beklauen	(40, ItMi_Gold, 70);
};

FUNC VOID Info_Mod_Ghorim_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ghorim_Pickpocket);

	Info_AddChoice	(Info_Mod_Ghorim_Pickpocket, DIALOG_BACK, Info_Mod_Ghorim_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ghorim_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ghorim_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ghorim_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ghorim_Pickpocket);
};

FUNC VOID Info_Mod_Ghorim_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Ghorim_Pickpocket);
};

INSTANCE Info_Mod_Ghorim_EXIT (C_INFO)
{
	npc		= Mod_2008_PSINOV_Ghorim_MT;
	nr		= 1;
	condition	= Info_Mod_Ghorim_EXIT_Condition;
	information	= Info_Mod_Ghorim_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ghorim_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ghorim_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};