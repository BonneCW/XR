INSTANCE Info_Mod_Lester_REL_Hi (C_INFO)
{
	npc		= Mod_7612_PSINOV_Lester_REL;
	nr		= 1;
	condition	= Info_Mod_Lester_REL_Hi_Condition;
	information	= Info_Mod_Lester_REL_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du hier?";
};

FUNC INT Info_Mod_Lester_REL_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lester_REL_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_REL_Hi_15_00"); //Du hier?
	AI_Output(self, hero, "Info_Mod_Lester_REL_Hi_41_01"); //(bekifft) Bist du schon einmal zugedröhnt mit dieser Lore gefahren? Ich sag dir, das ist ein Erlebnis, das du nicht so schnell vergessen wirst.
	AI_Output(self, hero, "Info_Mod_Lester_REL_Hi_41_02"); //Ich glaube, ich fahr direkt noch mal zurück und wieder hin.
	AI_Output(hero, self, "Info_Mod_Lester_REL_Hi_15_03"); //Schön und gut, aber weshalb bist du eigentlich hier?
	AI_Output(self, hero, "Info_Mod_Lester_REL_Hi_41_04"); //Hast du schon mal von Khorata gehört?
	AI_Output(hero, self, "Info_Mod_Lester_REL_Hi_15_05"); //Nicht wirklich.
	AI_Output(self, hero, "Info_Mod_Lester_REL_Hi_41_06"); //Von allem, was ich gehört habe, ist die Stadt nah dran am Paradies.
	AI_Output(self, hero, "Info_Mod_Lester_REL_Hi_41_07"); //Jeder, der will, wird reingelassen und darf dort sein gemütliches Leben führen.
	AI_Output(self, hero, "Info_Mod_Lester_REL_Hi_41_08"); //Die Stadtverwaltung besteht aus einem einzigen Mann, der nur darauf achtet, dass das Chaos nicht überhandnimmt.
	AI_Output(self, hero, "Info_Mod_Lester_REL_Hi_41_09"); //In dem nahen Hofstaat wird etwas gewonnen, das sich Freudenspender nennt, und viel effektiver sein soll als Sumpfkraut.
	AI_Output(self, hero, "Info_Mod_Lester_REL_Hi_41_10"); //Das kann ich mir fast nicht vorstellen, aber ausprobieren schadet ja nicht.
};

INSTANCE Info_Mod_Lester_REL_VonWem (C_INFO)
{
	npc		= Mod_7612_PSINOV_Lester_REL;
	nr		= 1;
	condition	= Info_Mod_Lester_REL_VonWem_Condition;
	information	= Info_Mod_Lester_REL_VonWem_Info;
	permanent	= 0;
	important	= 0;
	description	= "Von wem hast du das gehört?";
};

FUNC INT Info_Mod_Lester_REL_VonWem_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_REL_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_REL_VonWem_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_REL_VonWem_15_00"); //Von wem hast du das gehört?
	AI_Output(self, hero, "Info_Mod_Lester_REL_VonWem_41_01"); //Ich hab's auf dem Marktplatz von Khorinis aufgeschnappt. Ich glaube, Baltram hat davon erzählt.
	AI_Output(self, hero, "Info_Mod_Lester_REL_VonWem_41_02"); //Der Bekanntheitsgrad von Khorata ist allerdings erstaunlich gering.
	AI_Output(self, hero, "Info_Mod_Lester_REL_VonWem_41_03"); //Es scheint niemand das Bedürfnis zu haben, die Vorteile an die große Glocke zu hängen. Kann mir nur recht sein.
};

INSTANCE Info_Mod_Lester_REL_Zusammen (C_INFO)
{
	npc		= Mod_7612_PSINOV_Lester_REL;
	nr		= 1;
	condition	= Info_Mod_Lester_REL_Zusammen_Condition;
	information	= Info_Mod_Lester_REL_Zusammen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lass uns zusammen gehen.";
};

