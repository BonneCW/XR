INSTANCE Info_Mod_HofstaatKoenig_Hi (C_INFO)
{
	npc		= Mod_7285_HS_Koenig_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatKoenig_Hi_Condition;
	information	= Info_Mod_HofstaatKoenig_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatKoenig_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatArsch_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatKoenig_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Hi_06_00"); //Wer ist er, der er unserem königlichen Ritter von und zu Raufbold gewachsen ist?
	AI_Output(hero, self, "Info_Mod_HofstaatKoenig_Hi_15_01"); //Ich bin ...
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Hi_06_02"); //Haltet ein! Ihr seid nun einer von uns!
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Hi_06_03"); //Doch seht ihr nicht so aus als zieme euch eure Position! Ihr werdet fortan hier im Schloss wohnen.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Hi_06_04"); //Ihr seid des heutigen Tages an das königliche Mädchen für alles!
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Hi_06_05"); //Senkt euer Haupt in Demut!
	AI_Output(hero, self, "Info_Mod_HofstaatKoenig_Hi_15_06"); //Jaja, schon klar ...
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Hi_06_07"); //Haltet ein! Ich vermute, ihr habt meinen Arsch bereits kennen gelernt?
	AI_Output(hero, self, "Info_Mod_HofstaatKoenig_Hi_15_08"); //Ja.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Hi_06_09"); //So denn, geht zu ihr und lasset euch von ihr einen Termin bei dem höfischen Magier geben.

	B_LogEntry	(TOPIC_MOD_SEKTE_Freudenspender, "Der König hat mich zum Arsch geschickt, damit ich dort einen Termin mit dem Hofmagier vereinbare.");
};

INSTANCE Info_Mod_HofstaatKoenig_Sorge (C_INFO)
{
	npc		= Mod_7285_HS_Koenig_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatKoenig_Sorge_Condition;
	information	= Info_Mod_HofstaatKoenig_Sorge_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatKoenig_Sorge_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatRaufbold_KoenigSorge))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatKoenig_Sorge_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Sorge_06_00"); //Nichts gibt es, das die Schönheit meines Königreiches zu übertrumpfen vermag.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Sorge_06_01"); //Und doch ... wenn ich so dem Freifluss entlang sehe ... dann sehne ich mich immer nach dem Meer.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Sorge_06_02"); //Hab' ich Euch erzählt, dass euer König vor seiner Zeit in der Politik ein Fischer war? Natürlich nicht, es ist ja auch gelogen.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Sorge_06_03"); //Um die Wahrheit zu sprechen, getreuer Kehrwisch, einst verliebte ich mich in eine Meerjungfrau.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Sorge_06_04"); //Sie war schön wie die ersten Sonnenstrahlen des Tages, die sich auf dem Meer spiegelten ...
	AI_Output(hero, self, "Info_Mod_HofstaatKoenig_Sorge_15_05"); //Ich soll euch diese Aufzeichnungen bringen.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Sorge_06_06"); //Ich weiß dass die Kunst unseres Drogenministers unübertroffen ist, doch bin ich jetzt nicht in der Stimmung dafür ... tretet nicht auf den Königlichen Raufbold wenn ihr mich verlässt.

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Der König ist zu besorgt, um sich für die Aufzeichnungen des Drogenministers zu kümmern. Ich muss eine Lösung für diese Problem finden.");
};

INSTANCE Info_Mod_HofstaatKoenig_Meer (C_INFO)
{
	npc		= Mod_7285_HS_Koenig_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatKoenig_Meer_Condition;
	information	= Info_Mod_HofstaatKoenig_Meer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe die Antwort!";
};

