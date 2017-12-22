INSTANCE Info_Mod_Nadja_Hi (C_INFO)
{
	npc		= Mod_7115_NONE_Nadja_NW;
	nr		= 1;
	condition	= Info_Mod_Nadja_Hi_Condition;
	information	= Info_Mod_Nadja_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Nadja_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nadja_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Nadja_Hi_43_00"); //Nadja.
};

INSTANCE Info_Mod_Nadja_LuteroHochzeit (C_INFO)
{
	npc		= Mod_7115_NONE_Nadja_NW;
	nr		= 1;
	condition	= Info_Mod_Nadja_LuteroHochzeit_Condition;
	information	= Info_Mod_Nadja_LuteroHochzeit_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lutero hat dir versprochen, dich zu heiraten?";
};

FUNC INT Info_Mod_Nadja_LuteroHochzeit_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nadja_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Lutero_SonjaFreier))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nadja_LuteroHochzeit_Info()
{
	AI_Output(hero, self, "Info_Mod_Nadja_LuteroHochzeit_15_00"); //Lutero hat dir versprochen, dich zu heiraten?
	AI_Output(self, hero, "Info_Mod_Nadja_LuteroHochzeit_43_01"); //Mach dir darum mal keinen Kopf. Ich habe in meinem Leben schon Dutzende Heiratsanträge bekommen.
	AI_Output(self, hero, "Info_Mod_Nadja_LuteroHochzeit_43_02"); //Es gibt Situationen, in denen Männer ihr gesamtes rationales Denken über Bord werfen.
	AI_Output(self, hero, "Info_Mod_Nadja_LuteroHochzeit_43_03"); //Ich würde ja unglücklich werden, wenn ich all ihre Versprechungen für bare Münze nehmen würde.
};

INSTANCE Info_Mod_Nadja_Pickpocket (C_INFO)
{
	npc		= Mod_7115_NONE_Nadja_NW;
	nr		= 1;
	condition	= Info_Mod_Nadja_Pickpocket_Condition;
	information	= Info_Mod_Nadja_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90_Female;
};

FUNC INT Info_Mod_Nadja_Pickpocket_Condition()
{
	C_Beklauen	(73, ItMi_Gold, 20);
};

FUNC VOID Info_Mod_Nadja_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Nadja_Pickpocket);

	Info_AddChoice	(Info_Mod_Nadja_Pickpocket, DIALOG_BACK, Info_Mod_Nadja_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Nadja_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Nadja_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Nadja_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Nadja_Pickpocket);
};

FUNC VOID Info_Mod_Nadja_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Nadja_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Nadja_Pickpocket);

		Info_AddChoice	(Info_Mod_Nadja_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Nadja_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Nadja_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Nadja_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Nadja_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Nadja_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Nadja_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Nadja_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Nadja_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Nadja_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Nadja_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Nadja_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Nadja_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Nadja_EXIT (C_INFO)
{
	npc		= Mod_7115_NONE_Nadja_NW;
	nr		= 1;
	condition	= Info_Mod_Nadja_EXIT_Condition;
	information	= Info_Mod_Nadja_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Nadja_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nadja_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};