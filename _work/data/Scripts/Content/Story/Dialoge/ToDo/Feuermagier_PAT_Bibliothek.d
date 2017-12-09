INSTANCE Info_Mod_Feuermagier_PAT_Bibliothek_MangelQuest (C_INFO)
{
	npc		= Mod_1737_KDF_Feuermagier_PAT;
	nr		= 1;
	condition	= Info_Mod_Feuermagier_PAT_Bibliothek_MangelQuest_Condition;
	information	= Info_Mod_Feuermagier_PAT_Bibliothek_MangelQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hieltest du davon, dich zur Abwechslung in ein Gebet zu Innos zu versenken in seiner Kirche, Bruder?";
};

FUNC INT Info_Mod_Feuermagier_PAT_Bibliothek_MangelQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nagon_MangelQuest))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Nagon_MangelQuest2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Feuermagier_PAT_Bibliothek_MangelQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Feuermagier_PAT_Bibliothek_MangelQuest_15_00"); //Was hieltest du davon, dich zur Abwechslung in ein Gebet zu Innos zu versenken in seiner Kirche, Bruder?
	AI_Output(self, hero, "Info_Mod_Feuermagier_PAT_Bibliothek_MangelQuest_06_01"); //(vom Lesen aufgeschreckt) Was sagst du Bruder? Achso, ja die Kirche.
	AI_Output(self, hero, "Info_Mod_Feuermagier_PAT_Bibliothek_MangelQuest_06_02"); //Hmm, eigentlich wollte mich weiter mit dieser Abhandlung über magische Kriegsführung auseinandersetzen, an der ich schon so lange nage.
	AI_Output(self, hero, "Info_Mod_Feuermagier_PAT_Bibliothek_MangelQuest_06_03"); //Aber ein Gebet in der Kirche wird mir bestimmt zu einem frischen Geiste verhelfen, um konzentriert weiterzuarbeiten.
	AI_Output(self, hero, "Info_Mod_Feuermagier_PAT_Bibliothek_MangelQuest_06_04"); //Ich werde mich sofort dorthin begeben.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "KIRCHE");

	B_GivePlayerXP	(100);

	Mod_Pat_Beter += 1;

	if (Mod_Pat_Beter == 3)
	{
		B_LogEntry	(TOPIC_MOD_FM_MANGEL, "So, ich denke ich haben genügend Jünger Innos’ zum Gebet bewegen können und sollte in der Kirche bei Nagon vorbeischauen.");
	};
};

INSTANCE Info_Mod_Feuermagier_PAT_Bibliothek_EXIT (C_INFO)
{
	npc		= Mod_1737_KDF_Feuermagier_PAT;
	nr		= 1;
	condition	= Info_Mod_Feuermagier_PAT_Bibliothek_EXIT_Condition;
	information	= Info_Mod_Feuermagier_PAT_Bibliothek_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Feuermagier_PAT_Bibliothek_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Feuermagier_PAT_Bibliothek_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};