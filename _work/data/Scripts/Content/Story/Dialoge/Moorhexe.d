INSTANCE Info_Mod_Moorhexe_Hi (C_INFO)
{
	npc		= Mod_7295_OUT_Moorhexe_REL;
	nr		= 1;
	condition	= Info_Mod_Moorhexe_Hi_Condition;
	information	= Info_Mod_Moorhexe_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Moorhexe_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Moorhexe))
	&& (playerIsTransformed == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moorhexe_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Moorhexe_Hi_17_00"); //Was, ein lebender Mensch in dem verfluchten Moor, und er vermag mich zu sehen?!
	AI_Output(hero, self, "Info_Mod_Moorhexe_Hi_15_01"); //So scheint es ...
	AI_Output(self, hero, "Info_Mod_Moorhexe_Hi_17_02"); //Was in Beliars Namen hast du hier verloren? Was willst du?
	AI_Output(self, hero, "Info_Mod_Moorhexe_Hi_17_03"); //Ganz bestimmt nicht die Schätze des Sumpfes, sonst hättest du verblendet von Gier dein Leben in einem morastigen Tümpel gelassen.
	AI_Output(hero, self, "Info_Mod_Moorhexe_Hi_15_04"); //Ich bin auf der Suche nach einem Gegenstand, den ein Magier vermutlich dir überlassen hat.
	AI_Output(self, hero, "Info_Mod_Moorhexe_Hi_17_05"); //Was?! Den Kamm von Lich?! Bei meiner Hexenehre habe ich geschworen, ihn zu verteidigen. Nie wirst du ihn bekommen.

	AI_StopProcessInfos	(self);

	CreateInvItems	(self, ItMi_Kamm, 1);

	B_Attack	(self, hero, AR_GuildEnemy, 0);

	if (Mod_NL_Grimbald == 4)
	{
		B_StartOtherRoutine	(Mod_7294_OUT_Grimbald_REL, "TOT");

		Mod_NL_Grimbald = 5;
	};
};