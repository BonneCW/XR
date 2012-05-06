INSTANCE Info_Mod_Tyrus_Hi (C_INFO)
{
	npc		= Mod_7519_OUT_Tyrus_REL;
	nr		= 1;
	condition	= Info_Mod_Tyrus_Hi_Condition;
	information	= Info_Mod_Tyrus_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Tyrus_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Tyrus_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Tyrus_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Tyrus_Hi_08_01"); //(mürrisch) Ist was?
};

INSTANCE Info_Mod_Tyrus_AboutYou (C_INFO)
{
	npc		= Mod_7519_OUT_Tyrus_REL;
	nr		= 1;
	condition	= Info_Mod_Tyrus_AboutYou_Condition;
	information	= Info_Mod_Tyrus_AboutYou_Info;
	permanent	= 0;
	important	= 0;
	description	= "Erzähl mir was über dich.";
};

FUNC INT Info_Mod_Tyrus_AboutYou_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tyrus_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tyrus_AboutYou_Info()
{
	AI_Output(hero, self, "Info_Mod_Tyrus_AboutYou_15_00"); //Erzähl mir was über dich.
	AI_Output(self, hero, "Info_Mod_Tyrus_AboutYou_08_01"); //Da gibt es nicht viel zu sagen. Ich bin ein Schüler von Friedel, und der Unterricht ist hart genug, dass ich kaum zu etwas anderem komme.
	AI_Output(self, hero, "Info_Mod_Tyrus_AboutYou_08_02"); //Kriechen, Krabbeln, Kraulen ... Pah! Wer braucht das schon?
};

INSTANCE Info_Mod_Tyrus_Wettstreit (C_INFO)
{
	npc		= Mod_7519_OUT_Tyrus_REL;
	nr		= 1;
	condition	= Info_Mod_Tyrus_Wettstreit_Condition;
	information	= Info_Mod_Tyrus_Wettstreit_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was sagst du nun?";
};

FUNC INT Info_Mod_Tyrus_Wettstreit_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tyrus_AboutYou))
	&& (Npc_GetDistToWP(self, "REL_CITY_381") < 400)
	&& (Mod_REL_Wettstreit_Hero > Mod_REL_Wettstreit_Tyrus)
	&& (Mod_REL_Wettstreit_Hero > Mod_REL_Wettstreit_Davon)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tyrus_Wettstreit_Info()
{
	AI_Output(hero, self, "Info_Mod_Tyrus_Wettstreit_15_00"); //Was sagst du nun?
	AI_Output(self, hero, "Info_Mod_Tyrus_Wettstreit_08_01"); //Fühlst dich jetzt wohl ganz toll, hä? Und ich darf weiter bei Friedel rumgammeln ...
};

INSTANCE Info_Mod_Tyrus_Freudenspender (C_INFO)
{
	npc		= Mod_7519_OUT_Tyrus_REL;
	nr		= 1;
	condition	= Info_Mod_Tyrus_Freudenspender_Condition;
	information	= Info_Mod_Tyrus_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Ich hätte da bei Interesse Freudenspender für dich ...";
};                       

FUNC INT Info_Mod_Tyrus_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Tyrus_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Tyrus_Freudenspender_15_00"); //Ich hätte da bei Interesse Freudenspender für dich ...
	AI_Output(self, hero, "Info_Mod_Tyrus_Freudenspender_08_01"); //Schön für dich. Steck's dir meinetwegen in den Arsch.
};

INSTANCE Info_Mod_Tyrus_Pickpocket (C_INFO)
{
	npc		= Mod_7519_OUT_Tyrus_REL;
	nr		= 1;
	condition	= Info_Mod_Tyrus_Pickpocket_Condition;
	information	= Info_Mod_Tyrus_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Tyrus_Pickpocket_Condition()
{
	C_Beklauen	(72, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Tyrus_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Tyrus_Pickpocket);

	Info_AddChoice	(Info_Mod_Tyrus_Pickpocket, DIALOG_BACK, Info_Mod_Tyrus_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Tyrus_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Tyrus_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Tyrus_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Tyrus_Pickpocket);
};

FUNC VOID Info_Mod_Tyrus_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Tyrus_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Tyrus_Pickpocket);

		Info_AddChoice	(Info_Mod_Tyrus_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Tyrus_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Tyrus_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Tyrus_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Tyrus_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Tyrus_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Tyrus_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Tyrus_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Tyrus_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Tyrus_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Tyrus_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Tyrus_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Tyrus_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Tyrus_EXIT (C_INFO)
{
	npc		= Mod_7519_OUT_Tyrus_REL;
	nr		= 1;
	condition	= Info_Mod_Tyrus_EXIT_Condition;
	information	= Info_Mod_Tyrus_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Tyrus_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Tyrus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};