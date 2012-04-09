INSTANCE Info_Mod_RitterVorStadt_Lich_Hi (C_INFO)
{
	npc		= Mod_1243_RIT_Ritter_NW;
	nr		= 1;
	condition	= Info_Mod_RitterVorStadt_Lich_Hi_Condition;
	information	= Info_Mod_RitterVorStadt_Lich_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_RitterVorStadt_Lich_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Drachen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_RitterVorStadt_Lich_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_RitterVorStadt_Lich_Hi_12_00"); //Du läufst besser nicht hier draußen rum.
	AI_Output(self, hero, "Info_Mod_RitterVorStadt_Lich_Hi_12_01"); //Ein finsterer Magier treibt sein Unwesen, entführt Menschen, schändet Gräber und erweckt Leichnahme zu Untotendasein.
	AI_Output(self, hero, "Info_Mod_RitterVorStadt_Lich_Hi_12_02"); //Drei unserer Brüder sind zur Grabesstätte der Paladine bei Orlan aufgebrochen, um ihn dort zu stellen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_1243_RIT_Ritter_NW, "START");
	B_StartOtherRoutine	(Mod_1244_RIT_Ritter_NW, "START");
	B_StartOtherRoutine	(Mod_1245_RIT_Ritter_NW, "START");
	B_StartOtherRoutine	(Mod_1246_RIT_Ritter_NW, "START");
	B_StartOtherRoutine	(Mod_1247_RIT_Ritter_NW, "START");
};