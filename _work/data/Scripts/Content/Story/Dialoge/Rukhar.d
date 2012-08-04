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
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Rukhar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Rukhar_Pickpocket);

		Info_AddChoice	(Info_Mod_Rukhar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Rukhar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Rukhar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Rukhar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Rukhar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Rukhar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Rukhar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Rukhar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Rukhar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Rukhar_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Rukhar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Rukhar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Rukhar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
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