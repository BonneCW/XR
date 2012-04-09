INSTANCE Info_Mod_Nyras_Hi (C_INFO)
{
	npc		= Mod_7770_PSINOV_Nyras_OGY;
	nr		= 1;
	condition	= Info_Mod_Nyras_Hi_Condition;
	information	= Info_Mod_Nyras_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Nyras_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nyras_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Nyras_Hi_02_00"); //Da bist du ja, Frevler!
	AI_Output(hero, self, "Info_Mod_Nyras_Hi_15_01"); //Nyras?! Was machst du hier?
	AI_Output(self, hero, "Info_Mod_Nyras_Hi_02_02"); //Die nötigen Schritte Vorbereiten, um in nicht allzu ferner Zeit die Rückkehr meines Meisters zu begrüßen ... und all die abgefallenen Verräter ihrer gerechten Strafe zuzuführen.
	AI_Output(hero, self, "Info_Mod_Nyras_Hi_15_03"); //Seit der Sache mit dem Fokus scheinst sich dein Kopf ja nicht allzu gut erholt zu haben ...
	AI_Output(self, hero, "Info_Mod_Nyras_Hi_02_04"); //Spotte nur, du Narr! Ich bin beseelt von der Macht des Schläfers ... und es gibt noch viele andere, die ihm treu ergeben sind.
	AI_Output(self, hero, "Info_Mod_Nyras_Hi_02_05"); //Jaaa, schon bald wird unser Meister über die Erde herrschen, wie es ihm zusteht ... und ich werde an seiner Seite sein.
	AI_Output(self, hero, "Info_Mod_Nyras_Hi_02_06"); //Das wirst du allerdings nicht mehr erleben ... Stirb, ungläubiger Narr!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};