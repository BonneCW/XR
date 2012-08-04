INSTANCE Info_Mod_HofstaatGleichgewichtsminister_Hi (C_INFO)
{
	npc		= Mod_7287_HS_Gleichgewichtsminister_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatGleichgewichtsminister_Hi_Condition;
	information	= Info_Mod_HofstaatGleichgewichtsminister_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich muss zum Drogenminister.";
};

FUNC INT Info_Mod_HofstaatGleichgewichtsminister_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatJaeger_Drogenminister))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatGleichgewichtsminister_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_HofstaatGleichgewichtsminister_Hi_15_00"); //Ich muss zum Drogenminister.
	AI_Output(self, hero, "Info_Mod_HofstaatGleichgewichtsminister_Hi_01_01"); //Da bist du bei mir falsch, ich bin der Gleichgewichtsminister.
	AI_Output(hero, self, "Info_Mod_HofstaatGleichgewichtsminister_Hi_15_02"); //Ich weiﬂ, aber der J‰ger hat mir gesagt, du kannst mir helfen, zum Drogenminister zu kommen.
	AI_Output(self, hero, "Info_Mod_HofstaatGleichgewichtsminister_Hi_01_03"); //Da hat er wohl Recht. Aber nur, wenn du mir das Codewort sagen kannst.
	AI_Output(hero, self, "Info_Mod_HofstaatGleichgewichtsminister_Hi_15_04"); //Lass mich raten ... Bananarama?
	AI_Output(self, hero, "Info_Mod_HofstaatGleichgewichtsminister_Hi_01_05"); //Richtig. Gehen wir.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "DROGENMINISTER");
	B_StartOtherRoutine	(Mod_7289_HS_Jaeger_REL, "START");
};

INSTANCE Info_Mod_HofstaatGleichgewichtsminister_Drogenminister (C_INFO)
{
	npc		= Mod_7287_HS_Gleichgewichtsminister_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatGleichgewichtsminister_Drogenminister_Condition;
	information	= Info_Mod_HofstaatGleichgewichtsminister_Drogenminister_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatGleichgewichtsminister_Drogenminister_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatGleichgewichtsminister_Hi))
	&& (Npc_GetDistToWP(self, "REL_301") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatGleichgewichtsminister_Drogenminister_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatGleichgewichtsminister_Drogenminister_01_00"); //Also Mann, du musst nur ganz ruhig werden.
	AI_Output(hero, self, "Info_Mod_HofstaatGleichgewichtsminister_Drogenminister_15_01"); //Okay.
	AI_Output(self, hero, "Info_Mod_HofstaatGleichgewichtsminister_Drogenminister_01_02"); //F¸hl einfach, wie der Wind dich durchstrˆmt und eins mit dir wird.
	AI_Output(hero, self, "Info_Mod_HofstaatGleichgewichtsminister_Drogenminister_15_03"); //Ist gut.
	AI_Output(self, hero, "Info_Mod_HofstaatGleichgewichtsminister_Drogenminister_01_04"); //Du musst fest sein wie der Stein und doch biegsam wie das Schilfrohr, verstehst du?
	AI_Output(hero, self, "Info_Mod_HofstaatGleichgewichtsminister_Drogenminister_15_05"); //Mehr oder weniger.
	AI_Output(self, hero, "Info_Mod_HofstaatGleichgewichtsminister_Drogenminister_01_06"); //Das ist gut. Dann nimm jetzt dein Ziel in die Augen und ...
	AI_Output(hero, self, "Info_Mod_HofstaatGleichgewichtsminister_Drogenminister_15_07"); //Geh ¸ber das Seil?
	AI_Output(self, hero, "Info_Mod_HofstaatGleichgewichtsminister_Drogenminister_01_08"); //UM HIMMELS WILLEN BLOﬂ NICHT! Da brichst du dir ja den Hals.
	AI_Output(self, hero, "Info_Mod_HofstaatGleichgewichtsminister_Drogenminister_01_09"); //Hier, der Schl¸ssel f¸r die Treppe. Die T¸r ist am Fuﬂ des andren H¸gels.

	B_GiveInvItems	(self, hero, ItKe_HSDM, 1);

	AI_Output(hero, self, "Info_Mod_HofstaatGleichgewichtsminister_Drogenminister_15_10"); //Was?! Wieso sind wir dann noch mal hier rauf gegangen?!
	AI_Output(self, hero, "Info_Mod_HofstaatGleichgewichtsminister_Drogenminister_01_11"); //Mir gef‰llts hier oben.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Der Gleichgewichtsminister hat mir den Schl¸ssel zu einer T¸r im gegen¸berliegenden Berg gegeben, in welchem sich eine Treppe befinden soll, die zum Drogenminister hinauf f¸hrt.");
};

INSTANCE Info_Mod_HofstaatGleichgewichtsminister_Pickpocket (C_INFO)
{
	npc		= Mod_7287_HS_Gleichgewichtsminister_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatGleichgewichtsminister_Pickpocket_Condition;
	information	= Info_Mod_HofstaatGleichgewichtsminister_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_HofstaatGleichgewichtsminister_Pickpocket_Condition()
{
	C_Beklauen	(45, ItMi_Freudenspender, 3);
};

FUNC VOID Info_Mod_HofstaatGleichgewichtsminister_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatGleichgewichtsminister_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatGleichgewichtsminister_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatGleichgewichtsminister_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatGleichgewichtsminister_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatGleichgewichtsminister_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatGleichgewichtsminister_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatGleichgewichtsminister_Pickpocket);
};

FUNC VOID Info_Mod_HofstaatGleichgewichtsminister_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_HofstaatGleichgewichtsminister_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_HofstaatGleichgewichtsminister_Pickpocket);

		Info_AddChoice	(Info_Mod_HofstaatGleichgewichtsminister_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_HofstaatGleichgewichtsminister_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_HofstaatGleichgewichtsminister_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_HofstaatGleichgewichtsminister_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_HofstaatGleichgewichtsminister_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_HofstaatGleichgewichtsminister_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_HofstaatGleichgewichtsminister_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_HofstaatGleichgewichtsminister_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_HofstaatGleichgewichtsminister_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_HofstaatGleichgewichtsminister_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_HofstaatGleichgewichtsminister_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_HofstaatGleichgewichtsminister_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_HofstaatGleichgewichtsminister_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_HofstaatGleichgewichtsminister_EXIT (C_INFO)
{
	npc		= Mod_7287_HS_Gleichgewichtsminister_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatGleichgewichtsminister_EXIT_Condition;
	information	= Info_Mod_HofstaatGleichgewichtsminister_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatGleichgewichtsminister_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatGleichgewichtsminister_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};