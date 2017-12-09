INSTANCE Info_Mod_Porthos_Hi (C_INFO)
{
	npc		= Mod_7292_PAL_Porthos_NW;
	nr		= 1;
	condition	= Info_Mod_Porthos_Hi_Condition;
	information	= Info_Mod_Porthos_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Porthos_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aramis_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Porthos_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Porthos_Hi_03_00"); //Vermutlich hat er sich jetzt zur anderen Grabeshöhle zwischen schwarzem Troll und Steinkreis begeben.
	AI_Output(self, hero, "Info_Mod_Porthos_Hi_03_01"); //Schnell, lasst uns die Teleportzauber der Feuermagier anwenden.

	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Die drei Paladine, die versuchen einen untoten Magier zu stellen, sind nun zu einer Grabeshöhle zwischen Steinkreis und schwarzem Troll aufgebrochen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "LICH");
	B_StartOtherRoutine	(Mod_7290_PAL_Athos_NW, "LICH");
	B_StartOtherRoutine	(Mod_7291_PAL_Aramis_NW, "LICH");

	AI_Teleport	(self, "NW_TROLLAREA_TROLLROCKCAVE_02");
	AI_Teleport	(Mod_7290_PAL_Athos_NW, "NW_TROLLAREA_TROLLROCKCAVE_02");
	AI_Teleport	(Mod_7291_PAL_Aramis_NW, "NW_TROLLAREA_TROLLROCKCAVE_02");

	Wld_SendTrigger	("LICHDUNGEON");
};