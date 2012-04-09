INSTANCE Info_Mod_Alex_Trunkenbold (C_INFO)
{
	npc		= Mod_7011_HS_Alex_REL;
	nr		= 1;
	condition	= Info_Mod_Alex_Trunkenbold_Condition;
	information	= Info_Mod_Alex_Trunkenbold_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alex_Trunkenbold_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatTrunkenbold_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alex_Trunkenbold_Info()
{
	AI_Output(self, hero, "Info_Mod_Alex_Trunkenbold_08_00"); //Der ist weg!
	AI_Output(hero, self, "Info_Mod_Alex_Trunkenbold_15_01"); //Wie weg, der ist doch da?
	AI_Output(self, hero, "Info_Mod_Alex_Trunkenbold_08_02"); //Eben nicht, der ist WEG!!! Vollkommen WEG!
	AI_Output(hero, self, "Info_Mod_Alex_Trunkenbold_15_03"); //Und ... wann kommt er wieder?
	AI_Output(self, hero, "Info_Mod_Alex_Trunkenbold_08_04"); //Ich würde sagen ... in etwa vier Monaten.
	AI_Output(hero, self, "Info_Mod_Alex_Trunkenbold_15_05"); //Was?!
	AI_Output(self, hero, "Info_Mod_Alex_Trunkenbold_08_06"); //Ja, der hält sowas wie Winterschlaf. Sobald die Zeit des großen Feierns beginnt, wacht er auf.
	AI_Output(hero, self, "Info_Mod_Alex_Trunkenbold_15_07"); //Wie lange ist er denn schon weg?
	AI_Output(self, hero, "Info_Mod_Alex_Trunkenbold_08_08"); //Seit ungefähr acht Monaten.
	AI_Output(hero, self, "Info_Mod_Alex_Trunkenbold_15_09"); //Naja, egal. Ich brauche Alkohol.
	AI_Output(self, hero, "Info_Mod_Alex_Trunkenbold_08_10"); //Du braucht was?
	AI_Output(hero, self, "Info_Mod_Alex_Trunkenbold_15_11"); //Naja, Alkohol, Schnaps oder Bier oder so was. Der Weiberheld hat gesagt, das bekomme ich vom Trunkenbold.
	AI_Output(self, hero, "Info_Mod_Alex_Trunkenbold_08_12"); //Achso, ihr meint Trunken!
	AI_Output(hero, self, "Info_Mod_Alex_Trunkenbold_15_13"); //Was?
	AI_Output(self, hero, "Info_Mod_Alex_Trunkenbold_08_14"); //Trunken! Das ist das Zeug, weswegen der Trunkenbold weg ist.
	AI_Output(self, hero, "Info_Mod_Alex_Trunkenbold_08_15"); //Wie, glaubt ihr, ist er wohl zu seinem Namen gekommen?
	AI_Output(hero, self, "Info_Mod_Alex_Trunkenbold_15_16"); //Und wie komme ich daran?
	AI_Output(self, hero, "Info_Mod_Alex_Trunkenbold_08_17"); //Am besten ihr fragt ihn danach.
	AI_Output(hero, self, "Info_Mod_Alex_Trunkenbold_15_18"); //Aber er ist doch weg.
	AI_Output(self, hero, "Info_Mod_Alex_Trunkenbold_08_19"); //Weg? Er ist doch genau hier. Ihr seid mir einer ...

	AI_TurnToNpc	(self, Mod_7272_HS_Trunkenbold_REL);

	AI_Output(self, hero, "Info_Mod_Alex_Trunkenbold_08_20"); //Trunkenbold, würdest du dem Herrn etwas Trunken geben?

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Alex_Magier (C_INFO)
{
	npc		= Mod_7011_HS_Alex_REL;
	nr		= 1;
	condition	= Info_Mod_Alex_Magier_Condition;
	information	= Info_Mod_Alex_Magier_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alex_Magier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatArsch_MagierTermin))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alex_Magier_Info()
{
	AI_Output(self, hero, "Info_Mod_Alex_Magier_08_00"); //Ahh, ihr müsst das neue königliche Mädchen für alles sein!
	AI_Output(hero, self, "Info_Mod_Alex_Magier_15_01"); //Warst du nicht vor ein paar Tagen noch der königliche Lochgräber?
	AI_Output(self, hero, "Info_Mod_Alex_Magier_08_02"); //Natürlich, was denket ihr denn?
	AI_Output(hero, self, "Info_Mod_Alex_Magier_15_03"); //...
	AI_Output(self, hero, "Info_Mod_Alex_Magier_08_04"); //Machet kein so verzagtes Gesicht! Es gibt Arbeit für euch! Gehet zum königlichen Eremiten!

	B_Say	(hero, self, "$WOFINDEICHIHN");

	AI_Output(self, hero, "Info_Mod_Alex_Magier_08_06"); //Das herauszufinden wirdet eure erste königliche Aufgabe sein.
	AI_Output(hero, self, "Info_Mod_Alex_Magier_15_07"); //Was?
	AI_Output(self, hero, "Info_Mod_Alex_Magier_08_08"); //Mein Geist vermaget sich nicht mehr daran zu erinnern, wo er lebt. Doch bin ich mir sicher, ihn unlängst gesehen zu haben!
	AI_Output(self, hero, "Info_Mod_Alex_Magier_08_09"); //Suchet einfach die Orte auf, an denen ich in letzter Zeit war!
	AI_Output(hero, self, "Info_Mod_Alex_Magier_15_10"); //Und wo warst du in letzter Zeit ...?
	AI_Output(self, hero, "Info_Mod_Alex_Magier_08_11"); //Wenn ich dies wüsste, würde ich doch nicht eure Hilfe brauchen, ihn zu finden! Und nun gehet!
	AI_Output(hero, self, "Info_Mod_Alex_Magier_15_12"); //Und ... was soll ich dann bei ihm machen?
	AI_Output(self, hero, "Info_Mod_Alex_Magier_08_13"); //Bei wem?
	AI_Output(hero, self, "Info_Mod_Alex_Magier_15_14"); //Bei dem Eremiten.
	AI_Output(self, hero, "Info_Mod_Alex_Magier_08_15"); //Ihr habet Kunde vom Verbleib des Eremiten?
	AI_Output(hero, self, "Info_Mod_Alex_Magier_15_16"); //Nein.
	AI_Output(self, hero, "Info_Mod_Alex_Magier_08_17"); //Achso ... Könntet ihr ihn bitte suchen und ihn um die Übliche Lieferung Pilze bitten?
	AI_Output(hero, self, "Info_Mod_Alex_Magier_15_18"); //Na gut.

	Wld_InsertNpc	(Mod_7286_HS_Eremit_REL, "REL_247");

	B_LogEntry	(TOPIC_MOD_SEKTE_Freudenspender, "Der Hofmagier, bei welchem es sich um den ehemaligen Lochgräber handelt, will, dass ich vom Eremiten die übliche Lieferung Pilze besorge. Er weiß jedoch nicht mehr, wo er zu finden ist. Ich soll deshalb an den Orten suchen, wo der Magier zuletzt war.");
};

INSTANCE Info_Mod_Alex_GeheimnisFreudenspender (C_INFO)
{
	npc		= Mod_7011_HS_Alex_REL;
	nr		= 1;
	condition	= Info_Mod_Alex_GeheimnisFreudenspender_Condition;
	information	= Info_Mod_Alex_GeheimnisFreudenspender_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe noch eine Frage bezüglich der hiesigen Rauschmittel.";
};

FUNC INT Info_Mod_Alex_GeheimnisFreudenspender_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alex_Magier))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alex_GeheimnisFreudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Alex_GeheimnisFreudenspender_15_00"); //Ich habe noch eine Frage bezüglich der hiesigen Rauschmittel.
	AI_Output(self, hero, "Info_Mod_Alex_GeheimnisFreudenspender_08_01"); //Hinfort! Ihr seid noch nicht bereit, dieses Geheimnis zu erfahren!
};

