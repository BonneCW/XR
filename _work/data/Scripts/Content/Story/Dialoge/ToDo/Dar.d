INSTANCE Info_Mod_Dar_Miguel (C_INFO)
{
	npc		= Mod_782_SLD_Dar_MT;
	nr		= 1;
	condition	= Info_Mod_Dar_Miguel_Condition;
	information	= Info_Mod_Dar_Miguel_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dar_Miguel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Miguel_Aufgabe3))
	&& (Npc_HasItems(hero, ItPo_MiguelForDar) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dar_Miguel_Info()
{
	AI_Output(self, hero, "Info_Mod_Dar_Miguel_07_00"); //(unruhig) Hey, was machst du hier?! Oder bringst du mir die Ware von den Banditen?
	AI_Output(hero, self, "Info_Mod_Dar_Miguel_15_01"); //Ähhm, ja, das soll ich.
	AI_Output(self, hero, "Info_Mod_Dar_Miguel_07_02"); //Na los, dann her mit dem Trank.

	B_GiveInvItems	(hero, self, ItPo_MiguelForDar, 1);

	AI_Output(self, hero, "Info_Mod_Dar_Miguel_07_03"); //Na dann, wohl bekomms ...

	CreateInvItems	(self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);

	AI_Output(hero, self, "Info_Mod_Dar_Miguel_15_04"); //Ähh ...
	AI_Output(self, hero, "Info_Mod_Dar_Miguel_07_05"); //Buaahh, echt krasses Zeug, haut derbe rein. Mit so was will ich mich am libsten dn gaaanzn Tlg ...

	AI_StopProcessInfos	(self);

	AI_PlayAni	(self, "T_DANCE_01");

	AI_PlayAni	(self, "T_STAND_2_SLEEPGROUND");
	
	B_LogEntry	(TOPIC_MOD_BDT_FLIEGENPILZLURKERSCHLEIM, "Dar schlürft das Gebräu selbst leer? Was soll das jetzt? Gesund ist das bestimmt nicht ...");
};

INSTANCE Info_Mod_Dar_EXIT (C_INFO)
{
	npc		= Mod_782_SLD_Dar_MT;
	nr		= 1;
	condition	= Info_Mod_Dar_EXIT_Condition;
	information	= Info_Mod_Dar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Dar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};