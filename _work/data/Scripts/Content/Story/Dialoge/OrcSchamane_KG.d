INSTANCE Info_Mod_OrcSchamane_KG_Hi (C_INFO)
{
	npc		= Mod_10041_Orc_Schamane_MT;
	nr		= 1;
	condition	= Info_Mod_OrcSchamane_KG_Hi_Condition;
	information	= Info_Mod_OrcSchamane_KG_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_OrcSchamane_KG_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_OrcSchamane_KG_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_OrcSchamane_KG_Hi_18_00"); //Ah ... Mensch, ihr haben es geschafft Ritualstätte zu erreichen, allerdings es euch nichts mehr nützen.
	AI_Output(self, hero, "Info_Mod_OrcSchamane_KG_Hi_18_01"); //Ich schon seien unsterblich, durch macht von schwarzem Herz gefüllt mit rotem Menschenblut.
	AI_Output(self, hero, "Info_Mod_OrcSchamane_KG_Hi_18_02"); //Nun ich dir zeigen was Macht bedeuten.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_OrcSchamane_KG_NichtTot (C_INFO)
{
	npc		= Mod_10041_Orc_Schamane_MT;
	nr		= 1;
	condition	= Info_Mod_OrcSchamane_KG_NichtTot_Condition;
	information	= Info_Mod_OrcSchamane_KG_NichtTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_OrcSchamane_KG_NichtTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_OrcSchamane_KG_Hi))
	&& (Mod_KG_OrkZauber == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_OrcSchamane_KG_NichtTot_Info()
{
	AI_Output(self, hero, "Info_Mod_OrcSchamane_KG_NichtTot_18_01"); //Was ... Mensch leben noch, das seltsam seinen. Mensch stark, Schamane bewahren Ehre und lassen Mensch ziehen.

	AI_StopProcessInfos	(self);

	AI_GotoWP	(hero, "CASTLE_30");
};

INSTANCE Info_Mod_OrcSchamane_KG_KillYou (C_INFO)
{
	npc		= Mod_10041_Orc_Schamane_MT;
	nr		= 1;
	condition	= Info_Mod_OrcSchamane_KG_KillYou_Condition;
	information	= Info_Mod_OrcSchamane_KG_KillYou_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_OrcSchamane_KG_KillYou_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Trent2))
	&& (Mod_KG_SchwarzerRing == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_OrcSchamane_KG_KillYou_Info()
{
	AI_Output(self, hero, "DEFAULT"); //
	AI_Output(hero, self, "Info_Mod_OrcSchamane_KG_KillYou_15_00"); //Deine letzte Stunde hat geschlagen.
	AI_Output(self, hero, "Info_Mod_OrcSchamane_KG_KillYou_18_01"); //Was meinen Mensch mit Stunde, sollte so etwas schlagen?
	AI_Output(hero, self, "Info_Mod_OrcSchamane_KG_KillYou_15_02"); //Ach, vergiss es, stirb!
	AI_Output(self, hero, "DEFAULT"); //

	self.guild = GIL_ORC;
	Npc_SetTrueGuild (self, GIL_ORC);

	self.flags = 0;

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_OrcSchamane_KG_EXIT (C_INFO)
{
	npc		= Mod_10041_Orc_Schamane_MT;
	nr		= 1;
	condition	= Info_Mod_OrcSchamane_KG_EXIT_Condition;
	information	= Info_Mod_OrcSchamane_KG_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_OrcSchamane_KG_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_OrcSchamane_KG_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};