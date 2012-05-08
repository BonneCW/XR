INSTANCE Info_Mod_HofstaatWeiberheld_Hi (C_INFO)
{
	npc		= Mod_7270_OUT_Weiberheld_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatWeiberheld_Hi_Condition;
	information	= Info_Mod_HofstaatWeiberheld_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatWeiberheld_Hi_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Sabine_Heiraten_01))
	|| (Npc_KnowsInfo(hero, Info_Mod_HFFrau_Heiraten_01)))
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_09_00"); //So wirst du bei den Frauen aber kein Glück haben ...
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Hi_15_01"); //Was?
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_09_02"); //Die hofstaatlichen Frauen sind nicht wie die Frauen, die du kennst.
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Hi_15_03"); //Wer bist du überhaupt?
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_09_04"); //Ich bin der königliche Frauenheld. Und glaub mir, die Frauen, die du kennst, sind anders als die hierzulande!
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Hi_15_05"); //Inwiefern?
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_09_06"); //Na ja ... Die hofstaatlichen Frauen sind anders.
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Hi_15_07"); //Ja, so viel hab ich auch mitbekommen, aber wie unterscheiden sie sich von den anderen Frauen?
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_09_08"); //Die Frauen?
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Hi_15_09"); //Ja ...
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_09_10"); //Ach so ... Ich hab ein Buch geschrieben.
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Hi_15_11"); //Schön für dich ...
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_09_12"); //Darin stehen alle Eigenheiten der hofstaatlichen Frauen.
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Hi_15_13"); //Verkaufst du es mir?
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_09_14"); //Na gut ... aber pass auf, ich bin ein verdammt guter Feilscher.
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Hi_15_15"); //Wie viel willst du?
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_09_16"); //32 Milliarden 435 Millionen 684 Tausend 341 Goldstücke.
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Hi_15_17"); //Ein bisschen überteuert ...
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_09_18"); //Na gut ... Zwei Goldstücke.

	Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Hi);

	Info_AddChoice	(Info_Mod_HofstaatWeiberheld_Hi, "Immer noch zu viel ...", Info_Mod_HofstaatWeiberheld_Hi_B);

	if (Npc_HasItems(hero, ItMi_Gold) >= 2)
	{
		Info_AddChoice	(Info_Mod_HofstaatWeiberheld_Hi, "Gekauft.", Info_Mod_HofstaatWeiberheld_Hi_A);
	};
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Hi_D_15_00"); //Immer noch zu viel ...

	Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Hi);
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Hi_C_15_00"); //Gekauft.
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_C_09_01"); //(lacht) Dich hab ich aber übern Tisch gezogen.

	Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Hi);
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Hi_B()
{
	Info_Mod_HofstaatWeiberheld_Hi_D();

	if (Hlp_Random(100) < Mod_Verhandlungsgeschick)
	{
		AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_B_09_00"); //Na gut ... ich gebe dir 100 Goldstücke und das Buch.

		Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Hi);

		Info_AddChoice	(Info_Mod_HofstaatWeiberheld_Hi, "Immer noch zu viel ...", Info_Mod_HofstaatWeiberheld_Hi_F);
		Info_AddChoice	(Info_Mod_HofstaatWeiberheld_Hi, "Gekauft.", Info_Mod_HofstaatWeiberheld_Hi_E);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_B_09_01"); //Nee, nee, so viel muss schon sein.

		Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Hi);

		Info_AddChoice	(Info_Mod_HofstaatWeiberheld_Hi, "Gekauft.", Info_Mod_HofstaatWeiberheld_Hi_E);
	};
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Hi_A()
{
	B_GiveInvItems	(hero, self, ItMi_Gold, 2);

	B_GiveInvItems	(self, hero, ItWr_HSBook, 1);

	Info_Mod_HofstaatWeiberheld_Hi_C();
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Hi_F()
{
	Info_Mod_HofstaatWeiberheld_Hi_D();

	if (Hlp_Random(100) < Mod_Verhandlungsgeschick)
	{
		AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_F_09_00"); //Na gut ... ahm, du bekommst mein Haus, das Buch und 100 Goldstücke!

		Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Hi);

		Info_AddChoice	(Info_Mod_HofstaatWeiberheld_Hi, "Immer noch zu viel ...", Info_Mod_HofstaatWeiberheld_Hi_H);
		Info_AddChoice	(Info_Mod_HofstaatWeiberheld_Hi, "Gekauft ...", Info_Mod_HofstaatWeiberheld_Hi_G);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_F_09_01"); //Nein, das reicht ja wohl!

		Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Hi);

		Info_AddChoice	(Info_Mod_HofstaatWeiberheld_Hi, "Gekauft ...", Info_Mod_HofstaatWeiberheld_Hi_G);
	};
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Hi_E()
{
	B_ShowGivenThings	("100 Gold und Buch erhalten");

	CreateInvItems	(hero, ItMi_Gold, 100);
	CreateInvItems	(hero, ItWr_HSBook, 1);

	Info_Mod_HofstaatWeiberheld_Hi_C();
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Hi_H()
{
	Info_Mod_HofstaatWeiberheld_Hi_D();

	if (Hlp_Random(100) < Mod_Verhandlungsgeschick)
	{
		AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_H_09_00"); //Gaaaaahrr! Na gut, ich gebe dir mein Buch, mein Gold, mein Haus und ich heirate dich!
		AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Hi_H_15_01"); //WAS?!
		AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_H_09_02"); //Du willst doch die Staatsbürgerschaft, oder? In Relendel dürfen auch Männer heiraten.

		Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Hi);

		Info_AddChoice	(Info_Mod_HofstaatWeiberheld_Hi, "Na gut.", Info_Mod_HofstaatWeiberheld_Hi_J);
		Info_AddChoice	(Info_Mod_HofstaatWeiberheld_Hi, "Gib mir einfach nur das Buch!", Info_Mod_HofstaatWeiberheld_Hi_I);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Hi_H_09_03"); //Hahaha, das reicht aber langsam.

		Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Hi);

		Info_AddChoice	(Info_Mod_HofstaatWeiberheld_Hi, "Gib mir einfach nur das Buch!", Info_Mod_HofstaatWeiberheld_Hi_I);
	};
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Hi_G()
{
	B_ShowGivenThings	("100 Gold und Buch erhalten");

	CreateInvItems	(hero, ItMi_Gold, 100);
	CreateInvItems	(hero, ItWr_HSBook, 1);

	Mod_Sekte_WeiberheldHaus = 1;

	B_LogEntry	(TOPIC_MOD_SEKTE_Freudenspender, "Ich besitze jetzt ein Haus im Hofstaat. Das muss doch für irgendwas gut sein.");

	Info_Mod_HofstaatWeiberheld_Hi_C();
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Hi_J()
{
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Hi_J_15_00"); //Na gut.

	Mod_Sekte_WeiberheldHaus = 1;
	Mod_Sekte_Verheiratet = 1;

	B_StartOtherRoutine	(Mod_7020_HS_Tuersteher_REL, "DARFREIN");

	B_LogEntry	(TOPIC_MOD_SEKTE_Freudenspender, "Ich habe den Weiberheld geheiratet und besitze auch ein Haus. Der Türsteher sollte mich nun vorbei lassen.");

	Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Hi);
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Hi_I()
{
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Hi_I_15_00"); //Gib mir einfach nur das Buch!

	B_GiveInvItems	(self, hero, ItWr_HSBook, 1);

	Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Hi);
};

