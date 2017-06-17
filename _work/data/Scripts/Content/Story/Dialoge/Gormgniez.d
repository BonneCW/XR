INSTANCE Info_Mod_Gormgniez_Hi (C_INFO)
{
	npc		= Gormgniez_11007_FM;
	nr		= 1;
	condition	= Info_Mod_Gormgniez_Hi_Condition;
	information	= Info_Mod_Gormgniez_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gormgniez_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gormgniez_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Gormgniez_Hi_07_00"); //Was?! Du hier, Mensch?! Nie wirst du mich aufhalten und an mein Erz kommen.
	AI_Output(hero, self, "Info_Mod_Gormgniez_Hi_15_01"); //Du kleine Ausgeburt bist es also, die für dieses schändliche Treiben verantwortlich ist. Dem werde ich nun ein Ende bereiten.
	AI_Output(self, hero, "Info_Mod_Gormgniez_Hi_07_02"); //Verschone mich.
	AI_Output(hero, self, "Info_Mod_Gormgniez_Hi_15_03"); //Warum sollte ich das tun? Ganz gleich ob Drache oder Kobold, Missetäter wie euch werde ich zugrunde richten.
	AI_Output(self, hero, "Info_Mod_Gormgniez_Hi_07_04"); //Die Drachen, du weißt es? Ein Geheimnis kann ich dir verraten, das dir helfen kann.
	AI_Output(hero, self, "Info_Mod_Gormgniez_Hi_15_05"); //Wovon sprichst du?
	AI_Output(self, hero, "Info_Mod_Gormgniez_Hi_07_06"); //Der große Drache spricht im Schlaf.
	AI_Output(hero, self, "Info_Mod_Gormgniez_Hi_15_07"); //Ja, aber was hat das ... ach, verdammt.

	B_LogEntry_More	(TOPIC_MOD_NL_DRACHEN, TOPIC_MOD_NL_CRAWLER, "Verdammt, er ist mir entwischt. Was meinte er mit 'Der große Drache Spricht im Schlaf?' Ob mir Xardas dazu mehr verraten kann?", "Aha, dieser Kobold ist also für den ganzen Schrecken in der Mine verantwortlich.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_1582_SFB_Bert_FM, "GERETTET");
	
	B_RemoveNpc	(Zombie_11015_FM);
	B_RemoveNpc	(Zombie_11016_FM);
	B_RemoveNpc	(Zombie_11017_FM);
	B_RemoveNpc	(Zombie_11018_FM);

	B_StartOtherRoutine	(self, "TOT");
	AI_Teleport	(self, "TOT");
};