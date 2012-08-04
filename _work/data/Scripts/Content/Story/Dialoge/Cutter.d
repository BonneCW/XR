INSTANCE Info_Mod_Cutter_Anbau (C_INFO)
{
	npc		= Mod_1110_GRD_Cutter_MT;
	nr		= 1;
	condition	= Info_Mod_Cutter_Anbau_Condition;
	information	= Info_Mod_Cutter_Anbau_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was wird denn hier angebaut?";
};

FUNC INT Info_Mod_Cutter_Anbau_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cutter_Anbau_Info()
{
	AI_Output(hero, self, "Info_Mod_Cutter_Anbau_15_00"); //Was wird denn hier angebaut?
	AI_Output(self, hero, "Info_Mod_Cutter_Anbau_29_01"); //Äh... Getreide.
	AI_Output(hero, self, "Info_Mod_Cutter_Anbau_15_02"); //Und, wächst es gut?
	AI_Output(self, hero, "Info_Mod_Cutter_Anbau_29_03"); //Keine Ahnung. Sieht besser aus als die letzten beiden Male.
	AI_Output(self, hero, "Info_Mod_Cutter_Anbau_29_04"); //Ian hat gesagt, dass die Samen Wasser brauchen. Verstehe ich aber nicht, Bäume wachsen doch auch so.
	AI_Output(self, hero, "Info_Mod_Cutter_Anbau_29_05"); //Ian hat auch vorgeschlagen, wir sollten ein bisschen Scheiße auf die Felder kippen, aber ich hab gesagt, nur über meine Leiche.
	AI_Output(self, hero, "Info_Mod_Cutter_Anbau_29_06"); //Wir wollen das Getreide ja später essen.
	AI_Output(hero, self, "Info_Mod_Cutter_Anbau_15_07"); //Ich sehe schon, ihr habt nicht die geringste Ahnung, was ihr da tut.
	AI_Output(self, hero, "Info_Mod_Cutter_Anbau_29_08"); //Maul halten, klar?! Wir hatten sogar mal ein Buch darüber, wie man Pflanzen wachsen lässt, aber irgendein Penner hat's zerrissen und zum Feuermachen verwendet.
	AI_Output(self, hero, "Info_Mod_Cutter_Anbau_29_09"); //Kann sein, dass davon noch ein oder zwei Seiten rumfliegen. Na ja, hilft uns auch nicht weiter.
};

INSTANCE Info_Mod_Cutter_Barriere (C_INFO)
{
	npc		= Mod_1110_GRD_Cutter_MT;
	nr		= 1;
	condition	= Info_Mod_Cutter_Barriere_Condition;
	information	= Info_Mod_Cutter_Barriere_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie gefällt dir das Leben ohne Barriere?";
};

FUNC INT Info_Mod_Cutter_Barriere_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cutter_Barriere_Info()
{
	AI_Output(hero, self, "Info_Mod_Cutter_Barriere_15_00"); //Wie gefällt dir das Leben ohne Barriere?
	AI_Output(self, hero, "Info_Mod_Cutter_Barriere_29_01"); //Ich hätte mit Scorpio abhauen sollen. Seit wir keine Mine mehr haben, geht das Leben hier im Lager abwärts.
};

INSTANCE Info_Mod_Cutter_Dokumente (C_INFO)
{
	npc		= Mod_1110_GRD_Cutter_MT;
	nr		= 1;
	condition	= Info_Mod_Cutter_Dokumente_Condition;
	information	= Info_Mod_Cutter_Dokumente_Info;
	permanent	= 0;
	important	= 0;
	description	= "Vielleicht hilft euch diese Anleitung beim Pflanzen.";
};

