INSTANCE Info_Mod_Scar_Belagerung (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_Belagerung_Condition;
	information	= Info_Mod_Scar_Belagerung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alles überstanden?";
};

FUNC INT Info_Mod_Scar_Belagerung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_Belagerung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_Belagerung_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_Belagerung_15_00"); //Alles überstanden?
	AI_Output(self, hero, "Info_Mod_Scar_Belagerung_10_01"); //(sarkastisch) Ja, alles bestens. Uns sind bei der Schlacht fast alle Waffen abhanden gekommen oder zerstört worden.
	AI_Output(hero, self, "Info_Mod_Scar_Belagerung_15_02"); //Kann ich dir helfen?
	AI_Output(self, hero, "Info_Mod_Scar_Belagerung_10_03"); //Wenn du mich so fragst, ja. In der Bibliothek steht eine Kiste, in der eine Anleitung ist, wie man Stahlkampfstäbe herstellen kann.
	AI_Output(self, hero, "Info_Mod_Scar_Belagerung_10_04"); //Besorg mir die Bauanleitung. Doch Vorsicht! Es haben sich mehrere untote Novizen dort verschanzt!
	AI_Output(hero, self, "Info_Mod_Scar_Belagerung_15_05"); //In Ordnung.

	Wld_InsertNpc	(Mod_4009_UntoterNovize_10_MT, "LABYRINTH_71");
	Wld_InsertNpc	(Mod_4010_UntoterNovize_11_MT, "LABYRINTH_71");
	Wld_InsertNpc	(Mod_4011_UntoterNovize_12_MT, "LABYRINTH_71");
	Wld_InsertNpc	(Mod_4012_UntoterNovize_13_MT, "LABYRINTH_71");
	Wld_InsertNpc	(Mod_4013_UntoterNovize_14_MT, "LABYRINTH_71");
	Wld_InsertNpc	(Mod_4014_UntoterNovize_15_MT, "LABYRINTH_71");

	Log_CreateTopic	(TOPIC_MOD_BEL_STAEBE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_STAEBE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Scar will, dass ich ihm die Bauanleitung für Stahlkampfstäbe aus der Bibliothek bringen. Ich soll mich jedoch vor den untoten Novizen dort in acht nehmen.");
};

INSTANCE Info_Mod_Scar_TruheMage (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_TruheMage_Condition;
	information	= Info_Mod_Scar_TruheMage_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bekomme die Truhe nicht auf.";
};

FUNC INT Info_Mod_Scar_TruheMage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scar_Belagerung))
	&& (BEL_TruheMage == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_TruheMage_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_TruheMage_15_00"); //Ich bekomme die Truhe nicht auf. Sie ist anscheinend magisch geschützt!
	AI_Output(self, hero, "Info_Mod_Scar_TruheMage_10_01"); //Mist, das hatte ich vergessen. Ich hatte mir gedacht, dass die Bauanleitung geschützt ist. Wende dich an Gomez, er kennt sich mit so etwas aus!

	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Gomez wird mir bei der verschlossenen Truhe weiterhelfen können, meint Scar. Hoffentlich hat er Recht.");
};

INSTANCE Info_Mod_Scar_HabBauanleitung (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_HabBauanleitung_Condition;
	information	= Info_Mod_Scar_HabBauanleitung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier ist die Bauanleitung.";
};

