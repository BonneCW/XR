INSTANCE Info_Mod_Mortis_Hi (C_INFO)
{
	npc		= Mod_742_MIL_Mortis_NW;
	nr		= 1;
	condition	= Info_Mod_Mortis_Hi_Condition;
	information	= Info_Mod_Mortis_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Mortis_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mortis_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Mortis_Hi_13_01"); //Ich bin Mortis, Mitglied der Miliz und Schmied.
};

INSTANCE Info_Mod_Mortis_Join (C_INFO)
{
	npc		= Mod_742_MIL_Mortis_NW;
	nr		= 1;
	condition	= Info_Mod_Mortis_Join_Condition;
	information	= Info_Mod_Mortis_Join_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will mich der Miliz anschließen.";
};

FUNC INT Info_Mod_Mortis_Join_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mortis_Hi))
	&& (Mod_Gilde	==	0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mortis_Join_Info()
{
	AI_Output(hero, self, "Info_Mod_Mortis_Join_15_00"); //Ich will mich der Miliz anschließen.
	AI_Output(self, hero, "Info_Mod_Mortis_Join_13_01"); //Dann geh zu Lord Andre.
};

INSTANCE Info_Mod_Mortis_Andre (C_INFO)
{
	npc		= Mod_742_MIL_Mortis_NW;
	nr		= 1;
	condition	= Info_Mod_Mortis_Andre_Condition;
	information	= Info_Mod_Mortis_Andre_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lord Andre schickt mich.";
};

FUNC INT Info_Mod_Mortis_Andre_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mortis_Join))
	&& (Mod_MilizTurnier	==	9)
	&& (Mod_Gilde	==	0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mortis_Andre_Info()
{
	AI_Output(hero, self, "Info_Mod_Mortis_Andre_15_00"); //Lord Andre schickt mich.
	AI_Output(self, hero, "Info_Mod_Mortis_Andre_13_01"); //Willst du dich immer noch der Miliz anschließen?
	AI_Output(hero, self, "Info_Mod_Mortis_Andre_15_02"); //Ja.
	AI_Output(self, hero, "Info_Mod_Mortis_Andre_13_03"); //Und ich soll dir jetzt einen Auftrag geben?
	AI_Output(hero, self, "Info_Mod_Mortis_Andre_15_04"); //Ja.
	AI_Output(self, hero, "Info_Mod_Mortis_Andre_13_05"); //Nagut. Geh zu Olav, Pablo und Bilgot und frage wie es steht. Wenn du bei allen warst, dann komm zu mir und berichte mir was sie gesagt haben.

	Log_CreateTopic	(TOPIC_MOD_MORTIS_KONTROLLE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MORTIS_KONTROLLE, LOG_RUNNING);

	B_LogEntry_More	(TOPIC_MOD_MILIZ, TOPIC_MOD_MORTIS_KONTROLLE, "Ich soll für Mortis einen Kontrollgang zu 3 Milizen in der Stadt machen.", "Ich soll zu Olav, Pablo und Bilgot gehen und fragen wie es steht.");
};

INSTANCE Info_Mod_Mortis_OK (C_INFO)
{
	npc		= Mod_742_MIL_Mortis_NW;
	nr		= 1;
	condition	= Info_Mod_Mortis_OK_Condition;
	information	= Info_Mod_Mortis_OK_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe alle Milizen aufgesucht.";
};

FUNC INT Info_Mod_Mortis_OK_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Olav_Mortis))
	&& (Npc_KnowsInfo(hero, Info_Mod_Pablo_Infos))
	&& (Mod_BilgotOK	==	1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mortis_OK_Info()
{
	AI_Output(hero, self, "Info_Mod_Mortis_OK_15_00"); //Ich habe alle Milizen aufgesucht.
	AI_Output(self, hero, "Info_Mod_Mortis_OK_13_01"); //Und?
	AI_Output(hero, self, "Info_Mod_Mortis_OK_15_02"); //Alles in Ordnung.
	AI_Output(self, hero, "Info_Mod_Mortis_OK_13_03"); //Sehr gut, du kannst jetzt zu Lord Andre und ihm sagen, dass du meinen Auftrag erfüllt hast.

	B_LogEntry_More	(TOPIC_MOD_MILIZ, TOPIC_MOD_MORTIS_KONTROLLE, "Mortis ist zufrieden mit mir und hat mich zu Lord Andre geschickt.", "Ich hab Mortis bescheid gesagt, dass alles in Ordnung ist.");

	B_GivePlayerXP	(150);

	B_SetTopicStatus	(TOPIC_MOD_MORTIS_KONTROLLE, LOG_SUCCESS);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Mortis_Lehrer (C_INFO)
{
	npc		= Mod_742_MIL_Mortis_NW;
	nr		= 1;
	condition	= Info_Mod_Mortis_Lehrer_Condition;
	information	= Info_Mod_Mortis_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mich trainieren?";
};

FUNC INT Info_Mod_Mortis_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mortis_Hi))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mortis_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Mortis_Lehrer_15_00"); //Kannst du mich trainieren?
	
	if (Mod_Gilde == 2)
	{
		AI_Output(self, hero, "Info_Mod_Mortis_Lehrer_13_01"); //Du bist bereits ein Ritter. Ich kann dich nicht mehr unterweisen. Du musst dir einen neuen Lehrer suchen.
	}
	else if (Mod_Gilde == 1)
	{
		AI_Output(self, hero, "Info_Mod_Mortis_Lehrer_13_02"); //Da du bei der Miliz bist werde ich dich trainieren.

		B_LogEntry	(TOPIC_MOD_LEHRER_STADT, "Mortis wird mich in Stärke trainieren, solange ich ein Ritter bin.");
	}
	else if (Mod_Gilde == 3)
	{
		AI_Output(self, hero, "Info_Mod_Mortis_Lehrer_13_03"); //Du bist bereits ein Paladin. Ich kann dich nicht mehr unterweisen. Du musst dir einen neuen Lehrer suchen.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Mortis_Lehrer_13_04"); //Ich trainiere nur Milizsoldaten.
	};
};

