INSTANCE Info_Mod_Drake_Hi (C_INFO)
{
	npc		= Mod_7798_SMK_Drake_OM;
	nr		= 1;
	condition	= Info_Mod_Drake_Hi_Condition;
	information	= Info_Mod_Drake_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Drake_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Drake_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Drake_Hi_11_00"); //Ahh, ein Neuer.
	AI_Output(hero, self, "Info_Mod_Drake_Hi_15_01"); //Was meinst du?
	AI_Output(self, hero, "Info_Mod_Drake_Hi_11_02"); //Naja, du gehörst nicht zu uns Jungs, die wir damals hier verschüttet wurden.
};

INSTANCE Info_Mod_Drake_WhatHappened (C_INFO)
{
	npc		= Mod_7798_SMK_Drake_OM;
	nr		= 1;
	condition	= Info_Mod_Drake_WhatHappened_Condition;
	information	= Info_Mod_Drake_WhatHappened_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist damals passiert.";
};

FUNC INT Info_Mod_Drake_WhatHappened_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Drake_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Drake_WhatHappened_Info()
{
	AI_Output(hero, self, "Info_Mod_Drake_WhatHappened_15_00"); //Was ist damals passiert.
	AI_Output(self, hero, "Info_Mod_Drake_WhatHappened_11_01"); //Du bist wohl noch nicht lange dabei, oder?
	AI_Output(self, hero, "Info_Mod_Drake_WhatHappened_11_02"); //Ach, weißt du, ich würde dir ja gerne alles erzählen, aber von der staubigen Luft in der Mine ist mir gerade die Kehle so trocken, wenn du verstehst ...
};

INSTANCE Info_Mod_Drake_WhatHappened2 (C_INFO)
{
	npc		= Mod_7798_SMK_Drake_OM;
	nr		= 1;
	condition	= Info_Mod_Drake_WhatHappened2_Condition;
	information	= Info_Mod_Drake_WhatHappened2_Info;
	permanent	= 0;
	important	= 0;
	description	= "(einen ausgeben)";
};

FUNC INT Info_Mod_Drake_WhatHappened2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Drake_WhatHappened))
	&& (Npc_HasItems(hero, ItFo_Beer) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Drake_WhatHappened2_Info()
{
	B_GiveInvItems	(hero, self, ItFo_Beer, 1);

	B_UseItem	(self, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Drake_WhatHappened2_11_00"); //Ahh, das tat gut. Ok, wo waren wir ... genau ... also, da als wir ohne an etwas böses zu denken in der Mine saßen und jeder seinen Job gemacht hat, fing die Erde auf einmal an zu beben und zu rumpeln, dass es nichts auf seinem Fleck hielt.
	AI_Output(self, hero, "Info_Mod_Drake_WhatHappened2_11_01"); //Es ist dann auch so einiges eingestürzt und viele Jungs fanden den Tod ... nur ein paar Meter hinter mir wurde zum Beispiel Santino von Felsen erschlagen.
	AI_Output(self, hero, "Info_Mod_Drake_WhatHappened2_11_02"); //Was aber für die Überlebenden am schlimmsten war: Der Eingang war von Tonnenschweren Felsbrocken versperrt ... aussichtslos da je wieder raus zukommen.
	AI_Output(self, hero, "Info_Mod_Drake_WhatHappened2_11_03"); //Wir hatten alle schon unseren Frieden mit dem Jenseits gemacht, als nach zwei Wochen die Dämonenmagier mit ihren Kreaturen plötzlich den Weg nach draußen freigehauen hatten ... nicht vom alten Eingang aus, sondern über eine unbekannte Festung!
	AI_Output(self, hero, "Info_Mod_Drake_WhatHappened2_11_04"); //Kannst du dir das vorstellen?! Das waren hunderte Meter Gestein! Dafür hätten 100 Buddler paar Jahrzehnte gebraucht!
	AI_Output(hero, self, "Info_Mod_Drake_WhatHappened2_15_05"); //Und die haben dann die Mine übernommen?
	AI_Output(self, hero, "Info_Mod_Drake_WhatHappened2_11_06"); //Klar, die haben ja auch die Mine wieder freigelegt. Von uns sind die meisten dageblieben und haben sich ihnen angeschlossen.
	AI_Output(self, hero, "Info_Mod_Drake_WhatHappened2_11_07"); //Hat sich von selbst verstanden, nach den Geschehnissen.
};

INSTANCE Info_Mod_Drake_EXIT (C_INFO)
{
	npc		= Mod_7798_SMK_Drake_OM;
	nr		= 1;
	condition	= Info_Mod_Drake_EXIT_Condition;
	information	= Info_Mod_Drake_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Drake_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Drake_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};