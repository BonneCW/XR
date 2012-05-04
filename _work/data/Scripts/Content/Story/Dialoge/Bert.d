INSTANCE Info_Mod_Bert_Hi (C_INFO)
{
	npc		= Mod_1582_SFB_Bert_FM;
	nr		= 1;
	condition	= Info_Mod_Bert_Hi_Condition;
	information	= Info_Mod_Bert_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bert_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bert_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Bert_Hi_10_00"); //Was, wer bist du? Sind die Crawler weg?
	AI_Output(hero, self, "Info_Mod_Bert_Hi_15_01"); //Was machst du denn hier oben?
	AI_Output(self, hero, "Info_Mod_Bert_Hi_10_02"); //Bei dem letzten Überfall der Crawler bin ich hierhin geflüchtet.
	AI_Output(self, hero, "Info_Mod_Bert_Hi_10_03"); //Ich musste mit eigenen Augen dabei zusehen, wie viele meiner Freunde von den Crawlern niedergemacht und danach in den hinteren Teil der Höhle fortgeschleift wurden.
	AI_Output(self, hero, "Info_Mod_Bert_Hi_10_04"); //Nur Claus haben sie nicht wegbekommen, da sein Leichnam mit einem Bein zwischen dem Gerüst fest hing.
	AI_Output(hero, self, "Info_Mod_Bert_Hi_15_05"); //Ja, schön, wozu erzählst du mir das alles? Außerdem sehe ich hier keine Leiche herumliegen ...
	AI_Output(self, hero, "Info_Mod_Bert_Hi_10_06"); //Verdammt, das wollte ich doch gerade erklären.
	AI_Output(self, hero, "Info_Mod_Bert_Hi_10_07"); //Nach einigen Stunden überfiel mich der Schlaf vor lauter Erschöpfung über das Geschehnis.
	AI_Output(self, hero, "Info_Mod_Bert_Hi_10_08"); //Stunden später wurde ich plötzlich durch merkwürdige Geräusche und Lichter geweckt.
	AI_Output(self, hero, "Info_Mod_Bert_Hi_10_09"); //Als ich über den Felsen spickte, da sah ich, ich wollte meinen Augen nicht trauen, Claus schwankend hinter den Felsen verschwinden und weiter hinten war mir, als würde eine leuchtende Gestalt umherspringen.
	AI_Output(self, hero, "Info_Mod_Bert_Hi_10_10"); //Dann war sie auch plötzlich verschwunden. Ich glaube, langsam meinen Verstand zu verlieren ...
	AI_Output(self, hero, "Info_Mod_Bert_Hi_10_11"); //Hast du vielleicht was zu essen und zu trinken für mich, damit ich wieder zu Verstand und Kräften komme?

	B_LogEntry	(TOPIC_MOD_NL_CRAWLER, "Ich habe einen Überlebenden Schürfer getroffen. Er berichtete davon, wie er in der Dunkelheit seinen toten Freund habe weggehen sehen und von leuchtenden Gestalten. Hört sich ziemlich diffus an.");

	Info_ClearChoices	(Info_Mod_Bert_Hi);

	Info_AddChoice	(Info_Mod_Bert_Hi, "Nein.", Info_Mod_Bert_Hi_C);

	if (Npc_HasItems(hero, ItFo_Milk) >= 1)
	&& (Npc_HasItems(hero, ItFo_Bread) >= 1)
	&& (Npc_HasItems(hero, ItFo_Mutton) >= 1)
	{
		Info_AddChoice	(Info_Mod_Bert_Hi, "Hier, nimm. (Milch, gebratenes Fleisch und Brot geben)", Info_Mod_Bert_Hi_B);
	};

	if (Npc_HasItems(hero, ItFo_Water) >= 1)
	&& (Npc_HasItems(hero, ItFo_Bread) >= 1)
	{
		Info_AddChoice	(Info_Mod_Bert_Hi, "Hier, nimm. (Brot und Wasser geben)", Info_Mod_Bert_Hi_A);
	};
};

