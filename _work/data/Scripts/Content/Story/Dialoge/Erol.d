INSTANCE Info_Mod_Erol_Haendler (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Haendler_Condition;
	information	= Info_Mod_Erol_Haendler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier steht ja alles voll mit Krimskrams.";
};

FUNC INT Info_Mod_Erol_Haendler_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erol_Haendler_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Haendler_15_00"); //Hier steht ja alles voll mit Krimskrams.
	AI_Output(self, hero, "Info_Mod_Erol_Haendler_10_01"); //Ja, da sammelt sich im Laufe des Lebens einiges an.
	AI_Output(self, hero, "Info_Mod_Erol_Haendler_10_02"); //Sind ein paar echte Antiquitäten dabei.
	AI_Output(self, hero, "Info_Mod_Erol_Haendler_10_03"); //Willst du vielleicht was davon kaufen?

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_OHNELAGER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_OHNELAGER, "Der Händler Erol verkauft Antiquitäten.");
};

INSTANCE Info_Mod_Erol_DunklerPilger (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_DunklerPilger_Condition;
	information	= Info_Mod_Erol_DunklerPilger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du zufällig in letzter Zeit einen dunklen Pilger vorbeikommen sehen?";
};

FUNC INT Info_Mod_Erol_DunklerPilger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Haendler))
	&& (Npc_KnowsInfo(hero, Info_Mod_Orlan_DunklerPilger))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_DunklerPilger_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_DunklerPilger_15_00"); //Hast du zufällig in letzter Zeit einen dunklen Pilger vorbeikommen sehen?
	AI_Output(self, hero, "Info_Mod_Erol_DunklerPilger_10_01"); //(überrascht) Ja, allerdings. Dass du jetzt danach fragst ... erst vor kurzer Zeit.
	AI_Output(self, hero, "Info_Mod_Erol_DunklerPilger_10_02"); //Ich hatte gerade im Halbschlaf gedöst, als plötzlich dunkle Visionen, erschreckende Bilder meinem Geist heimsuchten, mich aus Schlaf rissen.
	AI_Output(self, hero, "Info_Mod_Erol_DunklerPilger_10_03"); //Ich könnte nicht mehr genau sagen, was es war, aber als ich nach draußen trat, sah ich diese dunkle Gestalt an meiner Hütte vorüberschreiten, plötzlich ihre Richtung ändernd, und im Wald verschwinden, dort, wo der alte Friedhof liegt.
	AI_Output(self, hero, "Info_Mod_Erol_DunklerPilger_10_04"); //Überaus unheimlich ... selbst für einen alten Haudegen wie mich. Es durchzuckt mich jetzt noch, wenn ich daran denke ...
	AI_Output(self, hero, "Info_Mod_Erol_DunklerPilger_10_05"); //Komm doch noch mal vorbei, wenn du den Typ gefunden hast. Vielleicht kannst du mir auch einen Gefallen tun.

	B_GivePlayerXP	(100);

	B_StartOtherRoutine	(Mod_7036_NONE_Pilger_NW, "GRAVEYARD");
	AI_Teleport	(Mod_7036_NONE_Pilger_NW, "NW_FARM4_WOOD_MONSTER_MORE_03");

	B_LogEntry	(TOPIC_MOD_DUNKLERPILGER, "Ich bin dem Pilger dicht auf den Fersen. Erol - sehr beunruhigt über die Gestalt - hat sie erst vor kurzem in den Wald Richtung Friedhof entschwinden sehen, nur wenige Meter entfernt.");
};

INSTANCE Info_Mod_Erol_Blutkelch (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Blutkelch_Condition;
	information	= Info_Mod_Erol_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "He, du.";
};