FUNC INT Info_Mod_Lester_REL_Zusammen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_REL_Hi))
	&& (Npc_GetDistToWP(self, "REL_001") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_REL_Zusammen_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_REL_Zusammen_15_00"); //Lass uns zusammen gehen.
	AI_Output(self, hero, "Info_Mod_Lester_REL_Zusammen_41_01"); //Ein andermal. Ich will erst noch unbedingt ein paar Fahrten mit dieser Lore unternehmen ...
};

INSTANCE Info_Mod_Lester_REL_Gefallen (C_INFO)
{
	npc		= Mod_7612_PSINOV_Lester_REL;
	nr		= 1;
	condition	= Info_Mod_Lester_REL_Gefallen_Condition;
	information	= Info_Mod_Lester_REL_Gefallen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie gefällt es dir hier?";
};

FUNC INT Info_Mod_Lester_REL_Gefallen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_REL_Hi))
	&& (Npc_GetDistToWP(self, "REL_CITY_111") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_REL_Gefallen_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_REL_Gefallen_15_00"); //Wie gefällt es dir hier?
	AI_Output(self, hero, "Info_Mod_Lester_REL_Gefallen_41_01"); //Der Freudenspender haut einen wirklich um. (lacht) Verflucht gutes Zeug. Aber Khorata ...
	AI_Output(self, hero, "Info_Mod_Lester_REL_Gefallen_41_02"); //Ich hatte gedacht, eine freie Stadt vorzufinden, aber Khorata wird von Missgunst und Willkür regiert.
	AI_Output(self, hero, "Info_Mod_Lester_REL_Gefallen_41_03"); //Das größte Problem an jeder Gemeinschaft ist und bleibt der Mensch.
};

INSTANCE Info_Mod_Lester_REL_FindeOrt (C_INFO)
{
	npc		= Mod_7612_PSINOV_Lester_REL;
	nr		= 1;
	condition	= Info_Mod_Lester_REL_FindeOrt_Condition;
	information	= Info_Mod_Lester_REL_FindeOrt_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich finde mich hier kaum zurecht.";
};

FUNC INT Info_Mod_Lester_REL_FindeOrt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_REL_Hi))
	&& (Npc_GetDistToWP(self, "REL_CITY_111") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_REL_FindeOrt_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_REL_FindeOrt_15_00"); //Ich finde mich hier kaum zurecht.
	AI_Output(self, hero, "Info_Mod_Lester_REL_FindeOrt_41_01"); //Was genau findest du nicht?

	Info_ClearChoices	(Info_Mod_Lester_REL_FindeOrt);

	Info_AddChoice	(Info_Mod_Lester_REL_FindeOrt, DIALOG_BACK, Info_Mod_Lester_REL_FindeOrt_BACK);

	if (Mod_Wendel_FettNehmer == 1)
	{
		Info_AddChoice	(Info_Mod_Lester_REL_FindeOrt, "Ich suche einen Troll.", Info_Mod_Lester_REL_FindeOrt_D);	
	};
	if (Npc_KnowsInfo(hero, Info_Mod_Heiler_Endres))
	{
		Info_AddChoice	(Info_Mod_Lester_REL_FindeOrt, "Ich suche die Mine.", Info_Mod_Lester_REL_FindeOrt_C);	
	};
	if (Mod_REL_Frauenkleider >= 1)
	{
		Info_AddChoice	(Info_Mod_Lester_REL_FindeOrt, "Ich suche Banditen in Relendel.", Info_Mod_Lester_REL_FindeOrt_B);	
	};
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Landvermessung))
	{
		Info_AddChoice	(Info_Mod_Lester_REL_FindeOrt, "Ich suche Vincent.", Info_Mod_Lester_REL_FindeOrt_A);	
	};
};

FUNC VOID B_Lester_Say_Alleine()
{
	AI_Output(hero, self, "Info_Mod_Lester_REL_FindeOrt_Alleine_15_00"); //Das schaffe ich schon allein.
};

