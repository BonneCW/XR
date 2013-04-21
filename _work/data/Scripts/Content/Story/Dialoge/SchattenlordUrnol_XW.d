INSTANCE Info_Mod_Urnol_XW_Hi (C_INFO)
{
	npc		= Schattenlord_998_Urnol;
	nr		= 1;
	condition	= Info_Mod_Urnol_XW_Hi_Condition;
	information	= Info_Mod_Urnol_XW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Urnol_XW_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Urnol_XW_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Urnol_XW_Hi_14_00"); //(hämisch) Und - zack! - schon ist sie zugeschnappt.
	AI_Output(self, hero, "Info_Mod_Urnol_XW_Hi_14_01"); //Ich würde dir ja zu gern selbst den Garaus machen, aber dann wäre mein Meister unglücklich - immerhin bist du sein Spielzeug.
	AI_Output(self, hero, "Info_Mod_Urnol_XW_Hi_14_02"); //Deshalb werde ich mich vorerst damit begnügen, dich hinter Gittern zu sehen.
	AI_Output(self, hero, "Info_Mod_Urnol_XW_Hi_14_03"); //Na los, wird's bald!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Urnol_XW_Gefangen (C_INFO)
{
	npc		= Schattenlord_998_Urnol;
	nr		= 1;
	condition	= Info_Mod_Urnol_XW_Gefangen_Condition;
	information	= Info_Mod_Urnol_XW_Gefangen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Urnol_XW_Gefangen_Condition()
{
	if (Mod_XW_Startscene == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Urnol_XW_Gefangen_Info()
{
	AI_Output(self, hero, "Info_Mod_Urnol_XW_Gefangen_14_00"); //Jetzt hat das leidige Versteckspiel ein Ende. Ich hätte dich gleich bei unserer ersten Begegnung mitnehmen sollen.
	AI_Output(self, hero, "Info_Mod_Urnol_XW_Gefangen_14_01"); //Zu blöd, dass unsere Planungen zu dem Zeitpunkt noch nicht abgeschlossen waren.
	AI_Output(self, hero, "Info_Mod_Urnol_XW_Gefangen_14_02"); //Aber es konnte ja auch niemand wissen, dass du es schaffen würdest, das Signum Magicum abzustreifen.
	AI_Output(hero, self, "Info_Mod_Urnol_XW_Gefangen_15_03"); //Wieso habt ihr Argez entführt?
	AI_Output(self, hero, "Info_Mod_Urnol_XW_Gefangen_14_04"); //Na, wir waren auf der Suche nach dir, aber er war es, der das Signum trug.
	AI_Output(hero, self, "Info_Mod_Urnol_XW_Gefangen_15_05"); //Was?!
	AI_Output(self, hero, "Info_Mod_Urnol_XW_Gefangen_14_06"); //(lacht) Noch besser, wenn es nicht beabsichtigt war.
	AI_Output(self, hero, "Info_Mod_Urnol_XW_Gefangen_14_07"); //Aber als wir schon mal da waren, haben wir gedacht, dass wir ihn auch gleich als Druckmittel nehmen könnten.
	AI_Output(self, hero, "Info_Mod_Urnol_XW_Gefangen_14_08"); //Na ja, ich hoffe, es dauert nicht zu lange, bis Xeres wiederkommt. Er hat oben dringende Geschäfte zu erledigen, weißt du.
	AI_Output(self, hero, "Info_Mod_Urnol_XW_Gefangen_14_09"); //Angelegenheiten, die er Tausende von Jahren aufschieben musste.
	AI_Output(self, hero, "Info_Mod_Urnol_XW_Gefangen_14_10"); //Aber keine Sorge, so lange musst du nicht auf deine schmerzhafte Hinrichtung warten. (lacht)

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Urnol_XW_EXIT (C_INFO)
{
	npc		= Schattenlord_998_Urnol;
	nr		= 1;
	condition	= Info_Mod_Urnol_XW_EXIT_Condition;
	information	= Info_Mod_Urnol_XW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Urnol_XW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Urnol_XW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};