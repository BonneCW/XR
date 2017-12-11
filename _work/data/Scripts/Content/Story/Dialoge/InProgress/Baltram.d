INSTANCE Info_Mod_Baltram_Hi (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Hi_Condition;
	information	= Info_Mod_Baltram_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Baltram_Hi_Condition()
{
	if (Wld_IsTime(05,05,20,05))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Baltram_Hi_16_00"); //Hallo, Fremder. Ich bin Baltram und handle mit Lebensmitteln.
	AI_Output(self, hero, "Info_Mod_Baltram_Hi_16_01"); //Solltest du jemals den Drang nach frischem Brot und Obst verspüren, dann kannst du zu mir kommen.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Baltram handelt mit Lebensmitteln.");
};

INSTANCE Info_Mod_Baltram_WieLaeufts (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_WieLaeufts_Condition;
	information	= Info_Mod_Baltram_WieLaeufts_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie läuft das Geschäft?";
};

FUNC INT Info_Mod_Baltram_WieLaeufts_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_Hi))
	&& (hero.guild != GIL_KDF)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_WieLaeufts_Info()
{
	AI_Output(hero, self, "Info_Mod_Baltram_WieLaeufts_15_00"); //Wie läuft das Geschäft?
	AI_Output(self, hero, "Info_Mod_Baltram_WieLaeufts_16_01"); //Es lief schon mal besser. Ich kann zwar meine Waren gut absetzen, aber der Nachschub von den Bauernhöfen kommt nur stockend.
	AI_Output(self, hero, "Info_Mod_Baltram_WieLaeufts_16_02"); //Die feigen Bauern trauen sich nicht, ihre Ladungen los zu schicken, weil sich in letzter Zeit die Überfälle häufen.
	AI_Output(hero, self, "Info_Mod_Baltram_WieLaeufts_15_03"); //Überfälle?
	AI_Output(self, hero, "Info_Mod_Baltram_WieLaeufts_16_04"); //Einiges von dem Diebesgesindel aus dem Minental zieht jetzt plündernd durch die Lande.
	AI_Output(self, hero, "Info_Mod_Baltram_WieLaeufts_16_05"); //Auflauern und aus dem Hinterhalt niedermachen ist das Einzige, was die können.
};

INSTANCE Info_Mod_Baltram_Warentransporte (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Warentransporte_Condition;
	information	= Info_Mod_Baltram_Warentransporte_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich könnte mich um die zurückgehaltenen Warentransporte (...)";
};

FUNC INT Info_Mod_Baltram_Warentransporte_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_WieLaeufts))
	&& (hero.guild != GIL_KDF)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Warentransporte_Info()
{
	AI_Output(hero, self, "Info_Mod_Baltram_Warentransporte_15_00"); //Ich könnte mich um die zurückgehaltenen Warentransporte kümmern.
	AI_Output(self, hero, "Info_Mod_Baltram_Warentransporte_16_01"); //Du traust dich was! Aber gern, gern, mach nur!
	AI_Output(self, hero, "Info_Mod_Baltram_Warentransporte_16_02"); //Mir fehlen noch die Transporte von Lobart und Bengar. Lobart wollte mir Rüben verkaufen, und von Bengar bekomme ich Brot.
	AI_Output(self, hero, "Info_Mod_Baltram_Warentransporte_16_03"); //Aber sieh dich bloß auf den Straßen vor!

	Log_CreateTopic	(TOPIC_MOD_BALTRAM_WARENTRANSPORTE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BALTRAM_WARENTRANSPORTE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BALTRAM_WARENTRANSPORTE, "Wegen der prekären Situation durch plündernde Sträflinge wollen die Bauern Lobart und Bengar ihre Waren nicht an Baltram versenden. Ich spiele also den Laufburschen.");

	Wld_InsertNpc	(Mod_7557_STRF_Straefling_NW, "NW_FARM1_PATH_SPAWN_05");
	Wld_InsertNpc	(Mod_7558_STRF_Straefling_NW, "NW_FARM1_PATH_SPAWN_05");
};

INSTANCE Info_Mod_Baltram_Warentransporte2 (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Warentransporte2_Condition;
	information	= Info_Mod_Baltram_Warentransporte2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe deine Waren abgeholt.";
};

