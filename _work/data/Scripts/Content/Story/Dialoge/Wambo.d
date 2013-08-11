INSTANCE Info_Mod_Wambo_Hi (C_INFO)
{
	npc		= Mod_755_MIL_Wambo_NW;
	nr		= 1;
	condition	= Info_Mod_Wambo_Hi_Condition;
	information	= Info_Mod_Wambo_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist der Ausbilder hier, stimmt's?";
};

FUNC INT Info_Mod_Wambo_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wambo_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Wambo_Hi_15_00"); //Du bist der Ausbilder hier, stimmt's?
	AI_Output(self, hero, "Info_Mod_Wambo_Hi_03_01"); //Richtig. Die Rekruten lernen bei mir das Nötigste im Umgang mit Ein- und Zweihändern.

	if (Mod_Schwierigkeit != 4)
	{
		Log_CreateTopic	(TOPIC_MOD_LEHRER_STADT, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_STADT, "Wambo kann mir den Umgang mit Einhändern und Zweihändern beibringen.");
	};
};

INSTANCE Info_Mod_Wambo_AndreVermaechtnis (C_INFO)
{
	npc		= Mod_755_MIL_Wambo_NW;
	nr		= 1;
	condition	= Info_Mod_Wambo_AndreVermaechtnis_Condition;
	information	= Info_Mod_Wambo_AndreVermaechtnis_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wambo_AndreVermaechtnis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_AndreVermaechtnis))
	&& (Mod_PAL_Diebesgilde == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wambo_AndreVermaechtnis_Info()
{
	AI_Output(self, hero, "Info_Mod_Wambo_AndreVermaechtnis_03_00"); //Ha, so bekommt das Verbrecherpack also doch noch sein gerechtes Urteil.
	AI_Output(self, hero, "Info_Mod_Wambo_AndreVermaechtnis_03_01"); //Und die Jungs konnten endlich mal sehen, wofür der Stahl eigentlich da ist.

	B_LogEntry	(TOPIC_MOD_MILIZ_DIEBESGILDE, "Ich kann Hagen ausrichten, dass die Diebe erledigt sind.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_583_NONE_Hanna_NW, "KNAST");

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_744_MIL_Pablo_NW, "START");
	B_StartOtherRoutine	(Mod_564_MIL_Boltan_NW, "START");
	B_StartOtherRoutine	(Mod_596_MIL_Martin_NW, "START");
};

INSTANCE Info_Mod_Wambo_Asylanten (C_INFO)
{
	npc		= Mod_755_MIL_Wambo_NW;
	nr		= 1;
	condition	= Info_Mod_Wambo_Asylanten_Condition;
	information	= Info_Mod_Wambo_Asylanten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich muss zurück ins Minental.";
};

FUNC INT Info_Mod_Wambo_Asylanten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wambo_Lehrer))
	&& (Mod_Wambo_Freund == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wambo_Asylanten_Info()
{
	AI_Output(hero, self, "Info_Mod_Wambo_Asylanten_15_00"); //Ich muss zurück ins Minental.
	AI_Output(self, hero, "Info_Mod_Wambo_Asylanten_03_01"); //Wenn du Angar siehst, gib ihm das hier. Das ist alles, was ich von seiner Frau finden konnte.

	B_GiveInvItems	(self, hero, ItMi_AngarHalskette, 1);

	AI_Output(hero, self, "Info_Mod_Wambo_Asylanten_15_02"); //Mach ich.
	AI_Output(self, hero, "Info_Mod_Wambo_Asylanten_03_03"); //Bis dann.

	Log_CreateTopic	(TOPIC_MOD_WAMBO_ANGAR, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_WAMBO_ANGAR, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_WAMBO_ANGAR, "Wambo hat mir eine Halskette für Angar mitgegeben, die ihn an seine Frau erinnern soll.");
};

INSTANCE Info_Mod_Wambo_Angar (C_INFO)
{
	npc		= Mod_755_MIL_Wambo_NW;
	nr		= 1;
	condition	= Info_Mod_Wambo_Angar_Condition;
	information	= Info_Mod_Wambo_Angar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Angar hat die Kette erhalten.";
};

FUNC INT Info_Mod_Wambo_Angar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Wambo))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wambo_Angar_Info()
{
	AI_Output(hero, self, "Info_Mod_Wambo_Angar_15_00"); //Angar hat die Kette erhalten.
	AI_Output(self, hero, "Info_Mod_Wambo_Angar_03_01"); //Und? Was hat er gesagt?
	AI_Output(hero, self, "Info_Mod_Wambo_Angar_15_02"); //Er war niedergeschlagen, wie zu erwarten. Aber er scheint dich nicht verantwortlich zu machen.
	AI_Output(self, hero, "Info_Mod_Wambo_Angar_03_03"); //(erleichtert) Ich muss ihn unbedingt mal wieder sehen.
	AI_Output(self, hero, "Info_Mod_Wambo_Angar_03_04"); //Hoffentlich schafft er es irgendwann zurück hierher.
};

