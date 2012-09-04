INSTANCE Info_Mod_Namib_Hi (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Hi_Condition;
	information	= Info_Mod_Namib_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Namib_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Namib_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Namib_Hi_02_00"); //Du lebst?
	AI_Output(hero, self, "Info_Mod_Namib_Hi_15_01"); //Man könnte es so sagen.
	AI_Output(self, hero, "Info_Mod_Namib_Hi_02_02"); //Du hast es also geschafft den Schläfer zu besiegen?
};

INSTANCE Info_Mod_Namib_Irdorath (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Irdorath_Condition;
	information	= Info_Mod_Namib_Irdorath_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Namib_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Irdorath))
	&& (Mod_Irdorath == 0)
	&& ((Guru_Dabei == 1)
	|| (Templer_Dabei == 1))
	{
		return 1;
	};
};

FUnc VOID Info_Mod_Namib_Irdorath_Info()
{
	AI_Output(self, hero, "Info_Mod_Namib_Irdorath_02_00"); //Ich hatte eine Vision! Ich sah das Meer ... darauf trieb ein stück Holz ... nein, es war ein Schiff.
	AI_Output(self, hero, "Info_Mod_Namib_Irdorath_02_01"); //Es bewegte sich auf etwas finsteres zu ... dann sah ich plötzlich Y'Berion.
	AI_Output(self, hero, "Info_Mod_Namib_Irdorath_02_02"); //Er sprach zu mir und sagte: Geh zum Hafen von Khorinis und schließ dich er Mannschaft an.
};

INSTANCE Info_Mod_Namib_Irdorath2 (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Irdorath2_Condition;
	information	= Info_Mod_Namib_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ja, tatsächlich! Das ist der Grund, aus welchem ich hier bin.";
};

FUNC INT Info_Mod_Namib_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUnc VOID Info_Mod_Namib_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_Irdorath2_15_00"); //(verblüfft) Ja, tatsächlich! Das ist der Grund, aus welchem ich hier bin.
	AI_Output(hero, self, "Info_Mod_Namib_Irdorath2_15_01"); //Ich versuche eine Mannschaft zu rekrutieren, mit welcher ich eine Insel aufsuchen muss, um dem finsteren Treiben des Magiers Xeres einen Ende setzen zu können ...
	AI_Output(hero, self, "Info_Mod_Namib_Irdorath2_15_02"); //Nun, es ist zumindest ein wichtiger Schritt auf diesem Weg.
	AI_Output(self, hero, "Info_Mod_Namib_Irdorath2_02_03"); //Dann ist es also der Weg, der mir bestimmt ist. Wir sehen uns dann am Hafen.
	AI_Output(hero, self, "Info_Mod_Namib_Irdorath2_15_04"); //Ähhm, klar, bis dahin.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Namib hatte eine Vision in welcher ihm aufgetragen wurde, sich meiner Mannschaft anzuschließen. Und das hat er jetzt auch.");

	B_GivePlayerXP	(100);

	Mod_NamibDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Namib_Sekte (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Sekte_Condition;
	information	= Info_Mod_Namib_Sekte_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lester hat mir gesagt, ihr seid noch hier.";
};

FUNC INT Info_Mod_Namib_Sekte_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Aufnehmen))
	{
		return 1;
	};
};

FUnc VOID Info_Mod_Namib_Sekte_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_Sekte_15_00"); //Lester hat mir gesagt, ihr seid noch hier.
	AI_Output(self, hero, "Info_Mod_Namib_Sekte_02_01"); //Ich hätte nicht gedacht, dich noch einmal wieder zu sehen!
	AI_Output(hero, self, "Info_Mod_Namib_Sekte_15_02"); //Seid ihr sauer, weil ich euch den Schläfer genommen habe?
	AI_Output(self, hero, "Info_Mod_Namib_Sekte_02_03"); //Nein, ganz und gar nicht! Wir sind dir dankbar, dass du uns von dem Dämon erlöst hast, der unseren Geist geiselte!
	AI_Output(hero, self, "Info_Mod_Namib_Sekte_15_04"); //Dann betet ihr also nicht länger zum Schläfer?
	AI_Output(self, hero, "Info_Mod_Namib_Sekte_02_05"); //Nein.
	AI_Output(hero, self, "Info_Mod_Namib_Sekte_15_06"); //Achso ...
	AI_Output(self, hero, "Info_Mod_Namib_Sekte_02_07"); //Ja ...
	AI_Output(hero, self, "Info_Mod_Namib_Sekte_15_08"); //Was macht ihr dann hier draußen?
	AI_Output(self, hero, "Info_Mod_Namib_Sekte_02_09"); //Nun, hauptsächlich säen, ernten und rauchen wir Sumpfkraut.
	AI_Output(hero, self, "Info_Mod_Namib_Sekte_15_10"); //Das hab ich mir fast gedacht.
	AI_Output(self, hero, "Info_Mod_Namib_Sekte_02_11"); //Des Weiteren studieren wir hier die Magie.
};

INSTANCE Info_Mod_Namib_Aufnehmen (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Aufnehmen_Condition;
	information	= Info_Mod_Namib_Aufnehmen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich möchte bei euch mitmachen!";
};

FUNC INT Info_Mod_Namib_Aufnehmen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_Sekte))
	&& (Mod_Gilde > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_Aufnehmen_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_Aufnehmen_15_00"); //Ich möchte bei euch mitmachen!
	AI_Output(self, hero, "Info_Mod_Namib_Aufnehmen_02_01"); //Es freut mich, das zu hören. Nun, es gibt da auch eine Aufgabe zu erledigen. Suche zuerst Lester!
	AI_Output(hero, self, "Info_Mod_Namib_Aufnehmen_15_02"); //Ich habe Lester bereits gesehen. Er hat mir gesagt, dass ihr noch hier seid.
	AI_Output(self, hero, "Info_Mod_Namib_Aufnehmen_02_03"); //(verwirrt) Ah ja ... damit hast du diese Probe bereits bestanden. Geh zu ihm. Er hat ein Päckchen bei sich, das er bei Constantino, dem Alchemisten Khorinis', abgeben sollte.
	AI_Output(hero, self, "Info_Mod_Namib_Aufnehmen_15_04"); //Warum gibt er es dann nicht dort ab?
	AI_Output(self, hero, "Info_Mod_Namib_Aufnehmen_02_05"); //Da unterlief uns ein kleiner organisatorischer Fehler. Wir haben Lester mit zwei Aufgaben auf einmal beauftragt.
	AI_Output(hero, self, "Info_Mod_Namib_Aufnehmen_15_06"); //Was macht er dann jetzt?
	AI_Output(self, hero, "Info_Mod_Namib_Aufnehmen_02_07"); //Warst du schon bei dem großen Turm von Xardas in Khorinis?
	AI_Output(hero, self, "Info_Mod_Namib_Aufnehmen_15_08"); //Äh ...
	AI_Output(self, hero, "Info_Mod_Namib_Aufnehmen_02_09"); //Jedenfalls hat er dort untote Wesen beschworen. Er muss viel Energie aufgewandt haben, es waren genügend um einen ganzen Turm in kurzer Zeit zu bauen.
	AI_Output(self, hero, "Info_Mod_Namib_Aufnehmen_02_10"); //Das ganze hat jedoch den Boden verändert, ihm gewisse Stoffe entzogen und als diese Untoten wieder zu Stein wurden, hat der Boden gewisse andere Stoffe wiederbekommen.
	AI_Output(self, hero, "Info_Mod_Namib_Aufnehmen_02_11"); //Lester soll in der Höhle testen, welche Auswirkungen so ein Zauber auf die Sumpfkrautpflanzen hat.
	AI_Output(self, hero, "Info_Mod_Namib_Aufnehmen_02_12"); //Wenn du schon bei ihm bist, frage ihn um einen Lagerbericht.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Baal Namib hat mich damit beauftrag Lesters Paket bei Constantino abzugeben und einen Lagebericht von Lester einzuholen.");
};

