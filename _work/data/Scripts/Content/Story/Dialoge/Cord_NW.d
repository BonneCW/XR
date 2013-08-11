INSTANCE Info_Mod_Cord_NW_Hi (C_INFO)
{
	npc		= Mod_528_SLD_Cord_NW;
	nr		= 1;
	condition	= Info_Mod_Cord_NW_Hi_Condition;
	information	= Info_Mod_Cord_NW_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Cord_NW_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cord_NW_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Cord_NW_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Cord_NW_Hi_14_01"); //Was machst du denn hier. Du kannst froh sein, dass wir nicht mehr für die Wassermagier arbeiten.
	AI_Output(self, hero, "Info_Mod_Cord_NW_Hi_14_02"); //Die waren ziemlich sauer nachdem du ihrem Erzhaufen die magische Energie entzogen hast.
	AI_Output(self, hero, "Info_Mod_Cord_NW_Hi_14_03"); //Aber wie es scheint hast du es geschafft die magische Barriere zu zerstören.
};

INSTANCE Info_Mod_Cord_NW_Irdorath (C_INFO)
{
	npc		= Mod_528_SLD_Cord_NW;
	nr		= 1;
	condition	= Info_Mod_Cord_NW_Irdorath_Condition;
	information	= Info_Mod_Cord_NW_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will mit dem Schiff der Paladine zu einer Insel aufbrechen.";
};

FUNC INT Info_Mod_Cord_NW_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cord_NW_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Cord_NW_Irdorath_15_00"); //Ich will mit dem Schiff der Paladine zu einer Insel aufbrechen, um finsteren Kreaturen die Stirn zu bieten und die Insel zu retten.
	AI_Output(hero, self, "Info_Mod_Cord_NW_Irdorath_15_01"); //Es wird ein gefährliches Unterfangen und ich brauche Schlagkräftige Männer ...
	AI_Output(self, hero, "Info_Mod_Cord_NW_Irdorath_14_02"); //Was sagst du?
	AI_Output(self, hero, "Info_Mod_Cord_NW_Irdorath_14_03"); //Klingt nach einer Gelegenheit, dass Schwert auch mal gegen echte Gegner zu schwingen, und nicht nur Löcher in die Luft zu stechen.
	AI_Output(self, hero, "Info_Mod_Cord_NW_Irdorath_14_04"); //Ich mach mich sofort auf den Weg in den Hafen.
	AI_Output(hero, self, "Info_Mod_Cord_NW_Irdorath_15_05"); //Ähh, klar, wir sehen uns dann dort, wenn es losgeht.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "So, Kämpfer Cord lässt es sich nicht nehmen, mich zur Insel zu begleiten.");

	B_GivePlayerXP	(100);

	Mod_CordDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Cord_NW_Irdorath3 (C_INFO)
{
	npc		= Mod_528_SLD_Cord_NW;
	nr		= 1;
	condition	= Info_Mod_Cord_NW_Irdorath3_Condition;
	information	= Info_Mod_Cord_NW_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tut mir leid, aber es scheint das wir zu viele sind.";
};

