INSTANCE Info_Mod_Hel_Hi (C_INFO)
{
	npc		= Mod_7299_OUT_Hel_NW;
	nr		= 1;
	condition	= Info_Mod_Hel_Hi_Condition;
	information	= Info_Mod_Hel_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hel_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hel_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Hel_Hi_26_00"); //(schräg) Ahh, Eindringlinge und neue Sklaven für meine Dienerschaft. An eurem Blute werde ich mich laben.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FLUCHT");
};

INSTANCE Info_Mod_Hel_GhuleFutsch (C_INFO)
{
	npc		= Mod_7299_OUT_Hel_NW;
	nr		= 1;
	condition	= Info_Mod_Hel_GhuleFutsch_Condition;
	information	= Info_Mod_Hel_GhuleFutsch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hel_GhuleFutsch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hel_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hel_GhuleFutsch_Info()
{
	AI_Output(self, hero, "Info_Mod_Hel_GhuleFutsch_26_00"); //Ahh, seid verflucht.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "KRYPTA");
	AI_Teleport	(self, "NW_CRYPT_IN_11");
};

INSTANCE Info_Mod_Hel_InKrypta (C_INFO)
{
	npc		= Mod_7299_OUT_Hel_NW;
	nr		= 1;
	condition	= Info_Mod_Hel_InKrypta_Condition;
	information	= Info_Mod_Hel_InKrypta_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hel_InKrypta_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_Hel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hel_InKrypta_Info()
{
	AI_Output(self, hero, "Info_Mod_Hel_InKrypta_26_00"); //Hartnäckig seid ihr. Aber umso mehr Vergnügen wird es mir bereiten, mit euren Eingeweiden die Decke meiner Räumlichkeiten zu kleiden.
	AI_Output(self, hero, "Info_Mod_Hel_InKrypta_26_01"); //(auffordernd) Inubis!

	self.flags = 0;

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);

	B_SetTopicStatus	(TOPIC_MOD_NL_GORN, LOG_SUCCESS);
};