INSTANCE Info_Mod_HofstaatWeiberheld_SabineWillNicht (C_INFO)
{
	npc		= Mod_7270_OUT_Weiberheld_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatWeiberheld_SabineWillNicht_Condition;
	information	= Info_Mod_HofstaatWeiberheld_SabineWillNicht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das mit dem Heiraten funktioniert nicht.";
};

FUNC INT Info_Mod_HofstaatWeiberheld_SabineWillNicht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sabine_Heiraten_02))
	&& (Mod_Sekte_Verheiratet == 0)
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatWeiberheld_SabineWillNicht_Info()
{
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_SabineWillNicht_15_00"); //Das mit dem Heiraten funktioniert nicht.
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_SabineWillNicht_09_01"); //Woran scheitert es denn?
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_SabineWillNicht_15_02"); //Na ja, ich weiß nicht, was ich sagen soll ...
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_SabineWillNicht_09_03"); //AHA!
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_SabineWillNicht_15_04"); //Ja?
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_SabineWillNicht_09_05"); //Du brauchst mein patentiertes "Anmachen und Anlachen", sozusagen die Fortsetzung meines ersten Buches.
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_SabineWillNicht_15_06"); //Wie viel willst du dafür?
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_SabineWillNicht_09_07"); //200 Goldstücke.
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_SabineWillNicht_15_08"); //Kein Feilschen?
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_SabineWillNicht_09_09"); //Nee ... letztens hab ich mein Haus verloren bei dem Versuch, jemandem meine gesammelten Werke zu verkaufen.
};

