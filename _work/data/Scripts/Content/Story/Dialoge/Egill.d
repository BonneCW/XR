INSTANCE Info_Mod_Egill_Hi (C_INFO)
{
	npc		= Mod_902_BAU_Egill_NW;
	nr		= 1;
	condition	= Info_Mod_Egill_Hi_Condition;
	information	= Info_Mod_Egill_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, was machst du hier so?";
};

FUNC INT Info_Mod_Egill_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Telbor_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Egill_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Egill_Hi_15_00"); //Hallo, was machst du hier so?
	AI_Output(self, hero, "Info_Mod_Egill_Hi_08_01"); //(traumatisiert) Was ... was war nur in mich gefahren?! Ich ... ich habe ihn umgebracht. Meinen eigenen Bruder ...
};

INSTANCE Info_Mod_Egill_Ehnim01 (C_INFO)
{
	npc		= Mod_902_BAU_Egill_NW;
	nr		= 1;
	condition	= Info_Mod_Egill_Ehnim01_Condition;
	information	= Info_Mod_Egill_Ehnim01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dein Bruder ist nicht tot.";
};

FUNC INT Info_Mod_Egill_Ehnim01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Egill_Hi))
	&& (!Npc_IsDead(Mod_903_BAU_Ehnim_NW))
	&& (Npc_GetDistToWP(Mod_903_BAU_Ehnim_NW, "TOT") > 2000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Egill_Ehnim01_Info()
{
	AI_Output(hero, self, "Info_Mod_Egill_Ehnim01_15_00"); //Dein Bruder ist nicht tot.
	AI_Output(self, hero, "Info_Mod_Egill_Ehnim01_08_01"); //(verwirrt) Was ... was sagst du? Er lebt?
	AI_Output(hero, self, "Info_Mod_Egill_Ehnim01_15_02"); //Ja, du hast ihn nur verletzt, nicht getötet.

	if (Npc_KnowsInfo(hero, Info_Mod_Ehnim_Hi))
	{
		if (!Npc_KnowsInfo(hero, Info_Mod_Telbor_AllZombies))
		{
			AI_Output(hero, self, "Info_Mod_Egill_Ehnim01_15_03"); //Er sitzt beim Lagerfeuer und erholt sich.
		}
		else
		{
			AI_Output(hero, self, "Info_Mod_Egill_Ehnim01_15_04"); //Er sitzt mit Telbor in der Stadt.
		};
	};

	AI_Output(self, hero, "Info_Mod_Egill_Ehnim01_08_05"); //(erfreut, erleichtert) Ich ... ich weiß nicht, was ich sagen soll. Vielen Dank für die Nachricht. Ich laufe sofort zurück, um ihn gesund zu pflegen.

	AI_StopProcessInfos	(self);

	if (!Npc_KnowsInfo(hero, Info_Mod_Telbor_AllZombies))
	{
		B_StartOtherRoutine	(self, "EHNIM");
	}
	else
	{
		B_StartOtherRoutine	(self, "CITY");
	};

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Egill_Ehnim02 (C_INFO)
{
	npc		= Mod_902_BAU_Egill_NW;
	nr		= 1;
	condition	= Info_Mod_Egill_Ehnim02_Condition;
	information	= Info_Mod_Egill_Ehnim02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du kannst nichts dafür. Es waren finstere Mächte, die dich lenkten.";
};

FUNC INT Info_Mod_Egill_Ehnim02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Egill_Hi))
	&& (Npc_IsDead(Mod_903_BAU_Ehnim_NW))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Egill_Ehnim01))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Egill_Ehnim03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Egill_Ehnim02_Info()
{
	AI_Output(hero, self, "Info_Mod_Egill_Ehnim02_15_00"); //Du kannst nichts dafür. Es waren finstere Mächte, die dich lenkten.
	AI_Output(self, hero, "Info_Mod_Egill_Ehnim02_08_01"); //Finstere Mächte, sagst du ...?! Ja, dieser verfluchte Pilger. Er ist an allem Schuld. Wenn ich ihn in die Finger bekomme ...
	AI_Output(hero, self, "Info_Mod_Egill_Ehnim02_15_02"); //Jetzt gehst du erst mal zum Hof zurück. Du wirst dort noch gebraucht. Um den Pilger kümmere ich mich.
	AI_Output(self, hero, "Info_Mod_Egill_Ehnim02_08_03"); //(etwas ruhiger) Ja, du hast wohl recht, sie brauchen mich. (wieder energischer) Ja, aber finde diesen Schurken!
	AI_Output(self, hero, "Info_Mod_Egill_Ehnim02_08_04"); //Bereite ihm einen langsamen, schmerzhaften Tod, diesem Unhold, auf dass er im Reich Beliars schmore.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Egill_Ehnim03 (C_INFO)
{
	npc		= Mod_902_BAU_Egill_NW;
	nr		= 1;
	condition	= Info_Mod_Egill_Ehnim03_Condition;
	information	= Info_Mod_Egill_Ehnim03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ganz recht. Und jetzt musst du auch die Verantwortung dafür tragen.";
};

FUNC INT Info_Mod_Egill_Ehnim03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Egill_Hi))
	&& (Npc_IsDead(Mod_903_BAU_Ehnim_NW))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Egill_Ehnim01))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Egill_Ehnim02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Egill_Ehnim03_Info()
{
	AI_Output(hero, self, "Info_Mod_Egill_Ehnim03_15_00"); //Ganz recht. Und jetzt musst du auch die Verantwortung dafür tragen.
	AI_Output(self, hero, "Info_Mod_Egill_Ehnim03_08_01"); //(resigniert) Ja ... ja, du hast Recht.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "BRIDGE");

	Mod_EgillSelbstmord = 1;

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Egill_Pickpocket (C_INFO)
{
	npc		= Mod_902_BAU_Egill_NW;
	nr		= 1;
	condition	= Info_Mod_Egill_Pickpocket_Condition;
	information	= Info_Mod_Egill_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Egill_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 70);
};

FUNC VOID Info_Mod_Egill_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Egill_Pickpocket);

	Info_AddChoice	(Info_Mod_Egill_Pickpocket, DIALOG_BACK, Info_Mod_Egill_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Egill_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Egill_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Egill_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Egill_Pickpocket);
};

FUNC VOID Info_Mod_Egill_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Egill_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Egill_Pickpocket);

		Info_AddChoice	(Info_Mod_Egill_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Egill_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Egill_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Egill_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Egill_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Egill_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Egill_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Egill_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Egill_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Egill_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Egill_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Egill_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Egill_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Egill_EXIT (C_INFO)
{
	npc		= Mod_902_BAU_Egill_NW;
	nr		= 1;
	condition	= Info_Mod_Egill_EXIT_Condition;
	information	= Info_Mod_Egill_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Egill_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Egill_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};