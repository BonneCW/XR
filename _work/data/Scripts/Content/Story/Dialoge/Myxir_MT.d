INSTANCE Info_Mod_Myxir_Irdorath (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Irdorath_Condition;
	information	= Info_Mod_Myxir_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will mit einem Schiff zu einer Enklave von Xeres aufbrechen, um ...";
};

FUNC INT Info_Mod_Myxir_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Irdorath))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Irdorath_15_00"); //Ich will mit einem Schiff zu einer Enklave von Xeres aufbrechen, um ...
	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath_28_01"); //Was, in eine Region tiefer Finsternis, abscheulicher Blasphemie ...
	AI_Output(hero, self, "Info_Mod_Myxir_Irdorath_15_02"); //Na ja, es geht aber um die Rettung der ...
	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath_28_03"); //(unterbricht, ohne zuzuhören) ... und Artefakte dunkler Magie? Herrlich.
};

INSTANCE Info_Mod_Myxir_Irdorath2 (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Irdorath2_Condition;
	information	= Info_Mod_Myxir_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ohh, zufällig habe ich noch an Platz an Bord ...";
};

FUNC INT Info_Mod_Myxir_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Irdorath))
	&& (Mod_MyxirDabei == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Irdorath2_15_00"); //(überrascht) Ohh, zufällig habe ich noch an Platz an Bord ...
	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath2_28_01"); //Großartig, ich werde mich dann zum Hafen begeben.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Na, bei Myxir habe ich aber nicht allzu große Überredungskünste benötigt.");

	B_GivePlayerXP	(100);

	Mod_MyxirDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Myxir_Irdorath3 (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Irdorath3_Condition;
	information	= Info_Mod_Myxir_Irdorath3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Eventuell hätte ich noch einen Platz an Bord.";
};

