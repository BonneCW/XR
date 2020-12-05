INSTANCE Info_Mod_Ramirez_REL_InHaus (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_InHaus_Condition;
	information	= Info_Mod_Ramirez_REL_InHaus_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_InHaus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jesper_REL_InHaus))
	&& (Wld_GetDay() > Mod_Dieb_Haus_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_InHaus_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_InHaus_03_00"); //To jest to, co nazywam wygodnym domem, czyz nie?
	AI_Output(hero, self, "Info_Mod_Ramirez_REL_InHaus_15_01"); //Wyglada dobrze.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_InHaus_03_02"); //Tak wlasnie rozumiem. Hmm, brakuje odpowiedniego pokarmu.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_InHaus_03_03"); //Mam nadzieje, ze Attyla wkrótce wróci z jego poszukiwan.... Slysze, jak slysze go schodami.

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Mod_7709_OUT_Attila_REL, "REL_CITY_053");

	Mod_RemoveAttilaFromKhorinis = TRUE;
};

INSTANCE Info_Mod_Ramirez_REL_Lagerhaus (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Lagerhaus_Condition;
	information	= Info_Mod_Ramirez_REL_Lagerhaus_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Lagerhaus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Attila_REL_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Lagerhaus_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus_03_00"); //Dobrze wykonane. Jestem pewien, ze to powinno miec sens.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus_03_01"); //(bohater) Jak pójsc tam i spróbowac zabrac z soba z obozem pelny worek.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus_03_02"); //Upewnij sie, ze oslony cie nie zlapia.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus_03_03"); //Moze bedziesz musial sie ukryc w obozie, dopóki nie przejda w nocy.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus_03_04"); //Pomysl o czyms.

	Log_CreateTopic	(TOPIC_MOD_DIEB_LAGERHAUS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DIEB_LAGERHAUS, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DIEB_LAGERHAUS, "W Khorata zapasy sa przechowywane w magazynie codziennie od rana do nocy. Spodziewam sie, ze spróbuje przybic duza torbe z nia pelna. Musze tylko upewnic sie, ze dwaj straznicy mnie nie zlapia. Byc moze mam szanse jak tylko opuszcza obóz w nocy....");

	Wld_InsertItem	(ItMi_Fresssack, "FP_ITEM_JIM_DROGEN");
	Wld_InsertItem	(ItMi_Kiste, "FP_ITEM_LAGERKISTE");
};

INSTANCE Info_Mod_Ramirez_REL_Lagerhaus2 (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Lagerhaus2_Condition;
	information	= Info_Mod_Ramirez_REL_Lagerhaus2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Lagerhaus2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_REL_Lagerhaus))
	&& (Npc_HasItems(hero, ItMi_Fresssack) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Lagerhaus2_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus2_03_00"); //Co to jest? Zapacham szynke, ser, chleb,....
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus2_03_01"); //Ahh, bardzo milo, byles w obozie, widze.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus2_03_02"); //I balem sie, ze musze isc na rynek, zeby cos kupic.

	B_GiveInvItems	(hero, self, ItMi_Fresssack, 1);

	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus2_03_03"); //Pozwólcie mi widziec.... co najmniej przez nastepne cztery tygodnie. Dobra praca.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Lagerhaus2_03_04"); //Oto troche zlota.... i troche jedzenia z worka.

	CreateInvItems	(hero, ItMi_Gold, 150);
	CreateInvItems	(hero, ItFo_Bacon, 1);
	CreateInvItems	(hero, ItFo_Cheese, 3);
	CreateInvItems	(hero, ItFo_Wine, 2);
	CreateInvItems	(hero, ItFo_Beer, 3);
	CreateInvItems	(hero, ItFo_Apple, 5);
	CreateInvItems	(hero, ItFo_Bread, 2);

	B_ShowGivenThings	("150 zlota, 1 szynka, 3 sery, 2 wina, 3 piwo, 5 jablek i 2 pieczywo zakonserwowane.");

	B_GivePlayerXP	(400);

	B_SetTopicStatus	(TOPIC_MOD_DIEB_LAGERHAUS, LOG_SUCCESS);

	Mod_Dieb_Haus_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Ramirez_REL_Glorie (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Glorie_Condition;
	information	= Info_Mod_Ramirez_REL_Glorie_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Glorie_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_REL_Glorie))
	&& (Wld_GetDay() > Mod_Dieb_Haus_Day)
	&& (Wld_IsTime(09,00,11,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Glorie_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie_03_00"); //Ach, tam jestescie. Wiec dobrze jest pojechac. Podazaj za mna, idz za mna.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOSCHNEIDER");
};

