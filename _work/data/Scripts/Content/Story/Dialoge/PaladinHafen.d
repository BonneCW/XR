INSTANCE Info_Mod_PaladinHafen_Hi (C_INFO)
{
	npc		= Mod_1257_PAL_Ritter_NW;
	nr		= 1;
	condition	= Info_Mod_PaladinHafen_Hi_Condition;
	information	= Info_Mod_PaladinHafen_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_PaladinHafen_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Steinmonster))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_PaladinHafen_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_PaladinHafen_Hi_04_00"); //Hey, du? Hast du zufällig was zu rauchen? Ich hatte schon ewig nichts mehr und die ständige Warterei hier im Hafen macht mich langsam mürbe!
};

INSTANCE Info_Mod_PaladinHafen_Trent (C_INFO)
{
	npc		= Mod_1257_PAL_Ritter_NW;
	nr		= 1;
	condition	= Info_Mod_PaladinHafen_Trent_Condition;
	information	= Info_Mod_PaladinHafen_Trent_Info;
	permanent	= 0;
	important	= 0;
	description	= "Klar, kein Problem. Du müsstest mir nur sagen, wo ich einen Paladin namens Trent finde.";
};

FUNC INT Info_Mod_PaladinHafen_Trent_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_PaladinHafen_Hi))
	&& (Npc_HasItems(hero, ItMi_Joint) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_PaladinHafen_Trent_Info()
{
	AI_Output(hero, self, "Info_Mod_PaladinHafen_Trent_15_00"); //Klar, kein Problem. Du müsstest mir nur sagen, wo ich einen Paladin namens Trent finde.
	AI_Output(self, hero, "Info_Mod_PaladinHafen_Trent_04_01"); //Trent?! (Pause) Nein, tut mir leid, ich hab den Namen noch nie gehört.
	AI_Output(self, hero, "Info_Mod_PaladinHafen_Trent_04_02"); //Mhm ... merkwürdig, ich kenne eigentlich jeden Paladin auf Khorinis. Meinst du vielleicht den neuen Paladin von den Südlichen Inseln?
	AI_Output(hero, self, "Info_Mod_PaladinHafen_Trent_15_03"); //Ja, ich nehme an, dass er das ist.
	AI_Output(self, hero, "Info_Mod_PaladinHafen_Trent_04_04"); //Gut, dann weiß ich zumindest, wo er ist.
	AI_Output(hero, self, "Info_Mod_PaladinHafen_Trent_15_05"); //Ok ... und wo ist er?
	AI_Output(self, hero, "Info_Mod_PaladinHafen_Trent_04_06"); //Er ist ins Meer gesprungen.
	AI_Output(hero, self, "Info_Mod_PaladinHafen_Trent_15_07"); //Was?!
	AI_Output(self, hero, "Info_Mod_PaladinHafen_Trent_04_08"); //Ja, er hat einen von uns gefragt, wo es hier noch unerkundete Orte gibt.
	AI_Output(self, hero, "Info_Mod_PaladinHafen_Trent_04_09"); //Der Ritter hat daraufhin auf die Insel dort vorne gezeigt. Das hättest du mal sehen sollen, ich hab nicht einmal gezwinkert und schon ist der in die Bucht gesprungen.
	AI_Output(hero, self, "Info_Mod_PaladinHafen_Trent_15_10"); //Also ist er noch auf der Insel?
	AI_Output(self, hero, "Info_Mod_PaladinHafen_Trent_04_11"); //Ich nehme es an.
	AI_Output(hero, self, "Info_Mod_PaladinHafen_Trent_15_12"); //Danke! Das war alles was ich wissen wollte.

	B_GiveInvItems	(hero, self, ItMi_Joint, 1);

	B_LogEntry	(TOPIC_MOD_KG_STEINMONSTER, "Trent scheint auf der kleinen Insel vor Khorinis zu sein. Wenn ich Glück habe, dann finde ich ihn dort noch.");

	Wld_InsertNpc	(Mod_7629_RIT_Trent_NW, "WAYTOPORT_07");

	Wld_InsertNpc	(Shadowbeast_Trent, "WAYTOPORT_09");
};