FUNC INT Info_Mod_Myxir_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Irdorath))
	&& (Mod_MyxirDabei == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Irdorath3_15_00"); //Eventuell hätte ich noch einen Platz an Bord. Die Aufwendungen für dieses Unterfangen sind jedoch groß ...
	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath3_28_01"); //Ach, Gold kann die Möglichkeit, die sich damit bietet, gar nicht aufwiegen.
	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath3_28_02"); //Hier, ich denke, das sollte den Ausgaben gerecht werden.

	B_ShowGivenThings	("300 Gold, Spruchrolle, 2 Fläschchen Blut und 4 Zombiefleisch erhalten");

	CreateInvItems	(hero, ItMi_Gold, 300);
	CreateInvItems	(hero, ItSc_Armyofdarkness, 1);
	CreateInvItems	(hero, ItPo_Blood, 2);
	CreateInvItems	(hero, ItFoMuttonZombie, 4);

	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath3_28_03"); //Ich werde mich dann zum Hafen begeben.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Na, bei Myxir habe ich aber nicht allzu große Überredungskünste benötigt.");

	B_GivePlayerXP	(100);

	Mod_MyxirDabei = 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Myxir_GotoIgnaz (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_GotoIgnaz_Condition;
	information	= Info_Mod_Myxir_GotoIgnaz_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Myxir_GotoIgnaz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_HabAxt))
	&& ((Mod_Gilde == 13)
	|| (Mod_Gilde == 15))
	&& (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_GotoIgnaz_Info()
{
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_00"); //Ah, du kommst mir gerade gelegen. Ich hätte etwas zu tun für dich!
	AI_Output(hero, self, "Info_Mod_Myxir_GotoIgnaz_15_01"); //(seufzt) Um was geht es dieses Mal?
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_02"); //Ich suche ein wertvolles Schmuckstück; ein altes Amulett, das von der Kraft Innos' erfüllt sein soll.
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_03"); //Damit können wir vielleicht das Kloster erpressen und so wertvolle Informationen über deren Magie erfahren!
	AI_Output(hero, self, "Info_Mod_Myxir_GotoIgnaz_15_04"); //Wo soll ich anfangen zu suchen?
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_05"); //Das Amulett soll ein alter wirrer Alchemist vor einiger Zeit gekauft haben. Der Narr heißt Ignaz. Er lebt im Hafenviertel der Stadt Khorinis.
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_06"); //Geh zu ihm und bringe das Artefakt zu mir!
	AI_Output(hero, self, "Info_Mod_Myxir_GotoIgnaz_15_07"); //Was soll ich mit Ignaz machen?
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_08"); //Das liegt in deiner Hand!
	AI_Output(hero, self, "Info_Mod_Myxir_GotoIgnaz_15_09"); //Gut.
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_10"); //(streng) Nun geh!

	Mod_584_NONE_Ignaz_NW.attribute[ATR_HITPOINTS] = 1;

	Log_CreateTopic	(TOPIC_MOD_BEL_SUCHE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_SUCHE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_SUCHE, "Myxir möchte, dass ich ihm ein altes Amulett von Ignaz besorge.");
};

INSTANCE Info_Mod_Myxir_Amulett (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Amulett_Condition;
	information	= Info_Mod_Myxir_Amulett_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab das Amulett.";
};

FUNC INT Info_Mod_Myxir_Amulett_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_UntoterNovize_01_Hi))
	&& (Npc_HasItems(hero, ItAm_GardeInnos) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Amulett_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Amulett_15_00"); //Ich hab das Amulett.

	B_GiveInvItems	(hero, self, ItAm_GardeInnos, 1);

	Npc_RemoveInvItems	(self, ItAm_GardeInnos, 1);

	AI_Output(self, hero, "Info_Mod_Myxir_Amulett_28_01"); //Warum ist es geöffnet?
	AI_Output(hero, self, "Info_Mod_Myxir_Amulett_15_02"); //Mehrere untote Novizen haben es Ignaz geraubt und ihn ermordet. Ich verfolgte sie zu einem Steinkreis im großen Wald, wo sie ein Ritual abhielten.
	AI_Output(hero, self, "Info_Mod_Myxir_Amulett_15_03"); //Einer der Untoten schwafelte davon, dass die alte Garde Innos' zurück sei und Beliar vernichten wolle.
	AI_Output(self, hero, "Info_Mod_Myxir_Amulett_28_04"); //(aufgebracht) Was? Das ist eine Katastrophe. Geh sofort zu Xardas und erstatte ihm Bericht!
	AI_Output(hero, self, "Info_Mod_Myxir_Amulett_15_05"); //Wieso?
	AI_Output(self, hero, "Info_Mod_Myxir_Amulett_28_06"); //Sofort!

	B_StartOtherRoutine	(Mod_513_DMB_Xardas_NW, "GARDEINNOS");

	Log_CreateTopic	(TOPIC_MOD_BEL_GARDEINNOS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_GARDEINNOS, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_BEL_SUCHE, TOPIC_MOD_BEL_GARDEINNOS, "Ich habe Myxir das Amulett gebracht.", "Myxir hat mich zu Xardas geschickt. Die Situation mit der Garde Innos' scheint ernst zu sein.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_SUCHE, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Myxir_Wein (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Wein_Condition;
	information	= Info_Mod_Myxir_Wein_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll hier diesen Wein aus dem Kloster abliefern.";
};

FUNC INT Info_Mod_Myxir_Wein_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Andokai))
	&& (Npc_HasItems(hero, ItFo_KWine) >= 10)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Orlan_Gorax))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Wein_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Wein_15_00"); //Ich soll hier diesen Wein aus dem Kloster abliefern.

	B_GiveInvItems	(hero, self, ItFo_KWine, 10);
	Npc_RemoveInvItems	(self, ItFo_KWine, 10);

	AI_Output(self, hero, "Info_Mod_Myxir_Wein_28_01"); //Ah ja, der Nachschub. Das wird heute wieder ein feuchtfröhliches Gelage der Krieger geben. Ätzend.
	AI_Output(hero, self, "Info_Mod_Myxir_Wein_15_02"); //Hab ich was falsch gemacht?
	AI_Output(self, hero, "Info_Mod_Myxir_Wein_28_03"); //(genervt) Hab ich das etwa gesagt? Du kannst dich jetzt entfernen.

	B_LogEntry	(TOPIC_MOD_ANDOKAI_WEIN, "Ich hab Myxir die Weinlieferung überbracht. Wirklich zufrieden war er nicht, aber das ist nicht mein Problem.");
	B_SetTopicStatus	(TOPIC_MOD_ANDOKAI_WEIN, LOG_SUCCESS);
};

