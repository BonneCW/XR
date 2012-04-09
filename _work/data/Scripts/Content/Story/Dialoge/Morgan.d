INSTANCE Info_Mod_Morgan_Hi (C_INFO)
{
	npc		= Mod_938_PIR_Morgan_AW;
	nr		= 1;
	condition	= Info_Mod_Morgan_Hi_Condition;
	information	= Info_Mod_Morgan_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Morgan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Morgan_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Morgan_Hi_07_01"); //Ich bin Morgan, einer der drei Entertruppführer.
	AI_Output(self, hero, "Info_Mod_Morgan_Hi_07_02"); //Was willst du von mir?
};

INSTANCE Info_Mod_Morgan_Entertrupp (C_INFO)
{
	npc		= Mod_938_PIR_Morgan_AW;
	nr		= 1;
	condition	= Info_Mod_Morgan_Entertrupp_Condition;
	information	= Info_Mod_Morgan_Entertrupp_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will in deinen Entertrupp.";
};

FUNC INT Info_Mod_Morgan_Entertrupp_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morgan_Hi))
	&& (Mod_InEntertrupp == 0)
	&& (Piraten_Dabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morgan_Entertrupp_Info()
{
	AI_Output(hero, self, "Info_Mod_Morgan_Entertrupp_15_00"); //Ich will in deinen Entertrupp.
	AI_Output(self, hero, "Info_Mod_Morgan_Entertrupp_07_01"); //Wenn du in meinen Entertrupp willst, dann musst du mir was besorgen.
	AI_Output(hero, self, "Info_Mod_Morgan_Entertrupp_15_02"); //Was soll ich dir besorgen?
	AI_Output(self, hero, "Info_Mod_Morgan_Entertrupp_07_03"); //Du gehst jetzt auf Alligatorenjagd. Im Talkessel solltest du noch auf ein paar der Viecher treffen.
	AI_Output(self, hero, "Info_Mod_Morgan_Entertrupp_07_04"); //Bring mir vier von ihren Krallen mit. Einige Leute glauben, dass ne Kette aus Alligatorenkrallen Glück bringt.
	AI_Output(hero, self, "Info_Mod_Morgan_Entertrupp_15_05"); //Du sollst deine Krallen bekommen.

	Wld_InsertNpc	(Alligator, "FP_ROAM_WATERHOLE_13");
	Wld_InsertNpc	(Alligator, "FP_ROAM_WATERHOLE_09");
	Wld_InsertNpc	(Alligator, "ADW_PIRATECAMP_INSEL_01");

	Log_CreateTopic	(TOPIC_MOD_MORGAN_ENTERTRUPP, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MORGAN_ENTERTRUPP, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MORGAN_ENTERTRUPP, "Um in Morgans Entertrupp zu kommen soll ich ihm 4 Alligatorenkrallen bringen.");
};

INSTANCE Info_Mod_Morgan_WieKrallen (C_INFO)
{
	npc		= Mod_938_PIR_Morgan_AW;
	nr		= 1;
	condition	= Info_Mod_Morgan_WieKrallen_Condition;
	information	= Info_Mod_Morgan_WieKrallen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo kann ich lernen Krallen zu nehmen?";
};

FUNC INT Info_Mod_Morgan_WieKrallen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morgan_Entertrupp))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morgan_WieKrallen_Info()
{
	AI_Output(hero, self, "Info_Mod_Morgan_WieKrallen_15_00"); //Wo kann ich lernen Krallen zu nehmen?
	AI_Output(self, hero, "Info_Mod_Morgan_WieKrallen_07_01"); //Ich kann dir beibringen wie du den Mistviechern ihre Krallen abnimmst.
};

INSTANCE Info_Mod_Morgan_KrallenZiehen (C_INFO)
{
	npc		= Mod_938_PIR_Morgan_AW;
	nr		= 1;
	condition	= Info_Mod_Morgan_KrallenZiehen_Condition;
	information	= Info_Mod_Morgan_KrallenZiehen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Alligatorenkrallen nehmen (1 LP)";
};

FUNC INT Info_Mod_Morgan_KrallenZiehen_Condition()
{
	Info_Mod_Morgan_KrallenZiehen.description = B_BuildLearnString("Alligatorenkrallen nehmen", B_GetLearnCostTalent(hero, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_AlligatorClaws));

	if (Npc_KnowsInfo(hero, Info_Mod_Morgan_WieKrallen))
	&& (Mod_InEntertrupp == 0)
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_AlligatorClaws] == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morgan_KrallenZiehen_Info()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, hero, TROPHY_AlligatorClaws))
	{
		AI_Output(self, hero, "Info_Mod_Morgan_KrallenZiehen_07_00"); //Im Grunde ist es ganz einfach. Schneide die Krallen einfach aus dem Vorderfuß raus.
		AI_Output(self, hero, "Info_Mod_Morgan_KrallenZiehen_07_01"); //Danach noch das restliche Fleisch abkratzen und du hast die Krallen.
	};
};

INSTANCE Info_Mod_Morgan_HierKrallen (C_INFO)
{
	npc		= Mod_938_PIR_Morgan_AW;
	nr		= 1;
	condition	= Info_Mod_Morgan_HierKrallen_Condition;
	information	= Info_Mod_Morgan_HierKrallen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, deine Krallen.";
};

