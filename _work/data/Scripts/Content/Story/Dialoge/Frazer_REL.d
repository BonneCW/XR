INSTANCE Info_Mod_Frazer_REL_Hi (C_INFO)
{
	npc		= Mod_7619_OUT_Frazer_REL;
	nr		= 1;
	condition	= Info_Mod_Frazer_REL_Hi_Condition;
	information	= Info_Mod_Frazer_REL_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Frazer_REL_Hi_Condition()
{
	if (Mod_REL_LukasS == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Frazer_REL_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Frazer_REL_Hi_13_00"); //Du hast mich gerettet. Brrr, kannst dir gar nicht vorstellen, was die mir alles langsam abschneiden wollten!
	AI_Output(self, hero, "Info_Mod_Frazer_REL_Hi_13_01"); //Da glaubt man immer, man sei ein guter Aufseher, guckt auch mal weg, wenn sie zu zweit was Unanständiges treiben - und das ist der Dank!
	AI_Output(self, hero, "Info_Mod_Frazer_REL_Hi_13_02"); //Na ja, um den Norman tut's mir fast Leid, der ist da sicher mit reingezogen worden. Aber der Rest soll sich zu Beliar scheren, jawohl!
	AI_Output(self, hero, "Info_Mod_Frazer_REL_Hi_13_03"); //Jetzt wird's wenigstens keinen Ärger mehr mit denen geben.
	AI_Output(self, hero, "Info_Mod_Frazer_REL_Hi_13_04"); //Also, was stehen wir hier noch rum? Ich muss dringend 'ne Runde pennen.

	B_GivePlayerXP	(300);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "INCITY2");

	B_StartOtherRoutine	(Mod_7517_OUT_Friedel_REL, "START");
	Mod_7517_OUT_Friedel_REL.aivar[AIV_Partymember] = FALSE;

	B_StartOtherRoutine	(Mod_7518_OUT_Davon_REL, "START");
	Mod_7518_OUT_Davon_REL.aivar[AIV_Partymember] = FALSE;

	B_StartOtherRoutine	(Mod_7391_OUT_Henker_REL, "START");
	Mod_7391_OUT_Henker_REL.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Frazer_REL_EXIT (C_INFO)
{
	npc		= Mod_7619_OUT_Frazer_REL;
	nr		= 1;
	condition	= Info_Mod_Frazer_REL_EXIT_Condition;
	information	= Info_Mod_Frazer_REL_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Frazer_REL_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Frazer_REL_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};