INSTANCE Info_Mod_Myxir_HabDieKraeuter (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_HabDieKraeuter_Condition;
	information	= Info_Mod_Myxir_HabDieKraeuter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mit freundlichen Grüßen von Bodo.";
};

FUNC INT Info_Mod_Myxir_HabDieKraeuter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bodo_Krautlieferung))
	&& (Npc_HasItems(hero, MyxirsGiftpflanze) >= 20)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_HabDieKraeuter_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_HabDieKraeuter_15_00"); //Mit freundlichen Grüßen von Bodo.

	B_GiveInvItems	(hero, self, MyxirsGiftpflanze, 20);

	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_01"); //Die kann er sich sparen! Hauptsache, er hat alles gefunden, was ich brauche.
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_02"); //(kurze Pause, zornig) Hab ich's mir doch gedacht! Dieser Faulenzer hat es sich wieder leicht gemacht!
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_03"); //Ich habe ausdrücklich von zehn Heilknospen gesprochen, und er schickt mir Heilkraut!
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_04"); //Das hätte ich ja wohl noch selbst sammeln können. Außerdem hat er die fünf Zwillingsdorne vergessen!
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_05"); //Wie soll ich denn jetzt bei meinen Forschungen weiterkommen?
	AI_Output(hero, self, "Info_Mod_Myxir_HabDieKraeuter_15_06"); //Das tut mir Leid. Aber handelst du jetzt mit mir?
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_07"); //Nicht, bis ich die vermaledeiten Pflanzen habe!
	AI_Output(hero, self, "Info_Mod_Myxir_HabDieKraeuter_15_08"); //So lautete unsere Abmachung aber nicht.
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_09"); //Was interessiert mich irgendeine Abmachung, hä?

	B_GivePlayerXP	(100);

	Npc_RemoveInvItems	(self, MyxirsGiftpflanze, 20);

	B_LogEntry	(TOPIC_MOD_GIFTPFLANZEN, "Bodo hat bei der Pflanzenlieferung ordentlich geschlampt. Myxir fehlen noch 10 Heilknospen und 5 Zwillingsdorne, damit er (hoffentlich) in eine gnädigere Stimmung versetzt wird.");

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Myxir_RestPflanzen (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_RestPflanzen_Condition;
	information	= Info_Mod_Myxir_RestPflanzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jetzt sollte deine Lieferung vollständig sein.";
};

