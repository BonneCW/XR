INSTANCE Info_Mod_Keroloth_Mario (C_INFO)
{
	npc		= Mod_502_RIT_Keroloth_NW;
	nr		= 1;
	condition	= Info_Mod_Keroloth_Mario_Condition;
	information	= Info_Mod_Keroloth_Mario_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Keroloth_Mario_Condition()
{
	if (Mod_Mario == 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Keroloth_Mario_Info()
{
	AI_Output(self, hero, "DEFAULT"); //
	AI_Output(hero, self, "Info_Mod_Keroloth_Mario_15_00"); //(schreit) Nein!
	AI_Output(self, hero, "Info_Mod_Keroloth_Mario_07_01"); //Das hat er schon verdient, muss ich sagen.
	AI_Output(hero, self, "Info_Mod_Keroloth_Mario_15_02"); //Wieso ...?
	AI_Output(self, hero, "Info_Mod_Keroloth_Mario_07_03"); //Allgemein, meine ich. Und er hätte sich von Garond nicht provozieren lassen dürfen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_500_PAL_Garond_NW, "FOLLOW");
	//B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Keroloth_Mario2 (C_INFO)
{
	npc		= Mod_502_RIT_Keroloth_NW;
	nr		= 1;
	condition	= Info_Mod_Keroloth_Mario2_Condition;
	information	= Info_Mod_Keroloth_Mario2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Keroloth_Mario2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garond_Mario2))
	&& (Npc_IsDead(Mod_500_PAL_Garond_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Keroloth_Mario2_Info()
{
	AI_Output(self, hero, "Info_Mod_Keroloth_Mario2_07_00"); //Verdammt, jetzt ist aber Schluss mit den Duellen!
	AI_Output(self, hero, "Info_Mod_Keroloth_Mario2_07_01"); //Sonst haben wir in ein paar Tagen gar keine Männer mehr!
	AI_Output(hero, self, "Info_Mod_Keroloth_Mario2_15_02"); //Keine Sorge.
	AI_Output(self, hero, "Info_Mod_Keroloth_Mario2_07_03"); //Keine Sorge ist gut, Mann. Und wer ... entfernt jetzt die Leichen und das ganze Blut?

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	B_GivePlayerXP	(100);

	B_SetTopicStatus	(TOPIC_MOD_MARIO_RACHE, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Keroloth_EXIT (C_INFO)
{
	npc		= Mod_502_RIT_Keroloth_NW;
	nr		= 1;
	condition	= Info_Mod_Keroloth_EXIT_Condition;
	information	= Info_Mod_Keroloth_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Keroloth_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Keroloth_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};