FUNC INT Info_Mod_Erol_Blutkelch_Condition()
{
	if (Mod_ASS_ErolWiederDa == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_00"); //He, du.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_10_01"); //Ja, was gibt's?
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_02"); //Du bist meine letzte Rettung. Ich suche dringend einen sogenannten Blutkelch.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_10_03"); //Ein schönes Teil. Reich verziert und trefflich gearbeitet. Selten so was gesehen.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_04"); //Dann hast du diesen Kelch?
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_10_05"); //Hatte, mein Lieber, hatte.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_06"); //Dann hast du ihn verkauft? An wen?
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_10_07"); //Nein, nicht verkauft. Eines Abends wurde ich heimtückisch niedergeschlagen und beraubt.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_10_08"); //Als ich aufwachte, stellte ich fest, dass unter anderem dieser Kelch verschwunden war.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_09"); //Weißt du, wer das war?
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_10_10"); //Nein, aber ich habe einen Verdacht. In letzter Zeit schleichen hier nachts vermummte Gestalten durch die Gegend.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_10_11"); //Einmal konnte ich einen näher beobachten. Hab aber niemanden erkannt. Dunkle Rüstung und Sehschlitze in den Hauben.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_12"); //Hmm ...
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_10_13"); //Dann hab ich einmal oben in der Gobblinhöhle ein grünes Licht gesehen.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_14"); //Aha!
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_10_15"); //Du glaubst mir nicht?
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_16"); //Doch, doch. Ich werde der Sache nachgehen. Ich brauche diesen Kelch unbedingt.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_10_17"); //Und ich hätte gern wenigstens mein goldenes Schwert zurück.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_18"); //Ich tue, was ich kann. Bis später.

	B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Offensichtlich hat sich einer meiner Brüder schon um den Blutkelch gekümmert, aber er hat den Besitzer nicht erschlagen. Hmm ... ist da vielleicht was faul? Ich muss unbedingt Azhar fragen.");
};

INSTANCE Info_Mod_Erol_Blutkelch2 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Blutkelch2_Condition;
	information	= Info_Mod_Erol_Blutkelch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab was für dich.";
};

FUNC INT Info_Mod_Erol_Blutkelch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Blutkelch))
	&& (Npc_HasItems(hero, ItMw_2H_Eminem_Goldschwert_01_Erol) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Blutkelch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch2_15_00"); //Ich hab was für dich.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch2_10_01"); //Mein Schwert etwa?
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch2_15_02"); //Ja, hier.

	B_GiveInvItems	(hero, self, ItMw_2H_Eminem_Goldschwert_01_Erol, 1);

	AI_EquipBestMeleeWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch2_10_03"); //Tausend Dank, Fremder. Das ist mir 1000 Gold wert.

	B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch2_15_04"); //Dann sind wir beide zufrieden. Mach's gut.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch2_10_05"); //Du auch.

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Erol_Fahrender (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender_Condition;
	information	= Info_Mod_Erol_Fahrender_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Erol_Fahrender_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_DunklerPilger))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender_Info()
{
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_10_00"); //Gut, dass wir uns treffen.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender_15_01"); //Wenn du meinst. Was gibt's?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_10_02"); //Nun, ich habe mir vorgenommen, wieder auf Reisen zu gehen.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_10_03"); //Die Höfe, Tavernen und Bauern zu beliefern, Aufträge anzunehmen und so.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender_15_04"); //Lohnt sich das denn?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_10_05"); //Sicher. Hab ich früher schon gemacht.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_10_06"); //Dann haben mich aber Wegelagerer unter der Brücke überfallen und total ausgeraubt.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_10_07"); //Und dann hatte ich beschlossen, bei meiner Hütte zu bleiben.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender_15_08"); //Wo du nichts verdienst ...
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_10_09"); //Genau. Und von nichts kann man nicht leben. Kaum einer hält bei mir und will was. Ich ziehe wieder los.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender_15_10"); //Viel Erfolg: Und pass auf. Die Gegend ist nicht gerade sicherer geworden, seit die Barriere gefallen ist.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_10_11"); //Das hab ich auch schon gemerkt.

	B_StartOtherRoutine	(self, "FAHRENDER");

	Mod_Erol_Unterwegs_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Erol_Fahrender2 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender2_Condition;
	information	= Info_Mod_Erol_Fahrender2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie läuft's?";
};

FUNC INT Info_Mod_Erol_Fahrender2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender))
	&& (Wld_GetDay() > Mod_Erol_Unterwegs_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender2_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender2_15_00"); //Wie läuft's?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_10_01"); //Kann nicht klagen. Hab schon einiges Gold im Beutel und einen größeren Auftrag.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender2_15_02"); //Ja?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_10_03"); //Ich hab in der Stadt einen der Feuermagier getroffen.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_10_04"); //Denen ihre Anführer sind an einem Teil interessiert, das im Minental zu finden sein soll.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_10_05"); //Nun kenn ich mich da gar nicht aus.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_10_06"); //Als ich auf die Insel kam, gab's die Barriere schon. Kannst du mir vielleicht helfen?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender2_15_07"); //Ich denke schon. Im Hafenviertel ist ein Händler, der Karten verkauft. Der sollte was für dich haben.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_10_08"); //Danke für den Tip. Ich denke, wir sind quitt.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender2_15_09"); //So muss es sein. Viel Erfolg.

	Mod_Erol_Unterwegs_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Erol_Fahrender3 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender3_Condition;
	information	= Info_Mod_Erol_Fahrender3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie war's im Minental?";
};