FUNC INT Info_Mod_Myxir_RestPflanzen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_HabDieKraeuter))
	&& (Npc_HasItems(hero, ItPl_Heilknospe) >= 10)
	&& (Npc_HasItems(hero, ItPl_Zwillingsdorn) >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_RestPflanzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_RestPflanzen_15_00"); //Jetzt sollte deine Lieferung vollständig sein.

	Npc_RemoveInvItems	(hero, ItPl_Heilknospe, 10);
	Npc_RemoveInvItems	(hero, ItPl_Zwillingsdorn, 5);

	B_ShowGivenThings	("10 Heilknospen und 5 Zwillingsdorne gegeben");

	AI_Output(self, hero, "Info_Mod_Myxir_RestPflanzen_28_01"); //Na, endlich! Und meine Haare sind noch nicht mal komplett ergraut!

	B_GivePlayerXP	(200);

	B_SetTopicStatus	(TOPIC_MOD_GIFTPFLANZEN, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Myxir_Skinner (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Skinner_Condition;
	information	= Info_Mod_Myxir_Skinner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier etwas, was Ihr schon sehnlich erwarten werdet.";
};

FUNC INT Info_Mod_Myxir_Skinner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 20)
	&& (Npc_HasItems(hero, ItAt_GoblinBone) >= 14)
	&& (Npc_HasItems(hero, ItAt_SkeletonHead) >= 4)
	&& (Npc_HasItems(hero, ItMi_Addon_Bloodwyn_Kopf) >= 2)
	&& (Npc_HasItems(hero, ItPo_Blood) >= 17)
	&& (Npc_HasItems(hero, ItFoMuttonZombie) >= 12)
	&& (Npc_HasItems(hero, ItAt_DemonHeart) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Skinner_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Skinner_15_00"); //Gebieter über die dämonischen Mächte. Ich habe hier etwas, was Ihr schon sehnlich erwarten werdet.

	Npc_RemoveInvItems	(hero, ItAt_SkeletonBone, 20);
	Npc_RemoveInvItems	(hero, ItAt_GoblinBone, 14);
	Npc_RemoveInvItems	(hero, ItAt_SkeletonHead, 4);
	Npc_RemoveInvItems	(hero, ItMi_Addon_Bloodwyn_Kopf, 2);
	Npc_RemoveInvItems	(hero, ItPo_Blood, 17);
	Npc_RemoveInvItems	(hero, ItFoMuttonZombie, 12);
	Npc_RemoveInvItems	(hero, ItAt_DemonHeart, 1);

	B_ShowGivenThings	("Dämonischen Kram gegeben");

	AI_Output(self, hero, "Info_Mod_Myxir_Skinner_28_01"); //Herrlich. Bei Beliar, damit werde ich mein abscheuliches Werk vorantreiben können.
	AI_Output(hero, self, "Info_Mod_Myxir_Skinner_15_02"); //Wie sieht das aus ... ?
	AI_Output(self, hero, "Info_Mod_Myxir_Skinner_28_03"); //Was? Wieso belästigst du mich noch? Ach so, deine Entlohnung. Der Finder dieser Relikte des Todes und der finsteren Mächte ist dieser Spruchrollen wahrhaft würdig.

	CreateInvItems	(hero, ItSc_SumWolf, 1);
	CreateInvItems	(hero, ItSc_SumDemon, 1);
	CreateInvItems	(hero, ItSc_SumGol, 1);

	B_ShowGivenThings	("Spruchrollen erhalten");

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "Myxir habe ich aufgesucht und die Spruchrollen erhalten.");
};

INSTANCE Info_Mod_Myxir_Befoerderung (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Befoerderung_Condition;
	information	= Info_Mod_Myxir_Befoerderung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will Dämonenbeschwörer werden.";
};

FUNC INT Info_Mod_Myxir_Befoerderung_Condition()
{
	if (Mod_Gilde == 13)
	&& ((Kapitel > 4)
	|| (Npc_KnowsInfo(hero, Info_Mod_Xardas_AW_Bshydal)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Befoerderung_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Befoerderung_15_00"); //Ich will Dämonenbeschwörer werden.
	AI_Output(self, hero, "Info_Mod_Myxir_Befoerderung_28_01"); //(abschätzend) Meinetwegen. Du hast Beliar bereits gute Dienste geleistet. Du hast seine Gunst erworben.
	AI_Output(self, hero, "Info_Mod_Myxir_Befoerderung_28_02"); //Ich werde dich in den Rang des Dämonenbeschwörers erheben.
	AI_Output(self, hero, "Info_Mod_Myxir_Befoerderung_28_03"); //Hier ist deine Robe.

	CreateInvItems	(self, ITAR_Xardas, 1);
	B_GiveInvItems	(self, hero, ITAR_Xardas, 1);

	AI_UnequipArmor	(hero);
	AI_EquipArmor	(hero, ItAr_Xardas);

	B_GivePlayerXP	(400);

	B_Göttergefallen(3, 5);

	Mod_Gilde = 14;

	Snd_Play ("LEVELUP");
};

INSTANCE Info_Mod_Myxir_WieGehts (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_WieGehts_Condition;
	information	= Info_Mod_Myxir_WieGehts_Info;
	permanent	= 0;
	important	= 0;
	description	= "He, wie geht's so?";
};

FUNC INT Info_Mod_Myxir_WieGehts_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Myxir_WieGehts_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_WieGehts_15_00"); //He, wie geht's so?
	AI_Output(self, hero, "Info_Mod_Myxir_WieGehts_28_01"); //Komm mir ja nicht so kumpelhaft, als würden wir uns schon ewig kennen!
	AI_Output(self, hero, "Info_Mod_Myxir_WieGehts_28_02"); //Bei den anderen mag das funktionieren, aber bei mir nicht.
};

INSTANCE Info_Mod_Myxir_Haendler (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Haendler_Condition;
	information	= Info_Mod_Myxir_Haendler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mein Gefühl sagt mir, dass du der geborene Händler wärst.";
};

FUNC INT Info_Mod_Myxir_Haendler_Condition()
{
	if (hero.guild == GIL_KDF)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Haendler_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Haendler_15_00"); //Mein Gefühl sagt mir, dass du der geborene Händler wärst.
	AI_Output(self, hero, "Info_Mod_Myxir_Haendler_28_01"); //Tatsächlich biete ich die eine oder andere Ware zum Verkauf.
	AI_Output(hero, self, "Info_Mod_Myxir_Haendler_15_02"); //Handelst du mit mir?
	AI_Output(self, hero, "Info_Mod_Myxir_Haendler_28_03"); //Ich verkaufe an jeden, der mir auch mal einen Gefallen getan hat ...

	Info_ClearChoices	(Info_Mod_Myxir_Haendler);

	Info_AddChoice	(Info_Mod_Myxir_Haendler, "Die alte Leier schon wieder. Nicht mit mir!", Info_Mod_Myxir_Haendler_B);
	Info_AddChoice	(Info_Mod_Myxir_Haendler, "Und wie könnte so ein Gefallen aussehen?", Info_Mod_Myxir_Haendler_A);
};

FUNC VOID Info_Mod_Myxir_Haendler_B()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Haendler_B_15_00"); //Die alte Leier schon wieder. Nicht mit mir!

	Info_ClearChoices	(Info_Mod_Myxir_Haendler);
};

