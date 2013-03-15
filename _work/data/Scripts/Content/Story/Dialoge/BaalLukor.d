INSTANCE Info_Mod_Lukor_Hi (C_INFO)
{
	npc		= Mod_7266_GUR_BaalLukor_OGY;
	nr		= 1;
	condition	= Info_Mod_Lukor_Hi_Condition;
	information	= Info_Mod_Lukor_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lukor_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lukor_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Lukor_Hi_31_00"); //Da ist ja der ungläubige Narr, der meinen Meister verbannt hat.
	AI_Output(hero, self, "Info_Mod_Lukor_Hi_15_01"); //Was, du lebst auch noch?
	AI_Output(self, hero, "Info_Mod_Lukor_Hi_31_02"); //(irre) Verbannt magst du ihn haben. Aber vorher wurde mir noch ein Teil seiner Macht übertragen.
	AI_Output(hero, self, "Info_Mod_Lukor_Hi_15_03"); //Was, wovon sprichst du?
	AI_Output(self, hero, "Info_Mod_Lukor_Hi_31_04"); //(durchgeknallt) Lauter ungläubige Narren, alle folgen sie fremden Götzen, Göttern oder dem schlichten Mammon. Sie alle werden büßen, mit ihrem Blute.
	AI_Output(hero, self, "Info_Mod_Lukor_Hi_15_05"); //(leise zu sich selbst) Kommt mir irgendwie bekannt vor.
	AI_Output(self, hero, "Info_Mod_Lukor_Hi_31_06"); //(wie besessen) Ich währenddessen habe meditiert, Tage und Wochen, unaufhörlich, und gelernt, Mächte freizusetzen und zu nutzen, die weit über die eines gewöhnlichen Magiers oder gar Kämpfers hinausgehen.

	Info_ClearChoices	(Info_Mod_Lukor_Hi);

	Info_AddChoice	(Info_Mod_Lukor_Hi, "Na und, der Schläfer war ja sowieso nur ein mickriger Diener eben eines Magiers.", Info_Mod_Lukor_Hi_C);
	Info_AddChoice	(Info_Mod_Lukor_Hi, "Hmm, ich glaube, meine Waffe zwischen deinen Schulterblättern (...)", Info_Mod_Lukor_Hi_B);
	Info_AddChoice	(Info_Mod_Lukor_Hi, "Ja, ja, ich lass dich dann mal weiter meditieren.", Info_Mod_Lukor_Hi_A);
};

FUNC VOID Info_Mod_Lukor_Hi_D()
{
	AI_Output(self, hero, "Info_Mod_Lukor_Hi_D_31_00"); //(ohne die Worte zu beachten) Und nun traf ich endlich auf Verbündete, Diener, die ihrem Meister und Schöpfer auch weiterhin treu ergeben sind.
	AI_Output(self, hero, "Info_Mod_Lukor_Hi_D_31_01"); //(verwirrt) Ja, mein Meister ... (überrascht feststellend) Und hier der Ungläubige, der ihn verbannte ...
	AI_Output(self, hero, "Info_Mod_Lukor_Hi_D_31_02"); //(im Wahn) Mit deinem Blute werde ich den Altar nun tränken. Stirb!
	
	Info_ClearChoices	(Info_Mod_Lukor_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

FUNC VOID Info_Mod_Lukor_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Lukor_Hi_C_15_00"); //Na und, der Schläfer war ja sowieso nur ein mickriger Diener eben eines Magiers.
	
	Info_Mod_Lukor_Hi_D();
};

FUNC VOID Info_Mod_Lukor_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Lukor_Hi_B_15_00"); //Hmm, ich glaube, meine Waffe zwischen deinen Schulterblättern könnte dich wieder schnell auf den Boden zurückholen.

	Info_Mod_Lukor_Hi_D();
};

FUNC VOID Info_Mod_Lukor_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Lukor_Hi_A_15_00"); //Ja, ja, ich lass dich dann mal weiter meditieren. Manch einer hat Jahrzehnte gebraucht, bis er die Erleuchtung fand ...

	Info_Mod_Lukor_Hi_D();
};