FUNC INT Info_Mod_Morgan_HierKrallen_Condition()
{
	if (Npc_HasItems(hero, ItAt_AlligatorClaw) > 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morgan_HierKrallen_Info()
{
	AI_Output(hero, self, "Info_Mod_Morgan_HierKrallen_15_00"); //Hier, deine Krallen.

	B_GiveInvItems	(hero, self, ItAt_AlligatorClaw, 4);

	AI_Output(self, hero, "Info_Mod_Morgan_HierKrallen_07_01"); //Sehr gut, Jungchen! Damit hast du meine Zustimmung.

	if (Mod_InEntertrupp == 0)
	{
		B_LogEntry_More	(TOPIC_MOD_PIRATEN_ENTERTRUPP, TOPIC_MOD_MORGAN_ENTERTRUPP, "Ich hab Morgans Zustimmung für die Aufnahme in einen Entertrupp.", "Morgan ist von mir überzeugt.");
	}
	else
	{
		B_LogEntry	(TOPIC_MOD_PIRATEN_ENTERTRUPP, "Ich hab Morgans Zustimmung für die Aufnahme in einen Entertrupp.");
	};

	B_SetTopicStatus	(TOPIC_MOD_MORGAN_ENTERTRUPP, LOG_SUCCESS);

	B_GivePlayerXP	(200);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Morgan_InEntertrupp (C_INFO)
{
	npc		= Mod_938_PIR_Morgan_AW;
	nr		= 1;
	condition	= Info_Mod_Morgan_InEntertrupp_Condition;
	information	= Info_Mod_Morgan_InEntertrupp_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will in deinen Entertrupp.";
};

FUNC INT Info_Mod_Morgan_InEntertrupp_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morgan_HierKrallen))
	&& (Mod_InEntertrupp == 0)
	&& ((Npc_KnowsInfo(hero, Info_Mod_Francis_Skip))
	|| (Mod_QuatschGrog == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morgan_InEntertrupp_Info()
{
	AI_Output(hero, self, "Info_Mod_Morgan_InEntertrupp_15_00"); //Ich will in deinen Entertrupp.
	AI_Output(self, hero, "Info_Mod_Morgan_InEntertrupp_07_01"); //Du hast bewiesen, dass du als Pirat zu gebrauchen bist.
	AI_Output(self, hero, "Info_Mod_Morgan_InEntertrupp_07_02"); //Ab sofort bist du in meinem Entertrupp.

	B_GivePlayerXP	(400);

	B_LogEntry	(TOPIC_MOD_PIRATEN_ENTERTRUPP, "Ich bin jetzt Mitglied von Morgans Entertrupp.");
	B_SetTopicStatus	(TOPIC_MOD_PIRATEN_ENTERTRUPP, LOG_SUCCESS);

	Mod_InEntertrupp = 1;

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Morgan_Lehrer (C_INFO)
{
	npc		= Mod_938_PIR_Morgan_AW;
	nr		= 1;
	condition	= Info_Mod_Morgan_Lehrer_Condition;
	information	= Info_Mod_Morgan_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Morgan_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morgan_Hi))
	&& (Piraten_Dabei == TRUE)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morgan_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Morgan_Lehrer_07_01"); //Ich kann dir den Umgang mit Einhändern beibringen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_PIRATEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_PIRATEN, "Morgan kann mir den Umgang mit Einhändern beibringen.");
};

INSTANCE Info_Mod_Morgan_Lernen (C_INFO)
{
	npc		= Mod_938_PIR_Morgan_AW;
	nr		= 1;
	condition	= Info_Mod_Morgan_Lernen_Condition;
	information	= Info_Mod_Morgan_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Morgan_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morgan_Lehrer))
	&& (Piraten_Dabei == TRUE)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morgan_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Morgan_Lernen_15_00"); //Ich will lernen.

	Info_ClearChoices	(Info_Mod_Morgan_Lernen);

	Info_AddChoice	(Info_Mod_Morgan_Lernen, DIALOG_BACK, Info_Mod_Morgan_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Morgan_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Morgan_Lernen_1H_5);
	Info_AddChoice	(Info_Mod_Morgan_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Morgan_Lernen_1H_1);
};

FUNC VOID Info_Mod_Morgan_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Morgan_Lernen);
};

FUNC VOID Info_Mod_Morgan_Lernen_1H_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_1H, 5, 60)
	{
		Info_ClearChoices	(Info_Mod_Morgan_Lernen);

		Info_AddChoice	(Info_Mod_Morgan_Lernen, DIALOG_BACK, Info_Mod_Morgan_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Morgan_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Morgan_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Morgan_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Morgan_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Morgan_Lernen_1H_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_1H, 1, 60)
	{
		Info_ClearChoices	(Info_Mod_Morgan_Lernen);

		Info_AddChoice	(Info_Mod_Morgan_Lernen, DIALOG_BACK, Info_Mod_Morgan_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Morgan_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Morgan_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Morgan_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Morgan_Lernen_1H_1);
	};
};

INSTANCE Info_Mod_Morgan_Pickpocket (C_INFO)
{
	npc		= Mod_938_PIR_Morgan_AW;
	nr		= 1;
	condition	= Info_Mod_Morgan_Pickpocket_Condition;
	information	= Info_Mod_Morgan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Morgan_Pickpocket_Condition()
{
	C_Beklauen	(58, ItMi_Gold, 170);
};

FUNC VOID Info_Mod_Morgan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Morgan_Pickpocket);

	Info_AddChoice	(Info_Mod_Morgan_Pickpocket, DIALOG_BACK, Info_Mod_Morgan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Morgan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Morgan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Morgan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Morgan_Pickpocket);
};

FUNC VOID Info_Mod_Morgan_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Morgan_Pickpocket);
};

INSTANCE Info_Mod_Morgan_EXIT (C_INFO)
{
	npc		= Mod_938_PIR_Morgan_AW;
	nr		= 1;
	condition	= Info_Mod_Morgan_EXIT_Condition;
	information	= Info_Mod_Morgan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Morgan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Morgan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};