INSTANCE Info_Mod_HofstaatWeiberheld_BuyBook2 (C_INFO)
{
	npc		= Mod_7270_OUT_Weiberheld_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatWeiberheld_BuyBook2_Condition;
	information	= Info_Mod_HofstaatWeiberheld_BuyBook2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gut, ich kaufe das Buch (200 Gold)";
};

FUNC INT Info_Mod_HofstaatWeiberheld_BuyBook2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatWeiberheld_SabineWillNicht))
	&& (Mod_Sekte_Verheiratet == 0)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 200)
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatWeiberheld_BuyBook2_Info()
{
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_BuyBook2_15_00"); //Gut, ich kaufe das Buch.

	B_GiveInvItems	(hero, self, ItMi_Gold, 200);

	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_BuyBook2_09_01"); //Hier hast du es. Viel Glück damit.

	B_GiveInvItems	(self, hero, ItWr_HSBook2, 1);
};

INSTANCE Info_Mod_HofstaatWeiberheld_Preacher (C_INFO)
{
	npc		= Mod_7270_OUT_Weiberheld_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatWeiberheld_Preacher_Condition;
	information	= Info_Mod_HofstaatWeiberheld_Preacher_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatWeiberheld_Preacher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sabine_Heiraten_03))
	|| (Npc_KnowsInfo(hero, Info_Mod_HFFrau_Heiraten_03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Preacher_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Preacher_09_00"); //Damit erkläre ich euch zu Mann und Frau!

	Mod_Sekte_Verheiratet = 1;

	Mod_HS_DarfZuKing = 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_7020_HS_Tuersteher_REL, "DARFREIN");

	Mod_7020_HS_Tuersteher_REL.aivar[AIV_Passgate] = TRUE;

	B_LogEntry	(TOPIC_MOD_SEKTE_Freudenspender, "Ich bin jetzt verheiratet. Der Türsteher sollte mich nun vorbei lassen.");
};