INSTANCE Info_Mod_Mortis_Lernen (C_INFO)
{
	npc		= Mod_742_MIL_Mortis_NW;
	nr		= 1;
	condition	= Info_Mod_Mortis_Lernen_Condition;
	information	= Info_Mod_Mortis_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Zeig mir wie ich Stärker werde.";
};

FUNC INT Info_Mod_Mortis_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mortis_Lehrer))
	&& (Mod_Gilde == 1)
	&& (hero.attribute[ATR_STRENGTH] < 100)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mortis_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Mortis_Lernen_15_00"); //Zeig mir wie ich Stärker werde.

	Info_ClearChoices	(Info_Mod_Mortis_Lernen);

	Info_AddChoice	(Info_Mod_Mortis_Lernen, DIALOG_BACK, Info_Mod_Mortis_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Mortis_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Mortis_Lernen_5);
	Info_AddChoice	(Info_Mod_Mortis_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Mortis_Lernen_1);
};

FUNC VOID Info_Mod_Mortis_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Mortis_Lernen);
};

FUNC VOID Info_Mod_Mortis_Lernen_5()
{
	B_TeachAttributePoints_New	(self, hero, ATR_STRENGTH, 5, 100);
	
	Info_ClearChoices	(Info_Mod_Mortis_Lernen);

	Info_AddChoice	(Info_Mod_Mortis_Lernen, DIALOG_BACK, Info_Mod_Mortis_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Mortis_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Mortis_Lernen_5);
	Info_AddChoice	(Info_Mod_Mortis_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Mortis_Lernen_1);
};

FUNC VOID Info_Mod_Mortis_Lernen_1()
{
	B_TeachAttributePoints	(self, hero, ATR_STRENGTH, 1, 100);

	Info_ClearChoices	(Info_Mod_Mortis_Lernen);

	Info_AddChoice	(Info_Mod_Mortis_Lernen, DIALOG_BACK, Info_Mod_Mortis_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Mortis_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Mortis_Lernen_5);
	Info_AddChoice	(Info_Mod_Mortis_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Mortis_Lernen_1);
};

INSTANCE Info_Mod_Mortis_Pickpocket (C_INFO)
{
	npc		= Mod_742_MIL_Mortis_NW;
	nr		= 1;
	condition	= Info_Mod_Mortis_Pickpocket_Condition;
	information	= Info_Mod_Mortis_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Mortis_Pickpocket_Condition()
{
	C_Beklauen	(48, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Mortis_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Mortis_Pickpocket);

	Info_AddChoice	(Info_Mod_Mortis_Pickpocket, DIALOG_BACK, Info_Mod_Mortis_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Mortis_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Mortis_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Mortis_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Mortis_Pickpocket);
};

FUNC VOID Info_Mod_Mortis_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Mortis_Pickpocket);
};

INSTANCE Info_Mod_Mortis_EXIT (C_INFO)
{
	npc		= Mod_742_MIL_Mortis_NW;
	nr		= 1;
	condition	= Info_Mod_Mortis_EXIT_Condition;
	information	= Info_Mod_Mortis_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Mortis_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mortis_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};