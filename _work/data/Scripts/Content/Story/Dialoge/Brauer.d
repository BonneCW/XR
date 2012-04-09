INSTANCE Info_Mod_Brauer_Hi (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Hi_Condition;
	information	= Info_Mod_Brauer_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist das hier deine Brauerei?";
};

FUNC INT Info_Mod_Brauer_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brauer_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Hi_15_00"); //Ist das hier deine Brauerei?
	AI_Output(self, hero, "Info_Mod_Brauer_Hi_06_01"); //Mittlerweile schon. Bis vor kurzem hat sie noch meinem Onkel gehört, aber der hat sie mir vermacht und ist dann unglücklich in einem der Wasserauffangbecken ertrunken.
};

INSTANCE Info_Mod_Brauer_Bierhexen (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen_Condition;
	information	= Info_Mod_Brauer_Bierhexen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du schaust etwas trübtassig drein.";
};

FUNC INT Info_Mod_Brauer_Bierhexen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Richter_Unfrieden))
	&& (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen_15_00"); //Du schaust etwas trübtassig drein.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_01"); //Ich wollte, dafür hätte ich keinen Grund.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_02"); //Aber die Bierhexen machen mir immer einen Strich durch die Rechnung!
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen_15_03"); //(ungläubig) Bierhexen?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_04"); //Genau! Hast du noch nicht von ihnen gehört?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_05"); //Sie verzaubern das Bier, sodass nichts daraus werden kann.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_06"); //Und auf mich haben sie es besonders abgesehen.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_07"); //Noch nie ist es mir gelungen, ein gutes Bier zu brauen. Es schmeckt immer bitter und streng.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_08"); //Beim letzten Mal habe ich schon einen Kranz aus Wildkräutern um den Sudbottich gelegt, obwohl ich eigentlich nicht abergläubisch bin.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_09"); //Doch nicht mal das hilft!

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen_15_10"); //(zu sich selbst) An den Hexen wird es wohl kaum liegen ...

	AI_TurnToNpc	(hero, self);

	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen_15_11"); //(laut) Wie lange übst du dich schon im Brauen?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_12"); //Ich bin erst seit ein paar Wochen hier ... und meine ersten Versuche sind alle im Abfluss verschwunden.
};

INSTANCE Info_Mod_Brauer_Bierhexen2 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen2_Condition;
	information	= Info_Mod_Brauer_Bierhexen2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du noch eine Ahnung, wie du die Hexen vertreiben kannst?";
};

FUNC INT Info_Mod_Brauer_Bierhexen2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen2_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen2_15_00"); //Hast du noch eine Ahnung, wie du die Hexen vertreiben kannst?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen2_06_01"); //Ich habe schon alles probiert.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen2_06_02"); //Aber niemand weiß, was sie mit dem Bier machen, also kann ich mich kaum dagegen wehren.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen2_06_03"); //Ich werde versuchen müssen, sie irgendwie zu besänftigen.
};

INSTANCE Info_Mod_Brauer_Bierhexen3 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen3_Condition;
	information	= Info_Mod_Brauer_Bierhexen3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du sicher, dass du richtig braust?";
};

FUNC INT Info_Mod_Brauer_Bierhexen3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen3_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen3_15_00"); //Bist du sicher, dass du richtig braust?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen3_06_01"); //Ja. Als ich den Laden hier von meinem Onkel übernommen habe, gab er mir eine genaue Einweisung.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen3_06_02"); //Und er schien nicht von den Hexen verfolgt zu werden.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen3_15_03"); //So, jetzt hörst du als Erstes mal auf mit dem Hexenquatsch.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen3_15_04"); //Hast du wenigstens mal überprüft, ob die Zutaten in Ordnung sind?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen3_06_05"); //Was soll denn mit denen sein? Der Bauer Erhard wird mich schon nicht veräppeln.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen3_15_06"); //Dann werden wir jetzt mal nachsehen.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen3_06_07"); //Kannst du ja tun. Aber die Hexen werden schon keine Spuren hinterlassen haben.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen3_06_08"); //Gerste, Hopfen und Hefe findest du in oben im Lager des Brauraums.

	Log_CreateTopic	(TOPIC_MOD_KHORATA_BIERHEXEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_BIERHEXEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_BIERHEXEN, "Der naive Braumeister glaubt, Bierhexen würden dafür sorgen, dass aus seinem Gebräu nichts wird. Aber entweder liegt der Fehler bei ihm, oder er verwendet schlechte Zutaten.");

	Wld_InsertItem	(ItMi_Hefe,	"FP_ITEM_BIERHEXEN_HEFE");
	Wld_InsertItem	(ItMi_Hopfen,	"FP_ITEM_BIERHEXEN_HOPFEN");
	Wld_InsertItem	(ItMi_Gerste,	"FP_ITEM_BIERHEXEN_GERSTE");
};

INSTANCE Info_Mod_Brauer_Bierhexen4 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen4_Condition;
	information	= Info_Mod_Brauer_Bierhexen4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jemand hat auf deine Gerste gepinkelt.";
};