FUNC INT Info_Mod_HofstaatKoenig_Meer_Condition()
{
	if (Mod_SL_Meer == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatKoenig_Meer_Info()
{
	AI_Output(hero, self, "Info_Mod_HofstaatKoenig_Meer_15_00"); //Ich habe die Antwort!
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Meer_06_01"); //Ihr stört mich beim sorgen, Kehrwisch. Das ist etwas, das nur den Geist des Königs zu betreffen vermag, ich könnt mir dabei nicht zur Hand gehen.
	AI_Output(hero, self, "Info_Mod_HofstaatKoenig_Meer_15_02"); //Aber ich habe ein Meer für euch, König!
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Meer_06_03"); //(in Rage) ES GIBT KEIN MEER FÜR MICH! Und jetzt geht mir aus den Augen, Kehrwisch.

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Der König lässt nicht mit sich reden. Was jetzt?");

	AI_StopProcessInfos	(self);

	AI_Teleport	(Mod_7328_HS_Hofnarr_REL, "REL_HS_005");
	B_StartOtherRoutine	(Mod_7328_HS_Hofnarr_REL, "ATKING");
};

INSTANCE Info_Mod_HofstaatKoenig_Gemaelde (C_INFO)
{
	npc		= Mod_7285_HS_Koenig_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatKoenig_Gemaelde_Condition;
	information	= Info_Mod_HofstaatKoenig_Gemaelde_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatKoenig_Gemaelde_Condition()
{
	if (Npc_HasItems(hero, ItMi_StrandBild) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatKoenig_Gemaelde_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Gemaelde_06_00"); //Kehrwisch! Ihr überschreitet eure Kompetenzen.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Gemaelde_06_01"); //Verschwindet augenblicklich oder Ihr werdet meinen Königlichen Zorn zu spüren bekommen.
	AI_Output(hero, self, "Info_Mod_HofstaatKoenig_Gemaelde_15_02"); //Vielleicht heitert dieses Gemälde euch auf.

	B_GiveInvItems	(hero, self, ItMi_StrandBild, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Gemaelde_06_03"); //Das ... das ist wunderschön. Was war die Inspiration für dieses Kunstwerk?
	AI_Output(hero, self, "Info_Mod_HofstaatKoenig_Gemaelde_15_04"); //Ein Strand. Er liegt in der alten Minenkolonie.
	AI_Output(hero, self, "Info_Mod_HofstaatKoenig_Gemaelde_15_05"); //Dort herrscht ein Bekannter von mir und ich bin mir sicher, ich könnte ein Bündnis arrangieren.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Gemaelde_06_06"); //Ihr meint ... ich hätte jederzeit Zutritt zu diesem von den Göttern geküssten Fleck Erde?
	AI_Output(hero, self, "Info_Mod_HofstaatKoenig_Gemaelde_15_07"); //Genau. Kommt mit mir, ich bring euch hin.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Gemaelde_06_08"); //Nein.
	AI_Output(hero, self, "Info_Mod_HofstaatKoenig_Gemaelde_15_09"); //Was soll das heißen, nein?
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Gemaelde_06_10"); //Ich bin vielleicht in Sorge, aber ich bin immer noch König! Ich erwarte, dass du eine dauerhafte Lösung für das Transportproblem findest.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Gemaelde_06_11"); //Hol mich, sobald du einen Weg gefunden hast.

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Der König ist beeindruckt von der Schönheit des Sumpfes. Er will jedoch eine Lösung des Transportproblemes. Ich sollte mich mal hier umhören, ob jemand etwas dazu weiß.");

	Mod_SL_Meer = 5;
};

INSTANCE Info_Mod_HofstaatKoenig_Loch (C_INFO)
{
	npc		= Mod_7285_HS_Koenig_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatKoenig_Loch_Condition;
	information	= Info_Mod_HofstaatKoenig_Loch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatKoenig_Loch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alex_AtLoch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatKoenig_Loch_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Loch_06_00"); //Habt ihr einen Weg gefunden?
	AI_Output(hero, self, "Info_Mod_HofstaatKoenig_Loch_15_01"); //Ja, habe ich, kommt mit.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Loch_06_02"); //Wehe euch, er ist einem König nicht würdig!

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Der König ist beeindruckt von der Schönheit des Sumpfes. Er will jedoch eine Lösung des Transportproblemes. Ich sollte mich mal hier umhören, ob jemand etwas dazu weiß.");

	Mod_SL_Meer = 8;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "LOCH");
};

INSTANCE Info_Mod_HofstaatKoenig_Tuersteher (C_INFO)
{
	npc		= Mod_7285_HS_Koenig_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatKoenig_Tuersteher_Condition;
	information	= Info_Mod_HofstaatKoenig_Tuersteher_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatKoenig_Tuersteher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatTuersteher_NachFest))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatKoenig_Tuersteher_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Tuersteher_06_00"); //Bademeister! Gut dass ihr kommt, seeeeeehr gut dass ihr kommt! Euch muss GOTT schicken!
	AI_Output(hero, self, "Info_Mod_HofstaatKoenig_Tuersteher_15_01"); //Nein, der Türsteher.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Tuersteher_06_02"); //Vielleicht sollte ich den Mann befödrern. Egal! Ich bitte euch einen letzten Botengang für mich zu erledigen, Bademeister!
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Tuersteher_06_03"); //Etwas so geheimes und gefährliches, dass nur IHR es tun könnt!
	AI_Output(hero, self, "Info_Mod_HofstaatKoenig_Tuersteher_15_04"); //Worum geht es? Laufen Kinder am Beckenrand?
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Tuersteher_06_05"); //Viiiiel wichtiger. Ihr müsst zum Drogenminister! Er wird euch weiter instruieren! Eilt euch!

	B_LogEntry	(TOPIC_MOD_SEKTE_KING, "Der König hat einen sehr geheimen und gefährlichen Auftrag für mich. Ich soll zum Drogenminister gehen.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_HofstaatKoenig_Fluffy (C_INFO)
{
	npc		= Mod_7285_HS_Koenig_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatKoenig_Fluffy_Condition;
	information	= Info_Mod_HofstaatKoenig_Fluffy_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatKoenig_Fluffy_Condition()
{
	if (Mod_SL_PartFluffy == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatKoenig_Fluffy_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Fluffy_06_00"); //Fluffy!!! Komm zurück zu mir, mein Liebling!!!
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Fluffy_06_01"); //Wir spielen auch fang den Baum und du darfst den Burgturm rammeln ... Fluffy ...
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_Fluffy_06_02"); //FLUUUUUUFFYYYYY!

	B_LogEntry	(TOPIC_MOD_SL_FLUFFY, "Fluffy ist weg und der König ganz schön traurig darüber.");

	Mod_SL_PartFluffy = 3;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_HofstaatKoenig_HofstaatFutsch (C_INFO)
{
	npc		= Mod_7285_HS_Koenig_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatKoenig_HofstaatFutsch_Condition;
	information	= Info_Mod_HofstaatKoenig_HofstaatFutsch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatKoenig_HofstaatFutsch_Condition()
{
	if (Mod_SL_Schwaechen == 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatKoenig_HofstaatFutsch_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_HofstaatFutsch_06_00"); //NEEEEEEEEEEEEEEEEEIIN!!! WARUM?
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_HofstaatFutsch_06_01"); //Verflucht seid ihr Götter! Gebt mir meine Welt zurück, ich will eure Realität nicht.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_HofstaatFutsch_06_02"); //(Stimme wird weinerlich und versagt am Schluss) Was habe ich nur getan ...

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Der Hofstaat ist nun endgültig zerstört. Ich sollte jetzt zu Baal Namib gehen.");

	Mod_SL_Schwaechen = 8;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_HofstaatKoenig_FreudenspenderGeheimnis (C_INFO)
{
	npc		= Mod_7285_HS_Koenig_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatKoenig_FreudenspenderGeheimnis_Condition;
	information	= Info_Mod_HofstaatKoenig_FreudenspenderGeheimnis_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe noch ein paar Fragen über die hiesigen Rauschmittel.";
};

FUNC INT Info_Mod_HofstaatKoenig_FreudenspenderGeheimnis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatKoenig_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatKoenig_FreudenspenderGeheimnis_Info()
{
	AI_Output(hero, self, "Info_Mod_HofstaatKoenig_FreudenspenderGeheimnis_15_00"); //Ich habe noch ein paar Fragen über die hiesigen Rauschmittel.
	AI_Output(self, hero, "Info_Mod_HofstaatKoenig_FreudenspenderGeheimnis_06_01"); //Stellt diese dem Hofmagier! Und nun hinfort!
};

INSTANCE Info_Mod_HofstaatKoenig_Pickpocket (C_INFO)
{
	npc		= Mod_7285_HS_Koenig_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatKoenig_Pickpocket_Condition;
	information	= Info_Mod_HofstaatKoenig_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_HofstaatKoenig_Pickpocket_Condition()
{
	C_Beklauen	(118, ItMi_Gold, 1500);
};

FUNC VOID Info_Mod_HofstaatKoenig_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatKoenig_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatKoenig_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatKoenig_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatKoenig_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatKoenig_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatKoenig_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatKoenig_Pickpocket);
};

FUNC VOID Info_Mod_HofstaatKoenig_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_HofstaatKoenig_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_HofstaatKoenig_Pickpocket);

		Info_AddChoice	(Info_Mod_HofstaatKoenig_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_HofstaatKoenig_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_HofstaatKoenig_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_HofstaatKoenig_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_HofstaatKoenig_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_HofstaatKoenig_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_HofstaatKoenig_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_HofstaatKoenig_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_HofstaatKoenig_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_HofstaatKoenig_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_HofstaatKoenig_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_HofstaatKoenig_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_HofstaatKoenig_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_HofstaatKoenig_EXIT (C_INFO)
{
	npc		= Mod_7285_HS_Koenig_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatKoenig_EXIT_Condition;
	information	= Info_Mod_HofstaatKoenig_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatKoenig_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatKoenig_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};