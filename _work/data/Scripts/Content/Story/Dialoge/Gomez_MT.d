INSTANCE Info_Mod_Gomez_MT_Hi (C_INFO)
{
	npc		= Mod_7067_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_MT_Hi_Condition;
	information	= Info_Mod_Gomez_MT_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_MT_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_DaemonenritterWache_Hi))
	&& (!Npc_IsInState(Mod_7066_DMR_Daemonenritter_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_MT_Hi_Info()
{
	AI_TurnToNpc	(self, Mod_7066_DMR_Daemonenritter_MT);

	AI_Output(self, hero, "Info_Mod_Gomez_MT_Hi_10_00"); //Jemand, den ich mir anhören möchte, und jetzt halt deinen Mund, wenn ich dir nicht die Zunge rausschneiden soll.
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Gomez_MT_WasWillstDu (C_INFO)
{
	npc		= Mod_7067_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_MT_WasWillstDu_Condition;
	information	= Info_Mod_Gomez_MT_WasWillstDu_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_MT_WasWillstDu_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_DaemonenritterWache_Hi))
	&& (!Npc_IsInState(Mod_7066_DMR_Daemonenritter_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_MT_WasWillstDu_Info()
{
	AI_Output(self, hero, "Info_Mod_Gomez_MT_WasWillstDu_10_00"); //Also junger Krieger, sag, was du zu sagen hast und mögen dir die Götter gnädig sein, wenn es nicht wirklich wichtig ist.
};

INSTANCE Info_Mod_Gomez_MT_WasWillstDu_A (C_INFO)
{
	npc		= Mod_7067_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_MT_WasWillstDu_A_Condition;
	information	= Info_Mod_Gomez_MT_WasWillstDu_A_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Wachposten außerhalb des Lagers werden angegriffen.";
};

FUNC INT Info_Mod_Gomez_MT_WasWillstDu_A_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_MT_WasWillstDu))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Gomez_MT_WasWillstDu_B))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_MT_WasWillstDu_A_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_MT_WasWillstDu_A_15_00"); //Die Wachposten außerhalb des Lagers werden angegriffen. Wir brauchen dich persönlich.
	AI_Output(self, hero, "Info_Mod_Gomez_MT_WasWillstDu_A_10_01"); //wenn diese Versager nicht alleine damit fertig werden, ist es ihre Schuld ... solange im Lager niemand angreift kann mir das egal sein. Noch was?
};

INSTANCE Info_Mod_Gomez_MT_WasWillstDu_B (C_INFO)
{
	npc		= Mod_7067_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_MT_WasWillstDu_B_Condition;
	information	= Info_Mod_Gomez_MT_WasWillstDu_B_Info;
	permanent	= 0;
	important	= 0;
	description	= "Auf einem der Hochsitze außerhalb des Lagers spielt einer unserer Leute verrückt und schießt auf sie.";
};

FUNC INT Info_Mod_Gomez_MT_WasWillstDu_B_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_MT_WasWillstDu))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_MT_WasWillstDu_B_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_MT_WasWillstDu_B_15_00"); //Auf einem der Hochsitze außerhalb des Lagers spielt einer unserer Leute verrückt und schießt auf sie. Er ist zu stark für uns, wir brauchen dich persönlich.
	AI_Output(self, hero, "Info_Mod_Gomez_MT_WasWillstDu_B_10_01"); //Ein Verräter? Das macht mir Sorgen. Ich denke, ich sollte mich um den Kerl kümmern bevor er noch Verluste innerhalb des Lagers verursacht.

	B_LogEntry	(TOPIC_MOD_AL_LOCKVOGEL, "Gomez verlässt das Lager ... nun wüssen wir ihn erledigen!");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "OUTDOOR");

	B_StartOtherRoutine	(Mod_1874_HMG_Makanius_MT, "OUTDOOR");
	AI_Teleport	(Mod_1874_HMG_Makanius_MT, "OC1");

	B_StartOtherRoutine	(Mod_7039_PAL_Oric_MT, "OUTDOOR");
	AI_Teleport	(Mod_7039_PAL_Oric_MT, "OC1");

	B_StartOtherRoutine	(Mod_1870_EBR_Alissandro_MT, "OUTDOOR");
	AI_Teleport	(Mod_1870_EBR_Alissandro_MT, "OC1");
};

INSTANCE Info_Mod_Gomez_MT_WasWillstDu_C (C_INFO)
{
	npc		= Mod_7067_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_MT_WasWillstDu_C_Condition;
	information	= Info_Mod_Gomez_MT_WasWillstDu_C_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alissandro will verhandeln.";
};

FUNC INT Info_Mod_Gomez_MT_WasWillstDu_C_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_MT_WasWillstDu))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Gomez_MT_WasWillstDu_B))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_MT_WasWillstDu_C_Info()
{
	AI_Output(hero, self, "Info_Mod_Gomez_MT_WasWillstDu_C_15_00"); //Alissandro will verhandeln. Allerdings besteht er darauf dich persönlich und ohne bewaffnete Begleitung zu sehen.
	AI_Output(self, hero, "Info_Mod_Gomez_MT_WasWillstDu_C_10_01"); //Hält der alte Bastard mich für dumm? Das stinkt nach einer Falle. Verhandlungen werden nach meinen Bedingungen geführt.
};

INSTANCE Info_Mod_Gomez_MT_Raven (C_INFO)
{
	npc		= Mod_7067_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_MT_Raven_Condition;
	information	= Info_Mod_Gomez_MT_Raven_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gomez_MT_Raven_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_MT_Oric))
	&& (!Npc_IsInState(Mod_7068_DMR_Raven_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gomez_MT_Raven_Info()
{
	AI_TurnToNpc	(self, Mod_7068_DMR_Raven_MT);

	AI_Output(self, hero, "Info_Mod_Gomez_MT_Raven_10_00"); //Was sollte das? Ihr wollt mir das Lager wieder nehmen? Du hast mir nicht's zu befehlen, Raven.
	AI_Output(self, hero, "Info_Mod_Gomez_MT_Raven_10_01"); //Früher war ich es, der dir die Befehle gab, und nur weil du Xardas in den Arsch kriechst, hast du nicht das Recht, solche Dinge zu bestimmen.
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Gomez_MT_EXIT (C_INFO)
{
	npc		= Mod_7067_DMR_Gomez_MT;
	nr		= 1;
	condition	= Info_Mod_Gomez_MT_EXIT_Condition;
	information	= Info_Mod_Gomez_MT_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gomez_MT_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gomez_MT_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};