INSTANCE Info_Mod_Namib_WarBeiLester (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_WarBeiLester_Condition;
	information	= Info_Mod_Namib_WarBeiLester_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Paket zu Constantino gebracht.";
};

FUNC INT Info_Mod_Namib_WarBeiLester_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Zauberwasser))
	&& (Npc_HasItems(hero, ItMi_DuengerPaket) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_WarBeiLester_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_WarBeiLester_15_00"); //Ich habe das Paket zu Constantino gebracht. Er hat mir das hier gegeben.

	B_GiveInvItems	(hero, self, ItMi_DuengerPaket, 1);

	AI_Output(self, hero, "Info_Mod_Namib_WarBeiLester_02_01"); //Ah, sehr gut! Bring es auf die Felder zu Balor.

	B_GiveInvItems	(self, hero, ItMi_DuengerPaket, 1);

	AI_Output(hero, self, "Info_Mod_Namib_WarBeiLester_15_02"); //Ich war auch bei Lester.
	AI_Output(self, hero, "Info_Mod_Namib_WarBeiLester_02_03"); //Und? Was sagt er? Sprich schon.
	AI_Output(hero, self, "Info_Mod_Namib_WarBeiLester_15_04"); //Er sagt, dass das Sumpfkraut in der Höhle ungewöhnlich gut gedeiht. Er hat irgendwas von den Schwarzmagiern gesagt.
	AI_Output(self, hero, "Info_Mod_Namib_WarBeiLester_02_05"); //Ausgezeichnet ... Hast du das Paket eigentlich schon zu Balor gebracht? Nein? Na dann beeil dich und bring es ihm.
	AI_Output(self, hero, "Info_Mod_Namib_WarBeiLester_02_06"); //Melde dich danach wieder bei mir!

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Baal Namib will, dass ich das Paket von Constantino zu Balor bringe.");
};

INSTANCE Info_Mod_Namib_DuengerVerteilt (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_DuengerVerteilt_Condition;
	information	= Info_Mod_Namib_DuengerVerteilt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich war bei Balor und hab auch gleich das Feld gedüngt.";
};

FUNC INT Info_Mod_Namib_DuengerVerteilt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Balor_DuengerVerteilt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_DuengerVerteilt_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_DuengerVerteilt_15_00"); //Ich war bei Balor und hab auch gleich das Feld gedüngt.
	AI_Output(self, hero, "Info_Mod_Namib_DuengerVerteilt_02_01"); //Sehr gut. Ich hab gleich einen weiteren Auftrag für dich. Geh zu den Schwarzmagiern. Wir brauchen ihre Hilfe.
	AI_Output(self, hero, "Info_Mod_Namib_DuengerVerteilt_02_02"); //Bring ihnen diesen Brief und dieses Paket Sumpfkraut als kleines Present.

	B_ShowGivenThings	("2 Gegenstände erhalten");

	CreateInvItems	(hero, ItWr_NamibForBeliar, 1);
	CreateInvItems	(hero, ItMi_HerbPaket, 1);

	AI_Output(self, hero, "Info_Mod_Namib_DuengerVerteilt_02_03"); //Und auf deinem Rückweg kannst du Lester wieder mitnehmen!

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Ich soll einen Brief und ein Paket Sumpfkraut zu den Schwarzmagiern bringen. Auf dem Weg zurück ins Minental soll ich außerdem Lester mitnehmen.");
};

INSTANCE Info_Mod_Namib_KarrasDa (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_KarrasDa_Condition;
	information	= Info_Mod_Namib_KarrasDa_Info;
	permanent	= 0;
	important	= 0;
	description	= "Karras ist hier.";
};

FUNC INT Info_Mod_Namib_KarrasDa_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Karras_Namib2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_KarrasDa_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_KarrasDa_15_00"); //Karras ist hier.
	AI_Output(self, hero, "Info_Mod_Namib_KarrasDa_02_01"); //Sehr gut. Geh zu den anderen Gurus und gib ihnen Bescheid, dass sie auf den Tempelplatz kommen sollen.
	AI_Output(self, hero, "Info_Mod_Namib_KarrasDa_02_02"); //Falls du nicht weißt, wer alles kommen muss oder wo du die Gurus findet, wird Talas dich zu ihnen führen.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Baal Namib will, dass ich den anderen Gurus sage, dass sie auf den Tempelplatz kommen sollen. Talas kann mich zu den Gurus führen, wenn ich sie nicht finde oder nicht weiß, wer noch fehlt.");

	B_StartOtherRoutine	(self, "TEMPEL");
	B_StartOtherRoutine	(Mod_514_DMB_Karras_MT, "TEMPEL");
	B_StartOtherRoutine	(Mod_7268_PSINOV_Lester_MT, "START");
	B_StartOtherRoutine	(Mod_2005_GUR_CorCadar_MT, "TEMPEL");
};

