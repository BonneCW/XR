INSTANCE Info_Mod_Kobold_Dieb_Hi (C_INFO)
{
	npc		= Kobold_11000_NW;
	nr		= 1;
	condition	= Info_Mod_Kobold_Dieb_Hi_Condition;
	information	= Info_Mod_Kobold_Dieb_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kobold_Dieb_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Kobold))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kobold_Dieb_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Kobold_Dieb_Hi_20_00"); //Was??!!! Du hier, Mensch???!!! Wage es nicht mir Leid zuzufügen.
	AI_Output(self, hero, "Info_Mod_Kobold_Dieb_Hi_20_01"); //Der vereinten Macht des untoten Magiers und der Drachen – deren Diener ich bin - wirst du nichts entgegenzusetzen haben.
	AI_Output(hero, self, "Info_Mod_Kobold_Dieb_Hi_15_02"); //Das hindert mich nicht, mir mein Gold wiederzuholen, diebischer Unrat.
	AI_Output(self, hero, "Info_Mod_Kobold_Dieb_Hi_20_03"); //Garstiger Mensch, das wirst du bereuen. Eines Tages werde ich mir mein Gold wiederholen.

	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Immerhin habe ich jetzt mein Gold wieder. Der Kobold indes erzählte irgendetwas von der vereinten Macht von untotem Magier und Drachen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
	AI_Teleport	(self, "TOT");
};