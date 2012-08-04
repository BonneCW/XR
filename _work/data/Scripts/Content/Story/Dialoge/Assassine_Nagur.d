INSTANCE Info_Mod_Assassine_Nagur_Hi (C_INFO)
{
	npc		= Mod_7782_ASS_Assassine_NW;
	nr		= 1;
	condition	= Info_Mod_Assassine_Nagur_Hi_Condition;
	information	= Info_Mod_Assassine_Nagur_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Assassine_Nagur_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Assassine_Nagur_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Assassine_Nagur_Hi_03_00"); //(erschrocken) Was?! Du?!

	AI_TurnToNpc	(self, Mod_7783_OUT_Schmuggler_NW);

	AI_Output(self, hero, "Info_Mod_Assassine_Nagur_Hi_03_01"); //(zu den anderen) Das ist der Typ der für Nagur den Novizen erledigt hat.

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Assassine_Nagur_Hi_03_02"); //(zum Helden) Bist du uns gefolgt? Was willst du hier?!

	Info_ClearChoices	(Info_Mod_Assassine_Nagur_Hi);

	Info_AddChoice	(Info_Mod_Assassine_Nagur_Hi, "Nagur gab mir den Auftrag euch zu erledigen.", Info_Mod_Assassine_Nagur_Hi_B);
	Info_AddChoice	(Info_Mod_Assassine_Nagur_Hi, "Eure Leichnahme um das Schmuggelgut erleichtern.", Info_Mod_Assassine_Nagur_Hi_A);
};

FUNC VOID Info_Mod_Assassine_Nagur_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Assassine_Nagur_Hi_B_15_00"); //Nagur gab mir den Auftrag euch zu erledigen.

	AI_ReadyMeleeWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Assassine_Nagur_Hi_B_03_01"); //Was?! Dieser Dreckskerl! Und du solltest dir genau überlegen, was du jetzt machst ... für wen du Partei ergreifst!
	AI_Output(hero, self, "Info_Mod_Assassine_Nagur_Hi_B_15_02"); //Was hast du anzubieten?
	AI_Output(self, hero, "Info_Mod_Assassine_Nagur_Hi_B_03_03"); //Nun ... du könntest ohne Kampf und Kratzer an paar Goldmünzen kommen.
	AI_Output(self, hero, "Info_Mod_Assassine_Nagur_Hi_B_03_04"); //Du müsstest lediglich wieder umdrehen und Nagur verklickern, dass du deinen Job erledigt hast.
	AI_Output(self, hero, "Info_Mod_Assassine_Nagur_Hi_B_03_05"); //Er wird unvorsichtig werden und das ist der Augenblick, wo wir zuschlagen.
	AI_Output(self, hero, "Info_Mod_Assassine_Nagur_Hi_B_03_06"); //Sobald die Sache erledigt ist, wirst du in der Kneipe davon erfahren und einen Beutel voll Gold bekommen.

	Info_ClearChoices	(Info_Mod_Assassine_Nagur_Hi);

	Info_AddChoice	(Info_Mod_Assassine_Nagur_Hi, "Hört sich gut an.", Info_Mod_Assassine_Nagur_Hi_D);
	Info_AddChoice	(Info_Mod_Assassine_Nagur_Hi, "Nein, ich will lieber eure Leichen um die Schmuggelwaren erleichtern.", Info_Mod_Assassine_Nagur_Hi_C);
};

FUNC VOID Info_Mod_Assassine_Nagur_Hi_E()
{
	AI_Output(self, hero, "Info_Mod_Assassine_Nagur_Hi_E_03_00"); //Das wollen wir doch mal sehen!

	Info_ClearChoices	(Info_Mod_Assassine_Nagur_Hi);

	AI_StopProcessInfos	(self);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild (self, GIL_STRF);

	Mod_7781_SNOV_Novize_NW.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_7781_SNOV_Novize_NW, GIL_STRF);

	Mod_7783_OUT_Schmuggler_NW.guild = GIL_STRF;
	Npc_SetTrueGuild (Mod_7783_OUT_Schmuggler_NW, GIL_STRF);

	Mod_Nagur_Geschaeft = 5;
};

FUNC VOID Info_Mod_Assassine_Nagur_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Assassine_Nagur_Hi_A_15_00"); //Eure Leichnahme um das Schmuggelgut erleichtern.

	Info_Mod_Assassine_Nagur_Hi_E();
};

FUNC VOID Info_Mod_Assassine_Nagur_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Assassine_Nagur_Hi_D_15_00"); //Hört sich gut an.
	AI_Output(self, hero, "Info_Mod_Assassine_Nagur_Hi_D_03_01"); //Sehr gut ... du bist vernünftig. Also, du weißt, was zu tun ist.

	Info_ClearChoices	(Info_Mod_Assassine_Nagur_Hi);

	B_LogEntry	(TOPIC_MOD_NAGUR_GESCHAEFT, "Ich kann jetzt Nagur davon berichten, dass seine Konkurrenten beseitigt wurden.");

	AI_StopProcessInfos	(self);

	Mod_Nagur_Geschaeft = 4;
};

FUNC VOID Info_Mod_Assassine_Nagur_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Assassine_Nagur_Hi_C_15_00"); //Nein, ich will lieber eure Leichen um die Schmuggelwaren erleichtern.

	Info_Mod_Assassine_Nagur_Hi_E();
};

INSTANCE Info_Mod_Assassine_Nagur_EXIT (C_INFO)
{
	npc		= Mod_7782_ASS_Assassine_NW;
	nr		= 1;
	condition	= Info_Mod_Assassine_Nagur_EXIT_Condition;
	information	= Info_Mod_Assassine_Nagur_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Assassine_Nagur_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Assassine_Nagur_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};