INSTANCE Info_Mod_HofstaatWeiberheld_Geliebte (C_INFO)
{
	npc		= Mod_7270_OUT_Weiberheld_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatWeiberheld_Geliebte_Condition;
	information	= Info_Mod_HofstaatWeiberheld_Geliebte_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatWeiberheld_Geliebte_Condition()
{
	if (Mod_SL_Schwaechen == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Geliebte_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Geliebte_09_00"); //Du schon wieder?
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Geliebte_15_01"); //Ich brauche noch mal deine Hilfe.
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Geliebte_09_02"); //Wie kann ich dir helfen? Willst du eine Frau rumkriegen, willst du einen Mann rumkriegen, willst du eine Frau und einen Mann rumkriegen? Nichts ist unmöglich!
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Geliebte_15_03"); //Ich will die königliche Geliebte verführen.
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Geliebte_09_04"); //Na klar, kein Problem, die königliche Geliebte verführen, das ist ga ... DU WILLST WAS? UNMÖGLICH!
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Geliebte_09_05"); //Du ungläubiger Narr! Glaubst du, sie heißt zum Spaß "königliche Geliebte".
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Geliebte_09_06"); //Dummkopf! Niemand außer dem König hat es je geschafft bei ihr zu landen.
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Geliebte_15_07"); //Es muss doch eine Möglichkeit geben. Wie hat es denn der König angestellt?
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Geliebte_09_08"); //Er hat ein Reich gegründet und trägt eine Krone! Der könnte sogar mich verführen!
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Geliebte_15_09"); //Dann brauch ich eine Krone?
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Geliebte_09_10"); //Ach was! (Leiser) Es geht das Gerücht um, dass der königliche Trunkenbold es zur Zeit des letzten Festes geschafft hat, sie zu verführen.
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Geliebte_15_11"); //Dann muss ich sie nur betrunken machen?
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Geliebte_09_12"); //Das wird nicht funktionieren. Glaub mir ... es funktioniert nicht. Du musst wohl ... den Trunkenbold wecken.
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Geliebte_15_13"); //Wie stell ich das an?
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Geliebte_09_14"); //Das kann nur der König. Er hat das Blastherr!
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Geliebte_15_15"); //Das ... Blastherr?
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Geliebte_09_16"); //Ja, das ist das Horn, mit dem er die Zeit des Feierns ausruft! Du musst es ihm stehlen. Es ist im Schloss.
	AI_Output(hero, self, "Info_Mod_HofstaatWeiberheld_Geliebte_15_17"); //Und wenn ich es habe?
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Geliebte_09_18"); //Spielst du es ... aber LEISE! Nur der Trunkenbold darf dich hören.
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Geliebte_09_19"); //Und sobald du hast, was du brauchst, musst du ihm Freudenspender geben, damit er wieder einschläft.
	AI_Output(self, hero, "Info_Mod_HofstaatWeiberheld_Geliebte_09_20"); //Sobald er sich den Schlaf aus den Augen reibt und merkt, dass du nicht der König bist und dass nicht die Zeit des Feierns ist, wird er dich erschlagen!

	B_LogEntry	(TOPIC_MOD_SL_GELIEBTE, "Ich muss den Trunkenbold wecken, der angeblich schon einmal die königliche Geliebte verführt hat. Dazu brauche ich das Blastherr des Königs, welches ich im Schloss finde.");

	Mod_SL_PartGeliebte = 1;

	Wld_InsertItem	(ItMi_Blastherr, "FP_ITEM_KOENIG_DMNACHRICHT");
};

INSTANCE Info_Mod_HofstaatWeiberheld_Pickpocket (C_INFO)
{
	npc		= Mod_7270_OUT_Weiberheld_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatWeiberheld_Pickpocket_Condition;
	information	= Info_Mod_HofstaatWeiberheld_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_HofstaatWeiberheld_Pickpocket_Condition()
{
	C_Beklauen	(49, ItMi_Freudenspender, 1);
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatWeiberheld_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatWeiberheld_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatWeiberheld_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatWeiberheld_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Pickpocket);
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Pickpocket);

		Info_AddChoice	(Info_Mod_HofstaatWeiberheld_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_HofstaatWeiberheld_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_HofstaatWeiberheld_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_HofstaatWeiberheld_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_HofstaatWeiberheld_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_HofstaatWeiberheld_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_HofstaatWeiberheld_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_HofstaatWeiberheld_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_HofstaatWeiberheld_EXIT (C_INFO)
{
	npc		= Mod_7270_OUT_Weiberheld_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatWeiberheld_EXIT_Condition;
	information	= Info_Mod_HofstaatWeiberheld_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatWeiberheld_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatWeiberheld_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};