FUNC INT Info_Mod_Cutter_Dokumente_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lehrling_Cutter))
	&& (Npc_HasItems(hero, ItWr_Lehrling01) == 1)
	&& (Npc_HasItems(hero, ItWr_Lehrling02) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cutter_Dokumente_Info()
{
	AI_Output(hero, self, "Info_Mod_Cutter_Dokumente_15_00"); //Vielleicht hilft euch diese Anleitung beim Pflanzen.

	Npc_RemoveInvItems	(hero, ItWr_Lehrling01, 1);
	Npc_RemoveInvItems	(hero, ItWr_Lehrling02, 1);

	B_ShowGivenThings	("Blätter des Lehrlings gegeben");

	AI_Output(self, hero, "Info_Mod_Cutter_Dokumente_29_01"); //He, Mann, das ist aus dem Buch, von dem ich dir erzählt habe!

	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Cutter_Dokumente_29_02"); //Das hilft uns sicher weiter. Sind zwar viele Fachausdrücke drin, aber ich verstehe, worum es geht.
	AI_Output(self, hero, "Info_Mod_Cutter_Dokumente_29_03"); //Dafür lass ich sogar 'ne kleine Bezahlung springen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	AI_Output(hero, self, "Info_Mod_Cutter_Dokumente_15_04"); //Dann noch viel Glück beim Anbauen.
	AI_Output(self, hero, "Info_Mod_Cutter_Dokumente_29_05"); //Jetzt kann ja eigentlich nichts mehr schief gehen.

	AI_TurnToNpc	(self, Mod_1440_BUD_Buddler_MT);

	AI_Output(self, hero, "Info_Mod_Cutter_Dokumente_29_06"); //(ruft zu den Buddlern) Wartet mal! Ihr müsst die Sense andersrum halten!

	B_GivePlayerXP	(150);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Cutter_Dieb (C_INFO)
{
	npc		= Mod_1110_GRD_Cutter_MT;
	nr		= 1;
	condition	= Info_Mod_Cutter_Dieb_Condition;
	information	= Info_Mod_Cutter_Dieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Waren wurden aus dem Haus der Erzbarone gestohlen ...";
};

FUNC INT Info_Mod_Cutter_Dieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Cutter_Infos == 0)
	&& (Mod_PDV_Fisk_Infos == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cutter_Dieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Cutter_Dieb_15_00"); //Waren wurden aus dem Haus der Erzbarone gestohlen, und ich glaube, dass du damit zu tun hast.
	AI_Output(self, hero, "Info_Mod_Cutter_Dieb_29_01"); //(wütend) Was?! Ich soll klauen? Ich bemühe mich darum, den Diebstahl endlich aufzuhalten, aber wenn ich wache, traut sich dieses Lumpenpack ja nicht, irgendetwas zu stehlen.
	AI_Output(self, hero, "Info_Mod_Cutter_Dieb_29_02"); //Mir genügt es ja zu sehen, dass dieser Fisk gestohlene Waren verkauft.

	Mod_PDV_Cutter_Infos = 1;

	Mod_PDV_Genug_Infos += 1;

	B_LogEntry	(TOPIC_MOD_PDV, "Cutter versucht anscheinend selbst den Dieb zu finden. Er konnte mir sagen, dass Fisk das Diebesgut verkauft.");
};

INSTANCE Info_Mod_Cutter_Frage (C_INFO)
{
	npc		= Mod_1110_GRD_Cutter_MT;
	nr		= 1;
	condition	= Info_Mod_Cutter_Frage_Condition;
	information	= Info_Mod_Cutter_Frage_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was weißt du über ...";
};

FUNC INT Info_Mod_Cutter_Frage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Cutter_Infos == 0)
	&& (Mod_PDV_Fisk_Infos == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cutter_Frage_Info()
{
	AI_Output(hero, self, "Info_Mod_Cutter_Frage_15_00"); //Was weißt du über den Diebstahl aus dem Haus der Erzbarone?
	AI_Output(self, hero, "Info_Mod_Cutter_Frage_29_01"); //Nicht genug, nur dass dieser Fisk die gestohlenen Waren verkauft.

	Mod_PDV_Cutter_Infos = 1;

	Mod_PDV_Genug_Infos += 1;

	B_LogEntry	(TOPIC_MOD_PDV, "Cutter versucht anscheinend selbst den Dieb zu finden. Er konnte mir sagen, dass Fisk das Diebesgut verkauft.");
};

INSTANCE Info_Mod_Cutter_Dealer (C_INFO)
{
	npc		= Mod_1110_GRD_Cutter_MT;
	nr		= 1;
	condition	= Info_Mod_Cutter_Dealer_Condition;
	information	= Info_Mod_Cutter_Dealer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo würde ich ...";
};

FUNC INT Info_Mod_Cutter_Dealer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Cutter_Infos == 0)
	&& (Mod_PDV_Fisk_Infos == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cutter_Dealer_Info()
{
	AI_Output(hero, self, "Info_Mod_Cutter_Dealer_15_00"); //Wo würde ich am ehesten "besondere" Ware bekommen?
	AI_Output(self, hero, "Info_Mod_Cutter_Dealer_29_01"); //Was, du fragst mich nach Diebesgut? Dieser verdammte Lumpenhändler Fisk verkauft genug davon. Geh zu dem, bevor ich deine Frage Thorus melde.

	Mod_PDV_Cutter_Infos = 1;

	Mod_PDV_Genug_Infos += 1;

	B_LogEntry	(TOPIC_MOD_PDV, "Cutter versucht anscheinend selbst den Dieb zu finden. Er konnte mir sagen, dass Fisk das Diebesgut verkauft.");
};

INSTANCE Info_Mod_Cutter_WhatCrime (C_INFO)
{
	npc		= Mod_1110_GRD_Cutter_MT;
	nr		= 1;
	condition	= Info_Mod_Cutter_WhatCrime_Condition;
	information	= Info_Mod_Cutter_WhatCrime_Info;
	permanent	= 0;
	important	= 0;
	description	= "Für welches Verbrechen bist du in die Kolonie geworfen worden?";
};

FUNC INT Info_Mod_Cutter_WhatCrime_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cutter_WhatCrime_Info()
{
	AI_Output(hero, self, "Info_Mod_Cutter_WhatCrime_15_00"); //Für welches Verbrechen bist du in die Kolonie geworfen worden?
	AI_Output(self, hero, "Info_Mod_Cutter_WhatCrime_29_01"); //Früher war ich Assassine in Varant. Ich sollte den Richter des Königs ausschalten, wurde aber erwischt.
	AI_Output(self, hero, "Info_Mod_Cutter_WhatCrime_29_02"); //Zum Glück wurde damals jeder Gefangene in die Kolonie geworfen, sonst hätte er mich sicherlich hinrichten lassen.
};

INSTANCE Info_Mod_Cutter_Costa (C_INFO)
{
	npc		= Mod_1110_GRD_Cutter_MT;
	nr		= 1;
	condition	= Info_Mod_Cutter_Costa_Condition;
	information	= Info_Mod_Cutter_Costa_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was haben die beiden Leichen neben Stone zu bedeuten?";
};

FUNC INT Info_Mod_Cutter_Costa_Condition()
{
	if (Mod_Costa_Guertel == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cutter_Costa_Info()
{
	AI_Output(hero, self, "Info_Mod_Cutter_Costa_15_00"); //Was haben die beiden Leichen neben Stone zu bedeuten?
	AI_Output(self, hero, "Info_Mod_Cutter_Costa_29_01"); //Ach, die. Nur zwei Buddler, die wir beim Fliehen erwischt haben.
	AI_Output(self, hero, "Info_Mod_Cutter_Costa_29_02"); //Die bleiben jetzt als Abschreckung für die anderen ein paar Tage da liegen.
};

INSTANCE Info_Mod_Cutter_Ambient (C_INFO)
{
	npc		= Mod_1110_GRD_Cutter_MT;
	nr		= 1;
	condition	= Info_Mod_Cutter_Ambient_Condition;
	information	= Info_Mod_Cutter_Ambient_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cutter_Ambient_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (hero.guild == GIL_MIL)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cutter_Ambient_Info()
{
	AI_Output(self, hero, "Info_Mod_Cutter_Ambient_29_00"); //Du gehörst ja zu den Scheiß-Söldnern. Verpiss dich!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Cutter_EXIT (C_INFO)
{
	npc		= Mod_1110_GRD_Cutter_MT;
	nr		= 1;
	condition	= Info_Mod_Cutter_EXIT_Condition;
	information	= Info_Mod_Cutter_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Cutter_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cutter_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};