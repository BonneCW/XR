var int MerkLebenspunkteBartok;
var int MerkLebenspunkteHeldBartok;

INSTANCE Info_Mod_Bartok_Bromor (C_INFO)
{
	npc		= Mod_519_SNOV_Bartok_NW;
	nr		= 1;
	condition	= Info_Mod_Bartok_Bromor_Condition;
	information	= Info_Mod_Bartok_Bromor_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab gehört du willst nicht zahlen.";
};

FUNC INT Info_Mod_Bartok_Bromor_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bromor_Bilgot))
	&& (Mod_BilgotBromorBartok == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartok_Bromor_Info()
{
	AI_Output(hero, self, "Info_Mod_Bartok_Bromor_15_00"); //Ich hab gehört, du willst nicht zahlen.

	Mod_BartokZufallZahlen = r_max(99);

	if (Mod_BartokZufallZahlen >= 80)
	{
		AI_Output(self, hero, "Info_Mod_Bartok_Bromor_04_01"); //Wieso das denn? Hier ist das Geld.

		B_GiveInvItems	(self, hero, ItMi_Gold, 500);

		Mod_BilgotBromorBartok = 1;

		B_Göttergefallen(2, 1);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Bartok_Bromor_04_02"); //Ja, wieso sollte ich auch zahlen?
		AI_Output(hero, self, "Info_Mod_Bartok_Bromor_15_03"); //Weil ich dir sonst die Fresse poliere.
		AI_Output(self, hero, "Info_Mod_Bartok_Bromor_04_04"); //Na warte.

		AI_StopProcessInfos	(self);

		B_Attack	(self, hero, AR_NONE, 1);
	};
};

INSTANCE Info_Mod_Bartok_Umgehauen (C_INFO)
{
	npc		= Mod_519_SNOV_Bartok_NW;
	nr		= 1;
	condition	= Info_Mod_Bartok_Umgehauen_Condition;
	information	= Info_Mod_Bartok_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bartok_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bartok_Bromor))
	&& (Mod_BilgotBromorBartok == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartok_Umgehauen_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Bartok_Umgehauen_04_00"); //Mannomann! Du hast ja 'nen ganz schönen Schlag drauf. Hier ist das Gold.

			Mod_BilgotBromorBartok = 1;

			Mod_BartokUeberzeugt = 1;

			B_GiveInvItems	(self, hero, ItMi_Gold, 500);

			B_Göttergefallen(1, 1);
		}
		else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Bartok_Umgehauen_04_01"); //Tja, das war wohl nichts.
		};
							
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};

	CreateInvItems	(self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

INSTANCE Info_Mod_Bartok_Arbeite (C_INFO)
{
	npc		= Mod_519_SNOV_Bartok_NW;
	nr		= 1;
	condition	= Info_Mod_Bartok_Arbeite_Condition;
	information	= Info_Mod_Bartok_Arbeite_Info;
	permanent	= 0;
	important	= 0;
	description	= "Scar schickt mich.";
};

FUNC INT Info_Mod_Bartok_Arbeite_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scar_Jagdtrophaeen_SollIch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartok_Arbeite_Info()
{
	AI_Output(hero, self, "Info_Mod_Bartok_Arbeite_15_00"); //Scar schickt mich. Du sollst wieder Jagen gehen.
	AI_Output(self, hero, "Info_Mod_Bartok_Arbeite_04_01"); //Warum sollte ich?
	AI_Output(hero, self, "Info_Mod_Bartok_Arbeite_15_02"); //Weil ich ...

	Info_ClearChoices	(Info_Mod_Bartok_Arbeite);

	Info_AddChoice	(Info_Mod_Bartok_Arbeite, "... dir sonst die Fresse poliere.", Info_Mod_Bartok_Arbeite_AufsMaul);
	Info_AddChoice	(Info_Mod_Bartok_Arbeite, "... dir Geld dafür gebe.", Info_Mod_Bartok_Arbeite_Geld);
};

FUNC VOID Info_Mod_Bartok_Arbeite_AufsMaul()
{
	AI_Output(hero, self, "Info_Mod_Bartok_Arbeite_AufsMaul_15_00"); //... dir sonst die Fresse poliere.
	AI_Output(self, hero, "Info_Mod_Bartok_Arbeite_AufsMaul_04_01"); //Das will ich sehen.

	var int MerkLebenspunkteBartok;
	var int MerkLebenspunkteHeldBartok;

	MerkLebenspunkteBartok	=	self.attribute[ATR_HITPOINTS];
	MerkLebenspunkteHeldBartok	=	hero.attribute[ATR_HITPOINTS];

	AI_StopProcessInfos	(self);
	B_Attack	(self, hero, AR_NONE, 1);
};

FUNC VOID Info_Mod_Bartok_Arbeite_Geld()
{
	AI_Output(hero, self, "Info_Mod_Bartok_Arbeite_Geld_15_00"); //... dir Geld dafür gebe.
	AI_Output(self, hero, "Info_Mod_Bartok_Arbeite_Geld_04_01"); //Wie viel Geld willst du mir geben?

	Info_ClearChoices	(Info_Mod_Bartok_Arbeite);

	Info_AddChoice	(Info_Mod_Bartok_Arbeite, "Gar nichts.", Info_Mod_Bartok_Arbeite_Geld_Nichts);
	Info_AddChoice	(Info_Mod_Bartok_Arbeite, "1000 Gold.", Info_Mod_Bartok_Arbeite_Geld_1000);
	Info_AddChoice	(Info_Mod_Bartok_Arbeite, "500 Gold.", Info_Mod_Bartok_Arbeite_Geld_500);
	Info_AddChoice	(Info_Mod_Bartok_Arbeite, "200 Gold.", Info_Mod_Bartok_Arbeite_Geld_200);
	Info_AddChoice	(Info_Mod_Bartok_Arbeite, "100 Gold.", Info_Mod_Bartok_Arbeite_Geld_100);
	Info_AddChoice	(Info_Mod_Bartok_Arbeite, "50 Gold.", Info_Mod_Bartok_Arbeite_Geld_50);
};

FUNC VOID Info_Mod_Bartok_Arbeite_Geld_Nichts()
{
	AI_Output(hero, self, "Info_Mod_Bartok_Arbeite_Geld_Nichts_15_00"); //Gar nichts.

	Info_ClearChoices	(Info_Mod_Bartok_Arbeite);

	Info_AddChoice	(Info_Mod_Bartok_Arbeite, "... dir sonst die Fresse poliere.", Info_Mod_Bartok_Arbeite_AufsMaul);
	Info_AddChoice	(Info_Mod_Bartok_Arbeite, "... dir Geld dafür gebe.", Info_Mod_Bartok_Arbeite_Geld);
};

FUNC VOID Info_Mod_Bartok_Arbeite_Geld_1000()
{
	AI_Output(hero, self, "Info_Mod_Bartok_Arbeite_Geld_1000_15_00"); //1000 Goldmünzen.
	
	if (Npc_HasItems(hero, ItMi_Gold) >= 1000)
	{
		AI_Output(self, hero, "Info_Mod_Bartok_Arbeite_Geld_1000_04_01"); //Na gut. Gib mir das Gold.
		AI_Output(hero, self, "Info_Mod_Bartok_Arbeite_Geld_1000_15_02"); //Hier ist es.

		B_GiveInvItems	(hero, self, ItMi_Gold, 1000);

		Mod_BartokUeberzeugt = 1;

		B_Göttergefallen(2, 1);

		Info_ClearChoices	(Info_Mod_Bartok_Arbeite);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Bartok_Arbeite_Geld_1000_04_03"); //Du willst mich wohl verarschen. Du hast gar keine 1000 Goldmünzen. Na warte.

		MerkLebenspunkteBartok	=	self.attribute[ATR_HITPOINTS];
		MerkLebenspunkteHeldBartok	=	hero.attribute[ATR_HITPOINTS];

		AI_StopProcessInfos	(self);
		B_Attack	(self, hero, AR_NONE, 1);
	};
};

FUNC VOID Info_Mod_Bartok_Arbeite_Geld_500()
{
	AI_Output(hero, self, "Info_Mod_Bartok_Arbeite_Geld_500_15_00"); //500 Goldmünzen.
	
	if (Npc_HasItems(hero, ItMi_Gold) >= 500)
	{
		AI_Output(self, hero, "Info_Mod_Bartok_Arbeite_Geld_500_04_01"); //Na gut. Gib mir das Gold.
		AI_Output(hero, self, "Info_Mod_Bartok_Arbeite_Geld_500_15_02"); //Hier ist es.

		B_GiveInvItems	(hero, self, ItMi_Gold, 500);

		Mod_BartokUeberzeugt = 1;

		B_Göttergefallen(2, 1);

		Info_ClearChoices	(Info_Mod_Bartok_Arbeite);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Bartok_Arbeite_Geld_500_04_03"); //Du willst mich wohl verarschen. Du hast gar keine 500 Goldmünzen. Na warte.

		AI_StopProcessInfos	(self);
		B_Attack	(self, hero, AR_NONE, 1);
	};
};

FUNC VOID Info_Mod_Bartok_Arbeite_Geld_200()
{
	AI_Output(hero, self, "Info_Mod_Bartok_Arbeite_Geld_200_15_00"); //200 Goldmünzen.
	
	if (Npc_HasItems(hero, ItMi_Gold) >= 200)
	{
		AI_Output(self, hero, "Info_Mod_Bartok_Arbeite_Geld_200_04_01"); //Na gut. Aber das ist auch das Minimum. Gib mir das Gold.
		AI_Output(hero, self, "Info_Mod_Bartok_Arbeite_Geld_200_15_02"); //Hier ist es.

		B_GiveInvItems	(hero, self, ItMi_Gold, 200);

		Mod_BartokUeberzeugt = 1;

		B_Göttergefallen(2, 1);

		Info_ClearChoices	(Info_Mod_Bartok_Arbeite);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Bartok_Arbeite_Geld_200_04_03"); //Du willst mich wohl verarschen. Du hast gar keine 200 Goldmünzen. Na warte.

		AI_StopProcessInfos	(self);
		B_Attack	(self, hero, AR_NONE, 1);
	};
};

FUNC VOID Info_Mod_Bartok_Arbeite_Geld_100()
{
	AI_Output(hero, self, "Info_Mod_Bartok_Arbeite_Geld_100_15_00"); //100 Goldmünzen.

	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		AI_Output(self, hero, "Info_Mod_Bartok_Arbeite_Geld_100_04_01"); //Gib mir zuerst das Gold.
		AI_Output(hero, self, "Info_Mod_Bartok_Arbeite_Geld_100_15_02"); //Hier ist es.

		B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		
		AI_Output(self, hero, "Info_Mod_Bartok_Arbeite_Geld_100_04_03"); //Ich hab's mir anders überlegt. Ich werde doch nicht wieder arbeiten.
		
		if (Npc_HasItems(hero, ItMi_Gold) >= 1)
		{
			AI_Output(self, hero, "Info_Mod_Bartok_Arbeite_Geld_100_04_04"); //Ich hole mir jetzt erst mal dein restliches Gold.

			AI_StopProcessInfos	(self);
			B_Attack	(self, hero, AR_NONE, 1);
		}
		else
		{
			AI_Output(hero, self, "Info_Mod_Bartok_Arbeite_Geld_100_15_05"); //Du mieser Betrüger. Na warte, dir zeig ich's.

			AI_StopProcessInfos	(self);
			B_Attack	(self, hero, AR_NONE, 1);
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Bartok_Arbeite_Geld_100_04_06"); //Du willst mich wohl verarschen. Du hast keine 100 Goldmünzen. Na warte.

		AI_StopProcessInfos	(self);
		B_Attack	(self, hero, AR_NONE, 1);
	};
};

FUNC VOID Info_Mod_Bartok_Arbeite_Geld_50()
{
	AI_Output(hero, self, "Info_Mod_Bartok_Arbeite_Geld_50_15_00"); //50 Goldmünzen.
	AI_Output(self, hero, "Info_Mod_Bartok_Arbeite_Geld_50_04_01"); //Willst du mich verarschen? Ich mach doch nicht für 50 Goldmünzen meine Finger krumm.

	Info_ClearChoices	(Info_Mod_Bartok_Arbeite);

	Info_AddChoice	(Info_Mod_Bartok_Arbeite, "Gar nichts.", Info_Mod_Bartok_Arbeite_Geld_Nichts);
	Info_AddChoice	(Info_Mod_Bartok_Arbeite, "1000 Gold.", Info_Mod_Bartok_Arbeite_Geld_1000);
	Info_AddChoice	(Info_Mod_Bartok_Arbeite, "500 Gold.", Info_Mod_Bartok_Arbeite_Geld_500);
	Info_AddChoice	(Info_Mod_Bartok_Arbeite, "200 Gold.", Info_Mod_Bartok_Arbeite_Geld_200);
	Info_AddChoice	(Info_Mod_Bartok_Arbeite, "100 Gold.", Info_Mod_Bartok_Arbeite_Geld_100);
};

INSTANCE Info_Mod_Bartok_Arbeite_AufsMaul_Gekriegt (C_INFO)
{
	npc		= Mod_519_SNOV_Bartok_NW;
	nr		= 1;
	condition	= Info_Mod_Bartok_Arbeite_AufsMaul_Gekriegt_Condition;
	information	= Info_Mod_Bartok_Arbeite_AufsMaul_Gekriegt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bartok_Arbeite_AufsMaul_Gekriegt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bartok_Arbeite))
	{	
		return 1;
	};
};

