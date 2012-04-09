INSTANCE Info_Mod_Giselle_RLMord (C_INFO)
{
	npc		= Mod_7234_OUT_Giselle_NW;
	nr		= 1;
	condition	= Info_Mod_Giselle_RLMord_Condition;
	information	= Info_Mod_Giselle_RLMord_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist Giselle?";
};

FUNC INT Info_Mod_Giselle_RLMord_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pablo_RLMord))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Giselle_RLMord_Info()
{
	AI_Output(hero, self, "Info_Mod_Giselle_RLMord_15_00"); //Du bist Giselle?
	AI_Output(self, hero, "Info_Mod_Giselle_RLMord_17_01"); //In Fleisch und Blut, mein Hübscher.
	AI_Output(hero, self, "Info_Mod_Giselle_RLMord_15_02"); //Was geschah letzte Nacht?
	AI_Output(self, hero, "Info_Mod_Giselle_RLMord_17_03"); //Nun, Jason kam, wie jeden Monat, zu mir und wollte das Übliche.
	AI_Output(self, hero, "Info_Mod_Giselle_RLMord_17_04"); //Da kam plötzlich jemand in das Zimmer hineingestürmt und Streckte Jason ohne Vorwarnung nieder.
	AI_Output(self, hero, "Info_Mod_Giselle_RLMord_17_05"); //Danach verschwand er einfach wieder, ohne ein Wort zu sagen. Gleich darauf rief weckte ich Bromor, den Besitzer, der die Miliz verständigte.
	AI_Output(hero, self, "Info_Mod_Giselle_RLMord_15_06"); //Was ist „Das Übliche“?
	AI_Output(self, hero, "Info_Mod_Giselle_RLMord_17_07"); //Nur Gutes über die Toten. Wir in der roten Laterne sind diskret.

	B_StartOtherRoutine	(Mod_744_MIL_Pablo_NW, "ZIMMER");

	Info_ClearChoices	(Info_Mod_Giselle_RLMord);

	Info_AddChoice	(Info_Mod_Giselle_RLMord, "Wenn du es mir nicht augenblicklich sagst (...)", Info_Mod_Giselle_RLMord_C);

	if (Npc_HasItems(hero, ItMi_GoldRing) >= 1)
	{
		Info_AddChoice	(Info_Mod_Giselle_RLMord, "Sag's mir Bitte!", Info_Mod_Giselle_RLMord_B);
	};

	Info_AddChoice	(Info_Mod_Giselle_RLMord, "Jason wird’s nicht mehr stören, wo er jetzt ist.", Info_Mod_Giselle_RLMord_A);
};

FUNC VOID Info_Mod_Giselle_RLMord_D()
{
	AI_Output(self, hero, "Info_Mod_Giselle_RLMord_D_17_00"); //Er stand auf Brutalitäten, wollte geschlagen verletzt werden. Einmal hat er sogar extra 'ne Feuerball-Spruchrolle mitgebracht.
	AI_Output(self, hero, "Info_Mod_Giselle_RLMord_D_17_01"); //Er selbst hat mich aber nie angerührt, war immer passiv.
	AI_Output(hero, self, "Info_Mod_Giselle_RLMord_D_15_02"); //Ich seh' mich mal am Tatort um. Ihr wart in Zimmer 2?
	AI_Output(self, hero, "Info_Mod_Giselle_RLMord_D_17_03"); //Genau Süßer.
	
	Info_ClearChoices	(Info_Mod_Giselle_RLMord);
};

FUNC VOID Info_Mod_Giselle_RLMord_C()
{
	AI_Output(hero, self, "Info_Mod_Giselle_RLMord_C_15_00"); //Wenn du es mir nicht augenblicklich sagst, lass ich dich wegen „Behinderung der Ermittlungsarbeiten“ in den Kerker werfen.
	AI_Output(self, hero, "Info_Mod_Giselle_RLMord_C_17_01"); //Ist ja schon gut, ich sag’s dir ja.
	
	Info_Mod_Giselle_RLMord_D();
};

