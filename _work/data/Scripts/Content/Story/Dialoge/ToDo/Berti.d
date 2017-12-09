INSTANCE Info_Mod_Berti_Hi (C_INFO)
{
	npc		= Mod_7590_OUT_Berti_REL;
	nr		= 1;
	condition	= Info_Mod_Berti_Hi_Condition;
	information	= Info_Mod_Berti_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie gefällt dir das Stück?";
};

FUNC INT Info_Mod_Berti_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Berti_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Berti_Hi_15_00"); //Wie gefällt dir das Stück?
	AI_Output(self, hero, "Info_Mod_Berti_Hi_06_01"); //Sauber geschrieben vielleicht - aber inhaltlich ist das doch Kokolores.
	AI_Output(self, hero, "Info_Mod_Berti_Hi_06_02"); //Der gute Will geht mit den Zuschauern um, als wären sie unmündige kleine Kinder. Diese unverhohlenen Moralbelehrungen!
	AI_Output(self, hero, "Info_Mod_Berti_Hi_06_03"); //Er verkennt nun mal, dass das heutige Theater anderen Ansprüchen gerecht werden muss.
	AI_Output(self, hero, "Info_Mod_Berti_Hi_06_04"); //Ich will keine Lehrmeinungen vorgesetzt bekommen, ich will selbst reflektieren und analysieren!
	AI_Output(self, hero, "Info_Mod_Berti_Hi_06_05"); //Und nun brüstet er sich mit seinen Neuerungen, winzige Änderungen im Vergleich zu dem, was mir vorschwebt.
	AI_Output(self, hero, "Info_Mod_Berti_Hi_06_06"); //Seine Zeit ist vorbei, und meine wird kommen.
};

INSTANCE Info_Mod_Berti_EXIT (C_INFO)
{
	npc		= Mod_7590_OUT_Berti_REL;
	nr		= 1;
	condition	= Info_Mod_Berti_EXIT_Condition;
	information	= Info_Mod_Berti_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Berti_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Berti_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};