FUNC INT Info_Mod_Erol_Fahrender3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender2))
	&& (Wld_GetDay() > Mod_Erol_Unterwegs_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender3_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender3_15_00"); //Wie war's im Minental?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender3_10_01"); //Wie soll ich das wissen?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender3_10_02"); //Dieser Brahim hat mir zwar eine Karte verkauft, aber dann diese Horden von wildgewordenen Goblis im Pass.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender3_10_03"); //Den Göttern sei Dank konnte ich schneller rennen als die.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender3_10_04"); //Hab meinen Beutel festgehalten und bin durchgerannt wie wenn Beliar hinter mir her ist.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender3_15_05"); //Siehst du, geht doch.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender3_10_06"); //Aber dann stoppt mich eine Wache der Paladine. Haben mich für Gold und gute Worte nicht durchgelassen.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender3_10_07"); //Ich also zurückgerannt. Hab wahrscheinlich paar von dem Gewürm zertreten.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender3_10_08"); //Und nun bin ich hier ...
};

INSTANCE Info_Mod_Erol_Fahrender4 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender4_Condition;
	information	= Info_Mod_Erol_Fahrender4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Pass sollte wieder offen sein.";
};

FUNC INT Info_Mod_Erol_Fahrender4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender3))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hagen_Asylanten2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender4_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_15_00"); //Der Pass sollte wieder offen sein. Ich habe für Lord Hagen die Lage gepeilt im Minental und konnte ihn beruhigen.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_15_01"); //Darauf wollte er die Wache wieder abziehen. Das Sollte mittlerweile geschehen sein. Probier's doch noch mal.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender4_10_02"); //(verlegen) Aber ich komme auch mit dieser Karte nicht klar. War ja noch nie dort.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_15_03"); //Dann gib den Auftrag halt zurück.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender4_10_04"); //Schon. Aber vielleicht würdest du ...
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_15_05"); //Hatte ich mir fast gedacht. Was muss ich dazu wissen?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender4_10_06"); //Da soll das Alte Lager sein und da drin eine Kapelle der Feuermagier. Da kann ich mehr erfahren. Du, nicht ich ...

	Info_ClearChoices	(Info_Mod_Erol_Fahrender4);

	Info_AddChoice	(Info_Mod_Erol_Fahrender4, "Dazu hab ich keine Zeit. Bin selber in einer wichtigen Sache unterwegs.", Info_Mod_Erol_Fahrender4_B);
	Info_AddChoice	(Info_Mod_Erol_Fahrender4, "Na gut. Ich schau dann mal. Aber ich machs nicht umsonst.", Info_Mod_Erol_Fahrender4_A);
};

FUNC VOID Info_Mod_Erol_Fahrender4_B()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_B_15_00"); //Dazu hab ich keine Zeit. Bin selber in einer wichtigen Sache unterwegs.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender4_B_10_01"); //Schade. Dann gebe ich die Sache besser wieder zurück.

	Info_ClearChoices	(Info_Mod_Erol_Fahrender4);
};

FUNC VOID Info_Mod_Erol_Fahrender4_A()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_A_15_00"); //Na gut. Ich schau dann mal. Aber ich machs nicht umsonst.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender4_A_10_01"); //Es wird dein Schaden nicht sei. Versprochen.

	Info_ClearChoices	(Info_Mod_Erol_Fahrender4);

	Mod_Erol_Fahrender = 1;

	Log_CreateTopic	(TOPIC_MOD_EROL_FEUERMAGIER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EROL_FEUERMAGIER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_EROL_FEUERMAGIER, "Ich soll für Erol im Minental ein 'Teil' suchen, an dem die Feuermagier interessiert sind. In der Kapelle der Feuermagier im Alten Lager gibt es nähere Hinweise.");
};

