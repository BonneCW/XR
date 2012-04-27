// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE Info_Mod_KDF_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= Info_Mod_KDF_13_EXIT_Condition;
	information	= Info_Mod_KDF_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Mod_KDF_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID Info_Mod_KDF_13_EXIT_Info()
{	
	AI_Output(self, hero, "Info_Mod_KDF_13_EXIT_13_00"); //Magie zu ehren!
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE Info_Mod_KDF_13_Trank(C_INFO)
{
	nr			= 3;
	condition	= Info_Mod_KDF_13_Trank_Condition;
	information	= Info_Mod_KDF_13_Trank_Info;
	permanent	= TRUE;
	description = "Hier hast du einen Trank.";
};                       

FUNC INT Info_Mod_KDF_13_Trank_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tojan_Hi))
	&& (Npc_HasItems(hero, ItPo_Mana_02) > 0)
	&& (self.aivar[AIV_TrankBekommen] == FALSE)
	&& (Mod_FM_TrankCounter_Mana < 9)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_KDF_13_Trank_Info()
{	
	AI_Output (hero, self, "Info_Mod_KDF_13_Trank_15_00"); //Hier hast du einen Trank.

	B_GiveInvItems	(hero, self, ItPo_Mana_02, 1);
	AI_UseItem	(self, ItPo_Mana_02);

	Mod_FM_TrankCounter_Mana += 1;

	AI_Output (self, hero, "Info_Mod_KDF_13_Trank_13_01"); //Danke.

	self.aivar[AIV_TrankBekommen] = TRUE;
};

INSTANCE Info_Mod_KDF_13_Fake(C_INFO)
{
	nr			= 4;
	condition	= Info_Mod_KDF_13_Fake_Condition;
	information	= Info_Mod_KDF_13_Fake_Info;
	permanent	= 0;
	description = "Hast du gesehen wohin der Magier vom Podest verschwunden ist?";
};                       

FUNC INT Info_Mod_KDF_13_Fake_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tojan_Trank))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_KDF_13_Fake_Info()
{	
	AI_Output (hero, self, "Info_Mod_KDF_13_Fake_15_00"); //Hast du gesehen wohin der Magier vom Podest verschwunden ist?
	AI_Output (self, hero, "Info_Mod_KDF_13_Fake_13_01"); //Ja, ich glaube er ist zu den Alchemielaboren gelaufen.

	B_LogEntry	(TOPIC_MOD_FM_SM, "Es scheint als wäre der Spion in die Alchemielabors geflohen.");
};

INSTANCE Info_Mod_KDF_13_TrankLeer(C_INFO)
{
	nr			= 5;
	condition	= Info_Mod_KDF_13_TrankLeer_Condition;
	information	= Info_Mod_KDF_13_TrankLeer_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_KDF_13_TrankLeer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tojan_Hi))
	&& (self.aivar[AIV_TrankBekommen] == FALSE)
	&& (Mod_FM_TrankCounter_Mana == 9)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_KDF_13_TrankLeer_Info()
{	
	AI_Output(self, hero, "Info_Mod_KDF_13_TrankLeer_13_00"); //Hast du auch einen Trank für mich?
	AI_Output(hero, self, "Info_Mod_KDF_13_TrankLeer_15_01"); //Ähm ... Nein. Da stimmt irgendetwas nicht.

	B_StartOtherRoutine	(Mod_1768_KDF_Magier_PAT, "FLUCHT");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_KDF_13_MangelQuest(C_INFO)
{
	nr			= 5;
	condition	= Info_Mod_KDF_13_MangelQuest_Condition;
	information	= Info_Mod_KDF_13_MangelQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hieltest du von einem Besuch in der Kirche, um zu Innos zu beten?";
};                       

FUNC INT Info_Mod_KDF_13_MangelQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nagon_MangelQuest))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Nagon_MangelQuest2))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_KDF_13_MangelQuest_Info()
{	
	AI_Output(hero, self, "Info_Mod_KDF_13_MangelQuest_15_00"); //Was hieltest du von einem Besuch in der Kirche, um zu Innos zu beten?
	AI_Output(self, hero, "Info_Mod_KDF_13_MangelQuest_13_01"); //Ich muss hier auf der Mauer Wache halten und die Schwarzröcken die Hölle heiß machen, sollten sie zu nahe kommen.
	AI_Output(hero, self, "Info_Mod_KDF_13_MangelQuest_15_02"); //Im Moment ist aber alles ruhig.
	AI_Output(self, hero, "Info_Mod_KDF_13_MangelQuest_13_03"); //Hmm, ja, stimmt eigentlich schon ... und die letzten Angriffe liegen auch schon einige Zeit zurück.
	AI_Output(hero, self, "Info_Mod_KDF_13_MangelQuest_15_04"); //Und dein letzter Besuch in der Kirche?
	AI_Output(self, hero, "Info_Mod_KDF_13_MangelQuest_13_05"); //(eingestehend) Hmm, nun, das ist tatsächlich schon etwas her ...
	AI_Output(hero, self, "Info_Mod_KDF_13_MangelQuest_15_06"); //Und einen Mann werdet ihr hier oben auch sicher entbehren können. Außer Belagerung ist ja nichts los ...
	AI_Output(self, hero, "Info_Mod_KDF_13_MangelQuest_13_07"); //Ja, du hast vollkommen recht.
	AI_Output(self, hero, "Info_Mod_KDF_13_MangelQuest_13_08"); //Über die Belagerung habe ich allmählich meine anderen Pflichten als Diener Innos immer stärker vernachlässigt, ohne es zu merken.
	AI_Output(self, hero, "Info_Mod_KDF_13_MangelQuest_13_09"); //Ich werde mich sofort zur Kirche begeben.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "KIRCHE");

	B_GivePlayerXP	(100);

	Mod_Pat_Beter += 1;

	if (Mod_Pat_Beter == 3)
	{
		B_LogEntry	(TOPIC_MOD_FM_MANGEL, "So, ich denke ich haben genügend Jünger Innos’ zum Gebet bewegen können und sollte in der Kirche bei Nagon vorbeischauen.");
	};
};

INSTANCE Info_Mod_KDF_13_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_KDF_13_Pickpocket_Condition;
	information	= Info_Mod_KDF_13_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_KDF_13_Pickpocket_Condition()
{
	C_Beklauen	(160, ItMi_Gold, 2000);
};

FUNC VOID Info_Mod_KDF_13_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_KDF_13_Pickpocket);

	Info_AddChoice	(Info_Mod_KDF_13_Pickpocket, DIALOG_BACK, Info_Mod_KDF_13_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_KDF_13_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_KDF_13_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_KDF_13_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_KDF_13_Pickpocket);
};

FUNC VOID Info_Mod_KDF_13_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_KDF_13_Pickpocket);
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_KDF_13 (var c_NPC slf)
{
	Info_Mod_KDF_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mod_KDF_13_Trank.npc	= Hlp_GetInstanceID(slf);
	Info_Mod_KDF_13_Fake.npc	= Hlp_GetInstanceID(slf);
	Info_Mod_KDF_13_TrankLeer.npc	= Hlp_GetInstanceID(slf);
	Info_Mod_KDF_13_MangelQuest.npc	= Hlp_GetInstanceID(slf);
	Info_Mod_KDF_13_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