FUNC VOID Info_Mod_Myxir_Haendler_A()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Haendler_A_15_00"); //Und wie könnte so ein Gefallen aussehen?
	AI_Output(self, hero, "Info_Mod_Myxir_Haendler_A_28_01"); //Ich hatte Bodo losgeschickt, weil er mir Kräuter sammeln sollte.
	AI_Output(self, hero, "Info_Mod_Myxir_Haendler_A_28_02"); //Auf Xardas' Geheiß ist er jetzt aber in Khorinis geblieben, um sich dort über die aktuelle Lage zu informieren. Und ich warte auf meine Pflanzen.
	AI_Output(hero, self, "Info_Mod_Myxir_Haendler_A_15_03"); //Ich werd dran denken, wenn ich ihn sehe.
	AI_Output(self, hero, "Info_Mod_Myxir_Haendler_A_28_04"); //Das solltest du. Die Versorgung des Klosters funktioniert eh schon mehr schlecht als recht, da brauche ich nicht noch weitere Verzögerungen.

	Info_ClearChoices	(Info_Mod_Myxir_Haendler);

	Log_CreateTopic	(TOPIC_MOD_GIFTPFLANZEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GIFTPFLANZEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GIFTPFLANZEN, "Wenn ich mit Myxir handeln will, muss ich ihm vorher einen Gefallen tun: Bodo in der Stadt hat eine Pflanzenlieferung, auf die Myxir wartet.");

	Mod_MyxirsKraeuter = 0;
	Mod_KenntBodo = 1;

	Mod_MyxirsAuftragOK = 1;
};

INSTANCE Info_Mod_Myxir_Schattenlaeuferhorn (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Schattenlaeuferhorn_Condition;
	information	= Info_Mod_Myxir_Schattenlaeuferhorn_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du erwähntest früher mal, dass die Versorgung des Klosters stockt.";
};

FUNC INT Info_Mod_Myxir_Schattenlaeuferhorn_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_RestPflanzen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Schattenlaeuferhorn_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Schattenlaeuferhorn_15_00"); //Du erwähntest früher mal, dass die Versorgung des Klosters stockt.
	AI_Output(self, hero, "Info_Mod_Myxir_Schattenlaeuferhorn_28_01"); //Ja, das liegt hauptsächlich an unseren unzuverlässigen Boten.
	AI_Output(self, hero, "Info_Mod_Myxir_Schattenlaeuferhorn_28_02"); //Scar kann ein Lied davon singen.
};