FUNC VOID Info_Mod_Giselle_RLMord_B()
{
	AI_Output(hero, self, "Info_Mod_Giselle_RLMord_B_15_00"); //Sag's mir Bitte!
	AI_Output(self, hero, "Info_Mod_Giselle_RLMord_B_17_01"); //Wenn man mich so nett bittet kann ich kaum Nein sagen ...
	AI_Output(self, hero, "Info_Mod_Giselle_RLMord_B_17_02"); //Ich mach dir n Vorschlag, du bringst mir ein kleines Zeichen deiner Wertschätzung, dann sag ich's dir.
	AI_Output(hero, self, "Info_Mod_Giselle_RLMord_B_15_03"); //Hier ist ein goldener Ring.

	B_GiveInvItems	(hero, self, ItMi_GoldRing, 1);

	AI_Output(self, hero, "Info_Mod_Giselle_RLMord_B_17_04"); //Der ist ja wunderschön. Na gut, ich werde es dir erzählen.
	
	Info_Mod_Giselle_RLMord_D();
};

FUNC VOID Info_Mod_Giselle_RLMord_A()
{
	AI_Output(hero, self, "Info_Mod_Giselle_RLMord_A_15_00"); //Jason wird’s nicht mehr stören, wo er jetzt ist.
	AI_Output(self, hero, "Info_Mod_Giselle_RLMord_A_17_01"); //Na gut.
	
	Info_Mod_Giselle_RLMord_D();
};

INSTANCE Info_Mod_Giselle_Jason (C_INFO)
{
	npc		= Mod_7234_OUT_Giselle_NW;
	nr		= 1;
	condition	= Info_Mod_Giselle_Jason_Condition;
	information	= Info_Mod_Giselle_Jason_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du dir sicher, dass Jason überrascht wurde?";
};

FUNC INT Info_Mod_Giselle_Jason_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pablo_Giselle))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Giselle_Jason_Info()
{
	AI_Output(hero, self, "Info_Mod_Giselle_Jason_15_00"); //Bist du dir sicher, dass Jason überrascht wurde?
	AI_Output(self, hero, "Info_Mod_Giselle_Jason_17_01"); //Natürlich. Wenn ich etwas kann, dann ist es die ganze Aufmerksamkeit eines Mannes auf mich zu lenken.
	AI_Output(hero, self, "Info_Mod_Giselle_Jason_15_02"); //Warum hatte er dann seine Waffe gezogen, bevor er starb?
	AI_Output(self, hero, "Info_Mod_Giselle_Jason_17_03"); //Er hatte ...? Na ... weil ... er auf Rollenspiele stand und sein Schwert dabei gerne gezogen hatte.
	AI_Output(hero, self, "Info_Mod_Giselle_Jason_15_04"); //Das klingt aber nicht nach dem „Üblichem“ von dem du mir vorhin erzählt hast.
	AI_Output(self, hero, "Info_Mod_Giselle_Jason_17_05"); //Ich ... ah ...

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_PAL_RL, "Giselle hat sich nun im Zimmer von Bromor versteckt. Sie scheint etwas zu verbergen. Ich sollte Pablo Bescheid geben.");

	B_StartOtherRoutine	(self, "ZIMMER");
};