INSTANCE Info_Mod_Erol_Fahrender5 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender5_Condition;
	information	= Info_Mod_Erol_Fahrender5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Erol_Fahrender5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender4))
	&& (Npc_HasItems(hero, ItAr_GewandDerMacht) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender5_Info()
{
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender5_10_00"); //Und, hast du das Teil gefunden?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender5_15_01"); //Gewiss, aber mir ist schleierhaft, wie die Magier dir diesen Auftrag andienen konnten.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender5_15_02"); //Du hättest es niemals gefunden, selbst wenn du im Minental gewesen wärst.

	B_GiveInvItems	(hero, self, ItAr_GewandDerMacht, 1);

	AI_Output(self, hero, "Info_Mod_Erol_Fahrender5_10_03"); //So schwierig war es?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender5_15_04"); //Das kannst du laut sagen. Und kaum bezahlen.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender5_10_05"); //Bei Innos! Was kriegst du?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender5_15_06"); //Erst mal abwarten, was der Rat rausrückt. Nicht unter 2000 Gold hergeben.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender5_10_07"); //Ich weiß Bescheid. Bis später.

	B_SetTopicStatus	(TOPIC_MOD_EROL_FEUERMAGIER, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	CurrentNQ += 1;

	Mod_Erol_Unterwegs_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Erol_Fahrender6 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender6_Condition;
	information	= Info_Mod_Erol_Fahrender6_Info;
	permanent	= 0;
	important	= 0;
	description	= "So sieht man sich wieder.";
};

FUNC INT Info_Mod_Erol_Fahrender6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender5))
	&& (Wld_GetDay() > Mod_Erol_Unterwegs_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender6_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender6_15_00"); //So sieht man sich wieder. Und, waren die Magier zufrieden mit der Kutte?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender6_10_01"); //Das kannst du glauben! Hocherfreut warn sie. Aber geheimnisvoll haben sie auch getan.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender6_10_02"); //Jedenfalls haben sie mich reichlicht belohnt.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender6_15_03"); //Das heißt?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender6_10_04"); //2500 Gold hat Pyrikar rausgerückt. Hier 2000 für dich. Da hast ja die Arbeit gemacht.

	B_GiveInvItems	(self, hero, ItMi_Gold, 2000);

	AI_Output(hero, self, "Info_Mod_Erol_Fahrender6_15_05"); //Das ist fair. Bis andermal.

	Mod_Erol_Unterwegs_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Erol_Fahrender7 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender7_Condition;
	information	= Info_Mod_Erol_Fahrender7_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Erol_Fahrender7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender6))
	&& (Wld_GetDay()-3 > Mod_Erol_Unterwegs_Day)
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender7_Info()
{
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_10_00"); //Die Welt ist klein.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_15_01"); //Die Insel allemal. Alles klar?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_10_02"); //Nicht so arg ...
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_15_03"); //Wo klemmt's denn diesmal?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_10_04"); //Der Wassermagier in der Stadt hat mich gebeten, Cavalorn, einen der Leute, die in der Ausgrabungsstelle sind, zu ihm zu schicken.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_15_05"); //Und wo ist da das Problem?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_10_06"); //Da ist ein Typ an der Baustelle, der lässt mich nicht in den Tempel.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_15_07"); //Dann besorg dir doch von Vatras einen Passierschein oder so was.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_10_08"); //Da hab ich schon dran gedacht. Aber der hat nix zum Schreiben.

	Info_ClearChoices	(Info_Mod_Erol_Fahrender7);

	Info_AddChoice	(Info_Mod_Erol_Fahrender7, "Ich gehe mit dir und rede mal mit diesem Lance.", Info_Mod_Erol_Fahrender7_B);
	Info_AddChoice	(Info_Mod_Erol_Fahrender7, "Dann sag ihm, dass du das nicht erledigen kannst. Basta.", Info_Mod_Erol_Fahrender7_A);
};

FUNC VOID Info_Mod_Erol_Fahrender7_B()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_B_15_00"); //Ich gehe mit dir und rede mal mit diesem Lance.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_B_10_01"); //Das würdest du tun?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_B_15_02"); //Wenn ich´s doch sage.  Lass uns gehen.

	Info_ClearChoices	(Info_Mod_Erol_Fahrender7);

	B_StartOtherRoutine	(self, "FOLLOWTOLANCE");

	Mod_Erol_Fahrender = 8;

	self.aivar[AIV_Partymember] = TRUE;

	Log_CreateTopic	(TOPIC_MOD_EROL_LANCE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EROL_LANCE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_EROL_LANCE, "Ich werde Erol zum Portaltempel begleiten, weil Lance ihn nicht reinlässt.");
};

