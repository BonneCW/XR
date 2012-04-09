INSTANCE Info_Mod_AufgebrachteBuergerin_Hi (C_INFO)
{
	npc		= Mod_7192_VLK_Buergerin_NW;
	nr		= 1;
	condition	= Info_Mod_AufgebrachteBuergerin_Hi_Condition;
	information	= Info_Mod_AufgebrachteBuergerin_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_AufgebrachteBuergerin_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_AufgebrachteBuergerin_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_AufgebrachteBuergerin_Hi_16_00"); //(kreischt) Iih! Das ist er!
	AI_Output(hero, self, "Info_Mod_AufgebrachteBuergerin_Hi_15_01"); //Beruhig dich! Wer ist was?
	AI_Output(self, hero, "Info_Mod_AufgebrachteBuergerin_Hi_16_02"); //Du bist der Schlächter! Mörder, Mörder!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FLUCHT");

	Log_CreateTopic	(TOPIC_MOD_MOE_TALK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MOE_TALK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MOE_TALK, "Ich bin leicht verwirrt ... Auf dem Marktplatz von Khorinis hat mich eine Frau des Mordes bezichtigt. Wieso das jetzt so plötzlich? Ich sollte mit Moe darüber reden.");
};