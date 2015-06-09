INSTANCE Info_Mod_Ignaz_Hi (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Hi_Condition;
	information	= Info_Mod_Ignaz_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Ignaz_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ignaz_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_14_01"); //Niemand im Besonderen - nur im Dunkeln pflügt der Vogel.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_15_02"); //Verstehe.
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_14_03"); //Schon lange her, dass jemand das zu mir gesagt hat! (lacht) Verhängnisvoll schwebt die Matratze über kaltem Wind.
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_14_04"); //Sag mal - hast du noch Bargeld?

	Info_ClearChoices	(Info_Mod_Ignaz_Hi);

	Info_AddChoice	(Info_Mod_Ignaz_Hi, "Das wird mir zu blöd.", Info_Mod_Ignaz_Hi_B);
	Info_AddChoice	(Info_Mod_Ignaz_Hi, "Du hast sie nicht mehr alle?", Info_Mod_Ignaz_Hi_A);
};

FUNC VOID Info_Mod_Ignaz_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_B_15_00"); //Das wird mir zu blöd.

	Info_ClearChoices	(Info_Mod_Ignaz_Hi);
};

FUNC VOID Info_Mod_Ignaz_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_A_15_00"); //Du hast sie nicht mehr alle?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_A_14_01"); //Sie alle, von der Made bis zum Maultier, nennen mich verrückt.

	Info_ClearChoices	(Info_Mod_Ignaz_Hi);

	Info_AddChoice	(Info_Mod_Ignaz_Hi, "Warum bist du verrückt?", Info_Mod_Ignaz_Hi_D);
	Info_AddChoice	(Info_Mod_Ignaz_Hi, "Kann man denn nichts dagegen tun?", Info_Mod_Ignaz_Hi_C);
};

FUNC VOID Info_Mod_Ignaz_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_00"); //Warum bist du verrückt?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_01"); //Ich bin nicht verrückt!
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_02"); //Was denn dann?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_03"); //Ich bin unendlich weise! Denke in Zukunft und Vergangenheit, in alle erdenklichen Dimensionen - ein leckerer Eintopf, diese Schraube - verflucht, nimm deine Augen aus meinem Karren!
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_04"); //Ernst zu sein ist schwierig mit erhobenem Bein.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_05"); //Und woher stammt diese ... unendliche Weisheit?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_06"); //Du, gegen den Fußpilz hilft nur noch der Stein der Weisen.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_07"); //Du hast ihn gefunden, den Stein der Weisen?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_08"); //Gefunden? Gebraut, gegessen, verdaut, geschissen! Ahahaha!
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_09"); //(ernst) Mein Bruder läuft in den Abgrund.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_10"); //Wer ist dein Bruder?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_11"); //Constantino, der fahrende Reisende ... der reisende Fahrer? Hoffentlich gibt's Klopse dazu.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_12"); //Constantino ist dein Bruder?!
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_13"); //Ein Zwillingsgestirn, sagen die Grubenarbeiter.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_14"); //Und was meinst damit, dass er in den Abgrund läuft?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_15"); //Ballspielen macht Spaß.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_16"); //Die unendliche Weisheit scheint dich ziemlich zu überfordern.
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_17"); //Für mich und meine drei Katzen ist das kein Problem.

	Mod_Ignaz_Bruder = 1;

	Info_ClearChoices	(Info_Mod_Ignaz_Hi);
};

FUNC VOID Info_Mod_Ignaz_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_C_15_00"); //Kann man denn nichts dagegen tun?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_C_14_01"); //Wieso? Im Speziellen ist es äußerst praktisch, verrückt zu sein. Eigentlich ist es verrückt, nicht verrückt zu sein. (lacht ausgelassen, dann sofort wieder nüchtern)
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_C_14_02"); //Das versteh ich jetzt nicht.

	Info_ClearChoices	(Info_Mod_Ignaz_Hi);

	Info_AddChoice	(Info_Mod_Ignaz_Hi, "Warum bist du verrückt?", Info_Mod_Ignaz_Hi_D);
};

INSTANCE Info_Mod_Ignaz_Handel (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Handel_Condition;
	information	= Info_Mod_Ignaz_Handel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Verkaufst du Alchemiezubehör?";
};

