INSTANCE Info_Mod_Cedric_Hi (C_INFO)
{
	npc		= Mod_569_RIT_Cedric_NW;
	nr		= 1;
	condition	= Info_Mod_Cedric_Hi_Condition;
	information	= Info_Mod_Cedric_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Cedric_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cedric_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Cedric_Hi_12_01"); //Ich bin Cedric, Kampflehrer der Miliz, der Ritter und der Paladine.
};

INSTANCE Info_Mod_Cedric_Irdorath (C_INFO)
{
	npc		= Mod_569_RIT_Cedric_NW;
	nr		= 1;
	condition	= Info_Mod_Cedric_Irdorath_Condition;
	information	= Info_Mod_Cedric_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hörte das Schiff der Paladine hätte sich zuletzt unter deinem Kommando befunden.";
};

FUNC INT Info_Mod_Cedric_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cedric_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Cedric_Irdorath_15_00"); //Ich hörte das Schiff der Paladine hätte sich zuletzt unter deinem Kommando befunden ...
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath_12_01"); //Ja, genau. Weshalb fragst du ... aber einen Augenblick mal, du bist doch jener Mann, dem auf Weisung der Magier das Schiff überlassen wurde ...
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath_12_02"); //Was kann ich für dich tun?
	AI_Output(hero, self, "Info_Mod_Cedric_Irdorath_15_03"); //Nun, du könntest ein weiteres Mal die Funktion des Kapitäns auf der Esmeralda übernehmen und mich zur Insel geleiten.
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath_12_04"); //Ahh ja, das ist also dein Anliegen ... ja, als Streiter für Recht und Ordnung komme ich gar nicht umhin, dieser Bitte nachzukommen.
	AI_Output(hero, self, "Info_Mod_Cedric_Irdorath_15_05"); //Wirklich?
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath_12_06"); //Selbstverständlich. Es ist die oberste Pflicht eines Paladins und Diener Innos' alles in seiner Macht stehende zu tun, um Finsternis und Unheil zu bannen.
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath_12_07"); //Einige der fähigsten meiner Mitstreiter werden uns zudem begleiten und den Erfolg unserer Mission gewährleisten.
	AI_Output(hero, self, "Info_Mod_Cedric_Irdorath_15_08"); //Großartig ...
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath_12_09"); //Nur ein Anliegen habe ich an dich, bevor wir aufbrechen können.
	AI_Output(hero, self, "Info_Mod_Cedric_Irdorath_15_10"); //Ja?
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath_12_11"); //Veranlasse bitte zumindest einen erfahrenen Magier des Feuers dazu, uns auf dieser Reise zu begleiten.
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath_12_12"); //Den Segen eines Magiers Innos möchte ich nicht auf unserer Exkursion missen ...
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath_12_13"); //Ich werde dann zum Hafen gehen und dort warten.

	Mod_Kapitan = 1;
	Mod_CedricDabei = 1;
	Mod_KerolothDabei = 1;
	Mod_MarcosDabei = 1;
	Mod_GeroldDabei = 1;

	Mod_CrewCount += 4;

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Cedric brennt mit seinem Eifer geradewegs auf die Mission. Er wünscht sich jedoch noch einen Feuermagier an Bord.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
	B_StartOtherRoutine	(Mod_978_RIT_Marcos_NW, "SCHIFF");
	B_StartOtherRoutine	(Mod_501_RIT_Gerold_NW, "SCHIFF");
	B_StartOtherRoutine	(Mod_502_RIT_Keroloth_NW, "SCHIFF");
};

INSTANCE Info_Mod_Cedric_Irdorath2 (C_INFO)
{
	npc		= Mod_569_RIT_Cedric_NW;
	nr		= 1;
	condition	= Info_Mod_Cedric_Irdorath2_Condition;
	information	= Info_Mod_Cedric_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Feuermagier Milten wird uns begleiten.";
};

