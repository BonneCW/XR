INSTANCE Info_Mod_Esteban_NW_Hi (C_INFO)
{
	npc		= Mod_1926_BDT_Esteban_NW;
	nr		= 1;
	condition	= Info_Mod_Esteban_NW_Hi_Condition;
	information	= Info_Mod_Esteban_NW_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Whistler schickt mich.";
};

FUNC INT Info_Mod_Esteban_NW_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Whistler_NW_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_NW_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Esteban_NW_Hi_15_00"); //Whistler hat mich zu dir geschickt. Er meinte, du könntest uns helfen den Einfluss des Lager auszuweiten.
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Hi_07_01"); //Das könnte ich vermutlich wirklich. Auch wenn du es nicht glaubst, wir Banditen sind mächtig.
	AI_Output(hero, self, "Info_Mod_Esteban_NW_Hi_15_02"); //Und was genau könnt ihr für uns tun?
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Hi_07_03"); //Einer unserer Leute, Morgahard, ist momentan auf dem Hof des Grossbauern und behält für uns die Söldner im Auge.
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Hi_07_04"); //Nun, ich will nicht näher darauf eingehen, allerdings hat er bei einigen wichtigen Leuten einen Stein im Brett.
	AI_Output(hero, self, "Info_Mod_Esteban_NW_Hi_15_05"); //Und welche Rolle spiele ich dabei?
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Hi_07_06"); //Nun, er hat ein kleinen Problem mit einigen mächtigen Leuten der Stadt Khorinis.
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Hi_07_07"); //Er wurde damals aufgrund eines Verbrechens, das man ihm  angedichtet hat, in die Kolonie geworfen. Er wurde ihnen zu einflussreich.
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Hi_07_08"); //Seitdem kann er sich nicht mehr in der Stadt blicken lassen. Wenn du allerdings Beweise für seine Unschuld findest, könnten wir auch euch helfen.
	AI_Output(hero, self, "Info_Mod_Esteban_NW_Hi_15_09"); //OK, wo soll ich suchen?
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Hi_07_10"); //Unterhalte dich mal mit Cornelius, dem stellvertretenden Statthalter.

	Log_CreateTopic	(TOPIC_MOD_AL_MORGAHARD, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_MORGAHARD, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_AL_AUSBREITUNGK, TOPIC_MOD_AL_MORGAHARD, "Esteban sagte mir, dass wir es Morgahard erst möglich machen sollen in die Stadt zu kommen, bevor er uns helfen wird.", "Esteban will, dass Morgahard wieder in die Stadt kann. Dafür soll ich mal mit Cornelius, dem stellvertretenden Statthalter, sprechen.");
};

INSTANCE Info_Mod_Esteban_NW_Gerbrandt (C_INFO)
{
	npc		= Mod_1926_BDT_Esteban_NW;
	nr		= 1;
	condition	= Info_Mod_Esteban_NW_Gerbrandt_Condition;
	information	= Info_Mod_Esteban_NW_Gerbrandt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe herausgefunden, dass Gerbrandt mit der Sache zu tun hat.";
};

FUNC INT Info_Mod_Esteban_NW_Gerbrandt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gerbrandt_Cornelius))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_NW_Gerbrandt_Info()
{
	AI_Output(hero, self, "Info_Mod_Esteban_NW_Gerbrandt_15_00"); //Ich habe herausgefunden, dass Gerbrandt mit der Sache zu tun hat. Allerdings kann ich ihm nichts nachweisen.
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Gerbrandt_07_01"); //Wegen Gerbrandt solltest du mal mit Diego reden, er kennt ihn schon länger.

	B_LogEntry	(TOPIC_MOD_AL_MORGAHARD, "Esteban meinte, Diego könne mir helfen.");

	Mob_CreateItems	("GERBRANDTSTRUHE", ItWr_AL_GebrandtDokumente, 1);
};

INSTANCE Info_Mod_Esteban_NW_MorgahardDarfWieder (C_INFO)
{
	npc		= Mod_1926_BDT_Esteban_NW;
	nr		= 1;
	condition	= Info_Mod_Esteban_NW_MorgahardDarfWieder_Condition;
	information	= Info_Mod_Esteban_NW_MorgahardDarfWieder_Info;
	permanent	= 0;
	important	= 0;
	description	= "Morgahard kann wieder in die Stadt.";
};

FUNC INT Info_Mod_Esteban_NW_MorgahardDarfWieder_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_GerbrandtGefangen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_NW_MorgahardDarfWieder_Info()
{
	AI_Output(hero, self, "Info_Mod_Esteban_NW_MorgahardDarfWieder_15_00"); //Morgahard kann wieder in die Stadt.
	AI_Output(self, hero, "Info_Mod_Esteban_NW_MorgahardDarfWieder_07_01"); //Gut, ich gehe wieder zurück ins Minental, wende dich ab jetzt an Morgahard.

	B_LogEntry_More	(TOPIC_MOD_AL_MORGAHARD, TOPIC_MOD_AL_AUSBREITUNGK, "Esteban wird zurück ins Minental gehen. Ich soll mich jetzt an Morgahard halten.", "Morgahard darf wieder in die Stadt und ist nun meine Kontaktperson");
	B_SetTopicStatus	(TOPIC_MOD_AL_MORGAHARD, LOG_SUCCESS);

	B_GivePlayerXP	(500);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Esteban_NW_Kleidung (C_INFO)
{
	npc		= Mod_1926_BDT_Esteban_NW;
	nr		= 1;
	condition	= Info_Mod_Esteban_NW_Kleidung_Condition;
	information	= Info_Mod_Esteban_NW_Kleidung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Warum trägst du diese Kleidung?";
};

FUNC INT Info_Mod_Esteban_NW_Kleidung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Whistler_NW_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_NW_Kleidung_Info()
{
	AI_Output(hero, self, "Info_Mod_Esteban_NW_Kleidung_15_00"); //Warum trägst du diese Kleidung?
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Kleidung_07_01"); //Meinst du, ich spaziere mit der Banditenkleidung in die Stadt, sage den Stadtwachen "guten Tag" und bitte um eine Privataudienz bei Hagen?
};

INSTANCE Info_Mod_Esteban_NW_Pickpocket (C_INFO)
{
	npc		= Mod_1926_BDT_Esteban_NW;
	nr		= 1;
	condition	= Info_Mod_Esteban_NW_Pickpocket_Condition;
	information	= Info_Mod_Esteban_NW_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Esteban_NW_Pickpocket_Condition()
{
	C_Beklauen	(78, ItMi_Gold, 340);
};

FUNC VOID Info_Mod_Esteban_NW_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Esteban_NW_Pickpocket);

	Info_AddChoice	(Info_Mod_Esteban_NW_Pickpocket, DIALOG_BACK, Info_Mod_Esteban_NW_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Esteban_NW_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Esteban_NW_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Esteban_NW_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Esteban_NW_Pickpocket);
};

FUNC VOID Info_Mod_Esteban_NW_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Esteban_NW_Pickpocket);
};

INSTANCE Info_Mod_Esteban_NW_EXIT (C_INFO)
{
	npc		= Mod_1926_BDT_Esteban_NW;
	nr		= 1;
	condition	= Info_Mod_Esteban_NW_EXIT_Condition;
	information	= Info_Mod_Esteban_NW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Esteban_NW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Esteban_NW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};