FUNC INT Info_Mod_Baltram_Warentransporte2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_Warentransporte))
	&& (Npc_HasItems(hero, ItPl_Beet) >= 20)
	&& (Npc_HasItems(hero, ItFo_Bread) >= 30)
	&& (Mod_LobartsRuebenBaltram == 1)
	&& (Mod_BengarBaltram == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Warentransporte2_Info()
{
	AI_Output(hero, self, "Info_Mod_Baltram_Warentransporte2_15_00"); //Ich habe deine Waren abgeholt.

	Npc_RemoveInvItems	(hero, ItFo_Bread, 30);
	Npc_RemoveInvItems	(hero, ItPl_Beet, 20);

	B_ShowGivenThings	("30 Brote und 20 Feldrüben gegeben");

	AI_Output(self, hero, "Info_Mod_Baltram_Warentransporte2_16_01"); //Gut, gut! Du hast das Gold für Bengar aus eigener Tasche bezahlt? 150 Gold?
	AI_Output(hero, self, "Info_Mod_Baltram_Warentransporte2_15_02"); //Natürlich.
	AI_Output(self, hero, "Info_Mod_Baltram_Warentransporte2_16_03"); //Dann hast du es hiermit zurück.

	B_GiveInvItems	(self, hero, ItMi_Gold, 150);

	AI_Output(self, hero, "Info_Mod_Baltram_Warentransporte2_16_04"); //Kannst dich ja mal in meinem Sortiment umsehen, für 150 bekommt man viele schöne Dinge ...

	B_SetTopicStatus	(TOPIC_MOD_BALTRAM_WARENTRANSPORTE, LOG_SUCCESS);

	B_GivePlayerXP	(150);

	CurrentNQ += 1;

	CreateInvItems	(self, ItFo_Bread, 15);
	CreateInvItems	(self, ItPl_Beet, 10);
};

INSTANCE Info_Mod_Baltram_MatteoLehrling1 (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_MatteoLehrling1_Condition;
	information	= Info_Mod_Baltram_MatteoLehrling1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hat sich da unter deinem Stand (...) (Apfel platzieren)";
};

FUNC INT Info_Mod_Baltram_MatteoLehrling1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Baltram_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_MatteoLehrling1_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL01");

	AI_PlayAni	(self, "T_PLUNDER");

	B_Say	(hero, self, "$PLACEAPFEL02");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Baltram_Apfel = 1;
};

INSTANCE Info_Mod_Baltram_MatteoLehrling2 (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_MatteoLehrling2_Condition;
	information	= Info_Mod_Baltram_MatteoLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, wird der da drüben nicht gesucht? (Apfel platzieren)";
};

FUNC INT Info_Mod_Baltram_MatteoLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Baltram_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_MatteoLehrling2_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL03");

	AI_PlayAni	(self, "T_SEARCH");

	B_Say	(hero, self, "$PLACEAPFEL04");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Baltram_Apfel = 1;
};

INSTANCE Info_Mod_Baltram_MatteoLehrling3 (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_MatteoLehrling3_Condition;
	information	= Info_Mod_Baltram_MatteoLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Schöne Äpfel hast du da ... (Apfel platzieren)";
};

FUNC INT Info_Mod_Baltram_MatteoLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Baltram_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_MatteoLehrling3_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL05");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Baltram_Apfel = 1;
};

INSTANCE Info_Mod_Baltram_Daemonisch (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Daemonisch_Condition;
	information	= Info_Mod_Baltram_Daemonisch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, ich komme von Coragon und soll das Paket mit Pökelfleisch abholen.";
};

FUNC INT Info_Mod_Baltram_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Coragon_Daemonisch2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Daemonisch_Info()
{
	AI_Output(hero, self, "Info_Mod_Baltram_Daemonisch_15_00"); //Hey, ich komme von Coragon und soll das Paket mit Pökelfleisch abholen.
	AI_Output(self, hero, "Info_Mod_Baltram_Daemonisch_16_01"); //Ahh, ja, ok, ist vorhin angekommen und alles schon bezahlt.

	B_GiveInvItems	(self, hero, ItMi_CoragonDaemonisch, 1);

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Baltram_Daemonisch_15_02"); //(zu sich selbst) So, das sollte ich jetzt mal an einem Alchemietisch etwas präparieren.
};

INSTANCE Info_Mod_Baltram_Melasse (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Melasse_Condition;
	information	= Info_Mod_Baltram_Melasse_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du Melasse?";
};

FUNC INT Info_Mod_Baltram_Melasse_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Samuel_Auftrag))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Kardif_Melasse))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Samuel_HabZeug))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Melasse_Info()
{
	AI_Output(hero, self, "Info_Mod_Baltram_Melasse_15_00"); //Hast du Melasse?
	AI_Output(self, hero, "Info_Mod_Baltram_Melasse_16_01"); //Damit kann ich dir leider nicht dienen, aber ich glaube, Kardif, der Wirt der Hafenkneipe, hat was.

	B_LogEntry	(TOPIC_MOD_SAMUEL_RUM, "Baltram hat keine Melasse, aber er glaubt, dass Kardif, der Wirt der Hafenkneipe, etwas davon hat.");
};