FUNC VOID Info_Mod_Bartok_Arbeite_AufsMaul_Gekriegt_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Bartok_Arbeite_AufsMaul_Gekriegt_04_00"); //Mannomann! Du hast ja 'nen ganz schönen Schlag drauf.

			Mod_BartokUeberzeugt = 1;

			B_Göttergefallen(3, 1);
		}
		else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Bartok_Arbeite_AufsMaul_Gekriegt_04_01"); //Tja, das war wohl nichts.

			Mod_KampfGegenBartokVerloren = 1;
		};		
					
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};

	CreateInvItems	(self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

INSTANCE Info_Mod_Bartok_ArbeiteWieder (C_INFO)
{
	npc		= Mod_519_SNOV_Bartok_NW;
	nr		= 1;
	condition	= Info_Mod_Bartok_ArbeiteWieder_Condition;
	information	= Info_Mod_Bartok_ArbeiteWieder_Info;
	permanent	= 0;
	important	= 0;
	description	= "Arbeitest du jetzt wieder?";
};

FUNC INT Info_Mod_Bartok_ArbeiteWieder_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bartok_Arbeite))
	&& ((Mod_BartokUeberzeugt == 1)
	|| ((Wld_GetDay() > Mod_SonjaHilftGegenBartok)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sonja_Bartok))))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartok_ArbeiteWieder_Info()
{
	AI_Output(hero, self, "Info_Mod_Bartok_ArbeiteWieder_15_00"); //Arbeitest du jetzt wieder?
	AI_Output(self, hero, "Info_Mod_Bartok_ArbeiteWieder_04_01"); //Ja. Ich mach mich sofort auf den Weg.

	B_StartOtherRoutine	(self,"ERWISCHT");
	B_StartOtherRoutine	(Mod_7115_NONE_Nadja_NW, "DOWN");

	Mod_BilgotBromorBartok = 1;

	AI_StopProcessInfos	(self);

	B_GivePlayerXP	(50);

	if (Npc_KnowsInfo(hero, Info_Mod_Sonja_Bartok))
	{
		B_StartOtherRoutine	(Mod_752_NONE_Sonja_NW, "START");
	};

	self.flags = 2;

	B_LogEntry	(TOPIC_MOD_FAULERJÄGER, "Ich habe es geschafft, Bartok zu überzeugen wieder zu arbeiten.");
};

