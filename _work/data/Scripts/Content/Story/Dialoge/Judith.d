INSTANCE Info_Mod_Judith_Hi (C_INFO)
{
	npc		= Mod_7680_OUT_Judith_REL;
	nr		= 1;
	condition	= Info_Mod_Judith_Hi_Condition;
	information	= Info_Mod_Judith_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Erzähl mir was von dir.";
};

FUNC INT Info_Mod_Judith_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Judith_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Judith_Hi_15_00"); //Erzähl mir was von dir.
	AI_Output(self, hero, "Info_Mod_Judith_Hi_06_01"); //Was soll ich groß von mir erzählen?
	AI_Output(self, hero, "Info_Mod_Judith_Hi_06_02"); //Ich habe mir vorgenommen, regelmäßig lange Abendspaziergänge zu machen.
	AI_Output(self, hero, "Info_Mod_Judith_Hi_06_03"); //Den ganzen Tag in der Küche stehen, den Haushalt in Schuss halten - da braucht man auch mal etwas Abwechslung, um den Kopf frei zu bekommen.
	AI_Output(self, hero, "Info_Mod_Judith_Hi_06_04"); //Wenn es das war, was du hören wolltest ...
};

INSTANCE Info_Mod_Judith_Pavillon (C_INFO)
{
	npc		= Mod_7680_OUT_Judith_REL;
	nr		= 1;
	condition	= Info_Mod_Judith_Pavillon_Condition;
	information	= Info_Mod_Judith_Pavillon_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Judith_Pavillon_Condition()
{
	if (Npc_GetDistToWP(self, "PARK_BETEN") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Judith_Pavillon_Info()
{
	AI_Output(self, hero, "Info_Mod_Judith_Pavillon_06_00"); //(leise) Bist du es, Liebling?

	Info_ClearChoices	(Info_Mod_Judith_Pavillon);

	Info_AddChoice	(Info_Mod_Judith_Pavillon, "(säuseln) Ja, mein Schatz.", Info_Mod_Judith_Pavillon_B);
	Info_AddChoice	(Info_Mod_Judith_Pavillon, "Wie bitte?", Info_Mod_Judith_Pavillon_A);
};

FUNC VOID Info_Mod_Judith_Pavillon_B()
{
	AI_Output(hero, self, "Info_Mod_Judith_Pavillon_B_15_00"); //(säuseln) Ja, mein Schatz.
	AI_Output(self, hero, "Info_Mod_Judith_Pavillon_B_06_01"); //Ich muss dir unbedingt erzählen, was vorhin passiert ist.
	AI_Output(self, hero, "Info_Mod_Judith_Pavillon_B_06_02"); //Ich glaube, Lukas hat Verdacht geschöpft.

	Info_ClearChoices	(Info_Mod_Judith_Pavillon);

	Info_AddChoice	(Info_Mod_Judith_Pavillon, "Von was hat er Verdacht geschöpft?", Info_Mod_Judith_Pavillon_D);
	Info_AddChoice	(Info_Mod_Judith_Pavillon, "Wollen wir nicht gleich zur Sache kommen?", Info_Mod_Judith_Pavillon_C);
};

FUNC VOID Info_Mod_Judith_Pavillon_A()
{
	AI_Output(hero, self, "Info_Mod_Judith_Pavillon_A_15_00"); //Wie bitte?
	AI_Output(self, hero, "Info_Mod_Judith_Pavillon_A_06_01"); //(erschrocken) Gar nichts. Ich muss wohl schlafwandeln.

	Info_ClearChoices	(Info_Mod_Judith_Pavillon);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

FUNC VOID Info_Mod_Judith_Pavillon_D()
{
	AI_Output(hero, self, "Info_Mod_Judith_Pavillon_D_15_00"); //Von was hat er Verdacht geschöpft?
	AI_Output(self, hero, "Info_Mod_Judith_Pavillon_D_06_01"); //Na, dass ich mich mit dir treffe.
	AI_Output(self, hero, "Info_Mod_Judith_Pavillon_D_06_02"); //Als ich ihm sagte, dass ich noch mal kurz an die frische Luft müsste, weil mir übel sei, hat er geantwortet, Hauptsache, ich lande nicht beim Peter.
	AI_Output(hero, self, "Info_Mod_Judith_Pavillon_D_15_03"); //Ich bin Peter?
	AI_Output(self, hero, "Info_Mod_Judith_Pavillon_D_06_04"); //(ironisch) Sicher, mit dem würd ich mich auch gerade um diese Uhrzeit hier herumtreiben.
	AI_Output(self, hero, "Info_Mod_Judith_Pavillon_D_06_05"); //(neckisch) Treib nur deine Spielchen mit mir!
	AI_Output(hero, self, "Info_Mod_Judith_Pavillon_D_15_06"); //(mir ironischem Unterton) Du kennst mich doch!
	AI_Output(self, hero, "Info_Mod_Judith_Pavillon_D_06_07"); //Jetzt aber genug von Lukas. Ich muss nur etwas vorsichtiger sein.
	AI_Output(self, hero, "Info_Mod_Judith_Pavillon_D_06_08"); //Machen wir es uns ein wenig gemütlich!

	Info_ClearChoices	(Info_Mod_Judith_Pavillon);

	AI_StopProcessInfos	(self);

	Mod_JudithNacht = 1;
};

FUNC VOID Info_Mod_Judith_Pavillon_C()
{
	AI_Output(hero, self, "Info_Mod_Judith_Pavillon_C_15_00"); //Wollen wir nicht gleich zur Sache kommen?
	AI_Output(self, hero, "Info_Mod_Judith_Pavillon_C_06_01"); //Zu welcher Sache?
	AI_Output(hero, self, "Info_Mod_Judith_Pavillon_C_15_02"); //Na ja ... was wir sonst auch immer machen.
	AI_Output(self, hero, "Info_Mod_Judith_Pavillon_C_06_03"); //Immer? Das ist unser drittes Treffen! Langsam habe ich das Gefühl ...

	AI_GotoNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Judith_Pavillon_C_06_04"); //Ah! Du bist nicht ... nicht der Richtige!

	Info_ClearChoices	(Info_Mod_Judith_Pavillon);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Judith_Pavillon2 (C_INFO)
{
	npc		= Mod_7680_OUT_Judith_REL;
	nr		= 1;
	condition	= Info_Mod_Judith_Pavillon2_Condition;
	information	= Info_Mod_Judith_Pavillon2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Judith_Pavillon2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Judith_Pavillon))
	&& (Mod_JudithNacht == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Judith_Pavillon2_Info()
{
	AI_Output(self, hero, "Info_Mod_Judith_Pavillon2_06_00"); //Wann sehen wir uns wieder?
	AI_Output(hero, self, "Info_Mod_Judith_Pavillon2_15_01"); //Wann immer du willst.
	AI_Output(self, hero, "Info_Mod_Judith_Pavillon2_06_02"); //Morgen, gleiche Zeit?
	AI_Output(hero, self, "Info_Mod_Judith_Pavillon2_15_03"); //Gern. Aber vielleicht bin ich nicht pünktlich.
	AI_Output(self, hero, "Info_Mod_Judith_Pavillon2_06_04"); //(lacht) Das sagst du immer. Und bist dann doch immer pünktlich. Bis morgen!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "RUPRECHT");
};

INSTANCE Info_Mod_Judith_Pickpocket (C_INFO)
{
	npc		= Mod_7680_OUT_Judith_REL;
	nr		= 1;
	condition	= Info_Mod_Judith_Pickpocket_Condition;
	information	= Info_Mod_Judith_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Judith_Pickpocket_Condition()
{
	C_Beklauen	(47, ItMi_Gold, 150);
};

FUNC VOID Info_Mod_Judith_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Judith_Pickpocket);

	Info_AddChoice	(Info_Mod_Judith_Pickpocket, DIALOG_BACK, Info_Mod_Judith_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Judith_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Judith_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Judith_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Judith_Pickpocket);
};

FUNC VOID Info_Mod_Judith_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Judith_Pickpocket);
};

INSTANCE Info_Mod_Judith_EXIT (C_INFO)
{
	npc		= Mod_7680_OUT_Judith_REL;
	nr		= 1;
	condition	= Info_Mod_Judith_EXIT_Condition;
	information	= Info_Mod_Judith_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Judith_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Judith_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};