INSTANCE Info_Mod_Wambo_TurnierSieg (C_INFO)
{
	npc		= Mod_755_MIL_Wambo_NW;
	nr		= 1;
	condition	= Info_Mod_Wambo_TurnierSieg_Condition;
	information	= Info_Mod_Wambo_TurnierSieg_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wambo_TurnierSieg_Condition()
{
	if (Mod_MilizTurnier == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wambo_TurnierSieg_Info()
{
	AI_Output(self, hero, "Info_Mod_Wambo_TurnierSieg_03_00"); //Du bist ein zäher Hund, wenn du selbst gegen Gidan bestehst.
	AI_Output(self, hero, "Info_Mod_Wambo_TurnierSieg_03_01"); //So einen wie dich brauchen wir hier.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Wambo_TurnierNiederlage (C_INFO)
{
	npc		= Mod_755_MIL_Wambo_NW;
	nr		= 1;
	condition	= Info_Mod_Wambo_TurnierNiederlage_Condition;
	information	= Info_Mod_Wambo_TurnierNiederlage_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wambo_TurnierNiederlage_Condition()
{
	if (Mod_MilizTurnier == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wambo_TurnierNiederlage_Info()
{
	AI_Output(self, hero, "Info_Mod_Wambo_TurnierNiederlage_03_00"); //Deine Kampftechnik könnte noch etwas Feinschliff vertragen.
	AI_Output(self, hero, "Info_Mod_Wambo_TurnierNiederlage_03_01"); //Ich kann dir da sicher noch etwas zeigen.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Wambo_Paladin (C_INFO)
{
	npc		= Mod_755_MIL_Wambo_NW;
	nr		= 1;
	condition	= Info_Mod_Wambo_Paladin_Condition;
	information	= Info_Mod_Wambo_Paladin_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wambo_Paladin_Condition()
{
	if (Mod_Gilde == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wambo_Paladin_Info()
{
	AI_Output(self, hero, "Info_Mod_Wambo_Paladin_03_00"); //Sieh an, ein Paladin bist du mittlerweile.
	AI_Output(self, hero, "Info_Mod_Wambo_Paladin_03_01"); //Ich kann mich nicht erinnern, dass mal jemand schneller als du aufgestiegen ist.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Wambo_Hauptmann (C_INFO)
{
	npc		= Mod_755_MIL_Wambo_NW;
	nr		= 1;
	condition	= Info_Mod_Wambo_Hauptmann_Condition;
	information	= Info_Mod_Wambo_Hauptmann_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wambo_Hauptmann_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_AndreVermaechtnis8))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wambo_Hauptmann_Info()
{
	AI_Output(self, hero, "Info_Mod_Wambo_Hauptmann_03_00"); //Dass ich jetzt auf dich hören soll, muss ich mir noch angewöhnen.
	AI_Output(hero, self, "Info_Mod_Wambo_Hauptmann_15_01"); //(ernst) 60 Liegestütze für diese blöde Anmache!
	AI_Output(self, hero, "Info_Mod_Wambo_Hauptmann_03_02"); //(zackig) Zu Befehl, Sir!
	AI_Output(hero, self, "Info_Mod_Wambo_Hauptmann_15_03"); //Klappt doch schon ganz gut.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Wambo_Lehrer (C_INFO)
{
	npc		= Mod_755_MIL_Wambo_NW;
	nr		= 1;
	condition	= Info_Mod_Wambo_Lehrer_Condition;
	information	= Info_Mod_Wambo_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Wambo_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wambo_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wambo_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Wambo_Lehrer_03_01"); //Du kommst doch aus dem Minental, oder?

	Info_ClearChoices	(Info_Mod_Wambo_Lehrer);

	Info_AddChoice	(Info_Mod_Wambo_Lehrer, "Nein. Ich bin nur neu hier.", Info_Mod_Wambo_Lehrer_B);
	Info_AddChoice	(Info_Mod_Wambo_Lehrer, "Ja.", Info_Mod_Wambo_Lehrer_A);
};

FUNC VOID Info_Mod_Wambo_Lehrer_B()
{
	AI_Output(hero, self, "Info_Mod_Wambo_Lehrer_B_15_00"); //Nein. Ich bin nur neu hier.
	AI_Output(self, hero, "Info_Mod_Wambo_Lehrer_B_03_01"); //Verstehe. Wenn du nicht bei der Miliz bist und ich dich unterrichten soll, kostet es dich 50 Goldstücke.

	Info_ClearChoices	(Info_Mod_Wambo_Lehrer);
};

FUNC VOID Info_Mod_Wambo_Lehrer_A()
{
	AI_Output(hero, self, "Info_Mod_Wambo_Lehrer_A_15_00"); //Ja.
	AI_Output(self, hero, "Info_Mod_Wambo_Lehrer_A_03_01"); //Dann werde ich dich unterrichten, wenn du es wünschst.
	AI_Output(hero, self, "Info_Mod_Wambo_Lehrer_A_15_02"); //(verblüfft) Wie komme ich zu der Ehre?
	AI_Output(self, hero, "Info_Mod_Wambo_Lehrer_A_03_03"); //Das ist eine lange Geschichte.
	AI_Output(self, hero, "Info_Mod_Wambo_Lehrer_A_03_04"); //Ich fühle mich verpflichtet, den Häftlingen so gut es geht zu helfen.

	Mod_Wambo_Freund = 1;

	Info_ClearChoices	(Info_Mod_Wambo_Lehrer);

	Info_AddChoice	(Info_Mod_Wambo_Lehrer, "Na gut. Aber zeig mir lieber, wie man kämpft.", Info_Mod_Wambo_Lehrer_D);
	Info_AddChoice	(Info_Mod_Wambo_Lehrer, "Was ist das für eine Geschichte?", Info_Mod_Wambo_Lehrer_C);
};

FUNC VOID Info_Mod_Wambo_Lehrer_D()
{
	AI_Output(hero, self, "Info_Mod_Wambo_Lehrer_D_15_00"); //Na gut. Aber zeig mir lieber, wie man kämpft.

	Info_ClearChoices	(Info_Mod_Wambo_Lehrer);
};

FUNC VOID Info_Mod_Wambo_Lehrer_C()
{
	AI_Output(hero, self, "Info_Mod_Wambo_Lehrer_C_15_00"); //Was ist das für eine Geschichte?
	AI_Output(self, hero, "Info_Mod_Wambo_Lehrer_C_03_01"); //Ich hatte einst einen guten Freund.
	AI_Output(self, hero, "Info_Mod_Wambo_Lehrer_C_03_02"); //Er war ein Kämpfer, nicht nur auf dem Übungsplatz, sondern in seinem Herzen.
	AI_Output(self, hero, "Info_Mod_Wambo_Lehrer_C_03_03"); //Er pflegte jedoch schon lange Kontakt zu einer falschgläubigen Sekte, deren Glaubensinhalt irgendetwas mit Piraten zu tun hatte.
	AI_Output(self, hero, "Info_Mod_Wambo_Lehrer_C_03_04"); //Nachdem die Barriere geschaffen worden war, galt das plötzlich als Verbrechen, und so wurde er verurteilt, dort zu schuften.
	AI_Output(hero, self, "Info_Mod_Wambo_Lehrer_C_15_05"); //Hatte dein Freund einen Namen?
	AI_Output(self, hero, "Info_Mod_Wambo_Lehrer_C_03_06"); //Angar hieß er.
	AI_Output(self, hero, "Info_Mod_Wambo_Lehrer_C_03_07"); //Ich versprach ihm, auf seine Frau aufzupassen für die Zeit, in der gefangen war.
	AI_Output(self, hero, "Info_Mod_Wambo_Lehrer_C_03_08"); //Wenn ich meine Zusage eingehalten hätte, wäre sie vielleicht noch am Leben.
	AI_Output(hero, self, "Info_Mod_Wambo_Lehrer_C_15_09"); //Oh.
	AI_Output(self, hero, "Info_Mod_Wambo_Lehrer_C_03_10"); //Ich weiß, unter welchen Umständen manche der Häftlinge zu Verbrechern gemacht wurden.
	AI_Output(self, hero, "Info_Mod_Wambo_Lehrer_C_03_11"); //Wenn ich schon nichts aktiv dagegen unternommen habe, so will ich jetzt doch meinen Teil dazu beitragen, sie wieder in unsere Gemeinschaft aufzunehmen.
	AI_Output(self, hero, "Info_Mod_Wambo_Lehrer_C_03_12"); //Solltest du jemals in das Minental zurückkehren, so wäre ich dir dankbar, wenn du mir vorher Bescheid sagen würdest.
	AI_Output(hero, self, "Info_Mod_Wambo_Lehrer_C_15_13"); //Kein Problem.
	AI_Output(self, hero, "Info_Mod_Wambo_Lehrer_C_03_14"); //Dann lass uns jetzt auf deinen ursprünglichen Willen zurückkommen.

	Info_ClearChoices	(Info_Mod_Wambo_Lehrer);
};

INSTANCE Info_Mod_Wambo_Lernen (C_INFO)
{
	npc		= Mod_755_MIL_Wambo_NW;
	nr		= 1;
	condition	= Info_Mod_Wambo_Lernen_Condition;
	information	= Info_Mod_Wambo_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den Umgang mit Ein- und Zweihändern.";
};

FUNC INT Info_Mod_Wambo_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wambo_Lehrer))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wambo_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Wambo_Lernen_15_00"); //Lehre mich den Umgang mit Ein- und Zweihändern.

	if (Mod_Wambo_Freund == 0)
	{
		if (Npc_HasItems(hero, ItMi_Gold) >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);

			Mod_Wambo_Freund = 2;

			Info_ClearChoices	(Info_Mod_Wambo_Lernen);

			Info_AddChoice	(Info_Mod_Wambo_Lernen, DIALOG_BACK, Info_Mod_Wambo_Lernen_BACK);
			Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Wambo_Lernen_2H_5);
			Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Wambo_Lernen_2H_1);
			Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Wambo_Lernen_1H_5);
			Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Wambo_Lernen_1H_1);
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Wambo_Lernen_03_00"); //Ohne das Gold werde ich dich nicht trainieren.
		};
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Wambo_Lernen);

		Info_AddChoice	(Info_Mod_Wambo_Lernen, DIALOG_BACK, Info_Mod_Wambo_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Wambo_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Wambo_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Wambo_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Wambo_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Wambo_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Wambo_Lernen);
};

FUNC VOID Info_Mod_Wambo_Lernen_2H_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 5, 60)
	{
		Info_ClearChoices	(Info_Mod_Wambo_Lernen);

		Info_AddChoice	(Info_Mod_Wambo_Lernen, DIALOG_BACK, Info_Mod_Wambo_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Wambo_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Wambo_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Wambo_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Wambo_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Wambo_Lernen_2H_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_2H, 1, 60)
	{
		Info_ClearChoices	(Info_Mod_Wambo_Lernen);

		Info_AddChoice	(Info_Mod_Wambo_Lernen, DIALOG_BACK, Info_Mod_Wambo_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Wambo_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Wambo_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Wambo_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Wambo_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Wambo_Lernen_1H_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_1H, 5, 60)
	{
		Info_ClearChoices	(Info_Mod_Wambo_Lernen);

		Info_AddChoice	(Info_Mod_Wambo_Lernen, DIALOG_BACK, Info_Mod_Wambo_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Wambo_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Wambo_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Wambo_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Wambo_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Wambo_Lernen_1H_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_1H, 1, 60)
	{
		Info_ClearChoices	(Info_Mod_Wambo_Lernen);

		Info_AddChoice	(Info_Mod_Wambo_Lernen, DIALOG_BACK, Info_Mod_Wambo_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Wambo_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Wambo_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Wambo_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Wambo_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Wambo_Lernen_1H_1);
	};
};

INSTANCE Info_Mod_Wambo_Pickpocket (C_INFO)
{
	npc		= Mod_755_MIL_Wambo_NW;
	nr		= 1;
	condition	= Info_Mod_Wambo_Pickpocket_Condition;
	information	= Info_Mod_Wambo_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Wambo_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 20);
};

FUNC VOID Info_Mod_Wambo_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Wambo_Pickpocket);

	Info_AddChoice	(Info_Mod_Wambo_Pickpocket, DIALOG_BACK, Info_Mod_Wambo_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Wambo_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Wambo_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Wambo_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Wambo_Pickpocket);
};

FUNC VOID Info_Mod_Wambo_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Wambo_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Wambo_Pickpocket);

		Info_AddChoice	(Info_Mod_Wambo_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Wambo_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Wambo_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Wambo_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Wambo_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Wambo_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Wambo_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Wambo_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Wambo_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Wambo_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Wambo_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Wambo_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Wambo_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Wambo_EXIT (C_INFO)
{
	npc		= Mod_755_MIL_Wambo_NW;
	nr		= 1;
	condition	= Info_Mod_Wambo_EXIT_Condition;
	information	= Info_Mod_Wambo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Wambo_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wambo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};