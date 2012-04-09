INSTANCE Info_Mod_Rukhar_Hi (C_INFO)
{
	npc		= Mod_777_NONE_Rukhar_NW;
	nr		= 1;
	condition	= Info_Mod_Rukhar_Hi_Condition;
	information	= Info_Mod_Rukhar_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Rukhar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rukhar_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Rukhar_Hi_12_01"); //Ich bin Rukhar.
};

INSTANCE Info_Mod_Rukhar_WacholderDieb (C_INFO)
{
	npc		= Mod_777_NONE_Rukhar_NW;
	nr		= 1;
	condition	= Info_Mod_Rukhar_WacholderDieb_Condition;
	information	= Info_Mod_Rukhar_WacholderDieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe ein paar Fragen zu dem Wachholderdiebstahl bei Coragon!";
};

FUNC INT Info_Mod_Rukhar_WacholderDieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rukhar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Wirt_WacholderDieb_Pay))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rukhar_WacholderDieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Rukhar_WacholderDieb_15_00"); //Ich habe ein paar Fragen zu dem Wachholderdiebstahl bei Coragon!
	AI_Output(self, hero, "Info_Mod_Rukhar_WacholderDieb_12_01"); //Was? Wer hat dir das gesteckt? Ich hatte keine Wahl!
	AI_Output(hero, self, "Info_Mod_Rukhar_WacholderDieb_15_02"); //Ist ja schon gut, gib mir einfach den Wacholder.
	AI_Output(self, hero, "Info_Mod_Rukhar_WacholderDieb_12_03"); //Ich habe ihn nicht mehr. Aber ich gebe dir diese Notiz, sie wird dir helfen.

	B_GiveInvItems	(self, hero, ItWr_Rukhar_Wacholder, 1);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Rukhar_Pickpocket (C_INFO)
{
	npc		= Mod_777_NONE_Rukhar_NW;
	nr		= 1;
	condition	= Info_Mod_Rukhar_Pickpocket_Condition;
	information	= Info_Mod_Rukhar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Rukhar_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Rukhar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Rukhar_Pickpocket);

	Info_AddChoice	(Info_Mod_Rukhar_Pickpocket, DIALOG_BACK, Info_Mod_Rukhar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Rukhar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Rukhar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Rukhar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Rukhar_Pickpocket);
};

FUNC VOID Info_Mod_Rukhar_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Rukhar_Pickpocket);
};

INSTANCE Info_Mod_Rukhar_EXIT (C_INFO)
{
	npc		= Mod_777_NONE_Rukhar_NW;
	nr		= 1;
	condition	= Info_Mod_Rukhar_EXIT_Condition;
	information	= Info_Mod_Rukhar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Rukhar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rukhar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};