FUNC INT Info_Mod_Cedric_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cedric_Irdorath))
	&& (Npc_GetDistToWP(self, "SHIP_CREW_CAPTAIN") < 1000)
	&& (Mod_MiltenDabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cedric_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Cedric_Irdorath2_15_00"); //Feuermagier Milten wird uns begleiten.
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath2_12_01"); //Sehr gut. Mit Innos Segen werden wir die die Scharen der Unholde versengen.

	Mod_CedricLos = 2;

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Cedric_Irdorath4 (C_INFO)
{
	npc		= Mod_569_RIT_Cedric_NW;
	nr		= 1;
	condition	= Info_Mod_Cedric_Irdorath4_Condition;
	information	= Info_Mod_Cedric_Irdorath4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cedric_Irdorath4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cedric_Irdorath))
	&& (Npc_GetDistToWP(self, "SHIP_CREW_CAPTAIN") < 1000)
	&& (Mod_JackDabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cedric_Irdorath4_Info()
{
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath4_12_00"); //Was soll das werden?!

	B_Say	(hero, self, "$WASMEINSTDU");

	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath4_12_01"); //Du heuerst mich nebst einem anderen Kapitän an?! Was soll das?!
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath4_12_02"); //Triff deine Entscheidung, wer dich denn nun begleiten soll! Jetzt gleich!
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath4_12_03"); //Du solltest unsere Mission mit der gleichen Ernsthaftigkeit begehen, wie ich.
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath4_12_04"); //Weitere Sperenzchen werde ich nicht dulden ... auch, wen du mit in unsere Mannschaft nimmst werde ich genau verfolgen.

	Info_ClearChoices	(Info_Mod_Cedric_Irdorath4);

	Info_AddChoice	(Info_Mod_Cedric_Irdorath4, "Tut mir Leid, aber ich entscheide mich in dem Fall für Jack.", Info_Mod_Cedric_Irdorath4_B);
	Info_AddChoice	(Info_Mod_Cedric_Irdorath4, "In Ordnung, du sollst mein Kapitän sein.", Info_Mod_Cedric_Irdorath4_A);
};

FUNC VOID Info_Mod_Cedric_Irdorath4_B()
{
	AI_Output(hero, self, "Info_Mod_Cedric_Irdorath4_B_15_00"); //Tut mir Leid, aber ich entscheide mich in dem Fall für Jack.
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath4_B_12_01"); //(fast außer sich) Wie, du willst mich doch verhöhnen ...?!
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath4_B_12_02"); //(beherrscht sich wieder, streng) In Ordnung, wie du meinst ...
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath4_B_12_03"); //(halblaut) Ich befürchte, dass die Magier dem falschen unser aller Schicksal anvertraut haben.

	Info_ClearChoices	(Info_Mod_Cedric_Irdorath4);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_978_RIT_Marcos_NW, "START");
	B_StartOtherRoutine	(Mod_501_RIT_Gerold_NW, "START");
	B_StartOtherRoutine	(Mod_502_RIT_Keroloth_NW, "START");

	Mod_CedricDabei = 0;
	Mod_KerolothDabei = 0;
	Mod_MarcosDabei = 0;
	Mod_GeroldDabei = 0;

	Mod_CrewCount -= 4;
};

FUNC VOID Info_Mod_Cedric_Irdorath4_A()
{
	AI_Output(hero, self, "Info_Mod_Cedric_Irdorath4_A_15_00"); //In Ordnung, du sollst mein Kapitän sein.
	AI_Output(self, hero, "Info_Mod_Cedric_Irdorath4_A_12_01"); //Gut, dann geh jetzt den weiteren Vorbereitungen nach.

	Info_ClearChoices	(Info_Mod_Cedric_Irdorath4);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_586_NONE_Jack_NW, "START");

	Mod_CrewCount -= 1;

	Mod_JackDabei = 0;
};

INSTANCE Info_Mod_Cedric_Irdorath3 (C_INFO)
{
	npc		= Mod_569_RIT_Cedric_NW;
	nr		= 1;
	condition	= Info_Mod_Cedric_Irdorath3_Condition;
	information	= Info_Mod_Cedric_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lass uns aufbrechen, es ist alles vorbereitet.";
};