FUNC VOID Info_Mod_Erol_Fahrender7_A()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_A_15_00"); //Dann sag ihm, dass du das nicht erledigen kannst. Basta.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_A_15_01"); //Oder hau diesem Lance kräftig eins auf die Nase
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_A_10_02"); //Ich mache mir nicht gern Feinde. Ist abträglich für´s Geschäft.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_A_15_03"); //Du musst wissen, was du tust ...

	Info_ClearChoices	(Info_Mod_Erol_Fahrender7);
};

INSTANCE Info_Mod_Erol_Fahrender8 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender8_Condition;
	information	= Info_Mod_Erol_Fahrender8_Info;
	permanent	= 0;
	important	= 0;
	description	= "So, das war´s dann. Ich mach mich fort.";
};

FUNC INT Info_Mod_Erol_Fahrender8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lance_Erol))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender8_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender8_15_00"); //So, das war´s dann. Ich mach mich fort.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender8_10_01"); //Danke erst mal.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATWMS");

	Mod_Erol_Unterwegs_Day = Wld_GetDay();

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Erol_Fahrender9 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender9_Condition;
	information	= Info_Mod_Erol_Fahrender9_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na, hat es geklappt?";
};

FUNC INT Info_Mod_Erol_Fahrender9_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender8))
	&& (Mod_Erol_Fahrender == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender9_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender9_15_00"); //Na, hat es geklappt?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender9_10_01"); //Jo. Aber was hat es mit dem leuchtenden Tor auf sich, Wollte mir keiner verraten.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender9_15_02"); //Dann sag ich dir auch nichts. Und?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender9_10_03"); //Was und?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender9_15_04"); //Du schuldest mir was.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender9_10_05"); //Ach so. Hier, 300 Gold kann ich dir geben.

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	B_GivePlayerXP	(100);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_EROL_LANCE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Erol_Soeldner (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Soeldner_Condition;
	information	= Info_Mod_Erol_Soeldner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gehörst du zu den Söldnern?";
};

FUNC INT Info_Mod_Erol_Soeldner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Soeldner_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Soeldner_15_00"); //Gehörst du zu den Söldnern?
	AI_Output(self, hero, "Info_Mod_Erol_Soeldner_10_01"); //Adanos bewahre! Mit solchen jungen Kerlen könnte ich nicht mehr konkurrieren.
	AI_Output(self, hero, "Info_Mod_Erol_Soeldner_10_02"); //Aber Geschäfte mache ich gern mit ihnen, und dafür haben sie meine kleine Hütte im Auge und passen auf, dass nichts passiert.
};

INSTANCE Info_Mod_Erol_Muenzen (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Muenzen_Condition;
	information	= Info_Mod_Erol_Muenzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du eine Kleinigkeit zu tun für mich?";
};

FUNC INT Info_Mod_Erol_Muenzen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Muenzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Muenzen_15_00"); //Hast du eine Kleinigkeit zu tun für mich?
	AI_Output(self, hero, "Info_Mod_Erol_Muenzen_10_01"); //Durchaus. Ich bin immer an alten Münzen interessiert.
	AI_Output(self, hero, "Info_Mod_Erol_Muenzen_10_02"); //Wenn du mir welche bringst, gebe ich dir ein bisschen Gold, bei vielen Münzen gibt's einen kleinen Bonus.
	AI_Output(self, hero, "Info_Mod_Erol_Muenzen_10_03"); //Wär das nichts?
};

INSTANCE Info_Mod_Erol_Muenzen2 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Muenzen2_Condition;
	information	= Info_Mod_Erol_Muenzen2_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe alte Münzen für dich ...";
};

FUNC INT Info_Mod_Erol_Muenzen2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Muenzen))
	&& (Npc_HasItems(hero, ItMi_OldCoin) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Muenzen2_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Muenzen2_15_00"); //Ich habe alte Münzen für dich ...

	Info_ClearChoices	(Info_Mod_Erol_Muenzen2);

	if (Npc_HasItems(hero, ItMi_OldCoin) >= 100)
	{
		Info_AddChoice	(Info_Mod_Erol_Muenzen2, "Hundert Münzen geben.", Info_Mod_Erol_Muenzen2_C);
	};
	if (Npc_HasItems(hero, ItMi_OldCoin) >= 10)
	{
		Info_AddChoice	(Info_Mod_Erol_Muenzen2, "Zehn Münzen geben.", Info_Mod_Erol_Muenzen2_B);
	};
	if (Npc_HasItems(hero, ItMi_OldCoin) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Muenzen2, "Eine Münze geben.", Info_Mod_Erol_Muenzen2_A);
	};
};

