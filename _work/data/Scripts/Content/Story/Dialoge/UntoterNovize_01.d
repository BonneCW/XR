INSTANCE Info_Mod_UntoterNovize_01_Hi (C_INFO)
{
	npc		= Mod_1995_UntoterNovize_01_NW;
	nr		= 1;
	condition	= Info_Mod_UntoterNovize_01_Hi_Condition;
	information	= Info_Mod_UntoterNovize_01_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_UntoterNovize_01_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_UntoterNovize_01_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_UntoterNovize_01_Hi_13_00"); //Du kommst zu spät! Innos' Garde wandelt wieder unter den Lebenden!
	AI_Output(hero, self, "Info_Mod_UntoterNovize_01_Hi_15_01"); //Was meinst du damit, du dreckige Ausgeburt der Hölle?
	AI_Output(self, hero, "Info_Mod_UntoterNovize_01_Hi_13_02"); //Das Amulett ist zerbrochen, und die Gardisten sind frei, um Beliar zu vernichten. (lacht) Du wirst nichts machen können! Und nun stirb!

	B_LogEntry	(TOPIC_MOD_BEL_SUCHE, "Die Novizen sind untot! Sie haben ein Ritual abgehalten, als ich gekommen bin. Einer sagte mir, dass sie Innos' Garde befreit haben. Wer das wohl sein mag? Das Amulett ist jedenfalls zerbrochen. Ich sollte es zu Myxir bringen.");

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);

	Mod_1995_UntoterNovize_01_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1995_UntoterNovize_01_NW, GIL_STRF);

	Mod_1996_UntoterNovize_02_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1996_UntoterNovize_02_NW, GIL_STRF);

	Mod_1997_UntoterNovize_03_NW.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_1997_UntoterNovize_03_NW, GIL_STRF);
};