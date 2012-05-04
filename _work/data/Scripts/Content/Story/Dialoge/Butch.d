INSTANCE Info_Mod_Butch_Hi (C_INFO)
{
	npc		= Mod_1288_SLD_Butch_MT;
	nr		= 1;
	condition	= Info_Mod_Butch_Hi_Condition;
	information	= Info_Mod_Butch_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Butch_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Butch_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	if (Mod_Schwierigkeit != 4)
	{
		AI_Output(self, hero, "Info_Mod_Butch_Hi_13_01"); //Ich bin Butch. Ich kann dir den Umgang mit Armbrüsten zeigen, wenn du einer von uns wirst.
		AI_Output(self, hero, "Info_Mod_Butch_Hi_13_02"); //Außerdem kann ich dir helfen stärker zu werden.

		Log_CreateTopic	(TOPIC_MOD_LEHRER_SOELDNER, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_SOELDNER, "Butch kann mir den Umgang mit Armbrüsten zeigen und mir helfen stärker zu werden, wenn ich erstmal Söldner bin.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Butch_Hi_13_03"); //Ich bin Butch, einer der besten Armbrustschützen hier im Lager.
	};
};

INSTANCE Info_Mod_Butch_SentenzaSchwert (C_INFO)
{
	npc		= Mod_1288_SLD_Butch_MT;
	nr		= 1;
	condition	= Info_Mod_Butch_SentenzaSchwert_Condition;
	information	= Info_Mod_Butch_SentenzaSchwert_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Butch_SentenzaSchwert_Condition()
{
	if (Mod_NL_BruceTot == 3)
	&& (Npc_IsDead(Mod_796_SLD_Sentenza_MT))
	&& (Npc_IsDead(Mod_779_SLD_Bullco_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Butch_SentenzaSchwert_Info()
{
	AI_Output(self, hero, "Info_Mod_Butch_SentenzaSchwert_13_00"); //So, die Schweine haben bekommen, was ihnen zustand.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "BOSS");

	self.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Butch_Lernen_Armbrust (C_INFO)
{
	npc		= Mod_1288_SLD_Butch_MT;
	nr		= 1;
	condition	= Info_Mod_Butch_Lernen_Armbrust_Condition;
	information	= Info_Mod_Butch_Lernen_Armbrust_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir Armbrustschießen bei.";
};

FUNC INT Info_Mod_Butch_Lernen_Armbrust_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Butch_Hi))
	&& (hero.hitchance[NPC_TALENT_CrossBow] < 100)
	&& ((Mod_Gilde == 4)
	|| (Mod_Gilde == 5)
	|| (Mod_Gilde == 19))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Butch_Lernen_Armbrust_Info()
{
	AI_Output(hero, self, "Info_Mod_Butch_Lernen_Armbrust_15_00"); //Bring mir Armbrustschießen bei.

	Info_ClearChoices	(Info_Mod_Butch_Lernen_Armbrust);
	
	Info_AddChoice	(Info_Mod_Butch_Lernen_Armbrust, "Zurück.", Info_Mod_Butch_Lernen_Armbrust_BACK);
	Info_AddChoice	(Info_Mod_Butch_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_CrossBow)), Info_Mod_Butch_Lernen_Armbrust_5);
	Info_AddChoice	(Info_Mod_Butch_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(hero, NPC_TALENT_CrossBow, 1)), Info_Mod_Butch_Lernen_Armbrust_1);
};

FUNC VOID Info_Mod_Butch_Lernen_Armbrust_BACK()
{
	Info_ClearChoices	(Info_Mod_Butch_Lernen_Armbrust);
};

FUNC VOID Info_Mod_Butch_Lernen_Armbrust_5()
{
	B_TeachFightTalentPercent_New (self, hero, NPC_TALENT_CrossBow, 5, 100);

	Info_AddChoice	(Info_Mod_Butch_Lernen_Armbrust, "Zurück.", Info_Mod_Butch_Lernen_Armbrust_BACK);
	Info_AddChoice	(Info_Mod_Butch_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_CrossBow)), Info_Mod_Butch_Lernen_Armbrust_5);
	Info_AddChoice	(Info_Mod_Butch_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(hero, NPC_TALENT_CrossBow, 1)), Info_Mod_Butch_Lernen_Armbrust_1);
};