FUNC INT Info_Mod_Ignaz_Handel_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ignaz_Handel_Info()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Handel_15_00"); //Verkaufst du Alchemiezubehör?
	AI_Output(self, hero, "Info_Mod_Ignaz_Handel_14_01"); //Ja, ja, steht doch alles hier rum. Oder sehe ich das falsch?

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Ignaz kann mir Tränke verkaufen.");
};

INSTANCE Info_Mod_Ignaz_Lehrer (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Lehrer_Condition;
	information	= Info_Mod_Ignaz_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Ignaz_Lehrer_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ignaz_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Lehrer_15_00"); //Kannst du mir was beibringen?
	AI_Output(self, hero, "Info_Mod_Ignaz_Lehrer_14_01"); //Ich kann dir zeigen, wie du deine zehn Magier auf dem Spielfeld platzieren musst, um zu gewinnen! Und wie du Spruchrollen herstellst!
	AI_Output(hero, self, "Info_Mod_Ignaz_Lehrer_15_02"); //Dann zeig mir lieber das mit den Spruchrollen.
};

INSTANCE Info_Mod_Ignaz_Irdorath (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Irdorath_Condition;
	information	= Info_Mod_Ignaz_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo Meister von Alchemie, Tränke- und Pflanzenkunde.";
};

FUNC INT Info_Mod_Ignaz_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_JackAL == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Irdorath_15_00"); //Hallo Meister von Alchemie, Tränke- und Pflanzenkunde, ich wollte ...
	AI_Output(self, hero, "Info_Mod_Ignaz_Irdorath_14_01"); //Tränke und Pflanzen? Nein, ich bin vor allem mit Spruchrollen und Tierbestandteilen vertraut ...
	AI_Output(hero, self, "Info_Mod_Ignaz_Irdorath_15_02"); //Ach, hat sich erledigt.

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Ignaz ist nicht der Alchemist, den ich suche ...");
};

INSTANCE Info_Mod_Ignaz_Amulett (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Amulett_Condition;
	information	= Info_Mod_Ignaz_Amulett_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist mit dir passiert?";
};

FUNC INT Info_Mod_Ignaz_Amulett_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ignaz_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Myxir_GotoIgnaz))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_Amulett_Info()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Amulett_15_00"); //Was ist mit dir passiert?
	AI_Output(self, hero, "Info_Mod_Ignaz_Amulett_14_01"); //(stöhnt) Mä ... Männner! Novizen ... sie haben mich ... bestohlen ... und geprügelt ...
	AI_Output(hero, self, "Info_Mod_Ignaz_Amulett_15_02"); //Was haben sie gestohlen?
	AI_Output(self, hero, "Info_Mod_Ignaz_Amulett_14_03"); //Ein altes Amulett!
	AI_Output(hero, self, "Info_Mod_Ignaz_Amulett_15_04"); //Das Amulett? Wo wollten sie damit hin?
	AI_Output(self, hero, "Info_Mod_Ignaz_Amulett_14_05"); //Ein Steinkreis ... großer Wald ... Ritual ...
	AI_Output(hero, self, "Info_Mod_Ignaz_Amulett_15_06"); //Was ist los, alter Mann?

	Wld_InsertNpc	(Mod_1995_UntoterNovize_01_NW, "BIGFARM");
	Wld_InsertNpc	(Mod_1996_UntoterNovize_02_NW, "BIGFARM");
	Wld_InsertNpc	(Mod_1997_UntoterNovize_03_NW, "BIGFARM");

	Wld_InsertItem	(ItAm_GardeInnos, "FP_TROLLAREA_RITUAL_ITEM");

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_BEL_SUCHE, "Ignaz ist dem Tode nahe und das Amulett wurde von Novizen gestohlen. Sie sind scheinbar bei einem Steinkreis in einem großen Wald.");
};

INSTANCE Info_Mod_Ignaz_MangelQuest (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_MangelQuest_Condition;
	information	= Info_Mod_Ignaz_MangelQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Fungizid kaufen (80 Gold)";
};

