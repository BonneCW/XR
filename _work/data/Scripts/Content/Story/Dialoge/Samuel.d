INSTANCE Info_Mod_Samuel_Hi (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_Hi_Condition;
	information	= Info_Mod_Samuel_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Samuel_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Samuel_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Samuel_Hi_14_01"); //Ich bin Samuel. Nimm erstmal nen ordentlichen Schluck Grog.
	
	B_GiveInvItems	(self, hero, ItFo_Addon_Grog, 1);

	B_UseItem	(hero, ItFo_Addon_Grog);

	AI_Output(self, hero, "Info_Mod_Samuel_Hi_14_02"); //Wenn du mehr willst, dann geh zu Skip, ich bring mein Zeug meistens zu ihm. Ich hab nicht viel, aber wenn du willst, kann ich dir auch etwas verkaufen.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PIRATEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PIRATEN, "Samuel hat ein wenig Grog, den er mir verkaufen könnte.");
};

INSTANCE Info_Mod_Samuel_Auftrag (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_Auftrag_Condition;
	information	= Info_Mod_Samuel_Auftrag_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greg schickt mich";
};

FUNC INT Info_Mod_Samuel_Auftrag_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Greg_Karte))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_Auftrag_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_Auftrag_15_00"); //Greg schickt mich. Ich soll mich nützlich machen, weil er in See stechen will.
	AI_Output(self, hero, "Info_Mod_Samuel_Auftrag_14_01"); //Sehr gut, ich brauch jemanden der mir die Zutaten für nen ordentlichen Rum beschafft.
	AI_Output(self, hero, "Info_Mod_Samuel_Auftrag_14_02"); //Bring mir 10 Gläser Melasse und 20 Flaschen Wasser.
	AI_Output(hero, self, "Info_Mod_Samuel_Auftrag_15_03"); //Lasse?
	AI_Output(self, hero, "Info_Mod_Samuel_Auftrag_14_04"); //Melasse! Sowas ähnliches wie Honig.
	AI_Output(self, hero, "Info_Mod_Samuel_Auftrag_14_05"); //Daraus lässt sich ein anständiger rum brauen, sag ich dir!
	AI_Output(hero, self, "Info_Mod_Samuel_Auftrag_15_06"); //Und woher krieg ich Melasse?
	AI_Output(self, hero, "Info_Mod_Samuel_Auftrag_14_07"); //Aus der Stadt. Entweder am Markt oder im Hafenviertel.

	Log_CreateTopic	(TOPIC_MOD_SAMUEL_RUM, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SAMUEL_RUM, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SAMUEL_RUM, "Ich soll in der Stadt Khorinis 10 Gläser Melasse und 20 Flaschen Wasser für Samuel besorgen.");
};

INSTANCE Info_Mod_Samuel_HabZeug (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_HabZeug_Condition;
	information	= Info_Mod_Samuel_HabZeug_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab das Zeug.";
};

FUNC INT Info_Mod_Samuel_HabZeug_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_Auftrag))
	&& (Npc_HasItems(hero, ItFo_Water) > 19)
	&& (Npc_HasItems(hero, ItFo_Melasse) > 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_HabZeug_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_HabZeug_15_00"); //Ich hab das Zeug.

	Npc_RemoveInvItems	(hero, ItFo_Water, 20);
	Npc_RemoveInvItems	(hero, ItFo_Melasse, 20);

	B_ShowGivenThings	("20 Wasser und 20 Melasse gegeben");

	AI_Output(self, hero, "Info_Mod_Samuel_HabZeug_14_01"); //Gut, dann haben wir unseren Rumvorrat gesichert.
	AI_Output(self, hero, "Info_Mod_Samuel_HabZeug_14_02"); //Hier ist dein Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 400);

	B_GivePlayerXP	(200);

	Mod_PiratenVorbereitungen += 1;

	B_Göttergefallen(2, 1);

	B_SetTopicStatus	(TOPIC_MOD_SAMUEL_RUM, LOG_SUCCESS);

	B_LogEntry	(TOPIC_MOD_PIRATEN_SCHATZSUCHE, "Ich habe Samuel geholfen den Rumvorrat zu sichern.");
};

INSTANCE Info_Mod_Samuel_SkipFleisch (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_SkipFleisch_Condition;
	information	= Info_Mod_Samuel_SkipFleisch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo! Hab hier 'nen Haufen Fleisch.";
};