INSTANCE Info_Mod_Giselle_Galf (C_INFO)
{
	npc		= Mod_7234_OUT_Giselle_NW;
	nr		= 1;
	condition	= Info_Mod_Giselle_Galf_Condition;
	information	= Info_Mod_Giselle_Galf_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Giselle_Galf_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pablo_GalfCall))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Giselle_Galf_Info()
{
	AI_Output(self, hero, "Info_Mod_Giselle_Galf_17_00"); //Ihr habt Galf? Lasst ihn in  Ruhe, ihr Schweine!
	AI_Output(hero, self, "Info_Mod_Giselle_Galf_15_01"); //Du kennst ihn?
	AI_Output(self, hero, "Info_Mod_Giselle_Galf_17_02"); //Er ist mein Bruder ... dieser Dummkopf hätte schon lange abhauen sollen.
	AI_Output(hero, self, "Info_Mod_Giselle_Galf_15_03"); //Was wird hier gespielt?
	AI_Output(self, hero, "Info_Mod_Giselle_Galf_17_04"); //Na schön, du hast gewonnen. Jason kommt schon lange zu mir und Galf hatte die Idee, ihn zu erpressen. Also kam er letzte Nacht ins Zimmer und drohte Jason, die Miliz zu rufen.
	AI_Output(self, hero, "Info_Mod_Giselle_Galf_17_05"); //Ihr Idioten hättet ihn natürlich achtkantig aus eurem Verein geworfen, wenn ihr erfahren hättet was er hier treibt. Also wurde er aggressiv, nahm sein Schwert und wollte auf Galf losgehen.
	AI_Output(self, hero, "Info_Mod_Giselle_Galf_17_06"); //Da kam jedoch eine dunkle Gestalt zur Türe herein, streckte Jason nieder und verschwand wieder, mitsamt Jasons Uniform. Und dann ...
	AI_Output(hero, self, "Info_Mod_Giselle_Galf_15_07"); //Habt ihr euch diese Geschichte ausgedacht, um von euch abzulenken.
	AI_Output(self, hero, "Info_Mod_Giselle_Galf_17_08"); //Genau ... aber das hat ja wohl nicht so gut funktioniert, Süßer.
	AI_Output(hero, self, "Info_Mod_Giselle_Galf_15_09"); //Aber warum hast du auch die Sache mit der dunklen Gestalt verschwiegen?
	AI_Output(self, hero, "Info_Mod_Giselle_Galf_17_10"); //Weil ihr einer Hure das wirklich abkaufen würdet? Da musst du doch selbst lachen.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_PAL_RL, "Giselle hat mir die wahre Geschichte erzählt. Ich sollte jetzt zu Lord Andre gehen.");
};

INSTANCE Info_Mod_Giselle_Satz (C_INFO)
{
	npc		= Mod_7234_OUT_Giselle_NW;
	nr		= 1;
	condition	= Info_Mod_Giselle_Satz_Condition;
	information	= Info_Mod_Giselle_Satz_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Giselle_Satz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_HeroBot))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Giselle_Satz_Info()
{
	AI_Output(self, hero, "Info_Mod_Giselle_Satz_17_00"); //Du kommst mich besuchen? Wie überaus reizend von dir.
	AI_Output(hero, self, "Info_Mod_Giselle_Satz_15_01"); //Ich hab eine Frage.
	AI_Output(self, hero, "Info_Mod_Giselle_Satz_17_02"); //Ich bin normalerweise herzlichere Begrüßungen von Männern gewohnt. Worum geht's?
	AI_Output(hero, self, "Info_Mod_Giselle_Satz_15_03"); //Hat die Dunkle Gestalt, die Jason getötet hat, irgendetwas gesagt?
	AI_Output(self, hero, "Info_Mod_Giselle_Satz_17_04"); //Schon möglich ...

	Info_ClearChoices	(Info_Mod_Giselle_Satz);

	Info_AddChoice	(Info_Mod_Giselle_Satz, "Was willst du?", Info_Mod_Giselle_Satz_C);
	Info_AddChoice	(Info_Mod_Giselle_Satz, "Vielleicht würde das ein harter Schlag auf den Hinterkopf auch schaffen.", Info_Mod_Giselle_Satz_B);
	Info_AddChoice	(Info_Mod_Giselle_Satz, "Wenn du es mir nicht sofort sagst brech ich deinem Bruder beide Beine.", Info_Mod_Giselle_Satz_A);
};

FUNC VOID B_SayBotSentenceGiselle()
{
	AI_Output(self, hero, "Info_Mod_Giselle_Satz_Say_17_00"); //Er hat etwas gesagt wie "Milizen ist es in ihrer Vorbildwirkung nicht erlaubt unlautere Taten auszuüben".

	B_LogEntry	(TOPIC_MOD_PAL_RL, "Der Satz des Roboters, den Giselle gehört hat, ist 'Milizen ist es in ihrer Vorbildwirkung nicht erlaubt unlautere Taten auszuüben'.");

	Mod_PAL_HeroBot = 3;
};