INSTANCE Info_Mod_Bartok_Stimme (C_INFO)
{
	npc		= Mod_519_SNOV_Bartok_NW;
	nr		= 1;
	condition	= Info_Mod_Bartok_Stimme_Condition;
	information	= Info_Mod_Bartok_Stimme_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nach den Frauen also jetzt das Bier.";
};

FUNC INT Info_Mod_Bartok_Stimme_Condition()
{
	if (Mod_BartokUeberzeugt == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartok_Stimme_Info()
{
	AI_Output(hero, self, "Info_Mod_Bartok_Stimme_15_00"); //Nach den Frauen also jetzt das Bier.
	AI_Output(self, hero, "Info_Mod_Bartok_Stimme_04_01"); //(bekifft) Hab heute schon schwer geschuftet, weißte. Da werd ich mir ja jetzt 'nen Humpen gönnen dürfen.
	AI_Output(hero, self, "Info_Mod_Bartok_Stimme_15_02"); //Was hast du denn genommen?
	AI_Output(self, hero, "Info_Mod_Bartok_Stimme_04_03"); //Hihi. Weißte, was geil wäre? Eine Rüstung aus Sumpfkraut!
	AI_Output(self, hero, "Info_Mod_Bartok_Stimme_04_04"); //Muss natürlich so sein, dass sie nicht leicht abfackelt und so.
	AI_Output(self, hero, "Info_Mod_Bartok_Stimme_04_05"); //Aber wenn du mal unterwegs bist und nix zu tun hast, kannste dir aus deinem Ärmel einfach 'nen Stengel drehen.
	AI_Output(hero, self, "Info_Mod_Bartok_Stimme_15_06"); //So ist aber bald von deiner Rüstung nichts mehr übrig.
	AI_Output(self, hero, "Info_Mod_Bartok_Stimme_04_07"); //Dann lass ich halt 'ne neue machen. Hihi.
	AI_Output(self, hero, "Info_Mod_Bartok_Stimme_04_08"); //Das meine ich ernst, Bruder - besorg mir so eine Rüstung, und du bist ein reicher Mann.

	Info_ClearChoices	(Info_Mod_Bartok_Stimme);

	Info_AddChoice	(Info_Mod_Bartok_Stimme, "Vielleicht schaff ich's ja tatsächlich.", Info_Mod_Bartok_Stimme_B);
	Info_AddChoice	(Info_Mod_Bartok_Stimme, "Du spinnst ja total.", Info_Mod_Bartok_Stimme_A);
};

FUNC VOID Info_Mod_Bartok_Stimme_B()
{
	AI_Output(hero, self, "Info_Mod_Bartok_Stimme_B_15_00"); //Vielleicht schaff ich's ja tatsächlich.
	AI_Output(self, hero, "Info_Mod_Bartok_Stimme_B_04_01"); //Sag einfach Harad Bescheid, der soll sich drum kümmern.
	AI_Output(self, hero, "Info_Mod_Bartok_Stimme_B_04_02"); //Hier haste mein Erspartes. Dafür soll er sich was Anständiges ausdenken.

	B_GiveInvItems	(hero, self, ItMi_Gold, 1000);

	Log_CreateTopic	(TOPIC_MOD_BARTOK_SUMPFKRAUTRUESTUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BARTOK_SUMPFKRAUTRUESTUNG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BARTOK_SUMPFKRAUTRUESTUNG, "Bartok hat mir Reichtum versprochen, wenn ich zu Harad gehe und sein Erspartes in eine Sumpfkrautrüstung anlege.");

	Info_ClearChoices	(Info_Mod_Bartok_Stimme);

	Mod_Bartok_Ruestung_Day = 1;
};

FUNC VOID Info_Mod_Bartok_Stimme_A()
{
	AI_Output(hero, self, "Info_Mod_Bartok_Stimme_A_15_00"); //Du spinnst ja total.
	AI_Output(self, hero, "Info_Mod_Bartok_Stimme_A_04_01"); //Ich nenn das Philosophieren. (lacht)

	Info_ClearChoices	(Info_Mod_Bartok_Stimme);
};

INSTANCE Info_Mod_Bartok_Ruestung (C_INFO)
{
	npc		= Mod_519_SNOV_Bartok_NW;
	nr		= 1;
	condition	= Info_Mod_Bartok_Ruestung_Condition;
	information	= Info_Mod_Bartok_Ruestung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Deine Rüstung ist bald fertig.";
};

FUNC INT Info_Mod_Bartok_Ruestung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Harad_Sumpfkrautruestung2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartok_Ruestung_Info()
{
	AI_Output(hero, self, "Info_Mod_Bartok_Ruestung_15_00"); //Deine Rüstung ist bald fertig.
	AI_Output(self, hero, "Info_Mod_Bartok_Ruestung_04_01"); //(verkatert) Was für 'ne Rüstung?
	AI_Output(hero, self, "Info_Mod_Bartok_Ruestung_15_02"); //Erinnerst du dich nicht? Die Sumpfkrautrüstung?
	AI_Output(self, hero, "Info_Mod_Bartok_Ruestung_04_03"); //Hast du was geraucht oder so? Ich hab noch nie was von einer Sumpfkrautrüstung gehört. Und ich will davon auch gar nichts hören.
	AI_Output(self, hero, "Info_Mod_Bartok_Ruestung_04_04"); //Mein verfluchter Schädel brummt und mein gesamtes Gold ist futsch. Das reicht mir für den Moment.

	Mod_Bartok_Ruestung_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Bartok_ImPuff (C_INFO)
{
	npc		= Mod_519_SNOV_Bartok_NW;
	nr		= 1;
	condition	= Info_Mod_Bartok_ImPuff_Condition;
	information	= Info_Mod_Bartok_ImPuff_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na, was machst du denn hier?";
};

FUNC INT Info_Mod_Bartok_ImPuff_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Bartok_ArbeiteWieder))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartok_ImPuff_Info()
{
	AI_Output(hero, self, "Info_Mod_Bartok_ImPuff_15_00"); //Na, was machst du denn hier?
	AI_Output(self, hero, "Info_Mod_Bartok_ImPuff_04_01"); //(explodiert) Was macht man wohl im Puff? Noch so eine Frage und ich hau dir die Fresse ein!
};

INSTANCE Info_Mod_Bartok_Lehrer (C_INFO)
{
	npc		= Mod_519_SNOV_Bartok_NW;
	nr		= 1;
	condition	= Info_Mod_Bartok_Lehrer_Condition;
	information	= Info_Mod_Bartok_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Bartok_Lehrer_Condition()
{
	if (Mod_BartokUeberzeugt == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartok_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Bartok_Lehrer_04_01"); //Ich kann dir zeigen, wie du Tieren die Haut abziehst.
};

INSTANCE Info_Mod_Bartok_HautAbziehen (C_INFO)
{
	npc		= Mod_519_SNOV_Bartok_NW;
	nr		= 1;
	condition	= Info_Mod_Bartok_HautAbziehen_Condition;
	information	= Info_Mod_Bartok_HautAbziehen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Worauf muss ich beim Häuten von Reptilien achten? (4 LP)";
};

FUNC INT Info_Mod_Bartok_HautAbziehen_Condition()
{
	if (Mod_Schwierigkeit == 4)
	{
		 Info_Mod_Bartok_HautAbziehen.description = "Worauf muss ich beim Häuten von Reptilien achten? (400 Gold)";
	}
	else
	{
		 Info_Mod_Bartok_HautAbziehen.description = "Worauf muss ich beim Häuten von Reptilien achten? (4 LP)";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Bartok_Lehrer))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bartok_HautAbziehen_Info()
{
	AI_Output(hero, self, "Info_Mod_Bartok_HautAbziehen_15_00"); //Worauf muss ich beim Häuten von Reptilien achten?

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ReptileSkin))
	{
		AI_Output(self, hero, "Info_Mod_Bartok_HautAbziehen_04_01"); //Wenn du die Haut an den Seiten anschneidest, löst sie sich wie von selbst. Du solltest ab jetzt kein Problem mehr haben, Echsen zu häuten.
	};
};

INSTANCE Info_Mod_Bartok_Pickpocket (C_INFO)
{
	npc		= Mod_519_SNOV_Bartok_NW;
	nr		= 1;
	condition	= Info_Mod_Bartok_Pickpocket_Condition;
	information	= Info_Mod_Bartok_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Bartok_Pickpocket_Condition()
{
	C_Beklauen	(50, ItAt_Teeth, 3);
};

FUNC VOID Info_Mod_Bartok_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bartok_Pickpocket);

	Info_AddChoice	(Info_Mod_Bartok_Pickpocket, DIALOG_BACK, Info_Mod_Bartok_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bartok_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bartok_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bartok_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bartok_Pickpocket);
};

FUNC VOID Info_Mod_Bartok_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Bartok_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Bartok_Pickpocket);

		Info_AddChoice	(Info_Mod_Bartok_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Bartok_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Bartok_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Bartok_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Bartok_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Bartok_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Bartok_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Bartok_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Bartok_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Bartok_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Bartok_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Bartok_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Bartok_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Bartok_EXIT (C_INFO)
{
	npc		= Mod_519_SNOV_Bartok_NW;
	nr		= 1;
	condition	= Info_Mod_Bartok_EXIT_Condition;
	information	= Info_Mod_Bartok_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bartok_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bartok_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};