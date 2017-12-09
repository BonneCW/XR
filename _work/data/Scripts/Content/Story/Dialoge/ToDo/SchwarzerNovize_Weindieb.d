INSTANCE Info_Mod_SchwarzerNovize_Weindieb_Hi (C_INFO)
{
	npc		= Mod_7761_SNOV_Novize_NW;
	nr		= 1;
	condition	= Info_Mod_SchwarzerNovize_Weindieb_Hi_Condition;
	information	= Info_Mod_SchwarzerNovize_Weindieb_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wen haben wir denn hier?";
};

FUNC INT Info_Mod_SchwarzerNovize_Weindieb_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_SchwarzerNovize_Weindieb_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_SchwarzerNovize_Weindieb_Hi_15_00"); //Wen haben wir denn hier?
	AI_Output(self, hero, "Info_Mod_SchwarzerNovize_Weindieb_Hi_11_01"); //(erschrocken) Ohh, verdammt ... was willst du?

	Info_ClearChoices	(Info_Mod_SchwarzerNovize_Weindieb_Hi);

	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Andokai))
	{
		Info_AddChoice	(Info_Mod_SchwarzerNovize_Weindieb_Hi, "Immer die Ruhe. Ich habe selbst mal für Andokai den Wein gemopst.", Info_Mod_SchwarzerNovize_Weindieb_Hi_C);
	};

	Info_AddChoice	(Info_Mod_SchwarzerNovize_Weindieb_Hi, "Dir klarmachen, dass du und deinesgleichen euch besser nie wieder hier blicken lasst.", Info_Mod_SchwarzerNovize_Weindieb_Hi_B);
	Info_AddChoice	(Info_Mod_SchwarzerNovize_Weindieb_Hi, "Dich für deinen dreisten Diebstahl bestrafen, dreckiger Dämonenlehrling.", Info_Mod_SchwarzerNovize_Weindieb_Hi_A);
};

FUNC VOID Info_Mod_SchwarzerNovize_Weindieb_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_SchwarzerNovize_Weindieb_Hi_C_15_00"); //Immer die Ruhe. Ich habe selbst mal für Andokai den Wein gemopst.
	AI_Output(self, hero, "Info_Mod_SchwarzerNovize_Weindieb_Hi_C_11_01"); //(erleichtert) Ohh, Mann, einen Moment habe ich echt gedacht, du willst mir jetzt die Hölle heiß machen. Aber ja, jetzt erkenne ich dich.
	AI_Output(hero, self, "Info_Mod_SchwarzerNovize_Weindieb_Hi_C_15_02"); //Du und die anderen Jungs, ihr solltet euch aber besser in Zukunft nicht mehr im Kloster blicken lassen. Serpentes hat Verdacht geschöpft.
	AI_Output(self, hero, "Info_Mod_SchwarzerNovize_Weindieb_Hi_C_11_03"); //Tatsächlich? Danke für die Warnung, Mann. Hier, nimm ein paar Stängel Sumpfkraut und paar Flaschen Wein zum Dank.

	CreateInvItems	(hero, ItMi_Joint, 8);
	CreateInvItems	(hero, ItFo_KWine, 12);

	B_ShowGivenThings	("8 Sumpfkrautstängel und 12 Klosterwein erhalten");

	AI_Output(self, hero, "Info_Mod_SchwarzerNovize_Weindieb_Hi_C_11_04"); //Man sieht sich.

	B_GivePlayerXP	(50);

	Info_ClearChoices	(Info_Mod_SchwarzerNovize_Weindieb_Hi);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

FUNC VOID Info_Mod_SchwarzerNovize_Weindieb_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_SchwarzerNovize_Weindieb_Hi_B_15_00"); //Dir klarmachen, dass du und deinesgleichen euch besser nie wieder hier blicken lasst.
	AI_Output(self, hero, "Info_Mod_SchwarzerNovize_Weindieb_Hi_B_11_01"); //Du weißt Bescheid? Ohh, Scheiße, nichts wie weg!

	Info_ClearChoices	(Info_Mod_SchwarzerNovize_Weindieb_Hi);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FLUCHT");
};

FUNC VOID Info_Mod_SchwarzerNovize_Weindieb_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_SchwarzerNovize_Weindieb_Hi_A_15_00"); //Dich für deinen dreisten Diebstahl bestrafen, dreckiger Dämonenlehrling.
	AI_Output(self, hero, "Info_Mod_SchwarzerNovize_Weindieb_Hi_A_11_01"); //Ohh, Scheiße ...

	Info_ClearChoices	(Info_Mod_SchwarzerNovize_Weindieb_Hi);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FLUCHT");
};

INSTANCE Info_Mod_SchwarzerNovize_Weindieb_EXIT (C_INFO)
{
	npc		= Mod_7761_SNOV_Novize_NW;
	nr		= 1;
	condition	= Info_Mod_SchwarzerNovize_Weindieb_EXIT_Condition;
	information	= Info_Mod_SchwarzerNovize_Weindieb_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_SchwarzerNovize_Weindieb_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_SchwarzerNovize_Weindieb_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};