INSTANCE Info_Mod_Myxir_Scar (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Scar_Condition;
	information	= Info_Mod_Myxir_Scar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist mit Scar?";
};

FUNC INT Info_Mod_Myxir_Scar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Schattenlaeuferhorn))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Scar_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Scar_15_00"); //Was ist mit Scar?
	AI_Output(self, hero, "Info_Mod_Myxir_Scar_28_01"); //Er handelt eigentlich nicht nur mit Schwertern, sondern auch mit Trophäen.
	AI_Output(self, hero, "Info_Mod_Myxir_Scar_28_02"); //Aber Bartok, den er losgeschickt hat, lässt sich nicht mehr blicken.
	AI_Output(self, hero, "Info_Mod_Myxir_Scar_28_03"); //(gehässig) Vielleicht ist er übergelaufen, wer weiß?
};

INSTANCE Info_Mod_Myxir_Angebot (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Angebot_Condition;
	information	= Info_Mod_Myxir_Angebot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Myxir_Angebot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kurgan_Angebot))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Angebot_Info()
{
	AI_Output(self, hero, "Info_Mod_Myxir_Angebot_28_00"); //(wütend) Was ist hier los?
	AI_Output(hero, self, "Info_Mod_Myxir_Angebot_15_01"); //Kurgan hat mich angegriffen, als ich ihm erklärte, dass das Alte Lager gezwungen ist, härtere Maßnahmen zu ergreifen, falls sie uns nicht einen Teil der Alten Mine verkaufen wollen.
	AI_Output(self, hero, "Info_Mod_Myxir_Angebot_28_02"); //Von der Mine wirst du jetzt nichts mehr sehen, und wenn Scar Wind davon bekommt und sich an das Alte Lager erinnern sollte, dann wird er mit den anderen wohl versuchen, das Lager einzunehmen, um seine alte Position wieder zu erlangen.
	AI_Output(hero, self, "Info_Mod_Myxir_Angebot_15_03"); //Du solltest am besten jetzt verschwinden.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_AL_MINE, "Ich habe im Lager der Dämonenritter Kurgan getroffen, der mich angegriffen hat. Myxir konnte ihn lähmen und meinte, ich sollte fliehen. Ich berichte besser Whistler, was geschehen ist.");

	AI_Teleport	(self, "START");

	Npc_ExchangeRoutine	(self, "START");
};	

INSTANCE Info_Mod_Myxir_Ruestung (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Ruestung_Condition;
	information	= Info_Mod_Myxir_Ruestung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kann ich bei dir eine bessere Rüstung bekommen?";
};

FUNC INT Info_Mod_Myxir_Ruestung_Condition()
{
	if (Mod_Gilde == 13)
	&& (Npc_KnowsInfo(hero, Info_Mod_Myxir_HabDieKraeuter))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Ruestung_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Ruestung_15_00"); //Kann ich bei dir eine bessere Rüstung bekommen?

	if (Kapitel > 3)
	&& (Mod_ZweiteVerbesserung == FALSE)
	&& (Mod_Gilde == 13)
	{
		AI_Output(self, hero, "Info_Mod_Myxir_Ruestung_28_01"); //Ich hab gehört, dass auf dem Weg zur Ausgrabungsstätte der Wassermagier ein Nachtmahr sein soll. Mit dessen Fell könnte ich deine schwarze Magierrobe sicher ein wenig verbessern.
	
		Mod_ZweiteVerbesserung = TRUE;
	};

	Info_ClearChoices	(Info_Mod_Myxir_Ruestung);
	Info_AddChoice	(Info_Mod_Myxir_Ruestung, DIALOG_BACK, Info_Mod_Myxir_Ruestung_BACK);

	if (Mod_ZweiteVerbesserung == TRUE)
	&& (Mod_Gilde == 13)
	{
		Info_AddChoice	(Info_Mod_Myxir_Ruestung, "Schwarze Magierrobe verbessern", Info_Mod_Myxir_Ruestung_KDS_S);
	};
};

FUNC VOID Info_Mod_Myxir_Ruestung_BACK ()
{
	Info_ClearChoices	(Info_Mod_Myxir_Ruestung);
};