FUNC VOID B_Lester_Say_Zusammen()
{
	AI_Output(hero, self, "Info_Mod_Lester_REL_FindeOrt_Zusammen_15_00"); //Zeig mir den Weg.
	AI_Output(self, hero, "DEFAULT"); //
};

FUNC VOID Info_Mod_Lester_REL_FindeOrt_BACK()
{
	Info_ClearChoices	(Info_Mod_Lester_REL_FindeOrt);
};

FUNC VOID Info_Mod_Lester_REL_FindeOrt_D()
{
	AI_Output(hero, self, "Info_Mod_Lester_REL_FindeOrt_D_15_00"); //Ich suche einen Troll.
	AI_Output(self, hero, "Info_Mod_Lester_REL_FindeOrt_D_41_01"); //(lacht) Normalerweise sucht man eher eine Möglichkeit, ihm aus dem Weg zu gehen.
	AI_Output(self, hero, "Info_Mod_Lester_REL_FindeOrt_D_41_02"); //Aber ich habe von einem Händler des Hofstaats gehört, dass ein Troll den Pass dorthin unsicher machen soll.
	AI_Output(self, hero, "Info_Mod_Lester_REL_FindeOrt_D_41_03"); //Brauchst du meine Hilfe?

	Info_ClearChoices	(Info_Mod_Lester_REL_FindeOrt);

	Info_AddChoice	(Info_Mod_Lester_REL_FindeOrt, "Das schaffe ich schon allein.", Info_Mod_Lester_REL_FindeOrt_D2);
	Info_AddChoice	(Info_Mod_Lester_REL_FindeOrt, "Zeig mir den Weg.", Info_Mod_Lester_REL_FindeOrt_D1);
};

FUNC VOID Info_Mod_Lester_REL_FindeOrt_D2()
{
	B_Lester_Say_Alleine();

	Info_ClearChoices	(Info_Mod_Lester_REL_FindeOrt);
};

FUNC VOID Info_Mod_Lester_REL_FindeOrt_D1()
{
	B_Lester_Say_Zusammen();

	Info_ClearChoices	(Info_Mod_Lester_REL_FindeOrt);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDETOTROLL");

	self.aivar[AIV_Partymember] = TRUE;

	Mod_LesterRelGuide = 4;
};

FUNC VOID Info_Mod_Lester_REL_FindeOrt_C()
{
	AI_Output(hero, self, "Info_Mod_Lester_REL_FindeOrt_C_15_00"); //Ich suche die Mine.
	AI_Output(self, hero, "Info_Mod_Lester_REL_FindeOrt_C_41_01"); //Kein Problem, die Mine ist von der Stadt aus ausgeschildert. Soll ich dich begleiten?

	Info_ClearChoices	(Info_Mod_Lester_REL_FindeOrt);

	Info_AddChoice	(Info_Mod_Lester_REL_FindeOrt, "Das schaffe ich schon allein.", Info_Mod_Lester_REL_FindeOrt_C2);
	Info_AddChoice	(Info_Mod_Lester_REL_FindeOrt, "Zeig mir den Weg.", Info_Mod_Lester_REL_FindeOrt_C1);
};

FUNC VOID Info_Mod_Lester_REL_FindeOrt_C2()
{
	B_Lester_Say_Alleine();

	Info_ClearChoices	(Info_Mod_Lester_REL_FindeOrt);
};

FUNC VOID Info_Mod_Lester_REL_FindeOrt_C1()
{
	B_Lester_Say_Zusammen();

	Info_ClearChoices	(Info_Mod_Lester_REL_FindeOrt);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDETOMINE");

	self.aivar[AIV_Partymember] = TRUE;

	Mod_LesterRelGuide = 3;
};

