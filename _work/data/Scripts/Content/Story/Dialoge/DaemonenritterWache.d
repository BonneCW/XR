INSTANCE Info_Mod_DaemonenritterWache_Hi (C_INFO)
{
	npc		= Mod_7066_DMR_Daemonenritter_MT;
	nr		= 1;
	condition	= Info_Mod_DaemonenritterWache_Hi_Condition;
	information	= Info_Mod_DaemonenritterWache_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_DaemonenritterWache_Hi_Condition()
{
	var C_Item CurrentArmor;
	CurrentArmor = Npc_GetEquippedArmor(hero);

	if (Hlp_IsItem(CurrentArmor, ItAr_Raven_Addon))
	{
		return 1;
	}
	else
	{
		B_Attack	(self, hero, AR_Kill, 0);
	};
};

FUNC VOID Info_Mod_DaemonenritterWache_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_DaemonenritterWache_Hi_12_00"); //Halt! Was willst du von Gomez?
	AI_Output(hero, self, "Info_Mod_DaemonenritterWache_Hi_15_01"); //Ich habe eine wichtige Nachricht für ihn.
	AI_Output(self, hero, "Info_Mod_DaemonenritterWache_Hi_12_02"); //Eine Nachricht kann nicht so wichtig sein, als das ich sie mir nicht anhören kann, um zu entscheiden, wie wichtig sie ist.
	AI_Output(hero, self, "Info_Mod_DaemonenritterWache_Hi_15_03"); //Die Nachricht ist nur für Gomez persönlich bestimmt.
	AI_Output(self, hero, "Info_Mod_DaemonenritterWache_Hi_12_04"); //Das kann jeder sagen. Wer bist du überhaupt?
	AI_Output(hero, self, "Info_Mod_DaemonenritterWache_Hi_15_05"); //Ich bin ...

	Wld_InsertNpc	(Mod_7067_DMR_Gomez_MT, "OCC_BARONS_RIGHT_ROOM_TO_GREATHALL");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_DaemonenritterWache_Ok (C_INFO)
{
	npc		= Mod_7066_DMR_Daemonenritter_MT;
	nr		= 1;
	condition	= Info_Mod_DaemonenritterWache_Ok_Condition;
	information	= Info_Mod_DaemonenritterWache_Ok_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_DaemonenritterWache_Ok_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_MT_Hi))
	&& (!Npc_IsInState(Mod_7067_DMR_Gomez_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_DaemonenritterWache_Ok_Info()
{
	AI_TurnToNpc	(self, Mod_7067_DMR_Gomez_MT);

	AI_Output(self, hero, "Info_Mod_DaemonenritterWache_Ok_12_00"); //Ja, Herr.

	AI_StopProcessInfos	(self);
};