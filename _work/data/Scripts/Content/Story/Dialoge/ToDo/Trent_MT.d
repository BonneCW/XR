INSTANCE Info_Mod_Trent_MT_Hi (C_INFO)
{
	npc		= Mod_7528_RIT_Trent_MT;
	nr		= 1;
	condition	= Info_Mod_Trent_MT_Hi_Condition;
	information	= Info_Mod_Trent_MT_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na, fühlst du dich schon besser?";
};

FUNC INT Info_Mod_Trent_MT_Hi_Condition()
{
	if (Mod_KG_TrentInMT == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Trent_MT_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Trent_MT_Hi_15_00"); //Na, fühlst du dich schon besser?
	AI_Output(self, hero, "Info_Mod_Trent_MT_Hi_06_01"); //Nicht wirklich. Ich hatte bisher wenig Zeit zum Erholen.
	AI_Output(self, hero, "Info_Mod_Trent_MT_Hi_06_02"); //Hier brennt die Luft, sag ich dir. Ich hab schon drei meiner Leute verloren und wir haben kaum noch Wasser.
	AI_Output(hero, self, "Info_Mod_Trent_MT_Hi_15_03"); //Habt ihr den schon was heraus gefunden?
	AI_Output(self, hero, "Info_Mod_Trent_MT_Hi_06_04"); //Ja, jeden Mann, den ich hier verliere, opfern die Orks in ihrer Höhle. Kein besonders ermutigender Gedanke. Wir sind einfach zu wenige, besonders jetzt!
	AI_Output(hero, self, "Info_Mod_Trent_MT_Hi_15_05"); //Na gut, aber vielleicht schafft ihr es mit mir.
	AI_Output(self, hero, "Info_Mod_Trent_MT_Hi_06_06"); //Einen Versucht ist es Wert. Mehr als einen weitern Tag halten wir es hier sowieso nicht mehr durch.
	AI_Output(self, hero, "Info_Mod_Trent_MT_Hi_06_07"); //Auf dein Zeichen greifen wir sie an.

	B_LogEntry	(TOPIC_MOD_KG_RITUAL, "Die Situation bei Trent sieht nicht gut aus. Wir müssen die Orks in ihrer Opferstätte gemeinsam angreifen, und zwar bald. Ich soll das Zeichen geben, sobald ich bereit bin.");
};

INSTANCE Info_Mod_Trent_MT_Angriff (C_INFO)
{
	npc		= Mod_7528_RIT_Trent_MT;
	nr		= 1;
	condition	= Info_Mod_Trent_MT_Angriff_Condition;
	information	= Info_Mod_Trent_MT_Angriff_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lasst uns angreifen!";
};

FUNC INT Info_Mod_Trent_MT_Angriff_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Trent_MT_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Trent_MT_Angriff_Info()
{
	AI_Output(hero, self, "Info_Mod_Trent_MT_Angriff_15_00"); //Lasst uns angreifen!
	AI_Output(self, hero, "DEFAULT"); //

	B_LogEntry	(TOPIC_MOD_KG_RITUAL, "Es geht los!");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDETOORKS");
	B_StartOtherRoutine	(Mod_7635_MIL_Miliz_MT, "GUIDETOORKS");
	B_StartOtherRoutine	(Mod_7636_MIL_Miliz_MT, "GUIDETOORKS");

	self.aivar[AIV_Partymember] = TRUE;
	Mod_7635_MIL_Miliz_MT.aivar[AIV_Partymember] = TRUE;
	Mod_7636_MIL_Miliz_MT.aivar[AIV_Partymember] = TRUE;
};

INSTANCE Info_Mod_Trent_MT_EXIT (C_INFO)
{
	npc		= Mod_7528_RIT_Trent_MT;
	nr		= 1;
	condition	= Info_Mod_Trent_MT_EXIT_Condition;
	information	= Info_Mod_Trent_MT_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Trent_MT_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Trent_MT_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};