FUNC INT Info_Mod_Cedric_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cedric_Irdorath2))
	&& (Npc_GetDistToWP(self, "SHIP_CREW_CAPTAIN") < 1000)
	&& (Mod_CedricLos == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cedric_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Cedric_Irdorath3_15_00"); //Lass uns aufbrechen, es ist alles vorbereitet.

	if (Mod_BonesDabei > 0)
	|| (Mod_CordDabei > 0)
	|| (Mod_RavenDabei > 0)
	|| (Mod_MyxirDabei > 0 && Mod_MyxirDabei < 4)
	|| (Mod_CassiaDabei > 0)
	|| (Mod_SagittaDabei > 0)
	{
		AI_Output(self, hero, "Info_Mod_Cedric_Irdorath3_12_01"); //Achja? Mir scheint aber, dass uns Leute begleiten sollen, die nichts auf dieser Mission verloren haben sollen.

		B_Say	(hero, self, "$WASMEINSTDU");

		AI_Output(self, hero, "Info_Mod_Cedric_Irdorath3_12_02"); //Piraten, Söldner, Diener Beliar’s und Frauen haben nichts auf einem Schiff der Paladine verloren.
		AI_Output(self, hero, "Info_Mod_Cedric_Irdorath3_12_03"); //Sie würden nur den Erfolg unserer Mission gefährden.
		AI_Output(hero, self, "Info_Mod_Cedric_Irdorath3_15_04"); //Wie?

		if (Mod_BonesDabei > 0)
		{
			AI_Output(self, hero, "Info_Mod_Cedric_Irdorath3_12_05"); //Piraten, üble Halunken, Halsabschneider, Mörder.
		};
		if (Mod_CordDabei > 0)
		{
			AI_Output(self, hero, "Info_Mod_Cedric_Irdorath3_12_06"); //Söldner, delinquente Schläger aus der Kolonie, die immer noch dem König die Gefolgschaft verweigern.
		};
		if (Mod_RavenDabei > 0)
		|| (Mod_MyxirDabei > 0 && Mod_MyxirDabei < 4)
		{
			AI_Output(self, hero, "Info_Mod_Cedric_Irdorath3_12_07"); //Belianer, Diener des finsteren Gottes, bei denen man sich nicht einmal sicher sein kann, ob sie nicht mit dem Urheber des Unheils unter einer Decke stecken.
		};
		if (Mod_CassiaDabei > 0)
		|| (Mod_SagittaDabei > 0)
		{
			AI_Output(self, hero, "Info_Mod_Cedric_Irdorath3_12_08"); //Für Frauen ist solcherlei Unternehmung schlichtweg zu gefährlich und ich könnte es zu ihrer eigenen Sicherheit nicht verantworten, sie mitzunehmen.
			AI_Output(self, hero, "Info_Mod_Cedric_Irdorath3_12_09"); //Außerdem würden sie die Männer nur von der drängenden Mission ablenken ...
		};

		AI_Output(self, hero, "Info_Mod_Cedric_Irdorath3_12_10"); //Also, sorge dafür, dass sie gleich wieder verschwinden.
		AI_Output(self, hero, "Info_Mod_Cedric_Irdorath3_12_11"); //Eher werde ich mich nicht zum Aufbruch bereit erklären.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Cedric_Irdorath3_12_12"); //Vortrefflich. Auf zu ruhmreichen Taten.

		Mod_CedricLos = 3;

		B_GivePlayerXP	(500);
	};
};

INSTANCE Info_Mod_Cedric_Lehrer (C_INFO)
{
	npc		= Mod_569_RIT_Cedric_NW;
	nr		= 1;
	condition	= Info_Mod_Cedric_Lehrer_Condition;
	information	= Info_Mod_Cedric_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Cedric_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cedric_Hi))
	&& ((Mod_Gilde == 1)
	|| (Mod_Gilde == 2)
	|| (Mod_Gilde == 3))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cedric_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Cedric_Lehrer_12_00"); //Ich kann dir den Umgang mit Einhändern und Zweihändern beibringen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_STADT, "Cedric kann mir den Umgang mit Einhändern und Zweihändern beibringen.");
};

