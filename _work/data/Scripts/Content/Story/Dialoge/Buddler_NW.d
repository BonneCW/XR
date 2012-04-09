INSTANCE Info_Mod_Buddler_NW_Hi (C_INFO)
{
	npc		= Mod_1933_BUD_Buddler_NW;
	nr		= 1;
	condition	= Info_Mod_Buddler_NW_Hi_Condition;
	information	= Info_Mod_Buddler_NW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Buddler_NW_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Whistler_NW_NachtImPuff))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Buddler_NW_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Buddler_NW_Hi_11_00"); //Ich habe eine Botschaft von Alissandro an den Boss hier.
	AI_Output(hero, self, "Info_Mod_Buddler_NW_Hi_15_01"); //Das bin dann wohl ich.
	AI_Output(self, hero, "Info_Mod_Buddler_NW_Hi_11_02"); //Der Alte hat mir diesen Zettel für dich gegeben.

	B_GiveInvItems	(self, hero, ItWr_BuddlerNachrichtVonAL, 1);

	AI_Output(hero, self, "Info_Mod_Buddler_NW_Hi_15_03"); //Gut, ist noch was?
	AI_Output(self, hero, "Info_Mod_Buddler_NW_Hi_11_04"); //Nein, der Alte meinte bloß, ich soll mich noch nützlich machen. Gibt es hier Arbeit für mich?
	AI_Output(hero, self, "Info_Mod_Buddler_NW_Hi_15_05"); //Frag Whistler.

	B_StartOtherRoutine	(self, "ARBEIT");
};

INSTANCE Info_Mod_Buddler_NW_Pickpocket (C_INFO)
{
	npc		= Mod_1933_BUD_Buddler_NW;
	nr		= 1;
	condition	= Info_Mod_Buddler_NW_Pickpocket_Condition;
	information	= Info_Mod_Buddler_NW_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_40;
};

FUNC INT Info_Mod_Buddler_NW_Pickpocket_Condition()
{
	C_Beklauen	(36, ItMi_Gold, 20);
};

FUNC VOID Info_Mod_Buddler_NW_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Buddler_NW_Pickpocket);

	Info_AddChoice	(Info_Mod_Buddler_NW_Pickpocket, DIALOG_BACK, Info_Mod_Buddler_NW_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Buddler_NW_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Buddler_NW_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Buddler_NW_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Buddler_NW_Pickpocket);
};

FUNC VOID Info_Mod_Buddler_NW_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Buddler_NW_Pickpocket);
};

INSTANCE Info_Mod_Buddler_NW_EXIT (C_INFO)
{
	npc		= Mod_1933_BUD_Buddler_NW;
	nr		= 1;
	condition	= Info_Mod_Buddler_NW_EXIT_Condition;
	information	= Info_Mod_Buddler_NW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Buddler_NW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Buddler_NW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};