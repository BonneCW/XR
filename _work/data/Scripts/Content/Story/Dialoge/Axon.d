INSTANCE Info_Mod_Axon_Hi (C_INFO)
{
	npc		= Mod_7415_OUT_Axon_REL;
	nr		= 1;
	condition	= Info_Mod_Axon_Hi_Condition;
	information	= Info_Mod_Axon_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du hier?";
};

FUNC INT Info_Mod_Axon_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Axon_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Axon_Hi_15_00"); //Was machst du hier?
	AI_Output(self, hero, "Info_Mod_Axon_Hi_06_01"); //Hmm ... lass mich nachdenken ...
	AI_Output(hero, self, "Info_Mod_Axon_Hi_15_02"); //Ist die Frage so kompliziert?
	AI_Output(self, hero, "Info_Mod_Axon_Hi_06_03"); //Auf welche Frage willst du jetzt zuerst eine Antwort?
	AI_Output(hero, self, "Info_Mod_Axon_Hi_15_04"); //Immer schön der Reihe nach.
	AI_Output(self, hero, "Info_Mod_Axon_Hi_06_05"); //Was hattest du mich zuerst gefragt?
	AI_Output(hero, self, "Info_Mod_Axon_Hi_15_06"); //Vergiss es.
	AI_Output(self, hero, "Info_Mod_Axon_Hi_06_07"); //Das soll mal einer verstehen ...
};

INSTANCE Info_Mod_Axon_Plagenquest (C_INFO)
{
	npc		= Mod_7415_OUT_Axon_REL;
	nr		= 1;
	condition	= Info_Mod_Axon_Plagenquest_Condition;
	information	= Info_Mod_Axon_Plagenquest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist Axon, wie ich vermute?";
};

FUNC INT Info_Mod_Axon_Plagenquest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Plagenquest_04))
	|| (Npc_KnowsInfo(hero, Info_Mod_Wendel_Plagenquest_04))
	|| (Npc_KnowsInfo(hero, Info_Mod_Theodorus_Plagenquest_04))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Axon_Plagenquest_Info()
{
	AI_Output(hero, self, "Info_Mod_Axon_Plagenquest_15_00"); //Du bist Axon, wie ich vermute?
	AI_Output(self, hero, "Info_Mod_Axon_Plagenquest_06_01"); //Hey, wie hast du das so schnell erkannt?
	AI_Output(hero, self, "Info_Mod_Axon_Plagenquest_15_02"); //Nun ... die Waffe, die du am Gürtel trägst ... ich habe sie schon mal gesehen.
	AI_Output(self, hero, "Info_Mod_Axon_Plagenquest_06_03"); //Achso, ja, stimmt ... Ähhm, dann wollen wir mal los ...
	AI_Output(self, hero, "Info_Mod_Axon_Plagenquest_06_04"); //Also, mein Gespür sagt mir, dass wir in folgende Richtung müssen ... (lange Pause)
	AI_Output(hero, self, "Info_Mod_Axon_Plagenquest_15_05"); //Ja?!
	AI_Output(self, hero, "Info_Mod_Axon_Plagenquest_06_06"); //Psst, ich muss mich sammeln ... (lange Pause)
	AI_Output(hero, self, "Info_Mod_Axon_Plagenquest_15_07"); //Hmpf ...
	AI_Output(self, hero, "Info_Mod_Axon_Plagenquest_06_09"); //Psst, habe ich gesagt ... Also ich würde sagen, wir gehen nach ... links. Folge mir.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDE");

	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_114");
	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_114");
	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_114");
	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_114");
	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_114");
	Wld_InsertNpc	(Insekt_02, "REL_SURFACE_114");
	Wld_InsertNpc	(Insekt_02, "REL_SURFACE_114");
	Wld_InsertNpc	(Insekt_02, "REL_SURFACE_114");
	Wld_InsertNpc	(Insekt_02, "REL_SURFACE_114");
	Wld_InsertNpc	(Insekt_03, "REL_SURFACE_114");
	Wld_InsertNpc	(Insekt_03, "REL_SURFACE_114");
	Wld_InsertNpc	(Insekt_03, "REL_SURFACE_114");
	Wld_InsertNpc	(Insekt_03, "REL_SURFACE_114");

	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_115");
	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_115");
	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_115");
	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_115");
	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_115");
	Wld_InsertNpc	(Insekt_02, "REL_SURFACE_115");
	Wld_InsertNpc	(Insekt_02, "REL_SURFACE_115");
	Wld_InsertNpc	(Insekt_02, "REL_SURFACE_115");
	Wld_InsertNpc	(Insekt_02, "REL_SURFACE_115");
	Wld_InsertNpc	(Insekt_03, "REL_SURFACE_115");
	Wld_InsertNpc	(Insekt_03, "REL_SURFACE_115");
	Wld_InsertNpc	(Insekt_03, "REL_SURFACE_115");
	Wld_InsertNpc	(Insekt_03, "REL_SURFACE_115");

	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_116");
	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_116");
	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_116");
	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_116");
	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_116");
	Wld_InsertNpc	(Insekt_02, "REL_SURFACE_116");
	Wld_InsertNpc	(Insekt_02, "REL_SURFACE_116");
	Wld_InsertNpc	(Insekt_02, "REL_SURFACE_116");
	Wld_InsertNpc	(Insekt_02, "REL_SURFACE_116");
	Wld_InsertNpc	(Insekt_03, "REL_SURFACE_116");
	Wld_InsertNpc	(Insekt_03, "REL_SURFACE_116");
	Wld_InsertNpc	(Insekt_03, "REL_SURFACE_116");
	Wld_InsertNpc	(Insekt_03, "REL_SURFACE_116");

	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_117");
	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_117");
	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_117");
	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_117");
	Wld_InsertNpc	(Insekt_01, "REL_SURFACE_117");
	Wld_InsertNpc	(Insekt_02, "REL_SURFACE_117");
	Wld_InsertNpc	(Insekt_02, "REL_SURFACE_117");
	Wld_InsertNpc	(Insekt_02, "REL_SURFACE_117");
	Wld_InsertNpc	(Insekt_02, "REL_SURFACE_117");
	Wld_InsertNpc	(Insekt_03, "REL_SURFACE_117");
	Wld_InsertNpc	(Insekt_03, "REL_SURFACE_117");
	Wld_InsertNpc	(Insekt_03, "REL_SURFACE_117");
	Wld_InsertNpc	(Insekt_03, "REL_SURFACE_117");
};

