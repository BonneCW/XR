INSTANCE Info_Mod_Babo_Daemonisch (C_INFO)
{
	npc		= Mod_914_NOV_Babo_NW;
	nr		= 1;
	condition	= Info_Mod_Babo_Daemonisch_Condition;
	information	= Info_Mod_Babo_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Babo_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_UrnolKap4))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Babo_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Babo_Daemonisch_03_00"); //(verstört) Schwarzer Rauch aus seinem Schlund, schwarzer Rauch aus seinem Körper, Schreie ...
	AI_Output(hero, self, "Info_Mod_Babo_Daemonisch_15_01"); //Nun, beruhige dich mal. Was genau ist passiert.
	AI_Output(self, hero, "Info_Mod_Babo_Daemonisch_03_02"); //(verstört) Kurz nachdem er die Kirche verließ ... nein, nein ...
	AI_Output(hero, self, "Info_Mod_Babo_Daemonisch_15_03"); //Nein, viel mehr bekomme ich aus ihm nicht heraus.

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Babo_Daemonisch_15_04"); //Acha, in der Kirche war er zuletzt. Da sollte ich mich mal umhören.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Babo ist tatsächlich ziemlich verstört, berichtet von schwarzem Rauch aus dem Körper des Verstorbenen. Dyrian war zuvor offensichtlich noch in der Kirche gewesen ...");

	Mod_BaboVerwirrt_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Babo_Daemonisch2 (C_INFO)
{
	npc		= Mod_914_NOV_Babo_NW;
	nr		= 1;
	condition	= Info_Mod_Babo_Daemonisch2_Condition;
	information	= Info_Mod_Babo_Daemonisch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Babo_Daemonisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Babo_Daemonisch))
	&& (Wld_GetDay() > Mod_BaboVerwirrt_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Babo_Daemonisch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Babo_Daemonisch2_03_00"); //Hey, wie sieht’s aus?
	AI_Output(hero, self, "Info_Mod_Babo_Daemonisch2_15_01"); //Ähh, du bist wieder ok? Du hast mir doch solche Sachen erzählt ...
	AI_Output(self, hero, "Info_Mod_Babo_Daemonisch2_03_02"); //Ach, vergiss den Unsinn. Ich war einfach verwirrt über Dyrian’s Tod. Aber jetzt geht es mir wieder gut.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Komisch ... Babo scheint wieder voll beisammen zu sein und tut die Sachen, die er mir zuvor berichtet hatte, als Folge des Schocks über Dyrians Tod ab.");
};

INSTANCE Info_Mod_Babo_Daemonisch3 (C_INFO)
{
	npc		= Mod_914_NOV_Babo_NW;
	nr		= 1;
	condition	= Info_Mod_Babo_Daemonisch3_Condition;
	information	= Info_Mod_Babo_Daemonisch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Babo_Daemonisch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Daemonisch3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Babo_Daemonisch3_Info()
{
	AI_Output(self, hero, "Info_Mod_Babo_Daemonisch3_03_00"); //Die schwarzen Schatten in der Höhle beim See ... ich muss sofort das Kloster davon in Kenntnis setzen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Babo_Pickpocket (C_INFO)
{
	npc		= Mod_914_NOV_Babo_NW;
	nr		= 1;
	condition	= Info_Mod_Babo_Pickpocket_Condition;
	information	= Info_Mod_Babo_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Babo_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Babo_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Babo_Pickpocket);

	Info_AddChoice	(Info_Mod_Babo_Pickpocket, DIALOG_BACK, Info_Mod_Babo_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Babo_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Babo_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Babo_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Babo_Pickpocket);
};

FUNC VOID Info_Mod_Babo_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Babo_Pickpocket);
};

INSTANCE Info_Mod_Babo_EXIT (C_INFO)
{
	npc		= Mod_914_NOV_Babo_NW;
	nr		= 1;
	condition	= Info_Mod_Babo_EXIT_Condition;
	information	= Info_Mod_Babo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Babo_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Babo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};