FUNC INT Info_Mod_Ignaz_MangelQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest2))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 80)
	&& (Npc_HasItems(hero, ItMi_Fungizid) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_MangelQuest_Info()
{
	B_GiveInvItems	(hero, self, ItMi_Gold, 80);

	B_GiveInvItems	(self, hero, ItMi_Fungizid, 1);
};

INSTANCE Info_Mod_Ignaz_Flugblaetter (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Flugblaetter_Condition;
	information	= Info_Mod_Ignaz_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Ignaz_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Ignaz_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_Flugblaetter_Info()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Flugblaetter_15_00"); //Ich hab hier ein Flugblatt für dich.

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Ignaz_Flugblaetter_14_01"); //Oh danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Ignaz_Flugblaetter_14_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Ignaz_Anschlagtafel (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Anschlagtafel_Condition;
	information	= Info_Mod_Ignaz_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe deinen Aushang an der Anschlagtafel gesehen ...";
};

FUNC INT Info_Mod_Ignaz_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Ignaz == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItMi_Pitch) >= Mod_Anschlagtafel_Khorinis_Ignaz_Pech)
	&& (Npc_HasItems(hero, ItMi_Coal) >= Mod_Anschlagtafel_Khorinis_Ignaz_Kohle)
	&& (Npc_HasItems(hero, ItMi_Quartz) >= Mod_Anschlagtafel_Khorinis_Ignaz_Quartz)
	&& (Npc_HasItems(hero, ItMi_RockCrystal) >= Mod_Anschlagtafel_Khorinis_Ignaz_Bergkristall)
	&& (Npc_HasItems(hero, ItWr_Paper) >= Mod_Anschlagtafel_Khorinis_Ignaz_Papier)
	&& (Npc_HasItems(hero, ItAt_Sting) >= Mod_Anschlagtafel_Khorinis_Ignaz_Blutfliegenstachel)
	&& (Npc_HasItems(hero, ItAt_CrawlerMandibles) >= Mod_Anschlagtafel_Khorinis_Ignaz_Minecrawlerzangen)
	&& (Npc_HasItems(hero, ItAt_SpiderMandibles) >= Mod_Anschlagtafel_Khorinis_Ignaz_Spinnenzangen)
	&& (Npc_HasItems(hero, ItAt_BugMandibles) >= Mod_Anschlagtafel_Khorinis_Ignaz_Feldraeuberzangen)
	&& (Npc_HasItems(hero, ItAt_GoblinBone) >= Mod_Anschlagtafel_Khorinis_Ignaz_Goblinknochen)
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= Mod_Anschlagtafel_Khorinis_Ignaz_Skelettknochen)
	&& (Npc_HasItems(hero, ItSc_Sleep) >= Mod_Anschlagtafel_Khorinis_Ignaz_Schlafzauber)
	&& (Npc_HasItems(hero, ItSc_Charm) >= Mod_Anschlagtafel_Khorinis_Ignaz_Vergessenszauber)
	&& (Npc_HasItems(hero, ItSc_Fear) >= Mod_Anschlagtafel_Khorinis_Ignaz_Angstzauber)
	&& (Npc_HasItems(hero, ItMi_Sulfur) >= Mod_Anschlagtafel_Khorinis_Ignaz_Schwefel)
	{
		Npc_RemoveInvItems	(hero, ItMi_Pitch, Mod_Anschlagtafel_Khorinis_Ignaz_Pech);
		Npc_RemoveInvItems	(hero, ItMi_Coal, Mod_Anschlagtafel_Khorinis_Ignaz_Kohle);
		Npc_RemoveInvItems	(hero, ItMi_Quartz, Mod_Anschlagtafel_Khorinis_Ignaz_Quartz);
		Npc_RemoveInvItems	(hero, ItMi_RockCrystal, Mod_Anschlagtafel_Khorinis_Ignaz_Bergkristall);
		Npc_RemoveInvItems	(hero, ItWr_Paper, Mod_Anschlagtafel_Khorinis_Ignaz_Papier);
		Npc_RemoveInvItems	(hero, ItAt_Sting, Mod_Anschlagtafel_Khorinis_Ignaz_Blutfliegenstachel);
		Npc_RemoveInvItems	(hero, ItAt_CrawlerMandibles, Mod_Anschlagtafel_Khorinis_Ignaz_Minecrawlerzangen);
		Npc_RemoveInvItems	(hero, ItAt_SpiderMandibles, Mod_Anschlagtafel_Khorinis_Ignaz_Spinnenzangen);
		Npc_RemoveInvItems	(hero, ItAt_BugMandibles, Mod_Anschlagtafel_Khorinis_Ignaz_Feldraeuberzangen);
		Npc_RemoveInvItems	(hero, ItAt_GoblinBone, Mod_Anschlagtafel_Khorinis_Ignaz_Goblinknochen);
		Npc_RemoveInvItems	(hero, ItAt_SkeletonBone, Mod_Anschlagtafel_Khorinis_Ignaz_Skelettknochen);
		Npc_RemoveInvItems	(hero, ItSc_Sleep, Mod_Anschlagtafel_Khorinis_Ignaz_Schlafzauber);
		Npc_RemoveInvItems	(hero, ItSc_Charm, Mod_Anschlagtafel_Khorinis_Ignaz_Vergessenszauber);
		Npc_RemoveInvItems	(hero, ItSc_Fear, Mod_Anschlagtafel_Khorinis_Ignaz_Angstzauber);
		Npc_RemoveInvItems	(hero, ItMi_Sulfur, Mod_Anschlagtafel_Khorinis_Ignaz_Schwefel);

		AI_Output(self, hero, "Info_Mod_Ignaz_Anschlagtafel_14_00"); //Was? Zeig her ... Tatsächlich, alles dabei. Ausgesprochen gut gemacht.
		AI_Output(self, hero, "Info_Mod_Ignaz_Anschlagtafel_14_01"); //Hier ist deine Entlohnung.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Ignaz_Gold);

		AI_Output(self, hero, "Info_Mod_Ignaz_Anschlagtafel_14_02"); //Hat mich gefreut mit dir Geschäfte zu machen.

		if (Mod_Anschlagtafel_Khorinis_Ignaz_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Ignaz_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Ignaz_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Ignaz = 0;
		Mod_Anschlagtafel_Khorinis_Ignaz_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Ignaz, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Ignaz_LearnScrolls (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_LearnScrolls_Condition;
	information	= Info_Mod_Ignaz_LearnScrolls_Info;
	permanent	= 1;
	important	= 0;
	description	= B_BuildLearnString ("Spruchrollen herstellen", B_GetLearnCostTalent (hero, NPC_TALENT_SCROLLS, 1));
};

FUNC INT Info_Mod_Ignaz_LearnScrolls_Condition()
{
	Info_Mod_Ignaz_LearnScrolls.description = B_BuildLearnString ("Spruchrollen herstellen", B_GetLearnCostTalent (hero, NPC_TALENT_SCROLLS, 1));

	if (Npc_KnowsInfo(hero, Info_Mod_Ignaz_Lehrer))
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SCROLLS) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_LearnScrolls_Info()
{
	if (B_TeachPlayerTalentScrolls(self, hero, 1))
	{
		AI_Output(self, hero, "Info_Mod_Ignaz_LearnScrolls_14_00"); //Um eine Spruchrolle herzustellen benötigst du zunächst einmal einen Rune der jeweiligen Magierichtung.
		AI_Output(self, hero, "Info_Mod_Ignaz_LearnScrolls_14_01"); //Die Wirkung der Rune übeträgst du mittels Runenstein und der Zutaten des Zaubers auf ein Blatt Papier.
		AI_Output(self, hero, "Info_Mod_Ignaz_LearnScrolls_14_02"); //Du kannst aber aus einer Rune nicht nur einen Zauber machen, sondern auch stärkere, jedoch brauchst du dafür das Rezept und auch alle Zutaten der einzelnen Zwischenschritte.
		AI_Output(self, hero, "Info_Mod_Ignaz_LearnScrolls_14_03"); //Wenn du also eine Feuerballspruchrolle herstellen willst, benötigst du alles, was du für die Feuerballspruchrolle brauchst ebenso wie alles für einen Feuerpfeil.
	};
};

INSTANCE Info_Mod_Ignaz_Trade (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Trade_Condition;
	information	= Info_Mod_Ignaz_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Ignaz_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ignaz_Handel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Ignaz_Pickpocket (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Pickpocket_Condition;
	information	= Info_Mod_Ignaz_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Ignaz_Pickpocket_Condition()
{
	C_Beklauen	(43, ItPl_Temp_Herb, 3);
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);

	Info_AddChoice	(Info_Mod_Ignaz_Pickpocket, DIALOG_BACK, Info_Mod_Ignaz_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ignaz_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ignaz_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);

		Info_AddChoice	(Info_Mod_Ignaz_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Ignaz_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Ignaz_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Ignaz_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Ignaz_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Ignaz_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Ignaz_EXIT (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_EXIT_Condition;
	information	= Info_Mod_Ignaz_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ignaz_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ignaz_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};