INSTANCE Info_Mod_Hannes_Hi (C_INFO)
{
	npc		= Mod_7591_OUT_Hannes_REL;
	nr		= 1;
	condition	= Info_Mod_Hannes_Hi_Condition;
	information	= Info_Mod_Hannes_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hannes_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hannes_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Hannes_Hi_06_00"); //Grandios! Parfait! So etwas kann nur von einem Meister erdacht werden. Sieh Er sich's an, sieh Er sich's an!
	AI_Output(self, hero, "Info_Mod_Hannes_Hi_06_01"); //Dieser Mann spricht wahr, alles passt wie der, Verzeihung, die Faust aufs Auge!
	AI_Output(self, hero, "Info_Mod_Hannes_Hi_06_02"); //Die Einführung der contraction wird das Theaterleben auf Jahrzehnte beeinflussen, was sage ich da, eine neue Phase der Bühnendichtung einläuten.
	AI_Output(self, hero, "Info_Mod_Hannes_Hi_06_03"); //Wir wohnen gewissermaßen einem historischen Moment bei, exactement!
};

INSTANCE Info_Mod_Hannes_EXIT (C_INFO)
{
	npc		= Mod_7591_OUT_Hannes_REL;
	nr		= 1;
	condition	= Info_Mod_Hannes_EXIT_Condition;
	information	= Info_Mod_Hannes_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hannes_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hannes_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};