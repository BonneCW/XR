INSTANCE Info_Mod_Bodo_MT_Hi (C_INFO)
{
	npc		= Mod_1941_SNOV_Bodo_NW;
	nr		= 1;
	condition	= Info_Mod_Bodo_MT_Hi_Condition;
	information	= Info_Mod_Bodo_MT_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bodo_MT_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bodo_MT_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Bodo_MT_Hi_36_00"); //Ich habe dich schon erwartet. An mir kommst du nicht vorbei, das schwöre ich.

	AI_UnequipArmor	(self);

	CreateInvItems	(self, ItAr_Raven_Addon, 1);

	AI_EquipArmor	(self, ItAr_Raven_Addon);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);

	if (!Npc_KnowsInfo(hero, Info_Mod_Alissandro_Hagen))
	{
		B_LogEntry	(TOPIC_MOD_AL_FLUCHT, "Im Minental hat mich Bodo angegriffen.");
	};
};