FUNC INT Info_Mod_Samuel_SkipFleisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Fleisch))
	&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= 30)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_SkipFleisch_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch_15_00"); //Hallo! Hab hier 'nen Haufen Fleisch. Du sollst es pökeln. Und dich beeilen.

	B_GiveInvItems	(hero, self, ItFo_MuttonRaw, 30);

	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch_14_01"); //Pökeln? Will Greg auslaufen?
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch_15_02"); //Gewiss. Er hat da eine Schatzkarte ...
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch_14_03"); //Das ist mal was Neues. Morgen ist das Fleisch fertig.

	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "Samuel wird das Fleisch morgen fertig haben. Ich sollte mich solange um die anderen kümmern ...");

	Mod_PIR_Samuel_Poekelfleisch = Wld_GetDay();
};

INSTANCE Info_Mod_Samuel_SkipFleisch2 (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_SkipFleisch2_Condition;
	information	= Info_Mod_Samuel_SkipFleisch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du fertig?";
};

FUNC INT Info_Mod_Samuel_SkipFleisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_SkipFleisch))
	&& (Wld_GetDay() > Mod_PIR_Samuel_Poekelfleisch)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_SkipFleisch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch2_15_00"); //Bist du fertig?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch2_14_01"); //Leider nicht. Mir ist das Salz ausgegangen.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch2_15_02"); //Und wo kriegst du neues her?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch2_14_03"); //Das ist das Problem. Sonst hab ich es hinten in der Höhle geschlagen.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch2_14_04"); //Aber da nisten seit kurzem Minecrawler drin. Da bringt mich keiner mehr rein.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch2_15_05"); //Dann muss ich mich wohl um das Salz kümmern.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch2_14_06"); //So ist es. Ich brauche mindest dreis Brocken.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch2_15_07"); //Immer auf die Kleinen ...

	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "Leider ist Samuel mit dem Fleisch noch nicht fertig, da ihm das Salz ausgegangen ist. In der Höhle am Nordstrand ist eine Salzader, doch dort sind seit kurzem einige Minecrawler. Aber ich habe wohl keine Wahl ...");

	Wld_InsertNpc	(Minecrawler,	"ADW_PIRATECAMP_CAVE3_04");
	Wld_InsertNpc	(Minecrawler,	"ADW_PIRATECAMP_CAVE3_04");
	Wld_InsertNpc	(MinecrawlerWarrior,	"ADW_PIRATECAMP_CAVE3_04");
};

INSTANCE Info_Mod_Samuel_SkipFleisch3 (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_SkipFleisch3_Condition;
	information	= Info_Mod_Samuel_SkipFleisch3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, dein Salz.";
};

FUNC INT Info_Mod_Samuel_SkipFleisch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_SkipFleisch2))
	&& (Npc_HasItems(hero, ItMi_Salznugget) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_SkipFleisch3_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch3_15_00"); //Hier, dein Salz.

	B_GiveInvItems	(hero, self, ItMi_Salznugget, 3);

	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch3_15_01"); //Die paar Crawler hättest du aber selbst ...
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch3_14_02"); //Wo denkst du hin? Ich bin Gelehrter, kein Schlächter.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch3_15_03"); //Also gut. Wann kann ich ...
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch3_14_04"); //Das Fleisch muss über Nacht reifen.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch3_15_05"); //Also morgen?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch3_14_06"); //Genau.

	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "Morgen sollte das Fleisch dann fertig sein.");

	Mod_PIR_Samuel_Poekelfleisch = Wld_GetDay();
};

INSTANCE Info_Mod_Samuel_SkipFleisch4 (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_SkipFleisch4_Condition;
	information	= Info_Mod_Samuel_SkipFleisch4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Samuel_SkipFleisch4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_SkipFleisch3))
	&& (Wld_GetDay() > Mod_PIR_Samuel_Poekelfleisch)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_SkipFleisch4_Info()
{
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch4_14_00"); //Du kommst genau richtig. Das Fleisch ist fertig.

	B_GiveInvItems	(self, hero, ItFo_Poekelfleisch_Skip, 30);

	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch4_15_01"); //Ich kann's also Skip bringen?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch4_14_02"); //Ja. Sag ihm, er soll's noch zum Trocknen auslegen oder -hängen.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch4_15_03"); //Mach ich.

	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "Ich hab das gepökelte Fleisch. Jetzt auf zu Skip ...");
};

