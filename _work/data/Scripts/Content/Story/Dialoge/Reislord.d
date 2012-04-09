INSTANCE Info_Mod_Reislord_Hi (C_INFO)
{
	npc		= Mod_2002_BAU_Ricelord_MT;
	nr		= 1;
	condition	= Info_Mod_Reislord_Hi_Condition;
	information	= Info_Mod_Reislord_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Reislord_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lefty_BauernVerbatscht))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Reislord_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Reislord_Hi_12_00"); //Ahh, ich habe gehört, dass du uns geholfen hast. Ich werde ein gutes Wort bei Sylvio für dich einlegen. Dann bringst du es irgendwann zum Orkjäger.
	AI_Output(self, hero, "Info_Mod_Reislord_Hi_12_01"); //Und hier, nimm das Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	B_GivePlayerXP	(100);

	Mod_Reislord_DayChecker = Wld_GetDay();

	Mod_LeftysBauern = 4;

	B_SetTopicStatus	(TOPIC_MOD_SLD_LEFTYBAUERN, LOG_SUCCESS);
};

INSTANCE Info_Mod_Reislord_RufusDa (C_INFO)
{
	npc		= Mod_2002_BAU_Ricelord_MT;
	nr		= 1;
	condition	= Info_Mod_Reislord_RufusDa_Condition;
	information	= Info_Mod_Reislord_RufusDa_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Reislord_RufusDa_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lefty_RufusDa))
	&& (Mod_SLD_Rufus < 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Reislord_RufusDa_Info()
{
	AI_Output(self, hero, "Info_Mod_Reislord_RufusDa_12_00"); //Hey, du bist doch der Kerl, der Rufus dazu gebracht hat zurückzukommen. Die Bauern werden sich nun ein zweites mal überlegen abzuhauen.
	AI_Output(self, hero, "Info_Mod_Reislord_RufusDa_12_01"); //Hier, nimm dieses Gold und Erz.

	if (hero.guild == GIL_MIL)
	{
		AI_Output(self, hero, "Info_Mod_Reislord_RufusDa_12_02"); //Sylvio wird nur Gutes über dich zu hören bekommen.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Reislord_RufusDa_12_03"); //Gute Arbeit.
	};

	CreateInvItems	(hero, ItMi_Gold, 300);
	CreateInvItems	(hero, ItMi_Nugget, 8);

	B_ShowGivenThings	("300 Gold und 8 Erz erhalten");

	B_GivePlayerXP	(300);

	Mod_Reislord_DayChecker = Wld_GetDay();

	Mod_LeftysBauern = 6;

	Mod_SLD_Rufus = 7;

	B_SetTopicStatus	(TOPIC_MOD_SLD_RUFUS, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Reislord_RufusTot (C_INFO)
{
	npc		= Mod_2002_BAU_Ricelord_MT;
	nr		= 1;
	condition	= Info_Mod_Reislord_RufusTot_Condition;
	information	= Info_Mod_Reislord_RufusTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich wollte berichten, dass Rufus tot ist.";
};

FUNC INT Info_Mod_Reislord_RufusTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lefty_RufusTot))
	&& (Mod_SLD_Rufus < 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Reislord_RufusTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Reislord_RufusTot_15_00"); //Ich wollte berichten, dass Rufus tot ist.
	AI_Output(self, hero, "Info_Mod_Reislord_RufusTot_12_01"); //Wirklich?! Wie ist das passiert?

	if (Mod_SLD_Rufus == 5)
	{
		AI_Output(hero, self, "Info_Mod_Reislord_RufusTot_15_02"); //Ich habe ihn getötet.
		AI_Output(self, hero, "Info_Mod_Reislord_RufusTot_12_03"); //Naja, besser als wenn er geflohen wäre.

		if (hero.guild == GIL_MIL)
		{
			AI_Output(self, hero, "Info_Mod_Reislord_RufusTot_12_04"); //Sylvio wird es außerordentlich gefallen, davon zu hören.
			AI_Output(self, hero, "Info_Mod_Reislord_RufusTot_12_05"); //Und die Bauern werden keine Flucht mehr wagen. Hier, nimm das Gold.
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Reislord_RufusTot_12_06"); //Ausgezeichnete Arbeit. Die Bauern werden keine Flucht mehr wagen.
			AI_Output(self, hero, "Info_Mod_Reislord_RufusTot_12_07"); //Hier, nimm das Gold.
		};

		CreateInvItems	(hero, ItMi_Gold, 300);
		CreateInvItems	(hero, ItMi_Nugget, 5);

		B_ShowGivenThings	("300 Gold und 5 Erz erhalten");

		B_GivePlayerXP	(350);
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Reislord_RufusTot_15_08"); //Er wurde von wilden Tieren zerrissen.
		AI_Output(self, hero, "Info_Mod_Reislord_RufusTot_12_09"); //Gut. Sein Schicksal wird den anderen Bauern eine Warnung sein. Hier, nimm das Gold als Belohnung.

		B_GiveInvItems	(self, hero, ItMi_Gold, 250);

		if (hero.guild == GIL_MIL)
		{
			AI_Output(self, hero, "Info_Mod_Reislord_RufusTot_12_10"); //Sylvio wird nur Gutes über dich zu hören bekommen.
		};

		B_GivePlayerXP	(300);
	};

	Mod_Reislord_DayChecker = Wld_GetDay();

	Mod_LeftysBauern = 6;

	Mod_SLD_Rufus = 7;

	B_SetTopicStatus	(TOPIC_MOD_SLD_RUFUS, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Reislord_OJGBoss (C_INFO)
{
	npc		= Mod_2002_BAU_Ricelord_MT;
	nr		= 1;
	condition	= Info_Mod_Reislord_OJGBoss_Condition;
	information	= Info_Mod_Reislord_OJGBoss_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Reislord_OJGBoss_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lefty_OJGBoss))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Reislord_OJGBoss_Info()
{
	AI_Output(self, hero, "Info_Mod_Reislord_OJGBoss_12_00"); //(übertrieben freundlich) Ahh, da bist du ja. Es freut mich, dass du es so weit gebracht hast und Anführer der Orkjäger bist.
	AI_Output(self, hero, "Info_Mod_Reislord_OJGBoss_12_01"); //Sofort als ich dich gesehen habe wusste ich, das ist ein richtiger Haudegen ...
	AI_Output(hero, self, "Info_Mod_Reislord_OJGBoss_15_02"); //(unterbricht trocken) Komm endlich zur Sache.
	AI_Output(self, hero, "Info_Mod_Reislord_OJGBoss_12_03"); //(unterwürfig) Jaja, sofort.
	AI_Output(self, hero, "Info_Mod_Reislord_OJGBoss_12_04"); //(listig) Naja, da du jetzt Sylvios Platz eingenommen, steht dir jetzt der Anteil an, ähh, unseren Einnahmen zu. Gold, Erz und auch was gutes zur Verpflegung.

	Info_ClearChoices	(Info_Mod_Reislord_OJGBoss);

	Info_AddChoice	(Info_Mod_Reislord_OJGBoss, "Was meinst du mit Einnahmen?", Info_Mod_Reislord_OJGBoss_B);
	Info_AddChoice	(Info_Mod_Reislord_OJGBoss, "Da sage ich bestimmt nicht nein.", Info_Mod_Reislord_OJGBoss_A);
};

FUNC VOID Info_Mod_Reislord_OJGBoss_B()
{
	AI_Output(hero, self, "Info_Mod_Reislord_OJGBoss_B_15_00"); //Was meinst du mit Einnahmen?
	AI_Output(self, hero, "Info_Mod_Reislord_OJGBoss_B_12_01"); //Naja, ... ähh ... für die Arbeit, die wir hier leisten bekommen wir unseren Anteil an Erz, Gold und Waren von draußen.
	AI_Output(self, hero, "Info_Mod_Reislord_OJGBoss_B_12_02"); //(höhnisch) Aber so ein Bauer ist ja eigentlich recht genügsam und braucht nicht so viel.
	AI_Output(self, hero, "Info_Mod_Reislord_OJGBoss_B_12_03"); //Und davon nehmen wir dann eben auch unseren bescheidenen Anteil.
	AI_Output(self, hero, "Info_Mod_Reislord_OJGBoss_B_12_04"); //Und dir in deiner wichtigen Position im Lager steht selbstverständlich ein würdiger Teil davon zu.

	Info_ClearChoices	(Info_Mod_Reislord_OJGBoss);

	Info_AddChoice	(Info_Mod_Reislord_OJGBoss, "Weißt du was ... du gibst den Bauern jetzt den Anteil, der ihnen wirklich zusteht.", Info_Mod_Reislord_OJGBoss_C);
	Info_AddChoice	(Info_Mod_Reislord_OJGBoss, "Da sage ich bestimmt nicht nein.", Info_Mod_Reislord_OJGBoss_A);
};

FUNC VOID Info_Mod_Reislord_OJGBoss_C()
{
	AI_Output(hero, self, "Info_Mod_Reislord_OJGBoss_C_15_00"); //Weißt du was ... du gibst den Bauern jetzt den Anteil, der ihnen wirklich zusteht.
	AI_Output(self, hero, "Info_Mod_Reislord_OJGBoss_C_12_01"); //(verdutzt) Ähh, was ... wie ...
	AI_Output(hero, self, "Info_Mod_Reislord_OJGBoss_C_15_02"); //Und von der letzten und der nächsten Lieferung gibst du den Bauern zum Ausgleich für ihre Ausfälle den Anteil, der dir und deinen Jungs normalerweise zustünde.
	AI_Output(hero, self, "Info_Mod_Reislord_OJGBoss_C_15_03"); //Haben wir uns verstanden?
	AI_Output(self, hero, "Info_Mod_Reislord_OJGBoss_C_12_04"); //(paralysiert) Ähh, ähh ... ja.

	B_GivePlayerXP	(200);

	Mod_NL_ReislordProBauern = 1;
	Mod_NL_ReislordProBauern_Day = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Reislord_OJGBoss);
};

FUNC VOID Info_Mod_Reislord_OJGBoss_A()
{
	AI_Output(hero, self, "Info_Mod_Reislord_OJGBoss_A_15_00"); //Da sage ich bestimmt nicht nein. Meine Taschen fühlen sich so leer an und etwas funkelndes Metall in ihnen wäre bestimmt nicht verfehlt.
	AI_Output(self, hero, "Info_Mod_Reislord_OJGBoss_A_12_01"); //Natürlich, wie es dir auch zusteht. Ich merke, mit dir wird auch weiterhin alles so laufen, wie es soll, hehe. Hier bitte. Viel Spaß damit.

	B_ShowGivenThings	("230 Gold, 17 Erz, 2 Wein und Schinken erhalten");

	CreateInvItems	(hero, ItMi_Gold, 230);
	CreateInvItems	(hero, ItMi_Nugget, 17);
	CreateInvItems	(hero, ItFo_Wine, 2);
	CreateInvItems	(hero, ItFo_Bacon, 1);

	B_GivePlayerXP	(100);

	Info_ClearChoices	(Info_Mod_Reislord_OJGBoss);
};

INSTANCE Info_Mod_Reislord_Pickpocket (C_INFO)
{
	npc		= Mod_2002_BAU_Ricelord_MT;
	nr		= 1;
	condition	= Info_Mod_Reislord_Pickpocket_Condition;
	information	= Info_Mod_Reislord_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Reislord_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 130);
};

FUNC VOID Info_Mod_Reislord_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Reislord_Pickpocket);

	Info_AddChoice	(Info_Mod_Reislord_Pickpocket, DIALOG_BACK, Info_Mod_Reislord_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Reislord_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Reislord_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Reislord_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Reislord_Pickpocket);
};

FUNC VOID Info_Mod_Reislord_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Reislord_Pickpocket);
};

INSTANCE Info_Mod_Reislord_EXIT (C_INFO)
{
	npc		= Mod_2002_BAU_Ricelord_MT;
	nr		= 1;
	condition	= Info_Mod_Reislord_EXIT_Condition;
	information	= Info_Mod_Reislord_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Reislord_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Reislord_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};