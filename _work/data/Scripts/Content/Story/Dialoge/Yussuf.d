INSTANCE Info_Mod_Yussuf_Hi (C_INFO)
{
	npc		= Mod_7113_ASS_Yussuf_NW;
	nr		= 1;
	condition	= Info_Mod_Yussuf_Hi_Condition;
	information	= Info_Mod_Yussuf_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tag. Ich suche Yussuf.";
};

FUNC INT Info_Mod_Yussuf_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Yussuf_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Yussuf_Hi_15_00"); //Tag. Ich suche Yussuf.
	AI_Output(self, hero, "Info_Mod_Yussuf_Hi_13_01"); //Du stehst vor ihm. Was liegt an?
	AI_Output(hero, self, "Info_Mod_Yussuf_Hi_15_02"); //Ich suche Stimmen für meine Aufnahme bei euch.
	AI_Output(self, hero, "Info_Mod_Yussuf_Hi_13_03"); //Das trifft sich gut, ich suche nämlich auch Stimmen. Will bei den Kriegern mitmachen. Diese Gaunereien hier langweilen mich.
	AI_Output(hero, self, "Info_Mod_Yussuf_Hi_15_04"); //Aber da musst du doch die Krieger fragen, nicht mich.
	AI_Output(self, hero, "Info_Mod_Yussuf_Hi_13_05"); //Schon. Aber du könntest mir bei einer schwierigen Aufgabe zur Hand gehen.
	AI_Output(self, hero, "Info_Mod_Yussuf_Hi_13_06"); //Wenn ich dann dafür eine Stimme kriege, kriegst du meine.

	Info_ClearChoices	(Info_Mod_Yussuf_Hi);

	Info_AddChoice	(Info_Mod_Yussuf_Hi, "Das hört sich gut an. Können wir machen.", Info_Mod_Yussuf_Hi_B);
	Info_AddChoice	(Info_Mod_Yussuf_Hi, "Ich weiß nicht. Korrekt ist das aber nicht.", Info_Mod_Yussuf_Hi_A);
};

FUNC VOID Info_Mod_Yussuf_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Yussuf_Hi_B_15_00"); //Das hört sich gut an. Können wir machen.
	AI_Output(self, hero, "Info_Mod_Yussuf_Hi_B_13_01"); //Ich melde mich, wenn ich dich brauche.

	Info_ClearChoices	(Info_Mod_Yussuf_Hi);

	Log_CreateTopic	(TOPIC_MOD_ASS_YUSSUF_HILFE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_YUSSUF_HILFE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_YUSSUF_HILFE, "Ich bekomme Yussufs Stimme, wenn ich ihm bei einer seiner Aufträge helfe. Er will mich später darauf ansprechen ...");

	Mod_ASS_Yussuf = 2;
};

FUNC VOID Info_Mod_Yussuf_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Yussuf_Hi_A_15_00"); //Ich weiß nicht. Korrekt ist das aber nicht.
	AI_Output(self, hero, "Info_Mod_Yussuf_Hi_A_13_01"); //Und für was sind wir Gauner?
	AI_Output(hero, self, "Info_Mod_Yussuf_Hi_A_15_02"); //Ne. Lieber nicht. Wenn das rauskommt, bin ich tot.
	AI_Output(hero, self, "Info_Mod_Yussuf_Hi_A_15_03"); //Oder glaubst du, die lassen mich einfach so wieder gehen?
	AI_Output(self, hero, "Info_Mod_Yussuf_Hi_A_13_04"); //Wohl nicht. Aber dann ist nichts mit meiner Stimme. Und halt's Maul wegen dieser Sache.
	AI_Output(hero, self, "Info_Mod_Yussuf_Hi_A_15_05"); //Klar.

	Info_ClearChoices	(Info_Mod_Yussuf_Hi);

	Mod_ASS_Yussuf = 1;
};