INSTANCE Info_Mod_Alex_Pilzsporen (C_INFO)
{
	npc		= Mod_7011_HS_Alex_REL;
	nr		= 1;
	condition	= Info_Mod_Alex_Pilzsporen_Condition;
	information	= Info_Mod_Alex_Pilzsporen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, deine Sporen!";
};

FUNC INT Info_Mod_Alex_Pilzsporen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatEremit_Hi))
	&& (Npc_HasItems(hero, ItMi_FreudenspenderSporen) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alex_Pilzsporen_Info()
{
	AI_Output(hero, self, "Info_Mod_Alex_Pilzsporen_15_00"); //Hier, deine Sporen!
	AI_Output(self, hero, "Info_Mod_Alex_Pilzsporen_08_01"); //Ihr habt den Eremiten gefunden? Wunderbar. So bringet diese Sporen zu dem königlichen Drogenminister!

	B_Say	(hero, self, "$WOFINDEICHIHN");

	AI_Output(self, hero, "Info_Mod_Alex_Pilzsporen_08_03"); //Suchet in den Unweiten des Lagers nach dem königlichen Jäger. Er wirdet euch den Weg weisen!

	B_LogEntry	(TOPIC_MOD_SEKTE_Freudenspender, "Die Sporen soll ich nun zum Drogenminister bringen, welchen ich mithilfe des königlichen Jägers finden soll. Ich denke, dass diese Sporen das Geheimnis der Freudenspender sind.");
};

INSTANCE Info_Mod_Alex_Transportsystem (C_INFO)
{
	npc		= Mod_7011_HS_Alex_REL;
	nr		= 1;
	condition	= Info_Mod_Alex_Transportsystem_Condition;
	information	= Info_Mod_Alex_Transportsystem_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin auf der Suche nach einem unbeschwerlichen Weg in die Sümpfe.";
};

FUNC INT Info_Mod_Alex_Transportsystem_Condition()
{
	if (Mod_SL_Meer == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alex_Transportsystem_Info()
{
	AI_Output(hero, self, "Info_Mod_Alex_Transportsystem_15_00"); //Ich bin auf der Suche nach einem unbeschwerlichen Weg in die Sümpfe.
	AI_Output(self, hero, "Info_Mod_Alex_Transportsystem_08_01"); //Und da kommet ihr zu mir?
	AI_Output(hero, self, "Info_Mod_Alex_Transportsystem_15_02"); //Ich dachte, vielleicht kannst du einen Teleporter erschaffen oder sonst irgendwie deine Magie spielen lassen ...
	AI_Output(self, hero, "Info_Mod_Alex_Transportsystem_08_03"); //Oh ja ... Meine Magie. Nun gut, euer Wunsch sei euch gewährt! Treffet mich in zwei Tagen vor den Toren der Burg!

	Mod_SL_Meer = 6;

	Mod_SL_AlexGraben = Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_SEKTE_Freudenspender, "Alex wird sich mit seiner Magie um ein Transportsystem kümmern. Ich soll ihn in zwei Tagen vor dem Tor treffen.");
};

INSTANCE Info_Mod_Alex_TeleporterFertig (C_INFO)
{
	npc		= Mod_7011_HS_Alex_REL;
	nr		= 1;
	condition	= Info_Mod_Alex_TeleporterFertig_Condition;
	information	= Info_Mod_Alex_TeleporterFertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alex_TeleporterFertig_Condition()
{
	if (Mod_SL_Meer == 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alex_TeleporterFertig_Info()
{
	AI_Output(self, hero, "Info_Mod_Alex_TeleporterFertig_08_00"); //Ah, da seid ihr ja. Kommet nur mit, kommet nur mit!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "LOCH");
};

INSTANCE Info_Mod_Alex_AtLoch (C_INFO)
{
	npc		= Mod_7011_HS_Alex_REL;
	nr		= 1;
	condition	= Info_Mod_Alex_AtLoch_Condition;
	information	= Info_Mod_Alex_AtLoch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alex_AtLoch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alex_TeleporterFertig))
	&& (Npc_GetDistToWP(self, "REL_236") < 400)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alex_AtLoch_Info()
{
	AI_Output(self, hero, "Info_Mod_Alex_AtLoch_08_00"); //Hier, mein Transport-System.
	AI_Output(hero, self, "Info_Mod_Alex_AtLoch_15_01"); //Ein ... Loch?
	AI_Output(self, hero, "Info_Mod_Alex_AtLoch_08_02"); //In gewissem Sinne ... ja, aber es ist auch ein Teleporter.
	AI_Output(self, hero, "Info_Mod_Alex_AtLoch_08_03"); //Man tritt hier rein, fällt und kommt im Sumpf wieder raus. Ist das nicht großartig?
	AI_Output(hero, self, "Info_Mod_Alex_AtLoch_15_04"); //Du hast in zwei Tagen ein Loch von hier bis zum Sumpf gegraben?
	AI_Output(self, hero, "Info_Mod_Alex_AtLoch_08_05"); //Ja.
	AI_Output(hero, self, "Info_Mod_Alex_AtLoch_15_06"); //Ich hatte etwas mit mehr ... Magie erwartet ...
	AI_Output(self, hero, "Info_Mod_Alex_AtLoch_08_07"); //Naja ... Also ... Ich meine ...
	AI_Output(hero, self, "Info_Mod_Alex_AtLoch_15_08"); //Okay, es wird seinen Zweck erfüllen ... hoffe ich.

	B_LogEntry	(TOPIC_MOD_SEKTE_Freudenspender, "Ein Loch? Naja, jedenfalls ist das Transportproblem wohl gelöst. Ich sollte es dem König zeigen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "MAGIER");

	Wld_SendTrigger	("EVT_LEVELCHANGETOSUMPF");
};

INSTANCE Info_Mod_Alex_Lochgraben (C_INFO)
{
	npc		= Mod_7011_HS_Alex_REL;
	nr		= 1;
	condition	= Info_Mod_Alex_Lochgraben_Condition;
	information	= Info_Mod_Alex_Lochgraben_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alex_Lochgraben_Condition()
{
	if (Mod_SL_Schwaechen == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alex_Lochgraben_Info()
{
	AI_Output(self, hero, "Info_Mod_Alex_Lochgraben_08_00"); //Oh, hallo. Na, bist du auch beeindruckt von meinem Loch?
	AI_Output(hero, self, "Info_Mod_Alex_Lochgraben_15_01"); //Natürlich. Es gibt bestimmt nichts und niemanden, das sich im Löchergraben mit dir messen kann!
	AI_Output(self, hero, "Info_Mod_Alex_Lochgraben_08_02"); //Hehe, da hast du recht. Ich bin fleißig wie ein Buddler.
	AI_Output(self, hero, "Info_Mod_Alex_Lochgraben_08_03"); //Es gibt niemanden und nichts, das schneller gräbt als ich ... außer.
	AI_Output(hero, self, "Info_Mod_Alex_Lochgraben_15_04"); //Außer was?
	AI_Output(self, hero, "Info_Mod_Alex_Lochgraben_08_05"); //Außer einem Crawler. Crawler sind unglaublich, wenn es ums Graben geht.
	AI_Output(self, hero, "Info_Mod_Alex_Lochgraben_08_06"); //So ein Crawler könnte da drüben, im Boden auf der anderne Seite von Fluffys Berg, innerhalb einer Nacht ein Loch graben, das so tief wäre, dass man den Boden nicht sehen würde!
	AI_Output(self, hero, "Info_Mod_Alex_Lochgraben_08_07"); //Aber zum Glück gibt’s hier keine Crawler ... nur mich.

	B_LogEntry	(TOPIC_MOD_SL_LOCHGRAEBER, "Minecrawler sind bessere Buddler als der Lochgräber. Wenn ich einen beschwören würde, könnte er ein tieferes Loch als das des Lochgräbers graben und ihn schlagen.");

	Wld_InsertItem	(ItSc_SumCrawler, "FP_ITEM_CRAWLERSCROLL");
};

INSTANCE Info_Mod_Alex_LochGegraben (C_INFO)
{
	npc		= Mod_7011_HS_Alex_REL;
	nr		= 1;
	condition	= Info_Mod_Alex_LochGegraben_Condition;
	information	= Info_Mod_Alex_LochGegraben_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alex_LochGegraben_Condition()
{
	if (Mod_SL_PartLochgraeber == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alex_LochGegraben_Info()
{
	AI_Output(self, hero, "Info_Mod_Alex_LochGegraben_08_00"); //Ah, guten Morgen. Du willst wohl wieder meine Grabkünste bewundern, was?
	AI_Output(self, hero, "Info_Mod_Alex_LochGegraben_08_01"); //Willst wohl selbst mal ein Loch graben. Oh, da ist ja schon eines.
	AI_Output(self, hero, "Info_Mod_Alex_LochGegraben_08_02"); //Lass mich das mal ansehen. Da hast du wohl mit dem Löffel gegraben, was?

	AI_GotoWP	(self, "REL_HS_007");

	AI_Output(self, hero, "Info_Mod_Alex_LochGegraben_08_03"); //Das Loch ist ja grade mal ... grad ... gra ... grade maal ... DAS IST DAS TIEFSTE LOCH, DAS ICH JE GESEHEN HABE!!!
	AI_Output(self, hero, "Info_Mod_Alex_LochGegraben_08_04"); //Wie hast du das gemacht, du Grünschnabel? Da muss ein Trick dabei sein.

	AI_GotoWP	(self, "REL_HS_008");
	AI_GotoWP	(self, "REL_HS_007");

	AI_Output(self, hero, "Info_Mod_Alex_LochGegraben_08_05"); //Das ... Das ... Aaaaaaaaaaaaaaaaaaaahhhhh ...

	B_LogEntry	(TOPIC_MOD_SL_LOCHGRAEBER, "Dem Lochgräber hab ich es aber ganz schön gegeben ...");

	Mod_SL_PartLochgraeber = 2;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Alex_Pickpocket (C_INFO)
{
	npc		= Mod_7011_HS_Alex_REL;
	nr		= 1;
	condition	= Info_Mod_Alex_Pickpocket_Condition;
	information	= Info_Mod_Alex_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Alex_Pickpocket_Condition()
{
	C_Beklauen	(79, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_Alex_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Alex_Pickpocket);

	Info_AddChoice	(Info_Mod_Alex_Pickpocket, DIALOG_BACK, Info_Mod_Alex_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Alex_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Alex_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Alex_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Alex_Pickpocket);
};

FUNC VOID Info_Mod_Alex_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Alex_Pickpocket);
};

INSTANCE Info_Mod_Alex_EXIT (C_INFO)
{
	npc		= Mod_7011_HS_Alex_REL;
	nr		= 1;
	condition	= Info_Mod_Alex_EXIT_Condition;
	information	= Info_Mod_Alex_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alex_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alex_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};