FUNC VOID Info_Mod_Butch_Lernen_Armbrust_1()
{
	B_TeachFightTalentPercent (self, hero, NPC_TALENT_CrossBow, 1, 100);

	Info_AddChoice	(Info_Mod_Butch_Lernen_Armbrust, "Zurück.", Info_Mod_Butch_Lernen_Armbrust_BACK);
	Info_AddChoice	(Info_Mod_Butch_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_CrossBow)), Info_Mod_Butch_Lernen_Armbrust_5);
	Info_AddChoice	(Info_Mod_Butch_Lernen_Armbrust, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(hero, NPC_TALENT_CrossBow, 1)), Info_Mod_Butch_Lernen_Armbrust_1);
};

INSTANCE Info_Mod_Butch_Lernen (C_INFO)
{
	npc		= Mod_1288_SLD_Butch_MT;
	nr		= 1;
	condition	= Info_Mod_Butch_Lernen_Condition;
	information	= Info_Mod_Butch_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will stärker werden!";
};

FUNC INT Info_Mod_Butch_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Butch_Hi))
	&& (hero.attribute[ATR_STRENGTH] < 200)
	&& ((Mod_Gilde	==	4)
	|| (Mod_Gilde == 5)
	|| (Mod_Gilde == 19))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Butch_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Butch_Lernen_15_00"); //Ich will stärker werden!

	Info_ClearChoices	(Info_Mod_Butch_Lernen);

	Info_AddChoice	(Info_Mod_Butch_Lernen, DIALOG_BACK, Info_Mod_Butch_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Butch_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Butch_Lernen_5);
	Info_AddChoice	(Info_Mod_Butch_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Butch_Lernen_1);
};

FUNC VOID Info_Mod_Butch_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Butch_Lernen);
};

FUNC VOID Info_Mod_Butch_Lernen_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_STRENGTH, 5, 200);
	
	Info_ClearChoices	(Info_Mod_Butch_Lernen);

	Info_AddChoice	(Info_Mod_Butch_Lernen, DIALOG_BACK, Info_Mod_Butch_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Butch_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Butch_Lernen_5);
	Info_AddChoice	(Info_Mod_Butch_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Butch_Lernen_1);
};

FUNC VOID Info_Mod_Butch_Lernen_1()
{
	B_TeachAttributePoints (self, hero, ATR_STRENGTH, 1, 200);
	
	Info_ClearChoices	(Info_Mod_Butch_Lernen);

	Info_AddChoice	(Info_Mod_Butch_Lernen, DIALOG_BACK, Info_Mod_Butch_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Butch_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Butch_Lernen_5);
	Info_AddChoice	(Info_Mod_Butch_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Butch_Lernen_1);
};

INSTANCE Info_Mod_Butch_Pickpocket (C_INFO)
{
	npc		= Mod_1288_SLD_Butch_MT;
	nr		= 1;
	condition	= Info_Mod_Butch_Pickpocket_Condition;
	information	= Info_Mod_Butch_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Butch_Pickpocket_Condition()
{
	C_Beklauen	(68, ItMi_Gold, 350);
};

FUNC VOID Info_Mod_Butch_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Butch_Pickpocket);

	Info_AddChoice	(Info_Mod_Butch_Pickpocket, DIALOG_BACK, Info_Mod_Butch_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Butch_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Butch_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Butch_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Butch_Pickpocket);
};

FUNC VOID Info_Mod_Butch_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Butch_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Butch_Pickpocket);

		Info_AddChoice	(Info_Mod_Butch_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Butch_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Butch_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Butch_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Butch_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Butch_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Butch_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Butch_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Butch_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Butch_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Butch_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Butch_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Butch_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Butch_EXIT (C_INFO)
{
	npc		= Mod_1288_SLD_Butch_MT;
	nr		= 1;
	condition	= Info_Mod_Butch_EXIT_Condition;
	information	= Info_Mod_Butch_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Butch_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Butch_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};