INSTANCE Info_Mod_Baltram_Dokumente (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Dokumente_Condition;
	information	= Info_Mod_Baltram_Dokumente_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du noch die Blätter von Erhard?";
};

FUNC INT Info_Mod_Baltram_Dokumente_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_Hi))
	&& (Mod_REL_Dokumente == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Dokumente_Info()
{
	AI_Output(hero, self, "Info_Mod_Baltram_Dokumente_15_00"); //Hast du noch die Blätter von Erhard?
	AI_Output(self, hero, "Info_Mod_Baltram_Dokumente_16_01"); //Welche ... Ah, ich verstehe. So Leid es mir tut, ich bin nicht mehr in ihrem Besitz.
	AI_Output(hero, self, "Info_Mod_Baltram_Dokumente_15_02"); //Wie vorherzusehen war ...
	AI_Output(self, hero, "Info_Mod_Baltram_Dokumente_16_03"); //Keineswegs! Mika von der hiesigen Stadtwache beschlagnahmte sie, als er meine Ladung überprüfte.
	AI_Output(self, hero, "Info_Mod_Baltram_Dokumente_16_04"); //Dabei ist doch solch ein Besitz nicht verboten!
	AI_Output(hero, self, "Info_Mod_Baltram_Dokumente_15_05"); //Ich werde mich darum kümmern.

	B_LogEntry	(TOPIC_MOD_KHORATA_DOKUMENTE, "Auch Baltram hat die Seiten verloren, und zwar an Mika von der Stadtwache.");

	Mod_REL_Dokumente = 3;
};

INSTANCE Info_Mod_Baltram_Blutkelch (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Blutkelch_Condition;
	information	= Info_Mod_Baltram_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich suche einen Blutkelch.";
};

FUNC INT Info_Mod_Baltram_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mustafa_PosWechsel))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Baltram_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Baltram_Blutkelch_15_00"); //Ich suche einen Blutkelch.
	AI_Output(self, hero, "Info_Mod_Baltram_Blutkelch_16_01"); //Hmm ... Du solltest es mal bei einem Raritätenhändler versuchen. Gibt doch einige auf Khorinis.
	AI_Output(self, hero, "Info_Mod_Baltram_Blutkelch_16_02"); //Ach ja. Neulich kam einer hier vorbei. Er nannte sich Morpheus. Kam wohl aus einer anderen Ecke der Insel.
	AI_Output(hero, self, "Info_Mod_Baltram_Blutkelch_15_03"); //Gute Idee. Versuch ich bei denen mal mein Glück.

	B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Zuris meint, ich solle es mit dem Kelch bei den Raritätenhändlern versuchen. Einer heißt Morpheus und kommt wohl von weiter her. Ansonsten wären da wohl noch Lutero und Erol ...");

	B_StartOtherRoutine	(Mod_521_NONE_Erol_NW, "TOT");
};

INSTANCE Info_Mod_Baltram_Anschlagtafel (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Anschlagtafel_Condition;
	information	= Info_Mod_Baltram_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe deinen Aushang an der Anschlagtafel gesehen ...";
};