INSTANCE Info_Mod_Samuel_Kompass (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_Kompass_Condition;
	information	= Info_Mod_Samuel_Kompass_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greg glaubt, du hast einlge Eisspruchrollen. Kann ich die haben?";
};

FUNC INT Info_Mod_Samuel_Kompass_Condition()
{
	if (Mod_VorbereitungenFertig == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_Kompass_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_Kompass_15_00"); //Greg glaubt, du hast einlge Eisspruchrollen. Kann ich die haben?
	AI_Output(self, hero, "Info_Mod_Samuel_Kompass_14_01"); //Hm ... Ungern. Ich brauch manchmal Eis für meine Tränke.
	AI_Output(self, hero, "Info_Mod_Samuel_Kompass_14_02"); //UndSkip kommt öfters und holt sich welches. Er meint, Rum auf Eis schmecke besser als ohne.
	AI_Output(hero, self, "Info_Mod_Samuel_Kompass_15_03"); //Ich muss rüber zum anderen Strand, da sind wahrscheinlich Feuerwarane. Da kann ich die Rollen gut gebrauchen.
	AI_Output(hero, self, "Info_Mod_Samuel_Kompass_15_04"); //Ich besorg dir auch später wieder welche. Versprochen.
	AI_Output(self, hero, "Info_Mod_Samuel_Kompass_14_05"); //Nun gut. Hier hast du drei Stück.

	B_GiveInvItems	(self, hero, ItSc_IceCube, 3);

	AI_Output(hero, self, "Info_Mod_Samuel_Kompass_15_06"); //Danke.
};

INSTANCE Info_Mod_Samuel_SkipToDead (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_SkipToDead_Condition;
	information	= Info_Mod_Samuel_SkipToDead_Info;
	permanent	= 0;
	important	= 0;
	description	= "Samuel, du musst mir unbedingt helfen.";
};

FUNC INT Info_Mod_Samuel_SkipToDead_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Befreiung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_SkipToDead_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_00"); //Samuel, du musst mir unbedingt helfen.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_01"); //Was ist denn los?
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_02"); //Skip wurde während des großen Kampfes schwer verwundet und wird ohne die richtige Medizin sicher bald sterben.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_03"); //Was hat er denn?
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_04"); //Er wurde von einem Feuerball getroffen.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_05"); //Da gibt es tatsächlich einen Trank dagegen. Er nennt sich "Adanos Wohltat".
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_06"); //In den alten Schriften hier in Jharkendar habe ich einst das Rezept dazu gefunden.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_07"); //Kannst du mir diesen Trank geben.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_08"); //Leider konnte ich ihn nie brauen, weil ich die Zutaten dafür nicht hatte.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_09"); //Was für Zutaten brauchst du denn?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_10"); //Insgesamt sind es drei wichtige Sachen, die ich benötige.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_11"); //Welche sind das?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_12"); //Zuerst brauche ich eine Rune der leichten Wundheilung. Ein Stück des Runensteins ist notwendig für die Wirkung des Trankes.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_13"); //Wo finde ich eine solche Rune?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_14"); //Frag mal diesen Myxir, vielleicht hat er eine.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_15"); //Was brauchst du noch?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_16"); //Als Zweites benötige ich eine Trollkirsche.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_17"); //Wo kann ich eine Trollkirsche bekommen?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_18"); //Am südlichen Strand müsste ein Troll rumlungern. In den Exkrementen der Trolle kannst du solche Früchte finden.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_19"); //Und als Letztes?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_20"); //Es fehlen noch ein paar Kräuter. Ein Kronstöckl, vier Heilpflanzen und fünf Feuernesseln.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_21"); //Die findest du eigentlich überall, nur beim Kronstöckl musst du etwas suchen.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_22"); //Gut, ich mach mich sofort auf den Weg.

	B_LogEntry	(TOPIC_MOD_BEL_PIRSKIP, "Samuel kennt das Rezept für einen Heiltrank, der Skip retten kann, doch die Liste mit benötigten Zutaten ist lang. Neben einer Rune der leichten Wundheilung, die ich mit etwas Glück bei Myxir bekommen kann, brauche ich auch noch eine Trollkirsche, die in den Exkrementen von Trollen zu finden sein soll, einen Kronstöckl, vier Heilpflanzen und fünf Feuernesseln. Ein Troll soll sich zur Zeit beim südlichen Strand befinden, den Rest muss ich wohl suchen.");

	B_TeachPlayerTalentAlchemy (self, hero, POTION_AdanosWohltat);

	Wld_InsertNpc	(Troll, "FP_ROAM_LONEBEACH_11");

	Wld_InsertItem	(ItPl_Trollkirsche, "FP_ITEM_TROLLKIRSCHE_01");
	Wld_InsertItem	(ItPl_Trollkirsche, "FP_ITEM_TROLLKIRSCHE_02");
	Wld_InsertItem	(ItPl_Perm_Herb, "FP_ITEM_KRONSTOECKL_01");
};

