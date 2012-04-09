INSTANCE Info_Mod_Khorgor_Hi (C_INFO)
{
	npc		= Mod_7554_OUT_Khorgor_DT;
	nr		= 1;
	condition	= Info_Mod_Khorgor_Hi_Condition;
	information	= Info_Mod_Khorgor_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Khorgor_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Khorgor_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Khorgor_Hi_04_00"); //Tritt näher, Krieger. Ich habe dich erwartet.
	AI_Output(self, hero, "Info_Mod_Khorgor_Hi_04_01"); //Du bist weit gekommen. Aber hier endet dein Weg.
	AI_Output(hero, self, "Info_Mod_Khorgor_Hi_15_02"); //Das sehe ich anders. Mein Weg endet, wenn du vor mir im Staub liegst.
	AI_Output(self, hero, "Info_Mod_Khorgor_Hi_04_03"); //Was hast du gegen mich?
	AI_Output(hero, self, "Info_Mod_Khorgor_Hi_15_04"); //Du verfolgst die Waldleute und die Wassermagier. Weshalb?
	AI_Output(self, hero, "Info_Mod_Khorgor_Hi_04_05"); //Sie sind im Weg! Sie behindern meine Vorhaben.
	AI_Output(hero, self, "Info_Mod_Khorgor_Hi_15_06"); //Welche Vorhaben?
	AI_Output(self, hero, "Info_Mod_Khorgor_Hi_04_07"); //Ich will das Chaos schaffen und es beherrschen.
	AI_Output(hero, self, "Info_Mod_Khorgor_Hi_15_08"); //Armer Irrer. Du hast das Chaos bestenfalls im Kopf.
	AI_Output(self, hero, "Info_Mod_Khorgor_Hi_04_09"); //Wie sprichst du von mir, du Wurm?
	AI_Output(hero, self, "Info_Mod_Khorgor_Hi_15_10"); //Von wegen Wurm. Ich bin bald Waldläufer ersten Grades. Und du?
	AI_Output(self, hero, "Info_Mod_Khorgor_Hi_04_11"); //Ich bin dein Tod. Dein schneller Tod.
	AI_Output(hero, self, "Info_Mod_Khorgor_Hi_15_12"); //Komm doch, du Chaot!

	AI_StopProcessInfos	(hero);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};