FUNC VOID Info_Mod_Myxir_Ruestung_KDS_S ()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Ruestung_KDS_S_15_00"); //Verbessere meine schwarze Magierrobe.

	if (Npc_HasItems(hero, ItAt_NightmareFur) == 1)
	&& (Npc_HasItems(hero, SChwarzmagierrobe) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Myxir_Ruestung_KDS_S_28_01"); //Alles klar.

		Npc_RemoveInvItems	(hero, ItAt_NightmareFur, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, SChwarzmagierrobe, 1);

		CreateInvItems	(self, ItAr_KDS_S, 1);

		B_GiveInvItems	(self, hero, ItAr_KDS_S, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_KDS_S);

		Mod_ZweiteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, Schwarzmagierrobe) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Myxir_Ruestung_SKR_S_28_02"); //Du musst schon eine schwarze Magierrobe haben, sonst kann ich sie dir nicht verbessern.
	}
	else if (Npc_HasItems(hero, ItAt_NightmareFur) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Myxir_Ruestung_SKR_S_28_03"); //Wenn du das Nachtmahrfell nicht hast, kann ich deine Robe nicht verbessern.
	};

	Info_ClearChoices	(Info_Mod_Myxir_Ruestung);
};

INSTANCE Info_Mod_Myxir_Lehrer (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Lehrer_Condition;
	information	= Info_Mod_Myxir_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Myxir_Lehrer_Condition()
{
	if ((Mod_Gilde == 12)
	|| (Mod_Gilde == 13)
	|| (Mod_Gilde == 14))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Myxir_Lehrer_28_01"); //Ich kann dir zeigen, wie du Menschen, die du getötet hast, Blut abnehmen kannst.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_DÄMONENBESCHWÖRER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_DÄMONENBESCHWÖRER, "Myxir kann mir zeigen, wie ich toten Menschen Blut abnehmen kann.");
};

INSTANCE Info_Mod_Myxir_Blut (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Blut_Condition;
	information	= Info_Mod_Myxir_Blut_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir bei, wie man Menschen Blut abzapft! (1 LP)";
};

FUNC INT Info_Mod_Myxir_Blut_Condition()
{
	Info_Mod_Myxir_Blut.description = B_BuildLearnString("Bring mir bei, wie man Menschen Blut abzapft!", B_GetLearnCostTalent(hero, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Blood));

	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Lehrer))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Blood] == FALSE)
	&& ((Mod_Gilde == 12)
	|| (Mod_Gilde == 13)
	|| (Mod_Gilde == 14))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Blut_Info()
{
	AI_Output (hero, self, "Info_Mod_Myxir_Blut_15_00"); //Bring mir bei, wie man Menschen Blut abzapft!

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, hero, TROPHY_Blood))
	{
		AI_Output (self, other, "Info_Mod_Myxir_Blut_28_01"); //Gut. Hör zu. Es ist im Grunde ganz einfach.
		AI_Output (self, other, "Info_Mod_Myxir_Blut_28_02"); //Du nimmst eine scharfe Klinge und schneidest dein Opfer irgendwo auf, am besten an der Hauptschlagader. Dann hältst du ein Fläschchen darunter und fängst das Blut ein.
	};
};

INSTANCE Info_Mod_Myxir_Trade (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Trade_Condition;
	information	= Info_Mod_Myxir_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Myxir_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_RestPflanzen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Myxir_Pickpocket (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Pickpocket_Condition;
	information	= Info_Mod_Myxir_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Myxir_Pickpocket_Condition()
{
	C_Beklauen	(100, ItPl_Speed_Herb_01, 3);
};

FUNC VOID Info_Mod_Myxir_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);

	Info_AddChoice	(Info_Mod_Myxir_Pickpocket, DIALOG_BACK, Info_Mod_Myxir_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Myxir_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Myxir_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Myxir_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);
};

FUNC VOID Info_Mod_Myxir_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);

		Info_AddChoice	(Info_Mod_Myxir_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Myxir_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Myxir_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Myxir_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Myxir_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Myxir_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Myxir_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Myxir_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Myxir_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Myxir_EXIT (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_EXIT_Condition;
	information	= Info_Mod_Myxir_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Myxir_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Myxir_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};