FUNC VOID Info_Mod_Giselle_Satz_D()
{
	AI_Output(self, hero, "Info_Mod_Giselle_Satz_D_17_00"); //Jaja ... schon gut, ich wollte ja nicht viel. Auf deine brutale Art steh' ich überhaupt nicht, Süßer.

	Info_ClearChoices	(Info_Mod_Giselle_Satz);

	B_SayBotSentenceGiselle();
};

FUNC VOID Info_Mod_Giselle_Satz_C()
{
	AI_Output(hero, self, "Info_Mod_Giselle_Satz_C_15_00"); //Was willst du?
	AI_Output(self, hero, "Info_Mod_Giselle_Satz_C_17_01"); //Ich will eine Kerze ... du glaubst nicht, wie dunkel es nachts in einem Kerker ist.

	B_LogEntry	(TOPIC_MOD_PAL_RL, "Bevor mir Giselle etwas zum Roboter verrät, soll ich ihr eine Kerze bringen.");
	
	Info_ClearChoices	(Info_Mod_Giselle_Satz);
};

FUNC VOID Info_Mod_Giselle_Satz_B()
{
	AI_Output(hero, self, "Info_Mod_Giselle_Satz_B_15_00"); //Vielleicht würde das ein harter Schlag auf den Hinterkopf auch schaffen.
	
	Info_Mod_Giselle_Satz_D();
};

FUNC VOID Info_Mod_Giselle_Satz_A()
{
	AI_Output(hero, self, "Info_Mod_Giselle_Satz_A_15_00"); //Wenn du es mir nicht sofort sagst brech ich deinem Bruder beide Beine.
	
	Info_Mod_Giselle_Satz_D();
};

INSTANCE Info_Mod_Giselle_Kerze (C_INFO)
{
	npc		= Mod_7234_OUT_Giselle_NW;
	nr		= 1;
	condition	= Info_Mod_Giselle_Kerze_Condition;
	information	= Info_Mod_Giselle_Kerze_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier eine Kerze für dich.";
};

FUNC INT Info_Mod_Giselle_Kerze_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Giselle_Satz))
	&& (Mod_PAL_HeroBot == 2)
	&& (Npc_HasItems(hero, ItMi_Kerze) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Giselle_Kerze_Info()
{
	AI_Output(hero, self, "Info_Mod_Giselle_Kerze_15_00"); //Ich habe hier eine Kerze für dich.

	B_GiveInvItems	(hero, self, ItMi_Kerze, 1);

	AI_Output(self, hero, "Info_Mod_Giselle_Kerze_17_01"); //Danke, jetzt habe ich hier wenigstens ein Licht in dieser dunklen Stunde.
	AI_Output(hero, self, "Info_Mod_Giselle_Kerze_15_02"); //Was hat der Mörder nun gesagt?

	B_GivePlayerXP	(250);

	Mod_PAL_GiselleKerze = 1;

	B_SayBotSentenceGiselle();
};

INSTANCE Info_Mod_Giselle_Pickpocket (C_INFO)
{
	npc		= Mod_7234_OUT_Giselle_NW;
	nr		= 1;
	condition	= Info_Mod_Giselle_Pickpocket_Condition;
	information	= Info_Mod_Giselle_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_40;
};

FUNC INT Info_Mod_Giselle_Pickpocket_Condition()
{
	C_Beklauen	(38, ItMi_Gold, 70);
};

FUNC VOID Info_Mod_Giselle_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Giselle_Pickpocket);

	Info_AddChoice	(Info_Mod_Giselle_Pickpocket, DIALOG_BACK, Info_Mod_Giselle_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Giselle_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Giselle_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Giselle_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Giselle_Pickpocket);
};

FUNC VOID Info_Mod_Giselle_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Giselle_Pickpocket);
};

INSTANCE Info_Mod_Giselle_EXIT (C_INFO)
{
	npc		= Mod_7234_OUT_Giselle_NW;
	nr		= 1;
	condition	= Info_Mod_Giselle_EXIT_Condition;
	information	= Info_Mod_Giselle_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Giselle_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Giselle_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};