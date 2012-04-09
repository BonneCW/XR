INSTANCE Info_Mod_Gizar_Hi (C_INFO)
{
	npc		= Mod_1772_KDF_Gizar_PAT;
	nr		= 1;
	condition	= Info_Mod_Gizar_Hi_Condition;
	information	= Info_Mod_Gizar_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gizar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gizar_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Gizar_Hi_10_00"); //Du sollst zu Nagon, Bruder. Er erwartet dich in der Kapelle.
	AI_Output(hero, self, "Info_Mod_Gizar_Hi_15_01"); //Wer ist der Magier, der hier eben hochgerannt ist?
	AI_Output(self, hero, "Info_Mod_Gizar_Hi_10_02"); //Das war Aaron. Er ist erst seit kurzem hier stationiert.

	Npc_ClearAIQueue	(Mod_1771_KDF_Aaron_PAT);
	AI_StandUp	(Mod_1771_KDF_Aaron_PAT);
	B_StartOtherRoutine	(Mod_1771_KDF_Aaron_PAT, "TOT");
	AI_Teleport	(Mod_1771_KDF_Aaron_PAT, "TOT");

	B_LogEntry	(TOPIC_MOD_FM_VERRAT, "Ein Magier names Aaron, welcher erst seit kurzer Zeit hier im Kloster ist, ist nach dem Angriff des Trolls auf den Turm gerannt. Ich sollte der Sache mal auf den Grund gehen.");
};

INSTANCE Info_Mod_Gizar_EXIT (C_INFO)
{
	npc		= Mod_1772_KDF_Gizar_PAT;
	nr		= 1;
	condition	= Info_Mod_Gizar_EXIT_Condition;
	information	= Info_Mod_Gizar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gizar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gizar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};