FUNC INT Info_Mod_Cord_NW_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cord_NW_Irdorath))
	&& (Mod_Irdorath == 0)
	&& (Mod_CordDabei == 1)
	&& (((Mod_JackDabei == 1)
	&& (Mod_CrewCount > 15))
	|| (Mod_CedricDabei == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cord_NW_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Cord_NW_Irdorath3_15_00"); //Tut mir leid, aber es scheint das wir zu viele sind. Ich kann dich doch nicht mitnehmen.
	AI_Output(self, hero, "Info_Mod_Cord_NW_Irdorath3_14_01"); //Schade. Ich gehe dann wieder zurück. Du weißt wo du mich findest, wenn doch noch ein Platz frei werden sollte.

	Mod_CordDabei = 0;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Cord_NW_Irdorath4 (C_INFO)
{
	npc		= Mod_528_SLD_Cord_NW;
	nr		= 1;
	condition	= Info_Mod_Cord_NW_Irdorath4_Condition;
	information	= Info_Mod_Cord_NW_Irdorath4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich kann dich doch mitnehmen.";
};

FUNC INT Info_Mod_Cord_NW_Irdorath4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cord_NW_Irdorath))
	&& (Mod_Irdorath == 0)
	&& (Mod_CordDabei == 0)
	&& (Mod_CedricDabei == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cord_NW_Irdorath4_Info()
{
	AI_Output(hero, self, "Info_Mod_Cord_NW_Irdorath4_15_00"); //Ich kann dich doch mitnehmen. Es hat sich noch ein Platz auf dem Schiff gefunden.
	AI_Output(self, hero, "Info_Mod_Cord_NW_Irdorath4_14_01"); //Sehr gut, ich bin dann wieder am Hafen.

	Mod_CordDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Cord_NW_Unheil (C_INFO)
{
	npc		= Mod_528_SLD_Cord_NW;
	nr		= 1;
	condition	= Info_Mod_Cord_NW_Unheil_Condition;
	information	= Info_Mod_Cord_NW_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Haben sich hier in letzter Zeit seltsame Dinge auf dem Hof ereignet – abgesehen von den Monstern auf den Höfen?";
};

FUNC INT Info_Mod_Cord_NW_Unheil_Condition()
{
	if (Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cord_NW_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Cord_NW_Unheil_15_00"); //Haben sich hier in letzter Zeit seltsame Dinge auf dem Hof ereignet – abgesehen von den Monstern auf den Höfen?
	AI_Output(self, hero, "Info_Mod_Cord_NW_Unheil_14_01"); //Ja, es ist wie verhext. Jeden Abend wenn es dunkel wird überkommt mich plötzlich eine so starke Müdigkeit, dass ich die Augen schließen muss.
	AI_Output(self, hero, "Info_Mod_Cord_NW_Unheil_14_02"); //Und dann erwache ich immer wieder nach kurzer Zeit und kann ohne Schwierigkeiten weitertrainieren.
	AI_Output(self, hero, "Info_Mod_Cord_NW_Unheil_14_03"); //Ich weiß auch nicht, woran es liegen kann.
};

INSTANCE Info_Mod_Cord_NW_WoWassermagier (C_INFO)
{
	npc		= Mod_528_SLD_Cord_NW;
	nr		= 1;
	condition	= Info_Mod_Cord_NW_WoWassermagier_Condition;
	information	= Info_Mod_Cord_NW_WoWassermagier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist jetzt mit den Wassermagiern?";
};

FUNC INT Info_Mod_Cord_NW_WoWassermagier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cord_NW_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cord_NW_WoWassermagier_Info()
{
	AI_Output(hero, self, "Info_Mod_Cord_NW_WoWassermagier_15_00"); //Was ist jetzt mit den Wassermagiern?
	AI_Output(self, hero, "Info_Mod_Cord_NW_WoWassermagier_14_01"); //Nachdem die Barriere gefallen ist sind sie erst in die Stadt gegangen. Doch dann haben sie sich auf den Weg zu einer Ausgrabungsstätte gemacht.
};

INSTANCE Info_Mod_Cord_NW_NahkampfJG (C_INFO)
{
	npc		= Mod_528_SLD_Cord_NW;
	nr		= 1;
	condition	= Info_Mod_Cord_NW_NahkampfJG_Condition;
	information	= Info_Mod_Cord_NW_NahkampfJG_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Waldläufer brauchen noch Nahkämpfer.";
};

FUNC INT Info_Mod_Cord_NW_NahkampfJG_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lares_NahkampfJG))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cord_NW_NahkampfJG_Info()
{
	AI_Output(hero, self, "Info_Mod_Cord_NW_NahkampfJG_15_00"); //Die Waldläufer brauchen noch Nahkämpfer.
	AI_Output(hero, self, "Info_Mod_Cord_NW_NahkampfJG_15_01"); //Die wissen mit dem Schwert nicht allzu viel anzufangen. Und im Minental ist der Bär los.
	AI_Output(hero, self, "Info_Mod_Cord_NW_NahkampfJG_15_02"); //Bei unserem Lager am Dunklen Wald ebenfalls.
	AI_Output(self, hero, "Info_Mod_Cord_NW_NahkampfJG_14_03"); //Was genau liegt an?
	AI_Output(hero, self, "Info_Mod_Cord_NW_NahkampfJG_15_04"); //Irgend ein Schwarzmagier hat es offensichtlich auf die Waldleute abgesehen.
	AI_Output(hero, self, "Info_Mod_Cord_NW_NahkampfJG_15_05"); //Keiner weiß warum. Wir haben schon fünf Mann verloren.
	AI_Output(self, hero, "Info_Mod_Cord_NW_NahkampfJG_14_06"); //Das ist schlecht. Aber wie du selber weißt, ist hier in Khorinis auch einiges Zugange.
	AI_Output(self, hero, "Info_Mod_Cord_NW_NahkampfJG_14_07"); //Man sieht allenthalben dunkle Gestalten umherlaufen.
	AI_Output(self, hero, "Info_Mod_Cord_NW_NahkampfJG_14_08"); //Hmm ... einen Mann könnte ich euch ausleihen. Für 500 Gold.
	AI_Output(hero, self, "Info_Mod_Cord_NW_NahkampfJG_15_09"); //500 Gold? An Gold war eigentlich nicht gedacht. Man wird den Mann selbst schon bezahlen müssen.
	AI_Output(hero, self, "Info_Mod_Cord_NW_NahkampfJG_15_10"); //Aber ich hab eine Idee. Wie wär's, wenn ich dafür sorge, dass ihr einen Jäger im Austausch bekommt. Jagt eigentlich bei euch jemand?
	AI_Output(self, hero, "Info_Mod_Cord_NW_NahkampfJG_14_11"); //Eigentlich nicht. Unsere Verpflegung kommt von Onar. Aber du hast recht. Ein extra Brocken Fleisch wäre nicht verkehrt. Abgemacht.
	AI_Output(hero, self, "Info_Mod_Cord_NW_NahkampfJG_15_12"); //Und wen ...
	AI_Output(self, hero, "Info_Mod_Cord_NW_NahkampfJG_14_13"); //Vorn am Eingang ist eine Erzatzwache. Sitzt meistens links im Gras.
	AI_Output(self, hero, "Info_Mod_Cord_NW_NahkampfJG_14_14"); //Hock heißt er. Der soll Mitgehen.
	AI_Output(hero, self, "Info_Mod_Cord_NW_NahkampfJG_15_15"); //Alles Klar. Bis demnächst.
	AI_Output(self, hero, "Info_Mod_Cord_NW_NahkampfJG_14_16"); //Adanos mit dir.
};

INSTANCE Info_Mod_Cord_NW_Lehrer (C_INFO)
{
	npc		= Mod_528_SLD_Cord_NW;
	nr		= 1;
	condition	= Info_Mod_Cord_NW_Lehrer_Condition;
	information	= Info_Mod_Cord_NW_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Cord_NW_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cord_NW_Hi))
	&& ((Mod_Gilde == 4)
	|| (Mod_Gilde == 5)
	|| (Mod_Gilde == 19))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cord_NW_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Cord_NW_Lehrer_14_00"); //Ich kann dir den Umgang mit Einhändern und Zweihändern beibringen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_SOELDNER_ONAR, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_SOELDNER_ONAR, "Cord kann mir den Umgang mit Einhändern und Zweihändern beibringen.");
};