FUNC VOID Info_Mod_Bert_Hi_C()
{
	B_Say	(hero, self, "$NO");

	AI_Output(self, hero, "Info_Mod_Bert_Hi_C_10_01"); //Naja, dann muss ich mich eben so durchschlagen.
	
	Info_ClearChoices	(Info_Mod_Bert_Hi);
};

FUNC VOID Info_Mod_Bert_Hi_B()
{
	B_Say	(hero, self, "$HIERNIMM");

	B_ShowGivenThings	("Milch, Brot und gebratenes Fleisch gegeben");

	Npc_RemoveInvItems	(hero, ItFo_Milk, 1);
	Npc_RemoveInvItems	(hero, ItFo_Bread, 1);
	Npc_RemoveInvItems	(hero, ItFo_Mutton, 1);

	AI_Output(self, hero, "Info_Mod_Bert_Hi_B_10_01"); //Vielen Dank. Mehr kann man sich kaum wünschen.

	B_GivePlayerXP	(200);

	Mod_NL_Bert = 1;
	
	Info_ClearChoices	(Info_Mod_Bert_Hi);
};

FUNC VOID Info_Mod_Bert_Hi_A()
{
	B_Say	(hero, self, "$HIERNIMM");

	B_ShowGivenThings	("Brot und Wasser gegeben");

	Npc_RemoveInvItems	(hero, ItFo_Water, 1);
	Npc_RemoveInvItems	(hero, ItFo_Bread, 1);

	AI_Output(self, hero, "Info_Mod_Bert_Hi_A_10_01"); //Hab Dank.

	B_GivePlayerXP	(100);

	Mod_NL_Bert = 1;
	
	Info_ClearChoices	(Info_Mod_Bert_Hi);
};

INSTANCE Info_Mod_Bert_Gormgniez (C_INFO)
{
	npc		= Mod_1582_SFB_Bert_FM;
	nr		= 1;
	condition	= Info_Mod_Bert_Gormgniez_Condition;
	information	= Info_Mod_Bert_Gormgniez_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bert_Gormgniez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gormgniez_Hi))
	&& (Mod_NL_Bert == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bert_Gormgniez_Info()
{
	AI_Output(self, hero, "Info_Mod_Bert_Gormgniez_10_00"); //Hab vielen Dank für meine Rettung, wie auch Speise und Trank.
	AI_Output(self, hero, "Info_Mod_Bert_Gormgniez_10_01"); //Ich habe leider wenig, was ich dir geben kann, aber zumindest werde ich dich etwas in die Kunst Erz zu schürfen einweihen.
	AI_Output(self, hero, "Info_Mod_Bert_Gormgniez_10_02"); //Achte auf Struktur und Beschaffenheit des Erzes. Wo verlaufen Risse und Schwachstellen in der Ader, in welche du deine Spitzhacke treiben kannst?
	AI_Output(self, hero, "Info_Mod_Bert_Gormgniez_10_03"); //Wenn du das berücksichtigst, wirst du große Brocken herausschlagen können.

	B_GivePlayerXP	(200);

	B_Upgrade_ErzHackChance (10);
};

INSTANCE Info_Mod_Bert_Pickpocket (C_INFO)
{
	npc		= Mod_1582_SFB_Bert_FM;
	nr		= 1;
	condition	= Info_Mod_Bert_Pickpocket_Condition;
	information	= Info_Mod_Bert_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Bert_Pickpocket_Condition()
{
	C_Beklauen	(32, ItMi_Nugget, 2);
};

FUNC VOID Info_Mod_Bert_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bert_Pickpocket);

	Info_AddChoice	(Info_Mod_Bert_Pickpocket, DIALOG_BACK, Info_Mod_Bert_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bert_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bert_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bert_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bert_Pickpocket);
};

FUNC VOID Info_Mod_Bert_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Bert_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Bert_Pickpocket);

		Info_AddChoice	(Info_Mod_Bert_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Bert_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Bert_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Bert_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Bert_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Bert_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Bert_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Bert_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Bert_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Bert_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Bert_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Bert_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Bert_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Bert_EXIT (C_INFO)
{
	npc		= Mod_1582_SFB_Bert_FM;
	nr		= 1;
	condition	= Info_Mod_Bert_EXIT_Condition;
	information	= Info_Mod_Bert_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bert_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bert_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};