FUNC INT Info_Mod_Scar_HabBauanleitung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_HabDietrich))
	&& (Npc_HasItems(hero, ItWr_StahlkampfAnleitung) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_HabBauanleitung_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_HabBauanleitung_15_00"); //Hier ist die Bauanleitung. Ich hoffe, das war die Mühe wert.

	B_GiveInvItems	(hero, self, ItWr_StahlkampfAnleitung, 1);

	AI_Output(self, hero, "Info_Mod_Scar_HabBauanleitung_10_01"); //Danke. Hier hast du eine Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

	AI_Output(hero, self, "Info_Mod_Scar_HabBauanleitung_15_02"); //Gut, danke.
	AI_Output(self, hero, "Info_Mod_Scar_HabBauanleitung_10_03"); //Ich werde nun die Waffen schmieden lassen. Erledige deine Aufgaben!

	B_GivePlayerXP	(800);

	B_LogEntry_More	(TOPIC_MOD_BEL_STAEBE, TOPIC_MOD_BEL_BELAGERUNG, "Ich hab Scar die Bauanleitung überreicht und eine Belohnung bekommen.", "Scar habe ich jetzt geholfen. Mal sehen, ob einer der anderen noch Hilfe braucht.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_STAEBE, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Scar_ToteNovizen (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_ToteNovizen_Condition;
	information	= Info_Mod_Scar_ToteNovizen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab ein paar Fragen an dich.";
};

FUNC INT Info_Mod_Scar_ToteNovizen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Abdi_Belagerung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_ToteNovizen_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_ToteNovizen_15_00"); //Ich hab ein paar Fragen an dich.
	AI_Output(self, hero, "Info_Mod_Scar_ToteNovizen_10_01"); //Um was geht es?
	AI_Output(hero, self, "Info_Mod_Scar_ToteNovizen_15_02"); //In den letzten zwei Nächten wurden zwei unserer Novizen tot aufgefunden. Ich muss den Mörder finden, bevor er sich noch jemanden holt.
	AI_Output(hero, self, "Info_Mod_Scar_ToteNovizen_15_03"); //Hast du etwas beobachtet?
	AI_Output(self, hero, "Info_Mod_Scar_ToteNovizen_10_04"); //Ja, letzte Nacht habe ich eine Art Flattern vernommen. Als ich nach draußen kam, war da jedoch nichts. Mehr weiß ich auch nicht.
	AI_Output(hero, self, "Info_Mod_Scar_ToteNovizen_15_05"); //Gut, danke für die Information.

	B_LogEntry	(TOPIC_MOD_BEL_DAEMON, "Scar hat ein Flattern gehört, als er jedoch nach draußen kam, war nicht mehr zu sehen.");
};

INSTANCE Info_Mod_Scar_Jagdtrophaeen_SollIch (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_Jagdtrophaeen_SollIch_Condition;
	information	= Info_Mod_Scar_Jagdtrophaeen_SollIch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Myxir sagt, du hast Probleme mit einem Jäger.";
};

FUNC INT Info_Mod_Scar_Jagdtrophaeen_SollIch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Scar))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_Jagdtrophaeen_SollIch_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_Jagdtrophaeen_SollIch_15_00"); //Myxir sagt, du hast Probleme mit einem Jäger.
	AI_Output(self, hero, "Info_Mod_Scar_Jagdtrophaeen_SollIch_10_01"); //Mit Bartok, richtig. Gerüchteweise vergnügt er sich den ganzen Tag in der Roten Laterne.
	AI_Output(self, hero, "Info_Mod_Scar_Jagdtrophaeen_SollIch_10_02"); //Wer könnte es ihm schon verübeln? Hier im Lager ist ja mit Frauen tote Hose.
	AI_Output(self, hero, "Info_Mod_Scar_Jagdtrophaeen_SollIch_10_03"); //Ändert aber nix dran, dass mal wieder jemand den Schattenläufern die Hörner stutzen muss. Sonst sitz ich hier weiter auf dem Trockenen.
	AI_Output(self, hero, "Info_Mod_Scar_Jagdtrophaeen_SollIch_10_04"); //Wenn du ihn wieder zum Arbeiten kriegst, mach ich dir gute Preise, versprochen.

	Log_CreateTopic	(TOPIC_MOD_FAULERJÄGER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FAULERJÄGER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FAULERJÄGER, "Scar will mir seine Jagdtrophäen erst verkaufen, wenn ich seinen Gehilfen Bartok dazu gebracht habe, wieder jagen zu gehen. Bartok hält sich die meiste Zeit in der Stadt und dort in der 'Roten Laterne' auf.");
};

INSTANCE Info_Mod_Scar_BartokArbeitetWieder (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_BartokArbeitetWieder_Condition;
	information	= Info_Mod_Scar_BartokArbeitetWieder_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bartok arbeitet jetzt wieder.";
};

FUNc INT Info_Mod_Scar_BartokArbeitetWieder_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bartok_ArbeiteWieder))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_BartokArbeitetWieder_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_BartokArbeitetWieder_15_00"); //Bartok arbeitet jetzt wieder.
	AI_Output(self, hero, "Info_Mod_Scar_BartokArbeitetWieder_10_01"); //Danke, du hast mir damit einen großen Gefallen getan.
	AI_Output(self, hero, "Info_Mod_Scar_BartokArbeitetWieder_10_02"); //Ab sofort kann ich dir meine Jagdtrophäen verkaufen.
	AI_Output(self, hero, "Info_Mod_Scar_BartokArbeitetWieder_10_03"); //Nimm dieses Gold als Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_FAULERJÄGER, "Scar verkauft mir jetzt Jagdtrophäen. Ich hoffe, dass er ein Schattenläuferhorn hat.");
	B_SetTopicStatus	(TOPIC_MOD_FAULERJÄGER, LOG_SUCCESS);

	CreateInvItems	(self, ItAt_ShadowHorn, 1);
	CreateInvItems	(self, ItAt_Claw, 5);
	CreateInvItems	(self, itat_LurkerSkin, 3);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Scar_AlteMineQuest (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_AlteMineQuest_Condition;
	information	= Info_Mod_Scar_AlteMineQuest_Info;
	permanent	= 0;
	important	= 1;
};