INSTANCE Info_Mod_Ramirez_REL_Glorie2 (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Glorie2_Condition;
	information	= Info_Mod_Ramirez_REL_Glorie2_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Glorie2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_REL_Glorie))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Ramirez_REL_Glorie))
	&& (Wld_GetDay() > Mod_Dieb_Haus_Day)
	&& (Wld_IsTime(11,00,24,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Glorie2_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie2_03_00"); //Jestes za pózno. Nie warto teraz zaczynac.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie2_03_01"); //Musimy ja odlozyc na jutro.... Wiecej twórz otwór.

	Mod_Dieb_Haus_Day = Wld_GetDay();

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Ramirez_REL_Glorie3 (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Glorie3_Condition;
	information	= Info_Mod_Ramirez_REL_Glorie3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Glorie3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_REL_Glorie))
	&& (Npc_GetDistToWP(self, "REL_CITY_233") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Glorie3_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie3_03_00"); //A zatem wszystko w porzadku. To, co teraz przychodzi, jest jedynym celem misji.
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie3_03_01"); //Jak tylko go zainteresuje, powinienes byc w stanie zlapac te sukienke.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHNEIDER");
	B_StartOtherRoutine	(Mod_7535_OUT_Schneider_REL, "ABGELENKT");
	B_StartOtherRoutine	(Mod_7705_OUT_Cassia_REL, "VORSCHNEIDER");
	B_StartOtherRoutine	(Mod_7704_OUT_Jesper_REL, "ATBIB");

	Wld_InsertItem	(ItAr_GelehrterNeu, "FP_ITEM_GELEHRTENKLEIDUNG");
};

INSTANCE Info_Mod_Ramirez_REL_Glorie4 (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Glorie4_Condition;
	information	= Info_Mod_Ramirez_REL_Glorie4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Glorie4_Condition()
{
	if (Mod_Diebe_Brunnen == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Glorie4_Info()
{
	if (Mod_Diebe_WandGehackt == 0)
	{
		AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie4_03_00"); //Tutaj jestes nareszcie. Kiedy byles w lózku z tylkiem, zlamalismy sciane i odkrylismy tunel.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie4_03_01"); //Wspaniale, przechodzimy. Dobra praca, chlopcy. Wyglada na to, ze to naprawde postep.
	};

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Ramirez_REL_Glorie5 (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_Glorie5_Condition;
	information	= Info_Mod_Ramirez_REL_Glorie5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ramirez_REL_Glorie5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Attila_REL_Glorie5))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ramirez_REL_Glorie5_Info()
{
	AI_Output(self, hero, "Info_Mod_Ramirez_REL_Glorie5_03_00"); //Wszystko w porzadku.... trzy funty zlota w kieszeniach wystarcza mi na razie.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "INHAUS");
	B_StartOtherRoutine	(Mod_7709_OUT_Attila_REL, "INHAUS");
	B_StartOtherRoutine	(Mod_7705_OUT_Cassia_REL, "INHAUS");
	B_StartOtherRoutine	(Mod_7704_OUT_Jesper_REL, "GELEHRTER");
};

INSTANCE Info_Mod_Ramirez_REL_EXIT (C_INFO)
{
	npc		= Mod_7708_OUT_Ramirez_REL;
	nr		= 1;
	condition	= Info_Mod_Ramirez_REL_EXIT_Condition;
	information	= Info_Mod_Ramirez_REL_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ramirez_REL_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ramirez_REL_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
