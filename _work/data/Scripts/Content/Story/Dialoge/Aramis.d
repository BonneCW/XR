INSTANCE Info_Mod_Aramis_Hi (C_INFO)
{
	npc		= Mod_7291_PAL_Aramis_NW;
	nr		= 1;
	condition	= Info_Mod_Aramis_Hi_Condition;
	information	= Info_Mod_Aramis_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aramis_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Athos_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aramis_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Aramis_Hi_03_00"); //Und die Gräber unserer Brüder hat er auch bereits geschändet.

	AI_StopProcessInfos	(self);
};