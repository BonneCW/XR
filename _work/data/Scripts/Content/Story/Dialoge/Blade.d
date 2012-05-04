INSTANCE Info_Mod_Blade_Hi (C_INFO)
{
	npc		= Mod_1269_SLD_Blade_MT;
	nr		= 1;
	condition	= Info_Mod_Blade_Hi_Condition;
	information	= Info_Mod_Blade_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das Training wartet. Geh zu Patrick.";
};

FUNC INT Info_Mod_Blade_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Patrick_Training))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Blade_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Blade_Hi_15_00"); //Das Training wartet. Geh zu Patrick.
	AI_Output(self, hero, "Info_Mod_Blade_Hi_11_01"); //Was? Man, ich bin doch sowieso schon einer der besten Schwertkämpfer.
	AI_Output(hero, self, "Info_Mod_Blade_Hi_15_02"); //Regeln sind Regeln.
	AI_Output(self, hero, "Info_Mod_Blade_Hi_11_03"); //Ja, ich mach mich ja schon auf die Socken.

	B_LogEntry	(TOPIC_MOD_SLD_PATRICK, "Blade zum Training zu bewegen war kein größeres Problem.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TRAINING");
};

INSTANCE Info_Mod_Blade_Ambient (C_INFO)
{
	npc		= Mod_1269_SLD_Blade_MT;
	nr		= 1;
	condition	= Info_Mod_Blade_Ambient_Condition;
	information	= Info_Mod_Blade_Ambient_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie geht's?";
};

FUNC INT Info_Mod_Blade_Ambient_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Blade_Ambient_Info()
{
	AI_Output(hero, self, "Info_Mod_Blade_Ambient_15_00"); //Wie geht's?
	AI_Output(self, hero, "Info_Mod_Blade_Ambient_11_01"); //Komisch heute. Hab da so ein Kribbeln im Arm.
	AI_Output(self, hero, "Info_Mod_Blade_Ambient_11_02"); //Muss wohl mal wieder ordentlich trainieren.
};

INSTANCE Info_Mod_Blade_Pickpocket (C_INFO)
{
	npc		= Mod_1269_SLD_Blade_MT;
	nr		= 1;
	condition	= Info_Mod_Blade_Pickpocket_Condition;
	information	= Info_Mod_Blade_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Blade_Pickpocket_Condition()
{
	C_Beklauen	(73, ItMi_Gold, 230);
};

FUNC VOID Info_Mod_Blade_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Blade_Pickpocket);

	Info_AddChoice	(Info_Mod_Blade_Pickpocket, DIALOG_BACK, Info_Mod_Blade_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Blade_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Blade_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Blade_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Blade_Pickpocket);
};

FUNC VOID Info_Mod_Blade_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Blade_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Blade_Pickpocket);

		Info_AddChoice	(Info_Mod_Blade_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Blade_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Blade_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Blade_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Blade_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Blade_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Blade_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Blade_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Blade_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Blade_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Blade_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Blade_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Blade_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Blade_EXIT (C_INFO)
{
	npc		= Mod_1269_SLD_Blade_MT;
	nr		= 1;
	condition	= Info_Mod_Blade_EXIT_Condition;
	information	= Info_Mod_Blade_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Blade_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Blade_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};