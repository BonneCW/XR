INSTANCE Info_Mod_Gobshak_Stollen (C_INFO)
{
	npc		= Mod_4021_Orc_Gobshak_MT;
	nr		= 1;
	condition	= Info_Mod_Gobshak_Stollen_Condition;
	information	= Info_Mod_Gobshak_Stollen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gobshak_Stollen_Condition()
{
	if (Mod_Hermy_KnowsQuest == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gobshak_Stollen_Info()
{
	AI_Output(self, hero, "Info_Mod_Gobshak_Stollen_18_00"); //Was machen Mensch hier oben?
	AI_Output(hero, self, "Info_Mod_Gobshak_Stollen_15_01"); //Du sprichst unsere Sprache?
	AI_Output(self, hero, "Info_Mod_Gobshak_Stollen_18_02"); //Ich lange gewesen Sklave von Menschen. Jetzt ich mich habe befreit. Ich nicht wieder in die Sklaverei zurückwollen.

	Info_ClearChoices	(Info_Mod_Gobshak_Stollen);

	Info_AddChoice	(Info_Mod_Gobshak_Stollen, "Da gehört ihr stinkenden Würmer aber hin!", Info_Mod_Gobshak_Stollen_B);
	Info_AddChoice	(Info_Mod_Gobshak_Stollen, "Habt ihr hier zufällig einen Stollen entdeckt?", Info_Mod_Gobshak_Stollen_A);
};

FUNC VOID Info_Mod_Gobshak_Stollen_B()
{
	AI_Output(hero, self, "Info_Mod_Gobshak_Stollen_B_15_00"); //Da gehört ihr stinkenden Würmer aber hin!
	AI_Output(self, hero, "Info_Mod_Gobshak_Stollen_B_18_01"); //Warum du wollen mich povo ... prozi ... verärgern?

	Info_ClearChoices	(Info_Mod_Gobshak_Stollen);

	Info_AddChoice	(Info_Mod_Gobshak_Stollen, "Tut mir Leid, das wollte ich nicht sagen.", Info_Mod_Gobshak_Stollen_D);
	Info_AddChoice	(Info_Mod_Gobshak_Stollen, "Ich mag es, Orks zu ärgern.", Info_Mod_Gobshak_Stollen_C);
};

FUNC VOID Info_Mod_Gobshak_Stollen_A()
{
	AI_Output(hero, self, "Info_Mod_Gobshak_Stollen_A_15_00"); //Habt ihr hier zufällig einen Stollen entdeckt?
	AI_Output(self, hero, "Info_Mod_Gobshak_Stollen_A_18_01"); //Ja, jetzt wo du sagen. Wir wirklich haben gefunden Stollen hier in Alter Bibio ... Biblithe ... Bücherei. Hinten bei Grubuz du müssen fragen.
	AI_Output(hero, self, "Info_Mod_Gobshak_Stollen_A_15_02"); //Danke für die Information.
	AI_Output(self, hero, "Info_Mod_Gobshak_Stollen_A_18_03"); //Es ehren mich, Dank zu haben.

	B_LogEntry	(TOPIC_MOD_FAICE_HARPIE, "Gobshak hat mir gesagt, dass weiter hinten in der Felsenfestung wirklich ein Stollen entdeckt wurde. Ich soll mit einem Ork namens Grubuz sprechen.");

	Mod_Hermy_KnowsQuest = 2;

	Info_ClearChoices	(Info_Mod_Gobshak_Stollen);
};

FUNC VOID Info_Mod_Gobshak_Stollen_D()
{
	AI_Output(hero, self, "Info_Mod_Gobshak_Stollen_D_15_00"); //Tut mir Leid, das wollte ich nicht sagen.
	AI_Output(self, hero, "Info_Mod_Gobshak_Stollen_D_18_01"); //Was du dann wollen?

	Info_ClearChoices	(Info_Mod_Gobshak_Stollen);

	Info_AddChoice	(Info_Mod_Gobshak_Stollen, "Habt ihr hier zufällig einen Stollen entdeckt?", Info_Mod_Gobshak_Stollen_A);
};

FUNC VOID Info_Mod_Gobshak_Stollen_C()
{
	AI_Output(hero, self, "Info_Mod_Gobshak_Stollen_C_15_00"); //Ich mag es, Orks zu ärgern.
	AI_Output(self, hero, "Info_Mod_Gobshak_Stollen_C_18_01"); //Du dich wollen bekämpfen mit Gobshak?

	Info_ClearChoices	(Info_Mod_Gobshak_Stollen);

	Info_AddChoice	(Info_Mod_Gobshak_Stollen, "Nein nein. Ich wollte etwas anderes.", Info_Mod_Gobshak_Stollen_G);
	Info_AddChoice	(Info_Mod_Gobshak_Stollen, "Komm doch her!", Info_Mod_Gobshak_Stollen_F);
};

FUNC VOID Info_Mod_Gobshak_Stollen_G()
{
	AI_Output(hero, self, "Info_Mod_Gobshak_Stollen_G_15_00"); //Nein nein. Ich wollte etwas anderes.
	AI_Output(self, hero, "Info_Mod_Gobshak_Stollen_G_18_01"); //Was du wollen?

	Info_ClearChoices	(Info_Mod_Gobshak_Stollen);

	Info_AddChoice	(Info_Mod_Gobshak_Stollen, "Habt ihr hier zufällig einen Stollen entdeckt?", Info_Mod_Gobshak_Stollen_A);
};

FUNC VOID Info_Mod_Gobshak_Stollen_F()
{
	AI_Output(hero, self, "Info_Mod_Gobshak_Stollen_F_15_00"); //Komm doch her!
	AI_Output(self, hero, "Info_Mod_Gobshak_Stollen_F_18_01"); //Auf so etwas ich mich nicht lassen herab. Mensch verschwinden besser.

	Info_ClearChoices	(Info_Mod_Gobshak_Stollen);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Gobshak_Grubuz (C_INFO)
{
	npc		= Mod_4021_Orc_Gobshak_MT;
	nr		= 1;
	condition	= Info_Mod_Gobshak_Grubuz_Condition;
	information	= Info_Mod_Gobshak_Grubuz_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gobshak_Grubuz_Condition()
{
	if (Mod_Hermy_KnowsQuest == 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gobshak_Grubuz_Info()
{
	AI_Output(self, hero, "Info_Mod_Gobshak_Grubuz_18_00"); //Etwas passieren? Mensch sehen aufgebracht aus.
	
	Info_ClearChoices	(Info_Mod_Gobshak_Grubuz);

	Info_AddChoice	(Info_Mod_Gobshak_Grubuz, "Leugnen ist zwecklos du stinkender Ork!", Info_Mod_Gobshak_Grubuz_B);
	Info_AddChoice	(Info_Mod_Gobshak_Grubuz, "Weißt du, wo sich Grubuz zurzeit aufhält?", Info_Mod_Gobshak_Grubuz_A);
};

FUNC VOID Info_Mod_Gobshak_Grubuz_B()
{
	AI_Output(hero, self, "Info_Mod_Gobshak_Grubuz_B_15_00"); //Leugnen ist zwecklos du stinkender Ork!
	AI_Output(self, hero, "Info_Mod_Gobshak_Grubuz_B_18_01"); //Was haben Gobshak dir getan?

	Info_ClearChoices	(Info_Mod_Gobshak_Grubuz);

	Info_AddChoice	(Info_Mod_Gobshak_Grubuz, "Es tut mir Leid, das war ein Ausrutscher.", Info_Mod_Gobshak_Grubuz_D);
	Info_AddChoice	(Info_Mod_Gobshak_Grubuz, "Ihr habt mir meine Spruchrolle gestohlen und Emerin umgebracht. Elendes Pack!", Info_Mod_Gobshak_Grubuz_C);
};

FUNC VOID Info_Mod_Gobshak_Grubuz_A()
{
	AI_Output(hero, self, "Info_Mod_Gobshak_Grubuz_A_15_00"); //Weißt du, wo sich Grubuz zurzeit aufhält?
	AI_Output(self, hero, "Info_Mod_Gobshak_Grubuz_A_18_01"); //Grubuz vorhin schnell wegrennen. Über die Brücke, wenn Gobshak sich nicht irren.
	AI_Output(hero, self, "Info_Mod_Gobshak_Grubuz_A_15_02"); //War er allein?
	AI_Output(self, hero, "Info_Mod_Gobshak_Grubuz_A_18_03"); //Ja, Gobshak niemandem bei ihm gesehen.
	AI_Output(hero, self, "Info_Mod_Gobshak_Grubuz_A_15_04"); //Danke für diese Information.
	AI_Output(self, hero, "Info_Mod_Gobshak_Grubuz_A_18_05"); //Es ehren mich, Dank zu haben.

	B_LogEntry	(TOPIC_MOD_FAICE_HARPIE, "Gobshak war scheinbar nicht am Überfall beteiligt, aber verdächtig ist, dass Grubuz über die Brücke getürmt ist. Weit kann er noch nicht sein.");

	Mod_Hermy_KnowsQuest = 8;

	Info_ClearChoices	(Info_Mod_Gobshak_Grubuz);
};

FUNC VOID Info_Mod_Gobshak_Grubuz_D()
{
	AI_Output(hero, self, "Info_Mod_Gobshak_Grubuz_D_15_00"); //Es tut mir Leid, das war ein Ausrutscher.

	Info_ClearChoices	(Info_Mod_Gobshak_Grubuz);

	Info_AddChoice	(Info_Mod_Gobshak_Grubuz, "Weißt du, wo sich Grubuz zurzeit aufhält?", Info_Mod_Gobshak_Grubuz_A);
};

FUNC VOID Info_Mod_Gobshak_Grubuz_C()
{
	AI_Output(hero, self, "Info_Mod_Gobshak_Grubuz_C_15_00"); //Ihr habt mir meine Spruchrolle gestohlen und Emerin umgebracht. Elendes Pack!
	AI_Output(self, hero, "Info_Mod_Gobshak_Grubuz_C_18_01"); //Du Gobshak für etwas beschuldigen, was Gobshak nicht getan!

	Info_ClearChoices	(Info_Mod_Gobshak_Grubuz);

	Info_AddChoice	(Info_Mod_Gobshak_Grubuz, "Es tut mir Leid, das war ein Ausrutscher.", Info_Mod_Gobshak_Grubuz_D);
	Info_AddChoice	(Info_Mod_Gobshak_Grubuz, "Natürlich nicht! Glaubst du ich spinne? Jetzt wirst du sterben!", Info_Mod_Gobshak_Grubuz_F);
};

FUNC VOID Info_Mod_Gobshak_Grubuz_F()
{
	AI_Output(hero, self, "Info_Mod_Gobshak_Grubuz_F_15_00"); //Natürlich nicht! Glaubst du ich spinne? Jetzt wirst du sterben!

	Info_ClearChoices	(Info_Mod_Gobshak_Grubuz);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

INSTANCE Info_Mod_Gobshak_EXIT (C_INFO)
{
	npc		= Mod_4021_Orc_Gobshak_MT;
	nr		= 1;
	condition	= Info_Mod_Gobshak_EXIT_Condition;
	information	= Info_Mod_Gobshak_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gobshak_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gobshak_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};