FUNC VOID Info_Mod_Lester_REL_FindeOrt_B()
{
	AI_Output(hero, self, "Info_Mod_Lester_REL_FindeOrt_B_15_00"); //Ich suche Banditen in Relendel.
	AI_Output(self, hero, "Info_Mod_Lester_REL_FindeOrt_B_41_01"); //Der Bauer Erhard hat sich schon häufiger beschwert, dass Banditen in der Nähe seines Bauernhofes seien.
	AI_Output(self, hero, "Info_Mod_Lester_REL_FindeOrt_B_41_02"); //Sie sollten nicht allzu schwierig zu finden sein. Sollen wir zusammen suchen gehen?

	Info_ClearChoices	(Info_Mod_Lester_REL_FindeOrt);

	Info_AddChoice	(Info_Mod_Lester_REL_FindeOrt, "Das schaffe ich schon allein.", Info_Mod_Lester_REL_FindeOrt_B2);
	Info_AddChoice	(Info_Mod_Lester_REL_FindeOrt, "Zeig mir den Weg.", Info_Mod_Lester_REL_FindeOrt_B1);
};

FUNC VOID Info_Mod_Lester_REL_FindeOrt_B2()
{
	B_Lester_Say_Alleine();

	Info_ClearChoices	(Info_Mod_Lester_REL_FindeOrt);
};

FUNC VOID Info_Mod_Lester_REL_FindeOrt_B1()
{
	B_Lester_Say_Zusammen();

	Info_ClearChoices	(Info_Mod_Lester_REL_FindeOrt);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDETOMELVIN");

	self.aivar[AIV_Partymember] = TRUE;

	Mod_LesterRelGuide = 2;
};

FUNC VOID Info_Mod_Lester_REL_FindeOrt_A()
{
	AI_Output(hero, self, "Info_Mod_Lester_REL_FindeOrt_A_15_00"); //Ich suche Vincent.
	AI_Output(self, hero, "Info_Mod_Lester_REL_FindeOrt_A_41_01"); //Ja, über Vincent habe ich auch schon einiges gehört.
	AI_Output(self, hero, "Info_Mod_Lester_REL_FindeOrt_A_41_02"); //Er soll sein Zelt irgendwo westlich des großen Sees in Relendel aufgeschlagen haben.
	AI_Output(self, hero, "Info_Mod_Lester_REL_FindeOrt_A_41_03"); //Wenn du willst, können wir zusammen nachschauen.

	Info_ClearChoices	(Info_Mod_Lester_REL_FindeOrt);

	Info_AddChoice	(Info_Mod_Lester_REL_FindeOrt, "Das schaffe ich schon allein.", Info_Mod_Lester_REL_FindeOrt_A2);
	Info_AddChoice	(Info_Mod_Lester_REL_FindeOrt, "Zeig mir den Weg.", Info_Mod_Lester_REL_FindeOrt_A1);
};

FUNC VOID Info_Mod_Lester_REL_FindeOrt_A2()
{
	B_Lester_Say_Alleine();

	Info_ClearChoices	(Info_Mod_Lester_REL_FindeOrt);
};

FUNC VOID Info_Mod_Lester_REL_FindeOrt_A1()
{
	B_Lester_Say_Zusammen();

	Info_ClearChoices	(Info_Mod_Lester_REL_FindeOrt);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDETOVINCENT");

	self.aivar[AIV_Partymember] = TRUE;

	Mod_LesterRelGuide = 1;
};