INSTANCE Info_Mod_Yussuf_Blutkelch (C_INFO)
{
	npc		= Mod_7113_ASS_Yussuf_NW;
	nr		= 1;
	condition	= Info_Mod_Yussuf_Blutkelch_Condition;
	information	= Info_Mod_Yussuf_Blutkelch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Yussuf_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Karim_Hi))
	|| (Npc_KnowsInfo(hero, Info_Mod_Aiman_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Yussuf_Blutkelch_Info()
{
	AI_Output(self, hero, "Info_Mod_Yussuf_Blutkelch_13_00"); //Was machst du denn hier? Du hast doch meine Stimme noch nicht.
	AI_Output(hero, self, "Info_Mod_Yussuf_Blutkelch_15_01"); //Ich hab Shakir so gut bedient, dass er mir deine Stimme erlassen und mich gleich zu Masut geschickt hat.
	AI_Output(self, hero, "Info_Mod_Yussuf_Blutkelch_13_02"); //Alter Streber! Aber dann könnten wir doch diesmal zusammenarbeiten.
	AI_Output(hero, self, "Info_Mod_Yussuf_Blutkelch_15_03"); //Das könnten wir wohl. Ich muss dem Richter in Khorinis einen Blutkelch abnehmen.
	AI_Output(self, hero, "Info_Mod_Yussuf_Blutkelch_13_04"); //Das trifft sich gut. Ich muss auch in die Stadt.
	AI_Output(hero, self, "Info_Mod_Yussuf_Blutkelch_15_05"); //Und was hast du zu tun?
	AI_Output(self, hero, "Info_Mod_Yussuf_Blutkelch_13_06"); //Ich soll die Kisten im Hof vom Händler Matteo plündern. Der Hohe Rat vermutet da Kleidung drin, die können wir gut gebrauchen.
	AI_Output(hero, self, "Info_Mod_Yussuf_Blutkelch_15_07"); //Steht da nicht eine Wache?
	AI_Output(self, hero, "Info_Mod_Yussuf_Blutkelch_13_08"); //Schon, aber das ist kein Problem für mich.
	AI_Output(hero, self, "Info_Mod_Yussuf_Blutkelch_15_09"); //Hast du eine Verkleidung?
	AI_Output(self, hero, "Info_Mod_Yussuf_Blutkelch_13_10"); //Natürlich. Lass uns gehen. Wir schauen erst mal nach den Klamotten.

	B_LogEntry	(TOPIC_MOD_ASS_BLUTKELCH, "Ich hab Yussuf getroffen. Diesmal wollen wir zusammenarbeiten. Er soll Bürgerkleidung aus dem Hof vom Händler Matteo besorgen.");

	CreateInvItems	(self, ItAr_Vlk_M, 1);

	AI_UnequipArmor	(self);

	AI_EquipArmor	(self, ItAr_Vlk_M);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
};

INSTANCE Info_Mod_Yussuf_Blutkelch2 (C_INFO)
{
	npc		= Mod_7113_ASS_Yussuf_NW;
	nr		= 1;
	condition	= Info_Mod_Yussuf_Blutkelch2_Condition;
	information	= Info_Mod_Yussuf_Blutkelch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Yussuf_Blutkelch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Yussuf_Blutkelch))
	&& (Npc_GetDistToWP(hero, "NW_CITY_MERCHANT_TRADE_02_B") < 750)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Yussuf_Blutkelch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Yussuf_Blutkelch2_13_00"); //Der Ritter hier könnte was bemerken. Du musst ihn ablenken. Den Rest mache ich.
	AI_Output(hero, self, "Info_Mod_Yussuf_Blutkelch2_15_01"); //Kein Problem.

	B_LogEntry	(TOPIC_MOD_ASS_BLUTKELCH, "Ich muss Garond ablenken, damit Yussuf die Kleidung aus dem Lager holen kann.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Yussuf_Blutkelch3 (C_INFO)
{
	npc		= Mod_7113_ASS_Yussuf_NW;
	nr		= 1;
	condition	= Info_Mod_Yussuf_Blutkelch3_Condition;
	information	= Info_Mod_Yussuf_Blutkelch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Yussuf_Blutkelch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garond_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Yussuf_Blutkelch3_Info()
{
	AI_Output(self, hero, "Info_Mod_Yussuf_Blutkelch3_13_00"); //Das war mal 'ne leichte Sache. Los weg hier, bevor noch einer was merkt.
	AI_Output(hero, self, "Info_Mod_Yussuf_Blutkelch3_15_01"); //Gehen wir doch gleich in die Oberstadt.
	AI_Output(self, hero, "Info_Mod_Yussuf_Blutkelch3_13_02"); //Du weißt, wo der Richter steckt?
	AI_Output(hero, self, "Info_Mod_Yussuf_Blutkelch3_15_03"); //Gewiss. Er hat allerdings ne Wache vom Haus.
	AI_Output(self, hero, "Info_Mod_Yussuf_Blutkelch3_13_04"); //Die könnte doch ich diesmal ablenken.
	AI_Output(hero, self, "Info_Mod_Yussuf_Blutkelch3_15_05"); //Gute Idee. Auf geht's!

	B_LogEntry	(TOPIC_MOD_ASS_BLUTKELCH, "Yussuf hat die Klamotten, jetzt müssen wir noch zum Richter");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_500_PAL_Garond_NW,	"PRESTART");
};

INSTANCE Info_Mod_Yussuf_Blutkelch4 (C_INFO)
{
	npc		= Mod_7113_ASS_Yussuf_NW;
	nr		= 1;
	condition	= Info_Mod_Yussuf_Blutkelch4_Condition;
	information	= Info_Mod_Yussuf_Blutkelch4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Yussuf_Blutkelch4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Richterhauswache_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Yussuf_Blutkelch4_Info()
{
	AI_Output(self, hero, "DEFAULT"); //
	AI_Output(hero, self, "Info_Mod_Yussuf_Blutkelch4_15_00"); //Wenn die Wache wiederkommt, musst du sie ablenken. Ich verschwinde nach drinnen.
	AI_Output(self, hero, "Info_Mod_Yussuf_Blutkelch4_13_01"); //Hab verstanden.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self,	"RICHTER");
	B_StartOtherRoutine	(Mod_1181_MIL_Tuerwache_NW,	"RICHTER");
};

INSTANCE Info_Mod_Yussuf_Blutkelch5 (C_INFO)
{
	npc		= Mod_7113_ASS_Yussuf_NW;
	nr		= 1;
	condition	= Info_Mod_Yussuf_Blutkelch5_Condition;
	information	= Info_Mod_Yussuf_Blutkelch5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Yussuf_Blutkelch5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Richterhauswache_Blutkelch2))
	&& (Npc_GetDistToWP(hero, "NW_CITY_UPTOWN_PATH_05_B") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Yussuf_Blutkelch5_Info()
{
	AI_Output(self, hero, "Info_Mod_Yussuf_Blutkelch5_13_00"); //Den haben wir schön reingelegt. Wie geht's dem Richter?
	AI_Output(hero, self, "Info_Mod_Yussuf_Blutkelch5_15_01"); //Nicht gut. Er steht jetzt vor seinem Richter.
	AI_Output(self, hero, "Info_Mod_Yussuf_Blutkelch5_13_02"); //Ein Mordskerl bist du.
	AI_Output(hero, self, "Info_Mod_Yussuf_Blutkelch5_15_03"); //Das kannst du wörtlich nehmen. (lacht)
};

INSTANCE Info_Mod_Yussuf_Blutkelch6 (C_INFO)
{
	npc		= Mod_7113_ASS_Yussuf_NW;
	nr		= 1;
	condition	= Info_Mod_Yussuf_Blutkelch6_Condition;
	information	= Info_Mod_Yussuf_Blutkelch6_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Yussuf_Blutkelch6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Yussuf_Blutkelch5))
	&& (Npc_GetDistToWP(hero, "WP_ASSASSINE_13") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Yussuf_Blutkelch6_Info()
{
	AI_Output(self, hero, "Info_Mod_Yussuf_Blutkelch6_13_00"); //Ich werde meine Klamotten abliefern.
	AI_Output(hero, self, "Info_Mod_Yussuf_Blutkelch6_15_01"); //Und ich gehe zum Hohen Rat. Bis ein andermal.
	AI_Output(self, hero, "Info_Mod_Yussuf_Blutkelch6_13_02"); //Mach's gut!

	AI_UnEquipArmor	(self);

	AI_EquipArmor	(self, ItAr_Assassine_01);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Yussuf_Assassinengold (C_INFO)
{
	npc		= Mod_7113_ASS_Yussuf_NW;
	nr		= 1;
	condition	= Info_Mod_Yussuf_Assassinengold_Condition;
	information	= Info_Mod_Yussuf_Assassinengold_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Yussuf_Assassinengold_Condition()
{
	if (Mod_ASS_Assassinengold == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Yussuf_Assassinengold_Info()
{
	AI_Output(self, hero, "Info_Mod_Yussuf_Assassinengold_13_00"); //Teufelskerl! Du bist der Star im Lager. Wie machst du das?
	AI_Output(hero, self, "Info_Mod_Yussuf_Assassinengold_15_01"); //Hast du schon mal was von Motivation gehört?
	AI_Output(self, hero, "Info_Mod_Yussuf_Assassinengold_13_02"); //Eh. Nein.
	AI_Output(hero, self, "Info_Mod_Yussuf_Assassinengold_15_03"); //Dachte ich mir.
};

INSTANCE Info_Mod_Yussuf_Pickpocket (C_INFO)
{
	npc		= Mod_7113_ASS_Yussuf_NW;
	nr		= 1;
	condition	= Info_Mod_Yussuf_Pickpocket_Condition;
	information	= Info_Mod_Yussuf_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Yussuf_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Yussuf_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Yussuf_Pickpocket);

	Info_AddChoice	(Info_Mod_Yussuf_Pickpocket, DIALOG_BACK, Info_Mod_Yussuf_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Yussuf_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Yussuf_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Yussuf_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Yussuf_Pickpocket);
};

FUNC VOID Info_Mod_Yussuf_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Yussuf_Pickpocket);
};

INSTANCE Info_Mod_Yussuf_EXIT (C_INFO)
{
	npc		= Mod_7113_ASS_Yussuf_NW;
	nr		= 1;
	condition	= Info_Mod_Yussuf_EXIT_Condition;
	information	= Info_Mod_Yussuf_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Yussuf_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Yussuf_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};