FUNC VOID Info_Mod_Erol_Muenzen2_C()
{
	B_GiveInvItems	(hero, self, ItMi_OldCoin, 100);

	Npc_RemoveInvItems	(self, ItMi_OldCoin, 100);

	AI_Output(self, hero, "Info_Mod_Erol_Muenzen2_C_10_00"); //Du machst mich ja zum Krösus! Wohin soll ich nur damit? (lacht)
	AI_Output(self, hero, "Info_Mod_Erol_Muenzen2_C_10_01"); //Immer her damit, du hast dir eine Belohnung verdient.

	B_GiveInvItems	(self, hero, ItMi_Gold, 450);

	B_GivePlayerXP	(750);

	B_RaiseHandelsgeschick (3);

	Info_ClearChoices	(Info_Mod_Erol_Muenzen2);
};

FUNC VOID Info_Mod_Erol_Muenzen2_B()
{
	B_GiveInvItems	(hero, self, ItMi_OldCoin, 10);

	Npc_RemoveInvItems	(self, ItMi_OldCoin, 10);

	AI_Output(self, hero, "Info_Mod_Erol_Muenzen2_B_10_00"); //Das ist eine ordentliche Menge. Dafür gibt's auch mehr Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 35);

	B_GivePlayerXP	(70);

	Info_ClearChoices	(Info_Mod_Erol_Muenzen2);
};

FUNC VOID Info_Mod_Erol_Muenzen2_A()
{
	B_GiveInvItems	(hero, self, ItMi_OldCoin, 1);

	Npc_RemoveInvItems	(self, ItMi_OldCoin, 1);

	AI_Output(self, hero, "Info_Mod_Erol_Muenzen2_A_10_00"); //Danke. Weiter so!

	B_GiveInvItems	(self, hero, ItMi_Gold, 3);

	B_GivePlayerXP	(5);

	Info_ClearChoices	(Info_Mod_Erol_Muenzen2);
};

INSTANCE Info_Mod_Erol_Heiltrank (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Heiltrank_Condition;
	information	= Info_Mod_Erol_Heiltrank_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Heiltrank geben)";
};

FUNC INT Info_Mod_Erol_Heiltrank_Condition()
{
	if (self.aivar[AIV_Partymember] == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Heiltrank_Info()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	Info_AddChoice	(Info_Mod_Erol_Heiltrank, DIALOG_BACK, Info_Mod_Erol_Heiltrank_BACK);

	if (Npc_HasItems(hero, ItPo_Health_Addon_04) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Essenz der Heilung", Info_Mod_Erol_Heiltrank_Health_04);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Elixier der Heilung", Info_Mod_Erol_Heiltrank_Health_03);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Extrakt der Heilung", Info_Mod_Erol_Heiltrank_Health_02);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Essenz der Heilung", Info_Mod_Erol_Heiltrank_Health_01);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Trank der leichten Heilung", Info_Mod_Erol_Heiltrank_Health_07);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Leichter Heiltrank", Info_Mod_Erol_Heiltrank_Health_06);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Trank der schnellen Heilung", Info_Mod_Erol_Heiltrank_Health_05);
	};
};

FUNC VOID Info_Mod_Erol_Heiltrank_BACK ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_04 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_03 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_02 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_01 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_07 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_06 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_05 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);
};

INSTANCE Info_Mod_Erol_Trade (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Trade_Condition;
	information	= Info_Mod_Erol_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Erol_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Erol_Pickpocket (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Pickpocket_Condition;
	information	= Info_Mod_Erol_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Erol_Pickpocket_Condition()
{
	C_Beklauen	(117, ItMi_OldCoin, 18);
};

FUNC VOID Info_Mod_Erol_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Erol_Pickpocket);

	Info_AddChoice	(Info_Mod_Erol_Pickpocket, DIALOG_BACK, Info_Mod_Erol_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Erol_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Erol_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Erol_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Erol_Pickpocket);
};

FUNC VOID Info_Mod_Erol_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Erol_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Erol_Pickpocket);

		Info_AddChoice	(Info_Mod_Erol_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Erol_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Erol_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Erol_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Erol_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Erol_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Erol_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Erol_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Erol_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Erol_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Erol_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Erol_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Erol_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Erol_EXIT (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_EXIT_Condition;
	information	= Info_Mod_Erol_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Erol_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erol_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};