INSTANCE Info_Mod_Lester_REL_AtTroll (C_INFO)
{
	npc		= Mod_7612_PSINOV_Lester_REL;
	nr		= 1;
	condition	= Info_Mod_Lester_REL_AtTroll_Condition;
	information	= Info_Mod_Lester_REL_AtTroll_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lester_REL_AtTroll_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_REL_Hi))
	&& (Npc_GetDistToWP(self, "RELWIDNIS_20") < 500)
	&& (Mod_LesterRELGuide == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_REL_AtTroll_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_REL_AtTroll_41_00"); //Na, wenn das mal kein Brocken ist. Bist du sicher, dass du den fällen willst?
	AI_Output(hero, self, "Info_Mod_Lester_REL_AtTroll_15_01"); //Wofür sind wir sonst den weiten Weg gelaufen?
	AI_Output(self, hero, "Info_Mod_Lester_REL_AtTroll_41_02"); //Na schön. Zu zweit packen wir ihn.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Lester_REL_AtTroll2 (C_INFO)
{
	npc		= Mod_7612_PSINOV_Lester_REL;
	nr		= 1;
	condition	= Info_Mod_Lester_REL_AtTroll2_Condition;
	information	= Info_Mod_Lester_REL_AtTroll2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lester_REL_AtTroll2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_REL_Hi))
	&& (Npc_GetDistToWP(self, "RELWIDNIS_21") < 500)
	&& (Mod_LesterRELGuide == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_REL_AtTroll2_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_REL_AtTroll2_41_00"); //Das wäre geschafft.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "MARKT");

	self.aivar[AIV_Partymember] = FALSE;

	Mod_LesterRelGuide = 0;
};

INSTANCE Info_Mod_Lester_REL_AtMine (C_INFO)
{
	npc		= Mod_7612_PSINOV_Lester_REL;
	nr		= 1;
	condition	= Info_Mod_Lester_REL_AtMine_Condition;
	information	= Info_Mod_Lester_REL_AtMine_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Lester_REL_AtMine_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_REL_Hi))
	&& (Npc_GetDistToWP(self, "REL_SURFACE_206") < 500)
	&& (Mod_LesterRELGuide == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_REL_AtMine_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_REL_AtMine_41_00"); //Hier ist der Eingang der Mine. Viel Spaß dort drinnen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "MARKT");

	self.aivar[AIV_Partymember] = FALSE;

	Mod_LesterRelGuide = 0;
};

INSTANCE Info_Mod_Lester_REL_AtMelvin (C_INFO)
{
	npc		= Mod_7612_PSINOV_Lester_REL;
	nr		= 1;
	condition	= Info_Mod_Lester_REL_AtMelvin_Condition;
	information	= Info_Mod_Lester_REL_AtMelvin_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Lester_REL_AtMelvin_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_REL_Hi))
	&& (Npc_GetDistToWP(self, "REL_SURFACE_045") < 500)
	&& (Mod_LesterRELGuide == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_REL_AtMelvin_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_REL_AtMelvin_41_00"); //Da vorn sehe ich ein Lager mit mehreren Zelten. Das sollten die Banditen sein, die du suchst.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "MARKT");

	self.aivar[AIV_Partymember] = FALSE;

	Mod_LesterRelGuide = 0;
};

INSTANCE Info_Mod_Lester_REL_AtVincent (C_INFO)
{
	npc		= Mod_7612_PSINOV_Lester_REL;
	nr		= 1;
	condition	= Info_Mod_Lester_REL_AtVincent_Condition;
	information	= Info_Mod_Lester_REL_AtVincent_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Lester_REL_AtVincent_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_REL_Hi))
	&& (Npc_GetDistToWP(self, "REL_SURFACE_026") < 500)
	&& (Mod_LesterRELGuide == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_REL_AtVincent_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_REL_AtVincent_41_00"); //Hier ist der große See, von dem ich gesprochen habe. Auf der gegenüberliegenden Seite solltest du Vincent finden.
	AI_Output(self, hero, "Info_Mod_Lester_REL_AtVincent_41_01"); //Ich kehre jetzt zurück in die Stadt. Die Rennerei ist zu viel für mich.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "MARKT");

	self.aivar[AIV_Partymember] = FALSE;

	Mod_LesterRelGuide = 0;
};

INSTANCE Info_Mod_Lester_REL_EXIT (C_INFO)
{
	npc		= Mod_7612_PSINOV_Lester_REL;
	nr		= 1;
	condition	= Info_Mod_Lester_REL_EXIT_Condition;
	information	= Info_Mod_Lester_REL_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lester_REL_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lester_REL_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};