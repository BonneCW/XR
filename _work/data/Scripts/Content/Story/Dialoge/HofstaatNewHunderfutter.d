INSTANCE Info_Mod_HofstaatNewHundefutter_Hi (C_INFO)
{
	npc		= Mod_7335_HS_Typ_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatNewHundefutter_Hi_Condition;
	information	= Info_Mod_HofstaatNewHundefutter_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatNewHundefutter_Hi_Condition()
{
	if (Mod_SL_PartFluffy == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatNewHundefutter_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatNewHundefutter_Hi_06_00"); //Da geht er hin ... eine Zierde seiner Zunft ... Ich werde wohl niemals auch nur annähernd so kross und saftig werden wie er ...
	AI_Output(self, hero, "Info_Mod_HofstaatNewHundefutter_Hi_15_01"); //Du bist sein Nachfolger?
	AI_Output(self, hero, "Info_Mod_HofstaatNewHundefutter_Hi_06_02"); //Jaja ... aber kein besonders guter.
	AI_Output(self, hero, "Info_Mod_HofstaatNewHundefutter_Hi_15_03"); //Vielleicht kann ich dir ja helfen?
	AI_Output(self, hero, "Info_Mod_HofstaatNewHundefutter_Hi_06_04"); //Du willst mir helfen? Bist du Koch oder was?
	AI_Output(self, hero, "Info_Mod_HofstaatNewHundefutter_Hi_15_05"); //Ich hab schon das eine oder andere Vieh geschlachtet.
	AI_Output(self, hero, "Info_Mod_HofstaatNewHundefutter_Hi_06_06"); //Du bist Metzger?! Bitte hilf mir! Bitte, bitte, bitte, bitte!! Was soll ich tun?
	AI_Output(self, hero, "Info_Mod_HofstaatNewHundefutter_Hi_15_07"); //Als Erstes kompletter Freudenspender-Entzug. Das macht dein Fleisch zäh.
	AI_Output(self, hero, "Info_Mod_HofstaatNewHundefutter_Hi_06_08"); //Freudenspender ... ja, natürlich ... Fleisch locker ... klar ... Das mach ich! Vielen Dank, Herr Metzgermeister!
	AI_Output(self, hero, "Info_Mod_HofstaatNewHundefutter_Hi_15_09"); //Gern geschehen.

	Mod_SL_PartFluffy_Day = Wld_GetDay();

	AI_StopProcessInfos	(self);
};