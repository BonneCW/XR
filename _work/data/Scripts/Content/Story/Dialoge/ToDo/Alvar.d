INSTANCE Info_Mod_Alvar_Hi (C_INFO)
{
	npc		= Mod_7561_OUT_Alvar_EIS;
	nr		= 1;
	condition	= Info_Mod_Alvar_Hi_Condition;
	information	= Info_Mod_Alvar_Hi_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Alvar_Hi_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Mod_AlvarKristall < 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alvar_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Alvar_Hi_01_00"); //Jetzt nicht. Ich bin beschäftigt.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Alvar_Unbekannt (C_INFO)
{
	npc		= Mod_7561_OUT_Alvar_EIS;
	nr		= 1;
	condition	= Info_Mod_Alvar_Unbekannt_Condition;
	information	= Info_Mod_Alvar_Unbekannt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alvar_Unbekannt_Condition()
{
	if (Mod_AlvarKristall == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alvar_Unbekannt_Info()
{
	AI_Output(self, hero, "Info_Mod_Alvar_Unbekannt_01_00"); //Das war in aller letzter Sekunde. Bist du verletzt?
	AI_Output(hero, self, "Info_Mod_Alvar_Unbekannt_15_01"); //Nein, ich glaube nicht. Nur etwas benommen. Wer bist du?
	AI_Output(self, hero, "Info_Mod_Alvar_Unbekannt_01_02"); //Das soll im Augenblick keine Rolle spielen. Du hast du den Kristall? Dann Eile zurück ins Dorf.
	AI_Output(self, hero, "Info_Mod_Alvar_Unbekannt_01_03"); //Die Erisschwestern führen Übles im Schilde ... Thys ist in Gefahr. Die Zeit drängt.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	Mdl_ApplyOverlayMDSTimed	(hero, "HUMANS_DRUNKEN.MDS", 60000);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_EIS_UNSCHULDIG, "ch habe den Kristall. Die Begegnung mit einer Hexe hätte mir dabei fast das Leben gekostet. Nur diesem Unbekannten verdanke ich mein leibliches Wohl. Jetzt aber nichts wie zurück ins Dorf. Die Erisschwestern wollen Thys ans Leder.");

	B_StartOtherRoutine	(Mod_7564_OUT_Knatus_EIS, "ALVAR");
	B_StartOtherRoutine	(Mod_7560_OUT_Malfama_EIS, "ALVAR");
	B_StartOtherRoutine	(Mod_7559_OUT_Serra_EIS, "ALVAR");
	B_StartOtherRoutine	(Mod_1954_EIS_Thys_EIS, "KO");
};

INSTANCE Info_Mod_Alvar_Unbekannt2 (C_INFO)
{
	npc		= Mod_7561_OUT_Alvar_EIS;
	nr		= 1;
	condition	= Info_Mod_Alvar_Unbekannt2_Condition;
	information	= Info_Mod_Alvar_Unbekannt2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alvar_Unbekannt2_Condition()
{
	if (Mod_AlvarKristall == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alvar_Unbekannt2_Info()
{
	AI_Output(self, hero, "Info_Mod_Alvar_Unbekannt2_01_00"); // ...
	AI_Output(hero, self, "Info_Mod_Alvar_Unbekannt2_15_01"); //Du schon wieder? Zum zweiten mal hast du mir das Leben gerettet.
	AI_Output(self, hero, "Info_Mod_Alvar_Unbekannt2_01_02"); //Nun, und du hast durch deinen Einsatz das ganze Dorf gerettet.
	AI_Output(hero, self, "Info_Mod_Alvar_Unbekannt2_15_03"); //Wer bist du? Warum versteckst du dich hinter dem Umhang? Zeig endlich dein Gesicht.
	AI_Output(self, hero, "Info_Mod_Alvar_Unbekannt2_01_04"); //Nun, jetzt da die Schwestern der Täuschung tot sind ...

	AI_UnequipArmor	(self);

	AI_EquipArmor	(self, ITAR_Eisgebiet_02);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_7564_OUT_Knatus_EIS, "THYS");

	B_KillNpc	(Mod_7560_OUT_Malfama_EIS);
	B_KillNpc	(Mod_7559_OUT_Serra_EIS);
};

INSTANCE Info_Mod_Alvar_Unbekannt3 (C_INFO)
{
	npc		= Mod_7561_OUT_Alvar_EIS;
	nr		= 1;
	condition	= Info_Mod_Alvar_Unbekannt3_Condition;
	information	= Info_Mod_Alvar_Unbekannt3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alvar_Unbekannt3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Knatus_Traenenkristall2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alvar_Unbekannt3_Info()
{
	AI_Output(self, hero, "Info_Mod_Alvar_Unbekannt3_01_00"); //Nicht ganz. Es war eine Eisleiche, die ich von einem alten Friedhof geborgen hatte.
	AI_Output(self, hero, "Info_Mod_Alvar_Unbekannt3_01_01"); //Ich habe sie in meine Rüstung gekleidet, um meinen Tod vorzutäuschen. Es ging leider nicht anders.
	AI_Output(self, hero, "Info_Mod_Alvar_Unbekannt3_01_02"); //Nur so konnte ich unbehelligt handeln und verhindern, dass unser Dorf den Erisschwestern zum Opfer fällt.
	AI_Output(hero, self, "Info_Mod_Alvar_Unbekannt3_15_03"); //Und das war ja auch in aller letzter Sekunde.
	AI_Output(self, hero, "Info_Mod_Alvar_Unbekannt3_01_04"); //Ja, und ohne dein Zutun wäre wohl trotzdem alles verloren gewesen.
	AI_Output(self, hero, "Info_Mod_Alvar_Unbekannt3_01_05"); //Ich hatte ihr Wesen erkannt, in alten Schriften und Büchern Bestätigung erhalten.
	AI_Output(self, hero, "Info_Mod_Alvar_Unbekannt3_01_06"); //Nur hatten die beiden leider schon zu viel Macht und Einfluss entwickelt, ich fand kein Gehör unter den Dorfbewohnern.
	AI_Output(self, hero, "Info_Mod_Alvar_Unbekannt3_01_07"); //Stattdessen erkannten die Erisschwestern die Gefahr, die ich für sie darstellte und schafften es das Dorf gegen mich aufzubringen.
	AI_Output(self, hero, "Info_Mod_Alvar_Unbekannt3_01_08"); //Meines Lebens konnte ich mich auch nicht mehr sicher fühlen ... aber der ganze Alptraum ist nun endlich vorbei.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Alvar_EXIT (C_INFO)
{
	npc		= Mod_7561_OUT_Alvar_EIS;
	nr		= 1;
	condition	= Info_Mod_Alvar_EXIT_Condition;
	information	= Info_Mod_Alvar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alvar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alvar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};