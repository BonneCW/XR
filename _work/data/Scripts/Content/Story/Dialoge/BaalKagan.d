INSTANCE Info_Mod_Kagan_Hi (C_INFO)
{
	npc		= Mod_1117_PSINOV_BaalKagan_MT;
	nr		= 1;
	condition	= Info_Mod_Kagan_Hi_Condition;
	information	= Info_Mod_Kagan_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und, vertreibst du immer noch Sumpfkraut im Lager?";
};

FUNC INT Info_Mod_Kagan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kagan_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Kagan_Hi_15_00"); //Und, vertreibst du immer noch Sumpfkraut im Lager?
	AI_Output(self, hero, "Info_Mod_Kagan_Hi_13_01"); //Ach, die Zeiten für den Sumpfkrauthandel im Neuen Lager sind schlecht, seitdem es Lee mit seinen neuen Regeln gelungen ist den Sumpfkrautkonsum größtenteils einzudämmen.
	AI_Output(hero, self, "Info_Mod_Kagan_Hi_15_02"); //Und was machst du dann im Neuen Lager?
	AI_Output(self, hero, "Info_Mod_Kagan_Hi_13_03"); //Ich habe den Auftrag bekommen Baal Isidro ins Sumpflager zurückzubringen.
	AI_Output(hero, self, "Info_Mod_Kagan_Hi_15_04"); //Warum erfüllst du nicht einfach deinen Auftrag?
	AI_Output(self, hero, "Info_Mod_Kagan_Hi_13_05"); //Und wie? Er sitzt doch in der Kneipe. Und da dürfen mittlerweile nur noch Söldner und Schürfer hinein.
	AI_Output(hero, self, "Info_Mod_Kagan_Hi_15_06"); //Irgendwann muss er ja auch rauskommen. Spätestens, wenn ihm sein Gold ausgeht und er keinen Schnaps mehr bekommt.
	AI_Output(self, hero, "Info_Mod_Kagan_Hi_13_07"); //Ach ja? Irgendjemand hat ihm kurze Zeit bevor die Barriere fiel einen Haufen Erz für sein Sumpfkraut gegeben. Und nach dem Fall der Barriere ist der Wert des Erzes wegen des nun offenen Handels um das 50fache angestiegen.
	AI_Output(self, hero, "Info_Mod_Kagan_Hi_13_08"); //Es kann noch Monate, oder Jahre dauern, bis ihm das Erz ausgeht und er die Kneipe verlassen muss. Und bis dahin muss ich bleiben und warten, da ich mich ohne Isidro nicht im Lager blicken lassen kann.

	Info_ClearChoices	(Info_Mod_Kagan_Hi);

	Info_AddChoice	(Info_Mod_Kagan_Hi, "Interessiert mich nicht.", Info_Mod_Kagan_Hi_B);
	Info_AddChoice	(Info_Mod_Kagan_Hi, "Vielleicht kann ich dir ja helfen ...", Info_Mod_Kagan_Hi_A);
};

FUNC VOID Info_Mod_Kagan_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Kagan_Hi_B_15_00"); //Interessiert mich nicht.
	
	Info_ClearChoices	(Info_Mod_Kagan_Hi);
};

FUNC VOID Info_Mod_Kagan_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Kagan_Hi_A_15_00"); //Vielleicht kann ich dir ja helfen ...
	AI_Output(self, hero, "Info_Mod_Kagan_Hi_A_13_01"); //(erfreut) Wirklich?

	Mod_SLD_Kagan = 1;
	
	Info_ClearChoices	(Info_Mod_Kagan_Hi);

	Info_AddChoice	(Info_Mod_Kagan_Hi, "Klar, aber ich will etwas dafür haben.", Info_Mod_Kagan_Hi_D);
	Info_AddChoice	(Info_Mod_Kagan_Hi, "Klar, ich bekomme ihn schon irgendwie aus der Kneipe.", Info_Mod_Kagan_Hi_C);
};

FUNC VOID Info_Mod_Kagan_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Kagan_Hi_D_15_00"); //Klar, aber ich will etwas dafür haben.
	AI_Output(self, hero, "Info_Mod_Kagan_Hi_D_13_01"); //Ich gebe dir alles Sumpfkraut, dass ich noch bei mir habe, wenn du ihn aus der Kneipe holst.
	
	Info_ClearChoices	(Info_Mod_Kagan_Hi);
};

FUNC VOID Info_Mod_Kagan_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Kagan_Hi_C_15_00"); //Klar, ich bekomme ihn schon irgendwie aus der Kneipe.
	
	Info_ClearChoices	(Info_Mod_Kagan_Hi);
};

INSTANCE Info_Mod_Kagan_Isidro (C_INFO)
{
	npc		= Mod_1117_PSINOV_BaalKagan_MT;
	nr		= 1;
	condition	= Info_Mod_Kagan_Isidro_Condition;
	information	= Info_Mod_Kagan_Isidro_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kagan_Isidro_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Isidro_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kagan_Isidro_Info()
{
	AI_Output(self, hero, "Info_Mod_Kagan_Isidro_13_00"); //Ahh, da ist er ja endlich. (zum Helden) Hier hast du mein Sumpfkraut als Dank für deine Tat.

	B_ShowGivenThings	("16 Stängel Sumpfkraut erhalten");

	CreateInvItems	(hero, ItMi_Addon_Joint_01, 7);
	CreateInvItems	(hero, ItMi_Addon_Joint_02, 6);
	CreateInvItems	(hero, ItMi_Traumruf, 3);

	AI_TurnToNpc	(self, Mod_1118_PSINOV_BaalIsidro_MT);

	AI_Output(self, hero, "Info_Mod_Kagan_Isidro_13_01"); //(zu Isidro bissig) So, und nun geht es zurück zu unserem Lager.

	B_GivePlayerXP	(200);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "LAGER");
	B_StartOtherRoutine	(Mod_1118_PSINOV_BaalIsidro_MT, "LAGER");
};

INSTANCE Info_Mod_Kagan_Pickpocket (C_INFO)
{
	npc		= Mod_1117_PSINOV_BaalKagan_MT;
	nr		= 1;
	condition	= Info_Mod_Kagan_Pickpocket_Condition;
	information	= Info_Mod_Kagan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Kagan_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 300);
};

FUNC VOID Info_Mod_Kagan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Kagan_Pickpocket);

	Info_AddChoice	(Info_Mod_Kagan_Pickpocket, DIALOG_BACK, Info_Mod_Kagan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Kagan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Kagan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Kagan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Kagan_Pickpocket);
};

FUNC VOID Info_Mod_Kagan_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Kagan_Pickpocket);
};

INSTANCE Info_Mod_Kagan_EXIT (C_INFO)
{
	npc		= Mod_1117_PSINOV_BaalKagan_MT;
	nr		= 1;
	condition	= Info_Mod_Kagan_EXIT_Condition;
	information	= Info_Mod_Kagan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Kagan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kagan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};