INSTANCE Info_Mod_Cord_NW_Lernen (C_INFO)
{
	npc		= Mod_528_SLD_Cord_NW;
	nr		= 1;
	condition	= Info_Mod_Cord_NW_Lernen_Condition;
	information	= Info_Mod_Cord_NW_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Cord_NW_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cord_NW_Lehrer))
	&& ((Mod_Gilde == 5)
	|| (Mod_Gilde == 4)
	|| (Mod_Gilde == 19))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cord_NW_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Cord_NW_Lernen_15_00"); //Ich will lernen.

	Info_ClearChoices	(Info_Mod_Cord_NW_Lernen);

	Info_AddChoice	(Info_Mod_Cord_NW_Lernen, DIALOG_BACK, Info_Mod_Cord_NW_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Cord_NW_Lernen_2H_5);
	Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Cord_NW_Lernen_2H_1);
	Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Cord_NW_Lernen_1H_5);
	Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Cord_NW_Lernen_1H_1);
};

FUNC VOID Info_Mod_Cord_NW_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Cord_NW_Lernen);
};

FUNC VOID Info_Mod_Cord_NW_Lernen_2H_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 5, 100)
	{
		Info_ClearChoices	(Info_Mod_Cord_NW_Lernen);

		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, DIALOG_BACK, Info_Mod_Cord_NW_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Cord_NW_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Cord_NW_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Cord_NW_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Cord_NW_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Cord_NW_Lernen_2H_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_2H, 1, 100)
	{
		Info_ClearChoices	(Info_Mod_Cord_NW_Lernen);

		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, DIALOG_BACK, Info_Mod_Cord_NW_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Cord_NW_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Cord_NW_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Cord_NW_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Cord_NW_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Cord_NW_Lernen_1H_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_1H, 5, 100)
	{
		Info_ClearChoices	(Info_Mod_Cord_NW_Lernen);

		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, DIALOG_BACK, Info_Mod_Cord_NW_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Cord_NW_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Cord_NW_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Cord_NW_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Cord_NW_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Cord_NW_Lernen_1H_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_1H, 1, 100)
	{
		Info_ClearChoices	(Info_Mod_Cord_NW_Lernen);

		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, DIALOG_BACK, Info_Mod_Cord_NW_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Cord_NW_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Cord_NW_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Cord_NW_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Cord_NW_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Cord_NW_Lernen_1H_1);
	};
};

INSTANCE Info_Mod_Cord_Pickpocket (C_INFO)
{
	npc		= Mod_528_SLD_Cord_NW;
	nr		= 1;
	condition	= Info_Mod_Cord_Pickpocket_Condition;
	information	= Info_Mod_Cord_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Cord_Pickpocket_Condition()
{
	C_Beklauen	(125, ItMi_Gold, 65);
};

FUNC VOID Info_Mod_Cord_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Cord_Pickpocket);

	Info_AddChoice	(Info_Mod_Cord_Pickpocket, DIALOG_BACK, Info_Mod_Cord_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Cord_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Cord_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Cord_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Cord_Pickpocket);
};

FUNC VOID Info_Mod_Cord_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Cord_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Cord_Pickpocket);

		Info_AddChoice	(Info_Mod_Cord_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Cord_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Cord_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Cord_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Cord_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Cord_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Cord_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Cord_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Cord_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Cord_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Cord_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Cord_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Cord_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Cord_NW_EXIT (C_INFO)
{
	npc		= Mod_528_SLD_Cord_NW;
	nr		= 1;
	condition	= Info_Mod_Cord_NW_EXIT_Condition;
	information	= Info_Mod_Cord_NW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Cord_NW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cord_NW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};