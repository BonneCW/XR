INSTANCE Info_Mod_RitterBeiCoragon_Daemonisch (C_INFO)
{
	npc		= Mod_1251_RIT_Ritter_NW;
	nr		= 1;
	condition	= Info_Mod_RitterBeiCoragon_Daemonisch_Condition;
	information	= Info_Mod_RitterBeiCoragon_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_RitterBeiCoragon_Daemonisch_Condition()
{
	if (Mod_HQ_Daemonisch_City == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_RitterBeiCoragon_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_RitterBeiCoragon_Daemonisch_04_00"); //Verdammt, was ist geschehen. Ich kann mich nur noch an das dunkle Tal vor der Stadt erinnern ... und dann ... finstere Schatten, Dämonen ...

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};