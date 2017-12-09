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

INSTANCE Info_Mod_Esteban_NW_Castlemine (C_INFO)
{
	npc		= Mod_1926_BDT_Esteban_NW;
	nr		= 1;
	condition	= Info_Mod_Esteban_NW_Castlemine_Condition;
	information	= Info_Mod_Esteban_NW_Castlemine_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und, wie läuft es bei dir jetzt in Khorinis?";
};

FUNC INT Info_Mod_Esteban_NW_Castlemine_Condition()
{
	if (Mod_Banditen_Irdorath_NW == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_NW_Castlemine_Info()
{
	AI_Output(hero, self, "Info_Mod_Esteban_NW_Castlemine_15_00"); //Und, wie läuft es bei dir jetzt in Khorinis?
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Castlemine_07_01"); //(schlecht gelaunt) Ich hatte gehofft mehr rausholen zu können aus meiner Rückkehr hierher ...
	AI_Output(hero, self, "Info_Mod_Esteban_NW_Castlemine_15_02"); //Was meinst du?
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Castlemine_07_03"); //Ausstehende Rechnungen. Bevor man mich nämlich in die Kolonie warf, hatte ich einige Rücklagen ganz in der Nähe deponiert.
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Castlemine_07_04"); //Aber dass sich die Söldner jetzt als Schutzherren der Bauern geben verhindert, dass ich diese bergen kann.
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Castlemine_07_05"); //Aber eines Nachts schleich ich mich zu diesem dreckigen Sekob und prügele es aus ihm heraus ...
	AI_Output(hero, self, "Info_Mod_Esteban_NW_Castlemine_15_06"); //Sekob der Bauer? Was hat der damit zu tun?
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Castlemine_07_07"); //Nun, bei ihm lagern meine Sachen. Ich hatte ihm damals einen Batzen Gold gegeben, dass er sie für mich verwahrt.
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Castlemine_07_08"); //Aber als ich jetzt bei ihm war, um die Dinge abzuholen, hat er mir nur damit gedroht die Söldner auf mich zu hetzen, wenn ich mich noch mal bei ihm blicken lasse.
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Castlemine_07_09"); //Es hat mich einiges an Beherrschung gekostet ihm nicht auf der Stelle den Schädel einzuschlagen.
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Castlemine_07_10"); //Aber einen Konflikt mit den Söldnern können wir uns leider nicht leisten.

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Esteban_NW_Castlemine_07_11"); //(zu sich selbst) Die Sachen sind bestimmt in der verschlossenen Truhe.

	AI_TurnToNpc	(self, hero);
};

INSTANCE Info_Mod_Esteban_NW_Castlemine2 (C_INFO)
{
	npc		= Mod_1926_BDT_Esteban_NW;
	nr		= 1;
	condition	= Info_Mod_Esteban_NW_Castlemine2_Condition;
	information	= Info_Mod_Esteban_NW_Castlemine2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe deine 'Rücklagen'.";
};

FUNC INT Info_Mod_Esteban_NW_Castlemine2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Esteban_NW_Castlemine))
	&& (Npc_HasItems(hero, ItMi_EstebanPaket_01) == 1)
	&& (Npc_HasItems(hero, ItMi_EstebanPaket_02) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Esteban_NW_Castlemine2_Info()
{
	AI_Output(hero, self, "Info_Mod_Esteban_NW_Castlemine2_15_00"); //Ich habe deine "Rücklagen".
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Castlemine2_07_01"); //Tatsache! Da bin aber baff. Ich hoffe aber doch, dass wir nicht bald wütende Söldner abwehren müssen?
	AI_Output(hero, self, "Info_Mod_Esteban_NW_Castlemine2_15_02"); //Da mach dir mal keine Sorgen.
	AI_Output(self, hero, "Info_Mod_Esteban_NW_Castlemine2_07_03"); //Ausgezeichnet! Da hast du wirklich gute Arbeit geleistet. Hier, nimm zum Dank etwas Kraut, Erz und Gold.

	B_ShowGivenThings	("300 Gold, 10 Erz, 5 Schwarzer Weiser und 4 Traumrufe erhalten");

	CreateInvItems	(hero, ItMi_Gold, 300);
	CreateInvItems	(hero, ItMi_Nugget, 10);
	CreateInvItems	(hero, ItMi_Addon_Joint_02, 5);
	CreateInvItems	(hero, ItMi_Traumruf, 4);

	AI_Output(self, hero, "Info_Mod_Esteban_NW_Castlemine2_07_04"); //Achja, diesen Ring sollst du auch haben. Er kann dir immer nützlich sein, wenn du jemandem mit etwas Nachdruck um dessen Wertsachen erleichtern willst. Viel Spaß damit.

	B_GiveInvItems	(self, hero, ItRi_Verschlagenheit, 1);

	B_GivePlayerXP	(500);
};

INSTANCE Info_Mod_Esteban_NW_Pickpocket (C_INFO)
{
	npc		= Mod_1926_BDT_Esteban_NW;
	nr		= 1;
	condition	= Info_Mod_Esteban_NW_Pickpocket_Condition;
	information	= Info_Mod_Esteban_NW_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Esteban_NW_Pickpocket_Condition()
{
	C_Beklauen	(78, ItMi_Gold, 29);
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
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Esteban_NW_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Esteban_NW_Pickpocket);

		Info_AddChoice	(Info_Mod_Esteban_NW_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Esteban_NW_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Esteban_NW_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Esteban_NW_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Esteban_NW_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Esteban_NW_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Esteban_NW_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Esteban_NW_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Esteban_NW_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Esteban_NW_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Esteban_NW_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Esteban_NW_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Esteban_NW_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
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