FUNC INT Info_Mod_Brauer_Bierhexen4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Bierhexen3))
	&& (Mod_Bierhexen == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen4_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_15_00"); //Jemand hat auf deine Gerste gepinkelt.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_06_01"); //(perplex) Was?!
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_15_02"); //Sie schmeckt eindeutig nach Urin.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_06_03"); //Das gibt es doch nicht!
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_06_04"); //Und ich habe mich noch vor ein paar Tagen gewundert, woher der penetrante Geruch kommt!
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_15_05"); //Das hat sich dann ja jetzt geklärt.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_15_06"); //Deine Bierhexen verunreinigen die Gerste auf eine sehr weltliche Art.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_06_07"); //Ja, lach nur! Ich kann mir schon vorstellen, wie sich Erhard einen ablacht, wenn er auf das Getreide pisst, bevor er es zu mir bringen lässt!
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_06_08"); //Dem verfluchten Mistkerl werde ich es zeigen!

	B_GivePlayerXP	(100);

	Info_ClearChoices	(Info_Mod_Brauer_Bierhexen4);

	Info_AddChoice	(Info_Mod_Brauer_Bierhexen4, "Das lasse ich mir nicht entgehen.", Info_Mod_Brauer_Bierhexen4_B);
	Info_AddChoice	(Info_Mod_Brauer_Bierhexen4, "Lass mich das machen und beruhig dich erst mal.", Info_Mod_Brauer_Bierhexen4_A);
};

FUNC VOID Info_Mod_Brauer_Bierhexen4_B()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_B_15_00"); //Das lasse ich mir nicht entgehen.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_B_06_01"); //Auf geht's!

	Info_ClearChoices	(Info_Mod_Brauer_Bierhexen4);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ERHARD");

	B_SetTopicStatus	(TOPIC_MOD_KHORATA_BIERHEXEN, LOG_SUCCESS);

	Mod_Bierhexen = 2;
};

FUNC VOID Info_Mod_Brauer_Bierhexen4_A()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_A_15_00"); //Lass mich das machen und beruhig dich erst mal.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_A_06_01"); //Na schön, kümmer du dich darum. Aber sag ihm ruhig saftig meine Meinung!
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_A_15_02"); //Bin schon auf dem Weg.

	Mod_Bierhexen = 3;

	B_LogEntry	(TOPIC_MOD_KHORATA_BIERHEXEN, "Der Braumeister hat Erhard im Verdacht, für die verunreinigte Gerste verantwortlich zu sein. Ich habe mich als Vermittler angeboten.");

	Info_ClearChoices	(Info_Mod_Brauer_Bierhexen4);
};

INSTANCE Info_Mod_Brauer_Bierhexen5 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen5_Condition;
	information	= Info_Mod_Brauer_Bierhexen5_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wo finde ich Erhard?";
};

FUNC INT Info_Mod_Brauer_Bierhexen5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Bierhexen4))
	&& (Mod_Bierhexen == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen5_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen5_15_00"); //Wo finde ich Erhard?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen5_06_01"); //Wenn du von der Stadt aus Richtung Pass nach Khorinis läufst, biegst du vor der Höhle nach links ab und läufst an der Bergwand entlang.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen5_06_02"); //Dann kannst du seinen Hof nicht verfehlen.
};

INSTANCE Info_Mod_Brauer_Bierhexen6 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen6_Condition;
	information	= Info_Mod_Brauer_Bierhexen6_Info;
	permanent	= 0;
	important	= 0;
	description	= "Leonhard ist der, den wir suchen.";
};

FUNC INT Info_Mod_Brauer_Bierhexen6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Leonhard_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen6_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen6_15_00"); //Leonhard ist der, den wir suchen.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen6_06_01"); //Ja? Dieses Schwein! Was fällt ihm ein?!
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen6_15_02"); //Die Frage ist: Was fällt uns ein, es ihm heimzuzahlen?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen6_06_03"); //Anselm zumindest wird es nicht interessieren, so viel hab ich in meiner kurzen Zeit hier schon mitbekommen.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen6_15_04"); //Einen Versuch ist es wert. Ohne seine Zustimmung würde es schwierig werden, Leonhard zu bestrafen.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen6_06_05"); //Ich lasse dir den Vortritt. Bemerkenswert, was du schon alles herausgefunden hast.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen6_06_06"); //Du scheinst gut mit Menschen umgehen zu können.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen6_15_07"); //Möglich.

	B_LogEntry	(TOPIC_MOD_KHORATA_BIERHEXEN, "Ich soll Anselm dazu bringen, Leonhard zu bestrafen.");
};

