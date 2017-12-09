INSTANCE Info_Mod_SchwarzerKriegerElvrich_Hi (C_INFO)
{
	npc		= Mod_7403_SMK_SchwarzerKrieger_MT;
	nr		= 1;
	condition	= Info_Mod_SchwarzerKriegerElvrich_Hi_Condition;
	information	= Info_Mod_SchwarzerKriegerElvrich_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_SchwarzerKriegerElvrich_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_SchwarzerKriegerElvrich_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_SchwarzerKriegerElvrich_Hi_13_00"); //Hey, hast du hier zufällig irgendwo einen Buddler in der Nähe herumrennen sehen?
	AI_Output(hero, self, "Info_Mod_SchwarzerKriegerElvrich_Hi_15_01"); //Nicht, dass ich wüsste.
	AI_Output(self, hero, "Info_Mod_SchwarzerKriegerElvrich_Hi_13_02"); //(zu sich selbst) Verdammt, das gibt Ärger von Kurgan, wenn ich diesen Stadtlümmel nicht wieder einfange.
	AI_Output(self, hero, "Info_Mod_SchwarzerKriegerElvrich_Hi_13_03"); //Ich hätte nicht so offen vom Sumpfkraut und dem Lager schwärmen sollen.

	B_LogEntry	(TOPIC_MOD_VERMISSTE, "Ein Dämonenkrieger sucht einen entlaufenen Buddler, der aus der Stadt stammen könnte. Er klagte darüber, ihn mit zu vielen Ausschweifen über ein gewisses Lager und Sumpfkraut auf dumme Gedanken gebracht zu haben.");

	Mod_WM_ElvrichImSumpf = 2;
};

INSTANCE Info_Mod_SchwarzerKriegerElvrich_EXIT (C_INFO)
{
	npc		= Mod_7403_SMK_SchwarzerKrieger_MT;
	nr		= 1;
	condition	= Info_Mod_SchwarzerKriegerElvrich_EXIT_Condition;
	information	= Info_Mod_SchwarzerKriegerElvrich_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_SchwarzerKriegerElvrich_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_SchwarzerKriegerElvrich_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};