INSTANCE Info_Mod_Namib_AtTempel (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_AtTempel_Condition;
	information	= Info_Mod_Namib_AtTempel_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Namib_AtTempel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orun_GotoTempel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Tyon_GotoTempel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Tondral_GotoTempel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Joru_GotoTempel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Caine_GotoTempel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_AtTempel_Info()
{
	AI_Output(self, hero, "Info_Mod_Namib_AtTempel_02_00"); //Ah, da bist du ja.
	AI_Output(hero, self, "Info_Mod_Namib_AtTempel_15_01"); //Was geschieht jetzt?
	AI_Output(self, hero, "Info_Mod_Namib_AtTempel_02_02"); //Du weiß doch, dass die Schwarzmagier in ihrem Tal Untote beschworen haben, die für sie den schwarzen Turm, die Beliarkirche und ihr ganzes Lager aufgebaut haben.
	AI_Output(self, hero, "Info_Mod_Namib_AtTempel_02_03"); //Und wie du durch Lester weißt, hat dies den Boden insofern beeinflusst, dass das Sumpfkraut dort hervorragend gedeiht.
	AI_Output(self, hero, "Info_Mod_Namib_AtTempel_02_04"); //Wir haben sie gebeten, das Selbe hier im Sumpf zu machen, um die Qualität unseres Sumpfkrautes noch weiter zu steigern, du verstehst?
	AI_Output(hero, self, "Info_Mod_Namib_AtTempel_15_05"); //Äh ...
	AI_Output(self, hero, "Info_Mod_Namib_AtTempel_02_06"); //Sehr gut.
	AI_Output(self, hero, "Info_Mod_Namib_AtTempel_02_07"); //Jedenfalls traue ich den Schwarzmagiern nicht ganz. Ich vermute die haben irgendeinen Hintergedanken.
	AI_Output(self, hero, "Info_Mod_Namib_AtTempel_02_08"); //Geh zu Cor Angar. Sag ihm, die Templer sollen ihre Position einnehmen, für den Fall das etwas schief geht.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Die Gurus sind am Tempelplatz versammelt und wollen jetzt Untote beschwören, damit die Qualität des Sumpfkrautes steigt. Ich soll vorsichtshalber dafür sorgen, dass die Templer bereit stehen.");
};

INSTANCE Info_Mod_Namib_SUDD (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_SUDD_Condition;
	information	= Info_Mod_Namib_SUDD_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Sumpfhaizombies sind tot.";
};

FUNC INT Info_Mod_Namib_SUDD_Condition()
{
	if (Mod_Sekte_SH_Kampf == 4)
	&& (Npc_IsDead(Swampshark_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_SUDD_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_SUDD_15_00"); //Die Sumpfhaizombies sind tot.
	AI_Output(self, hero, "Info_Mod_Namib_SUDD_02_01"); //Sehr gut! Diese verdammten Sumphaizombies haben nun zum zweiten Mal ihr Grab gefunden.
	AI_Output(self, hero, "Info_Mod_Namib_SUDD_02_02"); //Ich frage mich was bei dem Zauber schief gelaufen ist. Das ganze hat jedenfalls funktioniert! Das Sumpfkraut sollte hier jetzt wunderbar gedeihen.
	AI_Output(self, hero, "Info_Mod_Namib_SUDD_02_03"); //Du warst uns eine große Hilfe! Uns, und dem Sumpfkraut.

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_106_TPL_Angar_MT, "START");
	B_StartOtherRoutine	(Mod_1219_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1218_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1221_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1226_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1116_PSINOV_Caine_MT, "START");
	B_StartOtherRoutine	(Mod_2013_PSINOV_Joru_MT, "START");
	B_StartOtherRoutine	(Mod_2007_GUR_BaalOrun_MT, "START");
	B_StartOtherRoutine	(Mod_2003_GUR_BaalTondral_MT, "START");
	B_StartOtherRoutine	(Mod_2006_GUR_BaalTyon_MT, "START");
	B_StartOtherRoutine	(Mod_2005_GUR_CorCadar_MT, "START");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1218_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1219_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1221_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1226_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = FALSE;

	if (hero.guild != GIL_KDF)
	{
		B_StartOtherRoutine	(Mod_514_DMB_Karras_MT, "START");
		AI_Teleport	(Mod_514_DMB_Karras_MT, "TOT");
	};

	if (Mod_AnzahlNebengilden < MaxNebengilden)
	{
		AI_Output(self, hero, "Info_Mod_Namib_SUDD_02_04"); //Du kannst nun in den Rang eine Templers oder eines Gurus aufsteigen.

		Info_ClearChoices	(Info_Mod_Namib_SUDD);

		Info_AddChoice	(Info_Mod_Namib_SUDD, "Ich hab's mir anders überlegt.", Info_Mod_Namib_SUDD_No);
		Info_AddChoice	(Info_Mod_Namib_SUDD, "Ich will Guru werden.", Info_Mod_Namib_SUDD_Guru);
		Info_AddChoice	(Info_Mod_Namib_SUDD, "Ich will Templer werden.", Info_Mod_Namib_SUDD_Templer);
	};

	B_GivePlayerXP	(500);

	B_SetTopicStatus	(TOPIC_MOD_SEKTE_AUFNAHME, LOG_SUCCESS);
};

FUNC VOID Info_Mod_Namib_SUDD_No()
{
	AI_Output(hero, self, "Info_Mod_Namib_SUDD_No_15_00"); //Ich hab's mir anders überlegt.
	AI_Output(self, hero, "Info_Mod_Namib_SUDD_No_02_01"); //Schade, mit dir hätten wir viel erreichen können.

	Info_ClearChoices	(Info_Mod_Namib_SUDD);
};

FUNC VOID Info_Mod_Namib_SUDD_Guru()
{
	AI_Output(hero, self, "Info_Mod_Namib_SUDD_Guru_15_00"); //Ich will Guru werden.
	AI_Output(self, hero, "Info_Mod_Namib_SUDD_Guru_02_01"); //Gut, hier ist deine Robe.

	CreateInvItems	(hero, Nov_Armor_H, 1);
	B_ShowGivenThings	("Gururobe erhalten");

	Mod_AnzahlNebengilden += 1;

	Log_CreateTopic	(TOPIC_MOD_NEBENGILDEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NEBENGILDEN, "Ich bin jetzt ein Guru.");

	Mod_1210_TPL_Templer_MT.aivar[AIV_PASSGATE] = TRUE;

	Guru_Dabei = 1;

	Info_ClearChoices	(Info_Mod_Namib_SUDD);
};

FUNC VOID Info_Mod_Namib_SUDD_Templer()
{
	AI_Output(hero, self, "Info_Mod_Namib_SUDD_Templer_15_00"); //Ich will Templer werden.
	AI_Output(self, hero, "Info_Mod_Namib_SUDD_Templer_02_01"); //Gut, hier ist deine Rüstung.

	CreateInvItems	(self, Tpl_Armor_L, 1);
	B_GiveInvItems	(self, hero, Tpl_Armor_L, 1);

	Mod_AnzahlNebengilden += 1;

	Log_CreateTopic	(TOPIC_MOD_NEBENGILDEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NEBENGILDEN, "Ich bin jetzt ein Templer.");

	Mod_1210_TPL_Templer_MT.aivar[AIV_PASSGATE] = TRUE;

	Templer_Dabei = 1;

	Info_ClearChoices	(Info_Mod_Namib_SUDD);
};

INSTANCE Info_Mod_Namib_Dealer (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Dealer_Condition;
	information	= Info_Mod_Namib_Dealer_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Namib_Dealer_Condition()
{
	if ((Templer_Dabei == 1)
	|| (Guru_Dabei == 1))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_Dealer_Info()
{
	AI_Output(self, hero, "Info_Mod_Namib_Dealer_02_00"); //Gut, dass du kommst! Ich habe einen Auftrag für dich. Der Sumpfkrautlieferant ist krank geworden.
	AI_Output(self, hero, "Info_Mod_Namib_Dealer_02_01"); //Du musst unbedingt dieses Paket Sumpfkraut zu den Söldnern hier im Minental bringen! Liefere es bei Rath ab.

	CreateInvItems	(self, ItMi_HerbPaket, 1);
	B_GiveInvItems	(self, hero, ItMi_HerbPaket, 1);

	AI_Output(hero, self, "Info_Mod_Namib_Dealer_15_02"); //Alles klar.
	AI_Output(self, hero, "Info_Mod_Namib_Dealer_02_03"); //Hier hast du noch ein bessere Rüstung.

	if (Templer_Dabei == 1)
	{
		CreateInvItems	(hero, TPL_Armor_M, 1);
	}
	else
	{
		CreateInvItems	(hero, GUR_Armor_M, 1);
	};

	Log_CreateTopic	(TOPIC_MOD_SEKTE_DEALER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SEKTE_DEALER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SEKTE_DEALER, "Baal Namib hat mir ein Krautpaket gegeben, welches ich bei einem Söldner namens Rath hier im Minental abliefern soll.");
};

INSTANCE Info_Mod_Namib_NoDeal (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_NoDeal_Condition;
	information	= Info_Mod_Namib_NoDeal_Info;
	permanent	= 0;
	important	= 0;
	description	= "Rath wollte das Sumpfkraut nicht?";
};

FUNC INT Info_Mod_Namib_NoDeal_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rath_Sumpfkraut))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_NoDeal_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_NoDeal_15_00"); //Rath wollte das Sumpfkraut nicht?
	AI_Output(self, hero, "Info_Mod_Namib_NoDeal_02_01"); //Aber wieso denn das?
	AI_Output(hero, self, "Info_Mod_Namib_NoDeal_15_02"); //Er sagt, dass es eine billigere und bessere Droge als Sumpfkraut gibt. Er nennt es Freudenspender.
	AI_Output(hero, self, "Info_Mod_Namib_NoDeal_15_03"); //Ein Typ auf dem Marktplatz von Khorata soll es verkaufen.
	AI_Output(self, hero, "Info_Mod_Namib_NoDeal_02_04"); //Das sind schlechte Nachrichten. Geh nach Relendel und ergründe dort in Khorata das Geheimnis des Freudenspender. Du bist unsere letzte Hoffnung.

	Log_CreateTopic	(TOPIC_MOD_SEKTE_Freudenspender, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SEKTE_Freudenspender, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SEKTE_Freudenspender, "Baal Namib will, dass ich nach Khorata gehe, und dort die Spur des Freudenspender aufnehme.");
	B_SetTopicStatus	(TOPIC_MOD_SEKTE_DEALER, LOG_SUCCESS);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Namib_Meer (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Meer_Condition;
	information	= Info_Mod_Namib_Meer_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Namib_Meer_Condition()
{
	if (Mod_SL_Meer == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_Meer_Info()
{
	AI_Output(self, hero, "Info_Mod_Namib_Meer_02_00"); //DU!? Du wagst dich noch hierher, nachdem du uns verraten hast?
	AI_Output(self, hero, "Info_Mod_Namib_Meer_02_01"); //Sieh nur was du aus der glorreichen Gemeinschaft des Sumpfes gemacht hast!
	AI_Output(self, hero, "Info_Mod_Namib_Meer_02_02"); //Sie sind alle TOT ... naja die meisten sind gegangen weil wir keine Mittel mehr hatten, Sumpfkraut anzubauen, aber der Geist unserer Gemeinschaft ist TOT!
	AI_Output(hero, self, "Info_Mod_Namib_Meer_15_03"); //Beruhige dich. Ich hab eine Idee wie wir dem Sumpflager neues Leben einhauchen können.
	AI_Output(self, hero, "Info_Mod_Namib_Meer_02_04"); //Es ist UNVERZEIHLICH was du uns anget ... du hast eine Idee? Na sprich schon, lass dir nicht alles aus der Nase ziehen.
	AI_Output(hero, self, "Info_Mod_Namib_Meer_15_05"); //Der König wünscht sich ein Meer. Der Sumpf hier wäre genau das richtige.
	AI_Output(self, hero, "Info_Mod_Namib_Meer_02_06"); //Du glaubst wir überlassen diesen Spinnern einfach unsren Sumpf? Du bist VERRÜCKT!
	AI_Output(hero, self, "Info_Mod_Namib_Meer_15_07"); //Natürlich nicht. Ich hab eher an ein Bündnis gedacht.
	AI_Output(hero, self, "Info_Mod_Namib_Meer_15_08"); //Der Hofstaat darf sich frei hier aufhalten und dafür werde ich dafür sorgen, dass ihr wieder nach Lust und Laune Sumpfkraut anbauen könnt, ohne finanzielle Probleme.
	AI_Output(self, hero, "Info_Mod_Namib_Meer_02_09"); //Ach ich weiß nicht ... normaler weiße rauche ich immer einen, wenn ich über so wichtige Angelegenheiten nachdenke.

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Baal Namib ist sich noch nicht sicher, was er von dem Vorschlag halten soll. Er braucht erst was zu rauchen, bevor er einen Entschluss fassen kann. Ich sollte ihm etwas Sumpfkraut oder ein Fläschchen Freudenspender bringen.");

	Mod_SL_Meer = 2;
};

INSTANCE Info_Mod_Namib_KoenigJoint (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_KoenigJoint_Condition;
	information	= Info_Mod_Namib_KoenigJoint_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du einen Stängel.";
};

FUNC INT Info_Mod_Namib_KoenigJoint_Condition()
{
	if (Mod_SL_Meer == 2)
	&& (Npc_HasItems(hero, ItMi_Joint) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_KoenigJoint_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_KoenigJoint_15_00"); //Hier hast du einen Stängel.

	B_GiveInvItems	(hero, self, ItMi_Joint, 1);

	B_UseItem	(self, ItMi_Joint);

	AI_Output(self, hero, "Info_Mod_Namib_KoenigJoint_02_01"); //Ahhh ... Das tut gut ... nach so langer Zeit wieder den süßen Qualm einzuatmen.
	AI_Output(self, hero, "Info_Mod_Namib_KoenigJoint_02_02"); //Von mir aus, bring' diese Burg-Fuzzies hierher, wenn wir danach nur wieder unser geliebtes Sumpfkraut anbauen können!

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Baal Namib hat nichts dagegen, dass der König hierher kommt. Ich sollte jetzt mit dem König sprechen und ihn darüber informieren, dass ich ein Meer für ihn gefunden habe.");

	Mod_SL_Meer = 3;

	B_GivePlayerXP	(500);
};

INSTANCE Info_Mod_Namib_KoenigFreudenspender (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_KoenigFreudenspender_Condition;
	information	= Info_Mod_Namib_KoenigFreudenspender_Info;
	permanent	= 0;
	important	= 0;
	description	= "Versuch's mal hiermit.";
};

FUNC INT Info_Mod_Namib_KoenigFreudenspender_Condition()
{
	if (Mod_SL_Meer == 2)
	&& (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_KoenigFreudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_KoenigFreudenspender_15_00"); //Versuch's mal hiermit.

	B_GiveInvItems	(hero, self, ItMi_Freudenspender, 1);

	B_UseItem	(self, ItMi_Freudenspender);

	AI_Output(self, hero, "Info_Mod_Namib_KoenigFreudenspender_02_01"); //Ich ... Ich war an einem Berg. Da stand eine Burg und ein Fluss war auch da! Und ... Sumpfkraut!
	AI_Output(self, hero, "Info_Mod_Namib_KoenigFreudenspender_02_02"); //Da war Sumpfkraut, das zu mir gesprochen hat! Es hat gesagt, der Hofstaat ist die Antwort! Los beeil dich schon!

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Baal Namib hat nichts dagegen, dass der König hierher kommt. Ich sollte jetzt mit dem König sprechen und ihn darüber informieren, dass ich ein Meer für ihn gefunden habe.");

	Mod_SL_Meer = 3;

	B_GivePlayerXP	(500);
};

INSTANCE Info_Mod_Namib_Sporen (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Sporen_Condition;
	information	= Info_Mod_Namib_Sporen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier. Diese Sporen sind der Schlüssel zu der Droge des Hofstaates.";
};

FUNC INT Info_Mod_Namib_Sporen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatBarde_Sporen))
	&& (Npc_HasItems(hero, ItMi_FreudenspenderSporen) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_Sporen_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_Sporen_15_00"); //Hier. Diese Sporen sind der Schlüssel zu der Droge des Hofstaates.

	B_GiveInvItems	(hero, self, ItMi_FreudenspenderSporen, 1);

	AI_Output(self, hero, "Info_Mod_Namib_Sporen_02_01"); //Diese Sporen sind der Schlüssel?
	AI_Output(hero, self, "Info_Mod_Namib_Sporen_15_02"); //Ahm ... Ja. Hat der Magier so ungefähr gesagt.
	AI_Output(self, hero, "Info_Mod_Namib_Sporen_02_03"); //Das war wirklich ALLES was du herausfinden konntest?
	AI_Output(self, hero, "Info_Mod_Namib_Sporen_02_04"); //Naja, wie dem auch sei, ich werde diese Sporen untersuchen.
	AI_Output(hero, self, "Info_Mod_Namib_Sporen_15_05"); //Und was soll ich machen?
	AI_Output(self, hero, "Info_Mod_Namib_Sporen_02_06"); //Was?
	AI_Output(hero, self, "Info_Mod_Namib_Sporen_15_07"); //Was soll ich jetzt machen?
	AI_Output(self, hero, "Info_Mod_Namib_Sporen_02_08"); //Das liegt doch auf der Hand! Infiltriere sie, schwäche sie, unterwander ihre Motivation, so Sachen halt!
	AI_Output(hero, self, "Info_Mod_Namib_Sporen_15_09"); //Ich werde sehen was ich finden kann ...

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Ich soll den Hofstatt infiltrieren, schwächen, ihre Motivation unterwandern und so Sachen halt. Währenddesse untersucht Baal Namib die Sporen, die ich ihm gebracht habe.");

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Namib_Motivation (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Motivation_Condition;
	information	= Info_Mod_Namib_Motivation_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe den Hofstaat geschwächt und das alles.";
};

FUNC INT Info_Mod_Namib_Motivation_Condition()
{
	if (Mod_SL_Schwaechen == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_Motivation_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_Motivation_15_00"); //Ich habe den Hofstaat geschwächt und das alles.
	AI_Output(self, hero, "Info_Mod_Namib_Motivation_02_01"); //Hervorragend! Ich habe inzwischen diese Sporen analysiert, die sind hochinteressant.
	AI_Output(self, hero, "Info_Mod_Namib_Motivation_02_02"); //Jedenfalls solltest du diese Sporen jemandem bringen oder? Stattdessen wirst du ihm diesen Beutel hier bringen.

	B_GiveInvItems	(self, hero, ItMi_FakeFreudenspenderSporen, 1);

	AI_Output(self, hero, "Info_Mod_Namib_Motivation_02_03"); //Er Enthält die Eier einer parasitären Insektenart. Wenn sie diese auf ihrem Feld ausbringen, wird die ganze Ernte zu Grunde gehen!
	AI_Output(self, hero, "Info_Mod_Namib_Motivation_02_04"); //Das dürfte genügen, um sie ein für allemal fertig zu machen! Na los, geh schon!

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Ich soll die Parasiteneier zum Drogenminister bringen. Dazu muss ich wohl erstmal den Jäger aufsuchen.");

	Mod_SL_Schwaechen = 5;
};

INSTANCE Info_Mod_Namib_HofstaatFutsch (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_HofstaatFutsch_Condition;
	information	= Info_Mod_Namib_HofstaatFutsch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Hofstaat ist Geschichte.";
};

FUNC INT Info_Mod_Namib_HofstaatFutsch_Condition()
{
	if (Mod_SL_Schwaechen == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_HofstaatFutsch_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_HofstaatFutsch_15_00"); //Der Hofstaat ist Geschichte.
	AI_Output(self, hero, "Info_Mod_Namib_HofstaatFutsch_02_01"); //Ausgezeichnet! Alles entwickelt sich vortrefflich.

	if (Guru_Dabei == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Namib_HofstaatFutsch_02_02"); //Du bist es wirklich wert ein hoher Guru zu werden.
		AI_Output(self, hero, "Info_Mod_Namib_HofstaatFutsch_02_03"); //Mir obliegt die Ehre, dich in die Reihen der hohen Gurus aufzunehmen.
		AI_Output(self, hero, "Info_Mod_Namib_HofstaatFutsch_02_04"); //Trage diese Robe mit Stolz.

		HoherGuru_Dabei = TRUE;

		CreateInvItems	(hero, Gur_Armor_H, 1);

		B_ShowGivenThings	("Hohe Gururobe erhalten");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Namib_HofstaatFutsch_02_05"); //Du bist es wirklich wert ein hoher Templer zu werden.
		AI_Output(self, hero, "Info_Mod_Namib_HofstaatFutsch_02_06"); //Mir obliegt die Ehre, dich in die Reihen der hohen Templer aufzunehmen.
		AI_Output(self, hero, "Info_Mod_Namib_HofstaatFutsch_02_07"); //Trage diese Rüstung mit Stolz und Würde.

		HoherTempler_Dabei = TRUE;

		CreateInvItems	(hero, Tpl_Armor_H, 1);

		B_ShowGivenThings	("Schwere Templerrüstung erhalten");
	};

	B_SetTopicStatus	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, LOG_SUCCESS);

	B_GivePlayerXP	(1000);
};

INSTANCE Info_Mod_Namib_Leichengase (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Leichengase_Condition;
	information	= Info_Mod_Namib_Leichengase_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Namib_Leichengase_Condition()
{
	if ((Templer_Dabei == TRUE)
	|| (Guru_Dabei == TRUE))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_Leichengase_Info()
{
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_02_00"); //Verdammte Novizen!

	Wld_SendTrigger	("EVT_SUMPFHAIPROBE_01");
	Wld_SendTrigger	("EVT_SUMPFHAIPROBE_02");

	Info_ClearChoices	(Info_Mod_Namib_Leichengase);

	Info_AddChoice	(Info_Mod_Namib_Leichengase, "Nutzloses Pack, Allesamt!", Info_Mod_Namib_Leichengase_B);
	Info_AddChoice	(Info_Mod_Namib_Leichengase, "Was?", Info_Mod_Namib_Leichengase_A);
};

FUNC VOID Info_Mod_Namib_Leichengase_C()
{
	AI_Output(hero, self, "Info_Mod_Namib_Leichengase_C_15_00"); //Was?
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_01"); //Wie? Oh, äh es geht um die Novizen!
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_02"); //Seit wir die Sumpfkrautfelder ... "gedüngt" haben liegen sie mir tagein tagaus in den Ohren.
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_03"); //"Baal Namib es ist schrecklich, es ist grauenhaft furchtbar, unerträglich schlimm und einfach unzufrieden stellend", sagen sie!
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_04"); //"Du musst was dagegen tun", meinen sie.
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_05"); //"Das geht so nicht mehr weiter", beschweren sie sich.
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_06"); //Und ich? Was soll ich den bitte machen!
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_07"); //Oh es ist schlimm ... kannst du dir überhaupt vorstellen wie es ist, wenn einem die Ohren vollgejammert werden?
	AI_Output(hero, self, "Info_Mod_Namib_Leichengase_C_15_08"); //Naja ...
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_09"); //Dacht ich’s mir! Niemand leidet so sehr wie ich ... außer vielleicht die Novizen.
	AI_Output(hero, self, "Info_Mod_Namib_Leichengase_C_15_10"); //Vielleicht sagst du mir mal, woran sie leiden.
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_11"); //Duft.
	AI_Output(hero, self, "Info_Mod_Namib_Leichengase_C_15_12"); //Duft?
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_13"); //Naja, das trifft es nicht so ganz ... vielleicht würde der Begriff "Geruch" der Sache eher gerecht werden.
	AI_Output(hero, self, "Info_Mod_Namib_Leichengase_C_15_14"); //Geruch also?
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_15"); //Ja ... Nein ... Vielleicht ist Geruch auch nicht das richtige Wort ...
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_16"); //Mal sehen, eventuell würde es Mief ... oder Gestank ... oder ... OH MEIN GOTT, die armen Novizen.
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_17"); //Du kannst dir nicht vorstellen, wie schlimm diese verfaulenden Sumpfhaie stinken!
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_18"); //Es ist als wäre der Schläfer nach einem äonenlangen Nickerchen seinen Morgenkaffe getrunken und sich dann im Sumpf erleichtert.
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_19"); //Du kannst dir nicht vorstellen WIE schlimm es stinkt.
	AI_Output(hero, self, "Info_Mod_Namib_Leichengase_C_15_20"); //Naja, so schlimm ist Gestank nun auch wieder nicht.
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_21"); //Ach ja? Meinst du?! Einer der Novizen ist erblindet, so sehr stinkt es!
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_22"); //Bitte, BITTE, hilf meinen armen kleinen Novizen, sie sind doch wie Kinder für mich!
	AI_Output(hero, self, "Info_Mod_Namib_Leichengase_C_15_23"); //Und was soll ich tun?
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_C_02_24"); //Geh zu Baal Caine. Er arbeitet an dem Problem. Ich hoffe, er findet bald eine Lösung.

	Log_CreateTopic	(TOPIC_MOD_SL_LEICHENGASE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SL_LEICHENGASE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Die Novizen leiden unter dem Gestank, den die Leichen der Sumpfhaie verbreiten. Baal Caine sucht nach einer Lösung dafür. Ich sollte zu ihm gehen.");

	Info_ClearChoices	(Info_Mod_Namib_Leichengase);
};

FUNC VOID Info_Mod_Namib_Leichengase_A()
{
	AI_Output(hero, self, "Info_Mod_Namib_Leichengase_A_15_00"); //Was?

	Info_Mod_Namib_Leichengase_C();
};

FUNC VOID Info_Mod_Namib_Leichengase_B()
{
	AI_Output(hero, self, "Info_Mod_Namib_Leichengase_B_15_00"); //Nutzloses Pack, Allesamt!
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_B_02_01"); //Jaja! Ganz recht, kaum ein anständiger Arbeiter dabei, der zu schätzen weiß, dass ICH mich für diese Gesellschaft aufopfere.
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase_B_02_02"); //Aber ich leide LEISE, hörst du?
	AI_Output(hero, self, "Info_Mod_Namib_Leichengase_B_15_03"); //Kaum zu überhören. Worum geht’s denn?

	Info_Mod_Namib_Leichengase_C();
};

INSTANCE Info_Mod_Namib_Leichengase2 (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Leichengase2_Condition;
	information	= Info_Mod_Namib_Leichengase2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, ich habe das Problem gelöst.";
};

FUNC INT Info_Mod_Namib_Leichengase2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Leichengase5))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_Leichengase2_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_Leichengase2_15_00"); //Hey, ich habe das Problem gelöst.
	AI_Output(self, hero, "Info_Mod_Namib_Leichengase2_02_01"); //Du hast uns einen unschätzbaren Dienst erwiesen!

	B_GivePlayerXP	(150);

	B_SetTopicStatus	(TOPIC_MOD_SL_LEICHENGASE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Namib_Orkfriedhof (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Orkfriedhof_Condition;
	information	= Info_Mod_Namib_Orkfriedhof_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Namib_Orkfriedhof_Condition()
{
	if (Mod_NL_UOS > 0)
	&& (Mod_NL_UOS < 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_Orkfriedhof_Info()
{
	AI_Output(self, hero, "Info_Mod_Namib_Orkfriedhof_02_00"); //(aufgeregt) Was machst du hier? Oben beim Orkfriedhof, da wird deine Kampfkraft benötigt.
	AI_Output(hero, self, "Info_Mod_Namib_Orkfriedhof_15_01"); //Immer mit der Ruhe ... Berichte was geschehen ist?
	AI_Output(self, hero, "Info_Mod_Namib_Orkfriedhof_02_02"); //Baal Tavor war kürzlich mit einer Expedition aus Novizen und Templern zum verlassenen Orkfriedhof aufgebrochen, um nach Artefakten und Schätzen zu suchen und die Leichnahme unserer toten Brüder der ersten Expedition zu bergen.
	AI_Output(self, hero, "Info_Mod_Namib_Orkfriedhof_02_03"); //Ja, verlassen so dachten wir, genau wie beim ersten Besuch des Friedhofes, als uns Orks und finstere Mächte schmerzliche Verluste unter unseren Mitbrüdern bereiteten ...
	AI_Output(self, hero, "Info_Mod_Namib_Orkfriedhof_02_04"); //Zuerst ließ auch nichts das herannahende Unheil vermuten.
	AI_Output(self, hero, "Info_Mod_Namib_Orkfriedhof_02_05"); //Ungestört verrichteten meine Mitbrüder, wofür sie den Ort betreten hatten, nahmen die Räume, Gänge und Nischen in Augenschein, und betrauerten das Schicksal der toten Templer, die dort im Staube der Verwesung preisgegeben waren.
	AI_Output(self, hero, "Info_Mod_Namib_Orkfriedhof_02_06"); //Immer tiefer schritten sie in die Räume und teilten sich auf.
	AI_Output(self, hero, "Info_Mod_Namib_Orkfriedhof_02_07"); //Plötzlich vernahmen sie den gellenden Schrei eines Novizen, der wie besessen aus einem der tiefer liegenden Räume stürzte und etwas von Schamanen und Blitzen brüllte… aber da war es auch schon zu spät.
	AI_Output(hero, self, "Info_Mod_Namib_Orkfriedhof_15_08"); //(gespannt) Ja, was geschah ... ?
	AI_Output(self, hero, "Info_Mod_Namib_Orkfriedhof_02_09"); //Das ist schnell erzählt. Die im Friedhof beigesetzten Orks erhoben sich zu Untotendasein ... genau wie die Leichname unserer Mitbrüder.
	AI_Output(self, hero, "Info_Mod_Namib_Orkfriedhof_02_10"); //Sie  fielen über Templer und Novizen her und einzig dem Novizen Talas gelang es in den Wirren zu entkommen.
	AI_Output(self, hero, "Info_Mod_Namib_Orkfriedhof_02_11"); //Was mit den anderen geschah, ob es Überlebende gibt, ist unklar.
	AI_Output(self, hero, "Info_Mod_Namib_Orkfriedhof_02_12"); //Wie dem auch sei, wir haben die Unterstützung des Neuen Lagers erbeten und es würde mir Zuversicht schenken, wenn du dieser Rettungsexpedition beiwohnen würdest.
	AI_Output(self, hero, "Info_Mod_Namib_Orkfriedhof_02_13"); //Du hast bereits einmal den Widrigkeiten des Orkriedhofes getrotzt ...
};

INSTANCE Info_Mod_Namib_GeiselnSicher (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_GeiselnSicher_Condition;
	information	= Info_Mod_Namib_GeiselnSicher_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Namib_GeiselnSicher_Condition()
{
	if (Mod_NL_UOS == 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_GeiselnSicher_Info()
{
	AI_Output(self, hero, "Info_Mod_Namib_GeiselnSicher_02_00"); //Es ist dir tatsächlich gelungen die Überlebenden zu finden und zu retten, unglaublich. Hier, nimm dies als Dank.

	B_ShowGivenThings	("Diverse Items erhalten");

	AI_Output(self, hero, "Info_Mod_Namib_GeiselnSicher_02_01"); //Darunter ist auch eine neu entwickelte Spruchrolle, die mit einer ordentlichen Portion Sumpfkraut hergestellt wurde.
	AI_Output(self, hero, "Info_Mod_Namib_GeiselnSicher_02_02"); //Sie lässt pflanzliches Material deiner Umgebung zu einem Golem erstehen, der deinem Willen folgt. Viel Spaß damit.

	CreateInvItems	(hero, ItPo_Health_03, 4);
	CreateInvItems	(hero, ItMi_Gold, 300);
	CreateInvItems	(hero, ItMi_Traumruf, 5);
	CreateInvItems	(hero, ItPl_SwampHerb, 10);
	CreateInvItems	(hero, ItSc_SumSwampGolem, 1);

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Namib_Hueterklinge (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Hueterklinge_Condition;
	information	= Info_Mod_Namib_Hueterklinge_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich suche Baal Ydran.";
};

FUNC INT Info_Mod_Namib_Hueterklinge_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GorNaKar_Hueterklinge2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_Hueterklinge_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_Hueterklinge_15_00"); //Ich suche Baal Ydran.
	AI_Output(self, hero, "Info_Mod_Namib_Hueterklinge_02_01"); //Den findest du auf unserem Friedhof. Der befindet sich im Sumpf nahe dem Meer.

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Baal Ydran soll auf dem Friedhof im Sumpf nahe des Meeres zu finden sein.");
};

INSTANCE Info_Mod_Namib_Hueterklinge2 (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Hueterklinge2_Condition;
	information	= Info_Mod_Namib_Hueterklinge2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Ydran gefunden. Er ist tot.";
};

FUNC INT Info_Mod_Namib_Hueterklinge2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_Hueterklinge))
	&& (Mod_TPL_HK_Ydran == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_Hueterklinge2_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_Hueterklinge2_15_00"); //Ich habe Ydran gefunden. Er ist tot.
	AI_Output(self, hero, "Info_Mod_Namib_Hueterklinge2_02_01"); //Ich weiß. Tragisch die ganze Geschichte.
	AI_Output(hero, self, "Info_Mod_Namib_Hueterklinge2_15_02"); //Was ist passiert?
	AI_Output(self, hero, "Info_Mod_Namib_Hueterklinge2_02_03"); //Ich möchte nicht darüber reden ... die Wunden sind noch zu frisch ... SO FRISCH (heult lauthals los)
	AI_Output(hero, self, "Info_Mod_Namib_Hueterklinge2_15_04"); //Krieg dich mal wieder ein.
	AI_Output(self, hero, "Info_Mod_Namib_Hueterklinge2_02_05"); //Du hast Recht. Rydiger würde nicht wollen, dass ich seinetwegen weine.
	AI_Output(hero, self, "Info_Mod_Namib_Hueterklinge2_15_06"); //Rydiger? Ach egal. Kennst du einen Templer namens Gor Na Kosh?
	AI_Output(self, hero, "Info_Mod_Namib_Hueterklinge2_02_07"); //Aber ja. Ein sehr gewiefter junger Templer. Nimmt seine Aufgabe sehr ernst.
	AI_Output(hero, self, "Info_Mod_Namib_Hueterklinge2_15_08"); //Weißt du wo ich ihn finden kann?
	AI_Output(self, hero, "Info_Mod_Namib_Hueterklinge2_02_09"); //Versuch's doch einfach mal bei seiner Hütte. Die ist direkt auf der anderen Seite meines Baumes.
	AI_Output(hero, self, "Info_Mod_Namib_Hueterklinge2_15_10"); //Danke.

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Gor Na Koshs Hütte ist direkt auf der anderen Seite von Baal Namibs Baum. Mal sehen, was ich dort vorfinde.");

	Wld_InsertItem	(ItMi_GorNaKoshsBeutel, "FP_ITEM_GORNAKOSH_BEUTEL");
	Wld_InsertItem	(ItWr_GorNaKoshsTagebuch1, "FP_ITEM_GORNAKOSH_TAGEBUCH");
};

INSTANCE Info_Mod_Namib_Magie (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Magie_Condition;
	information	= Info_Mod_Namib_Magie_Info;
	permanent	= 0;
	important	= 0;
	description	= "Magie?! Wie könnt ihr Magie wirken?";
};

FUNC INT Info_Mod_Namib_Magie_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_Sekte))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_Magie_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_Magie_15_00"); //Magie?! Wie könnt ihr Magie wirken? Eure Magie erhieltet ihr doch vom Schläfer.
	AI_Output(self, hero, "Info_Mod_Namib_Magie_02_01"); //Das dachten wir. Doch wir haben herausgefunden, dass es nicht der Schläfer war, der uns die Magie gab. Es war das Sumpfkraut!
};

INSTANCE Info_Mod_Namib_Lehre (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Lehre_Condition;
	information	= Info_Mod_Namib_Lehre_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dann seid ihr keine religiöse Gruppe mehr?";
};

FUNC INT Info_Mod_Namib_Lehre_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_Sekte))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_Lehre_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_Lehre_15_00"); //Dann seid ihr keine religiöse Gruppe mehr?
	AI_Output(self, hero, "Info_Mod_Namib_Lehre_02_01"); //Nein. Wir sind mehr ein Wirtschaftsbündnis und eine Lebensgemeinschaft. Wer genug hat von den Konventionen  und Gesetzten der Stadt kommt hierher.
	AI_Output(hero, self, "Info_Mod_Namib_Lehre_15_02"); //Warum gibt es dann noch Templer hier?
	AI_Output(self, hero, "Info_Mod_Namib_Lehre_02_03"); //Gute Frage ... es hat eigentlich nie jemand daran gedacht. Naja, Templer sind immer nützlich.
};

INSTANCE Info_Mod_Namib_Ruestung (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Ruestung_Condition;
	information	= Info_Mod_Namib_Ruestung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wenn ihr nicht mehr an den Schläfer glaubt, warum ...";
};

FUNC INT Info_Mod_Namib_Ruestung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_Sekte))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_Ruestung_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_Ruestung_15_00"); //Wenn ihr nicht mehr an den Schläfer glaubt, warum habt ihr dann immer noch das Zeichen seiner Maske auf der Rüstung?
	AI_Output(self, hero, "Info_Mod_Namib_Ruestung_02_01"); //Wir haben beschlossen sie in Erinnerung an die alte Zeit dort zu lassen. Wir wollen nie wieder vergessen, wie falsch Glaube sein kann. Vor allem, wenn man ihn gepredigt bekommt.
};

INSTANCE Info_Mod_Namib_Woher (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Woher_Condition;
	information	= Info_Mod_Namib_Woher_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wieso bist du hier bei der Sekte?";
};

FUNC INT Info_Mod_Namib_Woher_Condition()
{
	if (Guru_Dabei == 1)
	|| (Templer_Dabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_Woher_15_00"); //Wieso bist du hier bei der Sekte?
	AI_Output(self, hero, "Info_Mod_Namib_Woher_02_01"); //Früher lebte ich in der Nähe von Silden als Besitzer einer Sumpfkrautplantage.
	AI_Output(self, hero, "Info_Mod_Namib_Woher_02_02"); //Als der König dann das Sumpfkrautverbot erlassen hat, wurde ich natürlich sofort in die Kolonie geworfen.
	AI_Output(hero, self, "Info_Mod_Namib_Woher_15_03"); //Was hast du dann gemacht?
	AI_Output(self, hero, "Info_Mod_Namib_Woher_02_04"); //Zuerst bin ich ins Neue Lager und hab dort als Bauer gearbeitet.
	AI_Output(self, hero, "Info_Mod_Namib_Woher_02_05"); //Als ich dann erfuhr, dass Y'Berion ein Lager im Sumpf gründen wollte, hab ich mich ihm angeschlossen. Nach einiger Zeit hat er mich auch zum Guru ernannt.
};

INSTANCE Info_Mod_Namib_Pickpocket (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_Pickpocket_Condition;
	information	= Info_Mod_Namib_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Namib_Pickpocket_Condition()
{
	C_Beklauen	(123, ItMi_Gold, 1300);
};

FUNC VOID Info_Mod_Namib_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Namib_Pickpocket);

	Info_AddChoice	(Info_Mod_Namib_Pickpocket, DIALOG_BACK, Info_Mod_Namib_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Namib_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Namib_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Namib_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Namib_Pickpocket);
};

FUNC VOID Info_Mod_Namib_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Namib_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Namib_Pickpocket);

		Info_AddChoice	(Info_Mod_Namib_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Namib_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Namib_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Namib_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Namib_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Namib_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Namib_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Namib_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Namib_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Namib_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Namib_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Namib_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Namib_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Namib_EXIT (C_INFO)
{
	npc		= Mod_2004_GUR_BaalNamib_MT;
	nr		= 1;
	condition	= Info_Mod_Namib_EXIT_Condition;
	information	= Info_Mod_Namib_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Namib_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Namib_EXIT_Info()
{
	AI_Output(self, hero, "Info_Mod_Namib_EXIT_02_01"); //Dem Ziel entgegen!

	AI_StopProcessInfos	(self);
};