INSTANCE Info_Mod_Samuel_AdanosWohltat (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_AdanosWohltat_Condition;
	information	= Info_Mod_Samuel_AdanosWohltat_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe alle Sachen.";
};

FUNC INT Info_Mod_Samuel_AdanosWohltat_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_SkipToDead))
	&& (Npc_HasItems(hero, ItRu_LightHeal) >= 1)
	&& (Npc_HasItems(hero, ItPl_Trollkirsche) >= 1)
	&& (Npc_HasItems(hero, ItPl_Perm_Herb) >= 1)
	&& (Npc_HasItems(hero, ItPl_Mana_Herb_01) >= 5)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 4)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Skip_Befreiung2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_AdanosWohltat_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_AdanosWohltat_15_00"); //Ich habe alle Sachen, die du benötgst, gefunden.

	B_ShowGivenThings	("Gegenstände gegeben");

	Npc_RemoveInvItems	(hero, ItRu_LightHeal, 1);
	Npc_RemoveInvItems	(hero, ItPl_Trollkirsche, 1);
	Npc_RemoveInvItems	(hero, ItPl_Perm_Herb, 1);
	Npc_RemoveInvItems	(hero, ItPl_Mana_Herb_01, 5);
	Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01, 4);

	AI_Output(self, hero, "Info_Mod_Samuel_AdanosWohltat_14_01"); //Sehr gut. Ich habe bis morgen sicher den Trank fertig. Komme dann wieder.
	AI_Output(hero, self, "Info_Mod_Samuel_AdanosWohltat_15_02"); //Ok.
	
	B_LogEntry	(TOPIC_MOD_BEL_PIRSKIP, "Ich habe Samuel die Zutaten gebracht. Bis morgen wird er den Trank fertig haben.");

	Mod_SamuelSkipsTrank = Wld_GetDay();

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Samuel_AdanosWohltat2 (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_AdanosWohltat2_Condition;
	information	= Info_Mod_Samuel_AdanosWohltat2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und?";
};

FUNC INT Info_Mod_Samuel_AdanosWohltat2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_AdanosWohltat))
	&& (Wld_GetDay() > Mod_SamuelSkipsTrank)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_AdanosWohltat2_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_AdanosWohltat2_15_00"); //Und?
	AI_Output(self, hero, "Info_Mod_Samuel_AdanosWohltat2_14_01"); //Es hat lange gedauert, aber hier ist der Trank. Bring' ihn schleunigst zu Skip.

	B_GiveInvItems	(self, hero, ItPo_AdanosWohltat, 1);

	AI_Output(hero, self, "Info_Mod_Samuel_AdanosWohltat2_15_02"); //Verstanden.
	
	B_LogEntry	(TOPIC_MOD_BEL_PIRSKIP, "Samuel hat mir den Trank gegeben. Jetzt sollte ich schnell zu Skip.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Samuel_Trade (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_Trade_Condition;
	information	= Info_Mod_Samuel_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Samuel_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Samuel_Pickpocket (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_Pickpocket_Condition;
	information	= Info_Mod_Samuel_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Samuel_Pickpocket_Condition()
{
	C_Beklauen	(84, ItFo_Addon_Rum, 19);
};

FUNC VOID Info_Mod_Samuel_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);

	Info_AddChoice	(Info_Mod_Samuel_Pickpocket, DIALOG_BACK, Info_Mod_Samuel_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Samuel_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Samuel_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Samuel_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);
};

FUNC VOID Info_Mod_Samuel_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);

		Info_AddChoice	(Info_Mod_Samuel_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Samuel_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Samuel_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Samuel_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Samuel_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Samuel_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Samuel_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Samuel_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Samuel_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Samuel_EXIT (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_EXIT_Condition;
	information	= Info_Mod_Samuel_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Samuel_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Samuel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};