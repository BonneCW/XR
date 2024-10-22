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

INSTANCE Info_Mod_Aramis_AtLich (C_INFO)
{
	npc		= Mod_7291_PAL_Aramis_NW;
	nr		= 1;
	condition	= Info_Mod_Aramis_AtLich_Condition;
	information	= Info_Mod_Aramis_AtLich_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aramis_AtLich_Condition()
{
	if (Npc_GetDistToWP(hero, "LICH") < 1500)
	&& (Npc_KnowsInfo(hero, Info_Mod_Porthos_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Moorhexe)) {
		return 1;
	};
};

FUNC VOID Aramis_SpawnLich() {
	B_SetNpcVisual 		(Mod_7290_PAL_Athos_NW, MALE, "Ske_Head", 0, 0, ITAR_PAL_SKEL);
	B_SetNpcVisual 		(Mod_7291_PAL_Aramis_NW, MALE, "Ske_Head", 0, 0, ITAR_PAL_SKEL);
	B_SetNpcVisual 		(Mod_7292_PAL_Porthos_NW, MALE, "Ske_Head", 0, 0, ITAR_PAL_SKEL);

	Mod_7290_PAL_Athos_NW.flags = 0;
	Mod_7291_PAL_Aramis_NW.flags = 0;
	Mod_7292_PAL_Porthos_NW.flags = 0;

	Wld_InsertNpc	(Lich_11008_NW, "NW_TROLLAREA_TROLLROCKCAVE_03");
};

FUNC VOID Info_Mod_Aramis_AtLich_Info()
{
	AI_output(self, hero, "DEFAULT"); //
	AI_Output(hero, self, "Info_Mod_Hero_LichDungeon_15_00"); //Und, habt ihr den Finsterling erwischt und erledigt?

	AI_StopProcessInfos	(self);

	AI_Function(self, Aramis_SpawnLich);
};