FUNC INT Info_Mod_Baltram_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Baltram == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItFo_Milk) >= Mod_Anschlagtafel_Khorinis_Baltram_Milch)
	&& (Npc_HasItems(hero, ItFo_Cheese) >= Mod_Anschlagtafel_Khorinis_Baltram_Kaese)
	&& (Npc_HasItems(hero, ItFo_Bread) >= Mod_Anschlagtafel_Khorinis_Baltram_Brot)
	&& (Npc_HasItems(hero, ItFo_Water) >= Mod_Anschlagtafel_Khorinis_Baltram_Wasser)
	&& (Npc_HasItems(hero, ItFo_Beer) >= Mod_Anschlagtafel_Khorinis_Baltram_Bier)
	&& (Npc_HasItems(hero, ItFo_Booze) >= Mod_Anschlagtafel_Khorinis_Baltram_Wacholder)
	&& (Npc_HasItems(hero, ItFo_Wine) >= Mod_Anschlagtafel_Khorinis_Baltram_Wein)
	&& (Npc_HasItems(hero, ItFo_Sausage) >= Mod_Anschlagtafel_Khorinis_Baltram_Wurst)
	&& (Npc_HasItems(hero, ItFo_Addon_Grog) >= Mod_Anschlagtafel_Khorinis_Baltram_Grog)
	&& (Npc_HasItems(hero, ItFo_Addon_Rum) >= Mod_Anschlagtafel_Khorinis_Baltram_Rum)
	&& (Npc_HasItems(hero, ItFo_Kuerbis) >= Mod_Anschlagtafel_Khorinis_Baltram_Kuerbis)
	&& (Npc_HasItems(hero, ItPl_Melone) >= Mod_Anschlagtafel_Khorinis_Baltram_Melone)
	&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= Mod_Anschlagtafel_Khorinis_Baltram_Fleisch)
	{
		Npc_RemoveInvItems	(hero, ItFo_Milk, Mod_Anschlagtafel_Khorinis_Baltram_Milch);
		Npc_RemoveInvItems	(hero, ItFo_Cheese, Mod_Anschlagtafel_Khorinis_Baltram_Kaese);
		Npc_RemoveInvItems	(hero, ItFo_Bread, Mod_Anschlagtafel_Khorinis_Baltram_Brot);
		Npc_RemoveInvItems	(hero, ItFo_Water, Mod_Anschlagtafel_Khorinis_Baltram_Wasser);
		Npc_RemoveInvItems	(hero, ItFo_Beer, Mod_Anschlagtafel_Khorinis_Baltram_Bier);
		Npc_RemoveInvItems	(hero, ItFo_Booze, Mod_Anschlagtafel_Khorinis_Baltram_Wacholder);
		Npc_RemoveInvItems	(hero, ItFo_Wine, Mod_Anschlagtafel_Khorinis_Baltram_Wein);
		Npc_RemoveInvItems	(hero, ItFo_Sausage, Mod_Anschlagtafel_Khorinis_Baltram_Wurst);
		Npc_RemoveInvItems	(hero, ItFo_Addon_Grog, Mod_Anschlagtafel_Khorinis_Baltram_Grog);
		Npc_RemoveInvItems	(hero, ItFo_Addon_Rum, Mod_Anschlagtafel_Khorinis_Baltram_Rum);
		Npc_RemoveInvItems	(hero, ItFo_Kuerbis, Mod_Anschlagtafel_Khorinis_Baltram_Kuerbis);
		Npc_RemoveInvItems	(hero, ItPl_Melone, Mod_Anschlagtafel_Khorinis_Baltram_Melone);
		Npc_RemoveInvItems	(hero, ItFo_MuttonRaw, Mod_Anschlagtafel_Khorinis_Baltram_Fleisch);

		AI_Output(self, hero, "Info_Mod_Baltram_Anschlagtafel_16_00"); //Was? Zeig her ... Tatsächlich, alles dabei. Ausgesprochen gut gemacht.
		AI_Output(self, hero, "Info_Mod_Baltram_Anschlagtafel_16_01"); //Hier ist deine Entlohnung.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Baltram_Gold);

		AI_Output(self, hero, "Info_Mod_Baltram_Anschlagtafel_16_02"); //Hat mich gefreut mit dir Geschäfte zu machen.

		if (Mod_Anschlagtafel_Khorinis_Baltram_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Baltram_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Baltram_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Baltram = 0;
		Mod_Anschlagtafel_Khorinis_Baltram_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Baltram, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Baltram_Trade (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Trade_Condition;
	information	= Info_Mod_Baltram_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Baltram_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_Hi))
	&& (Wld_IsTime(05,05,20,05))
	&& (hero.guild != GIL_KDF)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Baltram_TradeFake (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_TradeFake_Condition;
	information	= Info_Mod_Baltram_TradeFake_Info;
	permanent	= 0;
	important	= 0;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Baltram_TradeFake_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_Hi))
	&& (Wld_IsTime(05,05,20,05))
	&& (hero.guild == GIL_KDF)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_TradeFake_Info()
{
	B_Say (hero, self, "$TRADE_1");

	AI_Output(self, hero, "Info_Mod_Baltram_TradeFake_16_01"); //Handeln? Mit dir?! Scher dich zurück zu Beliar!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Baltram_Pickpocket (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Pickpocket_Condition;
	information	= Info_Mod_Baltram_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Baltram_Pickpocket_Condition()
{
	C_Beklauen	(67, ItMi_Gold, 26);
};

FUNC VOID Info_Mod_Baltram_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Baltram_Pickpocket);

	Info_AddChoice	(Info_Mod_Baltram_Pickpocket, DIALOG_BACK, Info_Mod_Baltram_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Baltram_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Baltram_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Baltram_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Baltram_Pickpocket);
};

FUNC VOID Info_Mod_Baltram_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Baltram_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Baltram_Pickpocket);

		Info_AddChoice	(Info_Mod_Baltram_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Baltram_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Baltram_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Baltram_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Baltram_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Baltram_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Baltram_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Baltram_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Baltram_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Baltram_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Baltram_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Baltram_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Baltram_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Baltram_EXIT (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_EXIT_Condition;
	information	= Info_Mod_Baltram_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Baltram_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Baltram_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};