INSTANCe Info_Mod_Axon_Plagenquest_02 (C_INFO)
{
	npc		= Mod_7415_OUT_Axon_REL;
	nr		= 1;
	condition	= Info_Mod_Axon_Plagenquest_02_Condition;
	information	= Info_Mod_Axon_Plagenquest_02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Axon_Plagenquest_02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Axon_Plagenquest))
	&& (Npc_GetDistToWP(self, "REL_SURFACE_117") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Axon_Plagenquest_02_Info()
{
	AI_Output(self, hero, "Info_Mod_Axon_Plagenquest_02_06_00"); //Also ... jetzt ... gehen wiiieer ... nach ... hmm ... ähh ...
	AI_Output(hero, self, "Info_Mod_Axon_Plagenquest_02_15_01"); //(ungeduldig) Kann es nicht etwas schneller gehen?
	AI_Output(self, hero, "Info_Mod_Axon_Plagenquest_02_06_02"); //(aufgebracht) Verdammter Mist, ich muss mich konzentrieren, habe ich gesagt.
	AI_Output(self, hero, "Info_Mod_Axon_Plagenquest_02_06_03"); //Aber ok ... dann gehen wir jetzt eben ... dahin ... (etwas leiser) Ignorant.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "BUG");

	Wld_InsertNpc	(Riesenbug, "REL_SURFACE_120");
};

INSTANCe Info_Mod_Axon_Plagenquest_03 (C_INFO)
{
	npc		= Mod_7415_OUT_Axon_REL;
	nr		= 1;
	condition	= Info_Mod_Axon_Plagenquest_03_Condition;
	information	= Info_Mod_Axon_Plagenquest_03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Axon_Plagenquest_03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Axon_Plagenquest_02))
	&& (Npc_GetDistToWP(self, "REL_SURFACE_120") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Axon_Plagenquest_03_Info()
{
	AI_Output(self, hero, "Info_Mod_Axon_Plagenquest_03_06_00"); //Wow, ich glaube, wir haben ihn. Dann kann es mal losgehen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "PAUSE");
};

INSTANCE Info_Mod_Axon_EXIT (C_INFO)
{
	npc		= Mod_7415_OUT_Axon_REL;
	nr		= 1;
	condition	= Info_Mod_Axon_EXIT_Condition;
	information	= Info_Mod_Axon_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Axon_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Axon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};