FUNc INT Info_Mod_Scar_AlteMineQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_AlteMineQuest))
	&& (Npc_IsDead(Mod_7713_DMR_Daemonenritter_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_AlteMineQuest_Info()
{
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest_10_00"); //Verdammt, schon wieder einer dieser Verrückten.
	AI_Output(hero, self, "Info_Mod_Scar_AlteMineQuest_15_01"); //Was ist geschehen?
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest_10_02"); //In der Mine sind alle durchgedreht.
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest_10_03"); //Sie haben erst angefangen sich gegenseitig umzubringen, und nun greifen sie uns an.
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest_10_04"); //Was zum Teufel geht da bloß vor ...

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Scar_AlteMineQuest2 (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_AlteMineQuest2_Condition;
	information	= Info_Mod_Scar_AlteMineQuest2_Info;
	permanent	= 0;
	important	= 1;
};

FUNc INT Info_Mod_Scar_AlteMineQuest2_Condition()
{
	if (Mod_AMQ_Viper == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_AlteMineQuest2_Info()
{
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest2_10_00"); //Du hast die Mine tatsächlich von den Wahnsinnigen befreit?
	AI_Output(hero, self, "Info_Mod_Scar_AlteMineQuest2_15_01"); //Ja, der Spuk hat ein Ende.
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest2_10_02"); //Du bist ein Teufelskerl. Hier, nimm ein paar Trophäen und einen guten Schluck zur Belohnung.

	B_ShowGivenThings	("Dämonenherz, schwarze Perle, 3 Skelettknochen und 2 reinen Alkohol erhalten");

	CreateInvItems	(hero, ItAt_DemonHeart, 1);
	CreateInvItems	(hero, ItMi_DarkPearl, 1);
	CreateInvItems	(hero, ItAt_SkeletonBone, 3);
	CreateInvItems	(hero, ItMi_Alchemy_Alcohol_01, 2);

	B_GivePlayerXP	(100);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Scar_AlterFreund (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_AlterFreund_Condition;
	information	= Info_Mod_Scar_AlterFreund_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na, alter Freund!";
};

FUNc INT Info_Mod_Scar_AlterFreund_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Scar_AlterFreund_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_15_00"); //Na, alter Freund!
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_10_01"); //(stutzt) Alter Freund?
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_15_02"); //(gespielt überrascht) Du erkennst mich nicht wieder? Wir waren einst die besten Kumpel!
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_10_03"); //Mag sein. Ich hab in der Barriere wohl zu viel gesoffen. Kann mich an gar nichts mehr erinnern. (lacht dreckig)

	Info_ClearChoices	(Info_Mod_Scar_AlterFreund);

	if (Npc_HasItems(hero, ItFo_Beer) >= 2)
	{
		Info_AddChoice	(Info_Mod_Scar_AlterFreund, "Lass uns einen auf die alten Zeiten heben!", Info_Mod_Scar_AlterFreund_B);
	};

	Info_AddChoice	(Info_Mod_Scar_AlterFreund, "Du hattest mir damals was versprochen...", Info_Mod_Scar_AlterFreund_A);
};

FUNC VOID Info_Mod_Scar_AlterFreund_B()
{
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_B_15_00"); //Lass uns einen auf die alten Zeiten heben!

	B_GiveInvItems	(hero, self, ItFo_Beer, 1);

	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_B_10_01"); //(verwirrt) Meinetwegen. Auf unsere Freundschaft!

	B_UseItem	(hero, ItFo_Beer);
	B_UseItem	(self, ItFo_Beer);

	Info_ClearChoices	(Info_Mod_Scar_AlterFreund);
};

FUNC VOID Info_Mod_Scar_AlterFreund_A()
{
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_A_15_01"); //Du hattest mir damals was versprochen...
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_A_10_02"); //(düster) Das kann ja nichts Gutes bedeuten.

	Info_ClearChoices	(Info_Mod_Scar_AlterFreund);

	Info_AddChoice	(Info_Mod_Scar_AlterFreund, "Du schuldest mir noch Gold. Ich hab eine Wette gewonnen.", Info_Mod_Scar_AlterFreund_D);
	Info_AddChoice	(Info_Mod_Scar_AlterFreund, "Du wolltest mir eine Waffe besorgen.", Info_Mod_Scar_AlterFreund_C);
};

FUNC VOID Info_Mod_Scar_AlterFreund_D()
{
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_D_15_00"); //Du schuldest mir noch Gold. Ich hab eine Wette gewonnen.
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_D_10_01"); //(misstrauisch) Gold? Ich dachte, in der Barriere wurde mir Erz gehandelt?
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_D_15_02"); //Mein ich ja.
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_D_10_03"); //(lacht) Na, mein Erz kannst du gern haben. Ist eh nicht mehr viel. Und wenn du dann zufrieden bist...

	B_GiveInvItems	(self, hero, ItMi_Nugget, 1);

	Info_ClearChoices	(Info_Mod_Scar_AlterFreund);
};

FUNC VOID Info_Mod_Scar_AlterFreund_C()
{
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_C_15_00"); //Du wolltest mir eine Waffe besorgen.
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_C_10_01"); //Hmm, wenn es nur das ist. Davon hab ich genug.
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_C_10_02"); //Nimm die hier, dann sind wir aber auch quitt!

	B_GiveInvItems	(self, hero, ItMw_1h_Mil_Sword, 1);

	Info_ClearChoices	(Info_Mod_Scar_AlterFreund);
};

INSTANCE Info_Mod_Scar_VieleSchwerter (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_VieleSchwerter_Condition;
	information	= Info_Mod_Scar_VieleSchwerter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du schleppst aber viele Schwerter mit dir rum!";
};

FUNc INT Info_Mod_Scar_VieleSchwerter_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Scar_VieleSchwerter_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_VieleSchwerter_15_00"); //Du schleppst aber viele Schwerter mit dir rum!
	AI_Output(self, hero, "Info_Mod_Scar_VieleSchwerter_10_01"); //Ja, sind ganz schön schwer. Aber Andokai hat gemeint, dass ich ja für irgendwas gut sein muss, deswegen verkaufe ich die jetzt.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_BELIARFESTUNG, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_BELIARFESTUNG, "Scar handelt mit Waffen.");
};

INSTANCE Info_Mod_Scar_Befoerderung (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_Befoerderung_Condition;
	information	= Info_Mod_Scar_Befoerderung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will Dämonenritter werden.";
};

FUNC INT Info_Mod_Scar_Befoerderung_Condition()
{
	if (Mod_Gilde == 15)
	&& ((Kapitel > 4)
	|| (Npc_KnowsInfo(hero, Info_Mod_Xardas_AW_Bshydal)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_Befoerderung_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_Befoerderung_15_00"); //Ich will Dämonenritter werden.
	AI_Output(self, hero, "Info_Mod_Scar_Befoerderung_10_01"); //Dämonenritter werden nur die Besten von uns. Doch du hast dir diesen Rang verdient.
	AI_Output(self, hero, "Info_Mod_Scar_Befoerderung_10_02"); //Ich werde dich in den Rang des Dämonenritters erheben.
	AI_Output(self, hero, "Info_Mod_Scar_Befoerderung_10_03"); //Hier ist deine Rüstung.

	CreateInvItems	(hero, ITAR_Raven_Addon, 1);

	AI_PrintScreen (ITAR_Raven_Addon.name, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

	B_GivePlayerXP	(400);

	B_Göttergefallen(3, 5);

	Mod_Gilde = 16;

	Snd_Play ("LEVELUP");
};

INSTANCE Info_Mod_Scar_Trade (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_Trade_Condition;
	information	= Info_Mod_Scar_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Scar_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scar_VieleSchwerter))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Scar_Pickpocket (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_Pickpocket_Condition;
	information	= Info_Mod_Scar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Scar_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Scar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Scar_Pickpocket);

	Info_AddChoice	(Info_Mod_Scar_Pickpocket, DIALOG_BACK, Info_Mod_Scar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Scar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Scar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Scar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Scar_Pickpocket);
};

FUNC VOID Info_Mod_Scar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Scar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Scar_Pickpocket);

		Info_AddChoice	(Info_Mod_Scar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Scar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Scar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Scar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Scar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Scar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Scar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Scar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Scar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Scar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Scar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Scar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Scar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Scar_EXIT (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_EXIT_Condition;
	information	= Info_Mod_Scar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Scar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Scar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};