INSTANCE Info_Mod_Raven_MT_Hi (C_INFO)
{
	npc		= Mod_7068_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_MT_Hi_Condition;
	information	= Info_Mod_Raven_MT_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Raven_MT_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_Gomez))
	&& (!Npc_IsInState(Mod_680_DMB_Xardas_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_MT_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Raven_MT_Hi_10_00"); //Das stimmt. Lasst ihn am Leben. Ich werde den Truppen auch sofort befehlen euer Lager zu verlassen.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Raven_MT_Oric (C_INFO)
{
	npc		= Mod_7068_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_MT_Oric_Condition;
	information	= Info_Mod_Raven_MT_Oric_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Raven_MT_Oric_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oric_Gomez))
	&& (!Npc_IsInState(Mod_7039_PAL_Oric_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_MT_Oric_Info()
{
	AI_TurnToNpc	(self, Mod_7039_PAL_Oric_MT);

	AI_Output(self, hero, "Info_Mod_Raven_MT_Oric_10_00"); //Halt's Maul

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_7039_PAL_Oric_MT, "DRAINED");
};

INSTANCE Info_Mod_Raven_MT_GomezNervt (C_INFO)
{
	npc		= Mod_7068_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_MT_GomezNervt_Condition;
	information	= Info_Mod_Raven_MT_GomezNervt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Raven_MT_GomezNervt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_MT_Raven))
	&& (!Npc_IsInState(Mod_7067_DMR_Gomez_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_MT_GomezNervt_Info()
{
	AI_TurnToNpc	(self, Mod_7067_DMR_Gomez_MT);

	AI_Output(self, hero, "Info_Mod_Raven_MT_GomezNervt_10_00"); //Ohne mich hätte dich hätte dich dieses Snapperrudel am Ausgang des Minentals doch zerfleischt und jetzt arbeitest du für mich.

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Raven_MT_GomezNervt_10_01"); //Als Entschädigung überreiche ich dir das Schwert namens Innos Zorn, das Gomez zu Zeiten des alten Lagers benutzte.
	AI_Output(self, hero, "Info_Mod_Raven_MT_GomezNervt_10_02"); //Möge es in deinen Händen ein Zeichen für die strahlende Zukunft des Alten Lagers sein.

	B_GiveInvItems	(self, hero, ItMw_1H_Blessed_03, 1);

	AI_StopProcessInfos	(self);
};