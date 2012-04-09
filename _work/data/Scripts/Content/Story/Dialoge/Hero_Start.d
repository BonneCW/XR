INSTANCE Info_Mod_Hero_Start_01 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_Hero_Start_01_Condition;
	information	= Info_Mod_Hero_Start_01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Schwierigkeitsgrad wählen";
};

FUNC INT Info_Mod_Hero_Start_01_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Spieleinstellungen)
	&& (TimeCounter_Real >= 45)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hero_Start_01_Info()
{

	Info_ClearChoices	(Info_Mod_Hero_Start_01);

	Info_AddChoice	(Info_Mod_Hero_Start_01, "Bis auf ein paar Kleinigkeiten weiß ich noch alles (Schwer)", Info_Mod_Hero_Start_01_Schwer);
	Info_AddChoice	(Info_Mod_Hero_Start_01, "Ein paar Dinge weiß ich noch (Mittel)", Info_Mod_Hero_Start_01_Mittel);
	Info_AddChoice	(Info_Mod_Hero_Start_01, "Ich weiß fast nichts mehr (Einfach)", Info_Mod_Hero_Start_01_Leicht);
};

FUNC VOID Info_Mod_Hero_Start_01_Schwer()
{
	Mod_Schwierigkeit = 3;

	Info_ClearChoices	(Info_Mod_Hero_Start_01);
};

FUNC VOID Info_Mod_Hero_Start_01_Mittel()
{
	Mod_Schwierigkeit = 2;

	Info_ClearChoices	(Info_Mod_Hero_Start_01);
};

FUNC VOID Info_Mod_Hero_Start_01_Leicht()
{
	Mod_Schwierigkeit = 1;

	Info_ClearChoices	(Info_Mod_Hero_Start_01);
};

INSTANCE Info_Mod_Hero_Start_02 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_Hero_Start_02_Condition;
	information	= Info_Mod_Hero_Start_02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Esssystem";
};

FUNC INT Info_Mod_Hero_Start_02_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Spieleinstellungen)
	&& (TimeCounter_Real >= 45)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hero_Start_02_Info()
{

	Info_ClearChoices	(Info_Mod_Hero_Start_02);

	Info_AddChoice	(Info_Mod_Hero_Start_02, "Nein", Info_Mod_Hero_Start_02_Nein);
	Info_AddChoice	(Info_Mod_Hero_Start_02, "Ja", Info_Mod_Hero_Start_02_Ja);
};

FUNC VOID Info_Mod_Hero_Start_02_Nein()
{
	Mod_Esssystem = FALSE;

	Mod_EssPunkte = 100;

	Info_ClearChoices	(Info_Mod_Hero_Start_02);
};

FUNC VOID Info_Mod_Hero_Start_02_Ja()
{
	Mod_Esssystem = TRUE;

	Mod_EssPunkte = 300;

	Info_ClearChoices	(Info_Mod_Hero_Start_02);
};

INSTANCE Info_Mod_Hero_Start_03 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_Hero_Start_03_Condition;
	information	= Info_Mod_Hero_Start_03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Inventar ...";
};

FUNC INT Info_Mod_Hero_Start_03_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Spieleinstellungen)
	&& (TimeCounter_Real >= 45)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hero_Start_03_Info()
{

	Info_ClearChoices	(Info_Mod_Hero_Start_03);

	Info_AddChoice	(Info_Mod_Hero_Start_03, "... manuell plündern", Info_Mod_Hero_Start_03_Nein);
	Info_AddChoice	(Info_Mod_Hero_Start_03, "... automatisch plündern", Info_Mod_Hero_Start_03_Ja);
};

FUNC VOID Info_Mod_Hero_Start_03_Nein()
{
	Mod_AutoInventar = FALSE;

	Info_ClearChoices	(Info_Mod_Hero_Start_03);
};

FUNC VOID Info_Mod_Hero_Start_03_Ja()
{
	Mod_AutoInventar = TRUE;

	Info_ClearChoices	(Info_Mod_Hero_Start_03);
};

INSTANCE Info_Mod_Hero_Start_04 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_Hero_Start_04_Condition;
	information	= Info_Mod_Hero_Start_04_Info;
	permanent	= 0;
	important	= 0;
	description	= "EXP-Balken";
};

FUNC INT Info_Mod_Hero_Start_04_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Spieleinstellungen)
	&& (TimeCounter_Real >= 45)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hero_Start_04_Info()
{

	Info_ClearChoices	(Info_Mod_Hero_Start_04);

	Info_AddChoice	(Info_Mod_Hero_Start_04, "aus", Info_Mod_Hero_Start_04_Nein);
	Info_AddChoice	(Info_Mod_Hero_Start_04, "an", Info_Mod_Hero_Start_04_Ja);
};

FUNC VOID Info_Mod_Hero_Start_04_Nein()
{
	Mod_EXP_Anzeige = FALSE;

	Info_ClearChoices	(Info_Mod_Hero_Start_04);
};

FUNC VOID Info_Mod_Hero_Start_04_Ja()
{
	Mod_EXP_Anzeige = TRUE;

	Info_ClearChoices	(Info_Mod_Hero_Start_04);
};

INSTANCE Info_Mod_Hero_Start_05 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_Hero_Start_05_Condition;
	information	= Info_Mod_Hero_Start_05_Info;
	permanent	= 0;
	important	= 0;
	description	= "Spielzeitanzeige";
};

FUNC INT Info_Mod_Hero_Start_05_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Spieleinstellungen)
	&& (TimeCounter_Real >= 45)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hero_Start_05_Info()
{
	Info_ClearChoices	(Info_Mod_Hero_Start_05);

	Info_AddChoice	(Info_Mod_Hero_Start_05, "aus", Info_Mod_Hero_Start_05_Nein);
	Info_AddChoice	(Info_Mod_Hero_Start_05, "an", Info_Mod_Hero_Start_05_Ja);
};

FUNC VOID Info_Mod_Hero_Start_05_Nein()
{
	TimeAn = FALSE;

	Info_ClearChoices	(Info_Mod_Hero_Start_05);
};

FUNC VOID Info_Mod_Hero_Start_05_Ja()
{
	TimeAn = TRUE;

	Info_ClearChoices	(Info_Mod_Hero_Start_05);
};

INSTANCE Info_Mod_Hero_Start_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= Info_Mod_Hero_Start_EXIT_Condition;
	information	= Info_Mod_Hero_Start_EXIT_Info;
	permanent	= 0;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hero_Start_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Spieleinstellungen)
	&& (Npc_KnowsInfo(hero, Info_Mod_Hero_Start_01))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hero_Start_02))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hero_Start_03))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hero_Start_04))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hero_Start_05))
	&& (TimeCounter_Real >= 45)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hero_Start_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};