INSTANCE Info_Mod_Brauer_Bierhexen7 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen7_Condition;
	information	= Info_Mod_Brauer_Bierhexen7_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brauer_Bierhexen7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen7_Info()
{
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen7_06_00"); //Leonhard hat gerade schon die erste Fuhre Gerste hergeschafft.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen7_06_01"); //Ich will gar nicht wissen, wie du das geschafft hast.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen7_06_02"); //Jedenfalls bin ich dir zu Dank verpflichtet. Von nun an wird mir das Bier hoffentlich gelingen.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen7_15_03"); //Außer die Bierhexen schlagen wieder zu.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen7_06_04"); //(erschrocken) Das verhüte Adanos!
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen7_15_05"); //War nur ein Scherz.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen7_06_06"); //(gefasst) Wenn du vorbeikommst, gebe ich dir jeden Tag einen Humpen aus.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen7_15_07"); //Danke für das Angebot.
};

INSTANCE Info_Mod_Brauer_Bierhexen8 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen8_Condition;
	information	= Info_Mod_Brauer_Bierhexen8_Info;
	permanent	= 1;
	important	= 0;
	description	= "Hast du ein Bier für mich?";
};

FUNC INT Info_Mod_Brauer_Bierhexen8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Bierhexen7))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen8_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen8_15_00"); //Hast du ein Bier für mich?

	if (Mod_Bierhexen_Tag < Wld_GetDay())
	{
		AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen8_06_01"); //Das geht aufs Haus!

		B_GiveInvItems	(self, hero, ItFo_Beer_Khorata, 1);

		Mod_Bierhexen_Tag = Wld_GetDay();
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen8_06_02"); //Heute nicht mehr. Komm morgen wieder.
	};
};

INSTANCE Info_Mod_Brauer_August (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_August_Condition;
	information	= Info_Mod_Brauer_August_Info;
	permanent	= 0;
	important	= 0;
	trade		= 1;
	description	= "Kennst du Dunkelbier?";
};

FUNC INT Info_Mod_Brauer_August_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Penner))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_August_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_August_15_00"); //Kennst du Dunkelbier?
	AI_Output(self, hero, "Info_Mod_Brauer_August_06_01"); //Natürlich. Meine eigene neue Kreation. Extra stark. Ich verkaufe sogar welches.
	AI_Output(hero, self, "Info_Mod_Brauer_August_15_02"); //Kann ich mal probieren?
	AI_Output(self, hero, "Info_Mod_Brauer_August_06_03"); //Gewiss. Ist die beste Werbung. Hier.

	B_GiveInvItems	(self, hero, ItFo_Dunkelbier, 1);

	B_UseItem	(hero, ItFo_Dunkelbier);

	AI_Output(hero, self, "Info_Mod_Brauer_August_15_04"); //Nicht übel. Ich will eins mitnehmen.
	AI_Output(self, hero, "Info_Mod_Brauer_August_06_05"); //Bitte, bedien dich.

	CreateInvItems	(self, ItFo_Dunkelbier, 20);

	B_GiveTradeInv (self);
};

INSTANCE Info_Mod_Brauer_August02 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_August02_Condition;
	information	= Info_Mod_Brauer_August02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brauer_August02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_August))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_August02_Info()
{
	AI_Output(self, hero, "Info_Mod_Brauer_August02_06_00"); //Ach ja. Hast du etwas Zeit?
	AI_Output(hero, self, "Info_Mod_Brauer_August02_15_01"); //Eigentlich nicht. Um was geht's?
	AI_Output(self, hero, "Info_Mod_Brauer_August02_06_02"); //Mir ist der Hopfen ausgegangen. Erhard liefert nicht.
	AI_Output(hero, self, "Info_Mod_Brauer_August02_15_03"); //Also gut. Ich schau mal nach.
};

INSTANCE Info_Mod_Brauer_August03 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_August03_Condition;
	information	= Info_Mod_Brauer_August03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brauer_August03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_August02))
	&& (Npc_HasItems(hero, ItMi_Hopfensack) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_August03_Info()
{
	AI_Output(self, hero, "Info_Mod_Brauer_August03_06_00"); //Da bist du ja. Der Wirt hat schon eine Bestellung. Ich muss den Kessel anheizen.
	AI_Output(hero, self, "Info_Mod_Brauer_August03_15_01"); //Hier der Hopfen. Du schuldest Erhard 150 Gold.

	B_GiveInvItems	(hero, self, ItMi_Hopfensack, 3);

	AI_Output(self, hero, "Info_Mod_Brauer_August03_06_02"); //In Ordnung. Er bekommt eh noch das Geld für den Weizen.
	AI_Output(hero, self, "Info_Mod_Brauer_August03_15_03"); //Wie du meinst ...

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Brauer_Trade (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Trade_Condition;
	information	= Info_Mod_Brauer_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Brauer_Trade_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brauer_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Brauer_Pickpocket (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Pickpocket_Condition;
	information	= Info_Mod_Brauer_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Brauer_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Brauer_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);

	Info_AddChoice	(Info_Mod_Brauer_Pickpocket, DIALOG_BACK, Info_Mod_Brauer_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Brauer_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Brauer_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Brauer_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);
};

FUNC VOID Info_Mod_Brauer_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);
};

INSTANCE Info_Mod_Brauer_EXIT (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_EXIT_Condition;
	information	= Info_Mod_Brauer_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brauer_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brauer_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};