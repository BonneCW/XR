INSTANCE Info_Mod_Will_Hi (C_INFO)
{
	npc		= Mod_7589_OUT_Will_REL;
	nr		= 1;
	condition	= Info_Mod_Will_Hi_Condition;
	information	= Info_Mod_Will_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Will_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Will_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Will_Hi_06_00"); //Tritt herein, Freund. Gerade eben läuft mein neues revolutionäres Bühnenstück.
	AI_Output(hero, self, "Info_Mod_Will_Hi_15_01"); //Was ist denn daran so revolutionär?
	AI_Output(self, hero, "Info_Mod_Will_Hi_06_02"); //(euphorisch) Ich habe das ganze Stück auf seine Höhepunkte zusammengestrichen!
	AI_Output(self, hero, "Info_Mod_Will_Hi_06_03"); //Innovation à la Will Shakesbeer!
	AI_Output(self, hero, "Info_Mod_Will_Hi_06_04"); //Wie oft sitzt man im teatro und schaut sich ein - womöglich spannendes - pièce teatrale, ein Stück, an, fiebert mit, und doch - nach zwei Stunden, nach drei Stunden schleicht sich ein Gähnen ein;
	AI_Output(self, hero, "Info_Mod_Will_Hi_06_05"); //man unterdrückt es, aber je weiter die Zeit fortschreitet, desto häufiger muss man dagegen ankämpfen.
	AI_Output(self, hero, "Info_Mod_Will_Hi_06_06"); //Und wahrlich niemand vermag es, mehrere Stunden ohne Brückenszenen zu füllen, Lückenbüßer, wenn Er so will, unnötig allemal.
	AI_Output(self, hero, "Info_Mod_Will_Hi_06_07"); //Dies wird sich nun ändern! Mein Konzept sieht eine Konzentration der suspense, der Spannung, vor, es geht Schlag auf Schlag, Schicksalsschlag auf Hammerschlag, oder so, wie Er will.
	AI_Output(self, hero, "Info_Mod_Will_Hi_06_08"); //Die nächste recita, Aufführung, beginnt gleich. Für nur 100 Goldmünzen kann Er dabei sein.
};

INSTANCE Info_Mod_Will_EXIT (C_INFO)
{
	npc		= Mod_7589_OUT_Will_REL;
	nr		= 1;
	condition	= Info_Mod_Will_EXIT_Condition;
	information	= Info_Mod_Will_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Will_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Will_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};