INSTANCE Info_Mod_FakeHero_Hi (C_INFO)
{
	npc		= Fake_Hero;
	nr		= 1;
	condition	= Info_Mod_FakeHero_Hi_Condition;
	information	= Info_Mod_FakeHero_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_FakeHero_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_FakeHero_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	B_Say (self, hero, "$WHOAREYOU");
	AI_Output(hero, self, "Info_Mod_FakeHero_Hi_15_02"); //Was soll das?
	AI_Output(self, hero, "Info_Mod_FakaHero_Hi_15_02"); //Was soll das?
	AI_Output(hero, self, "Info_Mod_FakeHero_Hi_15_03"); //Das reicht, jetzt bist du dran!
	AI_Output(self, hero, "Info_Mod_FakeHero_Hi_15_03"); //Das reicht, jetzt bist du dran!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};