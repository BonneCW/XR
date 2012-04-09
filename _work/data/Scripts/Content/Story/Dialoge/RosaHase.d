INSTANCE Info_Mod_RosaHase_Hi (C_INFO)
{
	npc		= RosaHase_7187;
	nr		= 1;
	condition	= Info_Mod_RosaHase_Hi_Condition;
	information	= Info_Mod_RosaHase_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_RosaHase_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_RosaHase_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_RosaHase_Hi_13_00"); //Endlich jemand, der mir beistehen kann.
	AI_Output(hero, self, "Info_Mod_RosaHase_Hi_15_01"); //Wa ... was, wo bin ich?
	AI_Output(self, hero, "Info_Mod_RosaHase_Hi_13_02"); //Du musst mir helfen! Die Schafsfraktion des Bösen hat mir meinen verzauberten Kamm gestohlen.
	AI_Output(self, hero, "Info_Mod_RosaHase_Hi_13_03"); //Ich brauche ihn doch, um damit zum Mond zu fliegen.
	AI_Output(hero, self, "Info_Mod_RosaHase_Hi_15_04"); //Ähh, verstehe.
	AI_Output(self, hero, "Info_Mod_RosaHase_Hi_13_05"); //Hier, nimm dieses verzauberte Brot als Waffe, um damit gegen die Schafe zu bestehen.

	B_GiveInvItems	(self, hero, ItMw_Brot, 1);

	AI_Output(self, hero, "Info_Mod_RosaHase_Hi_13_06"); //Sie befinden sich im Eintopfschloss dort hinten. Aber nimm dich vor ihnen in Acht.
	AI_Output(hero, self, "Info_Mod_RosaHase_Hi_15_07"); //Öhh, alles klar.

	Log_CreateTopic	(TOPIC_MOD_BDT_KAMM, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BDT_KAMM, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BDT_KAMM, "Ich befinde mich auf einer Wolke, in der Umgebung sonderbare Klänge. Ein rosa Hase hat mich darum gebeten, seinen Kamm zu bergen, welchen die Schafe ihm raubten.");
};

INSTANCE Info_Mod_RosaHase_HabKamm (C_INFO)
{
	npc		= RosaHase_7187;
	nr		= 1;
	condition	= Info_Mod_RosaHase_HabKamm_Condition;
	information	= Info_Mod_RosaHase_HabKamm_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_RosaHase_HabKamm_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_RosaHase_Hi))
	&& (Npc_HasItems(hero, ItMi_MagicKamm) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_RosaHase_HabKamm_Info()
{
	AI_Output(self, hero, "Info_Mod_RosaHase_HabKamm_13_00"); //Du hast es geschafft und damit bewiesen, dass du eines wahren Helden würdig bist.

	B_GiveInvItems	(hero, self, ItMi_MagicKamm, 1);
	AI_UnequipWeapons	(hero);

	B_TransferInventory_All (hero, RosaHase_7187);

	AI_Output(self, hero, "Info_Mod_RosaHase_HabKamm_13_01"); //Nun kann meine Reise beginnen. Leb wohl.
	
	B_SetTopicStatus	(TOPIC_MOD_BDT_KAMM, LOG_SUCCESS);

	B_Göttergefallen(3, 1);

	Mod_CrazyRabbit = 3;
};

INSTANCE Info_Mod_RosaHase_EXIT (C_INFO)
{
	npc		= RosaHase_7187;
	nr		= 1;
	condition	= Info_Mod_RosaHase_EXIT_Condition;
	information	= Info_Mod_RosaHase_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_RosaHase_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_RosaHase_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};