INSTANCE Info_Mod_Cedric_Lernen (C_INFO)
{
	npc		= Mod_569_RIT_Cedric_NW;
	nr		= 1;
	condition	= Info_Mod_Cedric_Lernen_Condition;
	information	= Info_Mod_Cedric_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Cedric_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cedric_Lehrer))
	&& ((Mod_Gilde == 1)
	|| (Mod_Gilde == 2)
	|| (Mod_Gilde == 3))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cedric_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Cedric_Lernen_15_00"); //Ich will lernen.

	Info_ClearChoices	(Info_Mod_Cedric_Lernen);

	Info_AddChoice	(Info_Mod_Cedric_Lernen, DIALOG_BACK, Info_Mod_Cedric_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Cedric_Lernen_2H_5);
	Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Cedric_Lernen_2H_1);
	Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Cedric_Lernen_1H_5);
	Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Cedric_Lernen_1H_1);
};

FUNC VOID Info_Mod_Cedric_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Cedric_Lernen);
};

FUNC VOID Info_Mod_Cedric_Lernen_2H_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 5, 60)
	{
		Info_ClearChoices	(Info_Mod_Cedric_Lernen);

		Info_AddChoice	(Info_Mod_Cedric_Lernen, DIALOG_BACK, Info_Mod_Cedric_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Cedric_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Cedric_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Cedric_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Cedric_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Cedric_Lernen_2H_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_2H, 1, 60)
	{
		Info_ClearChoices	(Info_Mod_Cedric_Lernen);

		Info_AddChoice	(Info_Mod_Cedric_Lernen, DIALOG_BACK, Info_Mod_Cedric_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Cedric_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Cedric_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Cedric_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Cedric_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Cedric_Lernen_1H_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_1H, 5, 60)
	{
		Info_ClearChoices	(Info_Mod_Cedric_Lernen);

		Info_AddChoice	(Info_Mod_Cedric_Lernen, DIALOG_BACK, Info_Mod_Cedric_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Cedric_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Cedric_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Cedric_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Cedric_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Cedric_Lernen_1H_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_1H, 1, 60)
	{
		Info_ClearChoices	(Info_Mod_Cedric_Lernen);

		Info_AddChoice	(Info_Mod_Cedric_Lernen, DIALOG_BACK, Info_Mod_Cedric_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Cedric_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Cedric_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Cedric_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Cedric_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Cedric_Lernen_1H_1);
	};
};

INSTANCE Info_Mod_Cedric_Pickpocket (C_INFO)
{
	npc		= Mod_569_RIT_Cedric_NW;
	nr		= 1;
	condition	= Info_Mod_Cedric_Pickpocket_Condition;
	information	= Info_Mod_Cedric_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Cedric_Pickpocket_Condition()
{
	C_Beklauen	(130, ItMi_Gold, 69);
};

FUNC VOID Info_Mod_Cedric_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Cedric_Pickpocket);

	Info_AddChoice	(Info_Mod_Cedric_Pickpocket, DIALOG_BACK, Info_Mod_Cedric_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Cedric_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Cedric_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Cedric_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Cedric_Pickpocket);
};

FUNC VOID Info_Mod_Cedric_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Cedric_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Cedric_Pickpocket);

		Info_AddChoice	(Info_Mod_Cedric_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Cedric_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Cedric_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Cedric_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Cedric_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Cedric_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Cedric_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Cedric_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Cedric_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Cedric_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Cedric_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Cedric_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Cedric_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Cedric_EXIT (C_INFO)
{
	npc		= Mod_569_RIT_Cedric_NW;
	nr		= 1;
	condition	= Info_Mod_Cedric_EXIT_Condition;
	information	= Info_Mod_Cedric_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Cedric_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cedric_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};