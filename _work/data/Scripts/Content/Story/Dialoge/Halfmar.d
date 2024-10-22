INSTANCE Info_Mod_Halfmar_Hi (C_INFO)
{
	npc		= Mod_7645_OUT_Halfmar_EIS;
	nr		= 1;
	condition	= Info_Mod_Halfmar_Hi_Condition;
	information	= Info_Mod_Halfmar_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Halfmar_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alfans_Aufgabe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Halfmar_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Halfmar_Hi_16_00"); //(überrascht) Wer da? Woher kommst du?
	AI_Output(hero, self, "Info_Mod_Halfmar_Hi_15_01"); //Ich komme aus dem Dorf nördlich von hier. Alfans bat mich darum, bei dir nach dem rechten zu sehen.
	AI_Output(self, hero, "Info_Mod_Halfmar_Hi_16_02"); //Nun, wie du siehst geht es mir nicht allzu gut.
	AI_Output(self, hero, "Info_Mod_Halfmar_Hi_16_03"); //Beim Kräutersammeln überraschte mich ein Wurzeldämon und biss mich in die Hand.
	AI_Output(self, hero, "Info_Mod_Halfmar_Hi_16_04"); //Seitdem sitze ich hier in meiner Hütte und versuche mich zu kurieren. Aber nichts scheint zu helfen.
	AI_Output(self, hero, "Info_Mod_Halfmar_Hi_16_05"); //Die Vergiftung, die er mir zufügte, scheint magischer Natur zu sein und da helfen keine einfachen Kräuter.
	AI_Output(self, hero, "Info_Mod_Halfmar_Hi_16_06"); //(nachdenklich) Wenn ich doch nur etwas Rabenkraut und Mondschattengewächs hätte ...
	AI_Output(hero, self, "Info_Mod_Halfmar_Hi_15_07"); //Wieso, was ist mit diesen Kräutern?
	AI_Output(self, hero, "Info_Mod_Halfmar_Hi_16_08"); //Es sind besondere Gewächse.
	AI_Output(self, hero, "Info_Mod_Halfmar_Hi_16_09"); //Sie benötigen im Gegensatz zu anderen Pflanzen kein Sonnenlicht, denn sie ziehen ihre Energie aus magischer Strahlung.
	AI_Output(self, hero, "Info_Mod_Halfmar_Hi_16_10"); //Daher findet man sie häufig in Höhlen mit magischem Erz oder in der Nähe mystischer Orte ...
	AI_Output(hero, self, "Info_Mod_Halfmar_Hi_15_11"); //Und gibt es solche Plätze in der Nähe?
	AI_Output(self, hero, "Info_Mod_Halfmar_Hi_16_12"); //Ja, die gibt es, einige hundert Meter südlich von hier, ein Steinkreis nebst einer Höhle.
	AI_Output(self, hero, "Info_Mod_Halfmar_Hi_16_13"); //Die magischen Mächte sind dort stark ...
	AI_Output(hero, self, "Info_Mod_Halfmar_Hi_15_14"); //Dann werde ich mich dort nach den Pflanzen umsehen.
	AI_Output(self, hero, "Info_Mod_Halfmar_Hi_16_15"); //Ja, aber wie ich sagte sind die magischen Energien dort mächtig ... sogar in so weit, dass sie sich manifestieren können ... zu Geschöpfen.
	AI_Output(self, hero, "Info_Mod_Halfmar_Hi_16_16"); //Obwohl ich mich in der gesamten Umgebung hier gut auskenne, traue sogar ich mich nur selten dorthin ...
	AI_Output(self, hero, "Info_Mod_Halfmar_Hi_16_17"); //So, wie vor einigen Tagen eben, als mich der garstige Dämon beim Kräutersammeln überraschte.
	AI_Output(self, hero, "Info_Mod_Halfmar_Hi_16_18"); //Pass also gut auf dich auf.

	B_LogEntry	(TOPIC_MOD_ALFANS_HALFMAR, "Ich habe Halfmar gefunden. Er sitzt in seiner Hütte und ist in schlechter Verfassung. Ein Dämon biss ihn in die Hand und fügte ihm damit damit eine Vergiftung zu. Nur die heilende Wirkung eines Mondschattens und eines Rabenkrauts kann ihm Genesung verschaffen. Einige hundert Meter südlich gibt es einen Steinkreis und eine Höhle, wo ich welche finden müsste ... jedoch auch auf dämonische Wesen treffen könnte.");

	Wld_InsertItem	(ItPl_Mondschatten, "FP_ITEM_MONDSCHATTEN_01");
	Wld_InsertItem	(ItPl_Rabenkraut, "FP_ITEM_RABENKRAUT_01");

	Wld_InsertNpc	(ZombieRandom,	"SUEDMINE_2");
	Wld_InsertNpc	(Demon,	"SUEDMINE_6");
	Wld_InsertNpc	(Skeleton_Halfmar,	"SUEDMINE_15");
};

INSTANCE Info_Mod_Halfmar_HabKraeuter (C_INFO)
{
	npc		= Mod_7645_OUT_Halfmar_EIS;
	nr		= 1;
	condition	= Info_Mod_Halfmar_HabKraeuter_Condition;
	information	= Info_Mod_Halfmar_HabKraeuter_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Halfmar_HabKraeuter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Halfmar_Hi))
	&& (Npc_HasItems(hero, ItPl_Mondschatten) >= 1)
	&& (Npc_HasItems(hero, ItPl_Rabenkraut) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Halfmar_HabKraeuter_Info()
{
	AI_Output(self, hero, "Info_Mod_Halfmar_HabKraeuter_16_00"); //Da bist du ja wieder. Warst du erfolgreich?
	AI_Output(hero, self, "Info_Mod_Halfmar_HabKraeuter_15_01"); //Ja, ich habe die Kräuter.

	Npc_RemoveInvItems	(hero, ItPl_Mondschatten, 1);
	Npc_RemoveInvItems	(hero, ItPl_Rabenkraut, 1);

	B_ShowGivenThings	("Rabenkraut und Mondschatten gegeben");

	AI_Output(self, hero, "Info_Mod_Halfmar_HabKraeuter_16_02"); //Tatsächlich. Und du bist unversehrt?
	AI_Output(hero, self, "Info_Mod_Halfmar_HabKraeuter_15_03"); //Ja, den Dämonen konnte ich beikommen ...
	AI_Output(self, hero, "Info_Mod_Halfmar_HabKraeuter_16_04"); //Ausgezeichnet. Warte ... hier, nimm diese Kräuter zur Entlohnung.

	CreateInvItems	(hero, ItPl_Perm_Herb, 1);
	CreateInvItems	(hero, ItPl_Heilknospe, 1);
	CreateInvItems	(hero, ItPl_Health_Herb_03, 1);
	CreateInvItems	(hero, ItPl_Mana_Herb_03, 1);

	B_ShowGivenThings	("Kronstöckel, Heilknospe, Heilwurzel und Feuerwurzel erhalten");

	AI_Output(self, hero, "Info_Mod_Halfmar_HabKraeuter_16_05"); //Ich mach mich dann mal daran, den Trank für meine Genesung herzustellen.
	AI_Output(self, hero, "Info_Mod_Halfmar_HabKraeuter_16_06"); //Achja, wenn du wieder bei Alfans bist, kannst du ihm mitteilen, dass ich in den nächsten Tagen mit den Kräutern vorbeikomme.
	AI_Output(hero, self, "Info_Mod_Halfmar_HabKraeuter_15_07"); //Mach ich.
	AI_Output(self, hero, "Info_Mod_Halfmar_HabKraeuter_16_08"); //Gut, hab vielen Dank für alles.

	B_GivePlayerXP	(350);

	B_LogEntry	(TOPIC_MOD_ALFANS_HALFMAR, "Halfmar hat die Kräuter und sollte bald wieder auf den Beinen sein. Wenn ich wieder im Dorf bin, kann ich Alfans berichten, dass er bald wieder bei ihm vorbeischaut.");
};

INSTANCE Info_Mod_Halfmar_GeistGetroffen (C_INFO)
{
	npc		= Mod_7645_OUT_Halfmar_EIS;
	nr		= 1;
	condition	= Info_Mod_Halfmar_GeistGetroffen_Condition;
	information	= Info_Mod_Halfmar_GeistGetroffen_Info;
	permanent	= 0;
	important	= 0;
	description	= "In der Höhle begegnete ich dem Geist eines Verstorbenen.";
};

FUNC INT Info_Mod_Halfmar_GeistGetroffen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Halfmar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Geist_EIS_Hi))
	&& (Mod_Geist_EIS_Bruder == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Halfmar_GeistGetroffen_Info()
{
	AI_Output(hero, self, "Info_Mod_Halfmar_GeistGetroffen_15_00"); //In der Höhle begegnete ich dem Geist eines Verstorbenen. Er schien seit Ewigkeiten an diesen Ort gebunden.
	AI_Output(self, hero, "Info_Mod_Halfmar_GeistGetroffen_16_01"); //Eine ruhelose Seele, gefangen an diesem Ort?
	AI_Output(hero, self, "Info_Mod_Halfmar_GeistGetroffen_15_02"); //Ja. Als Lebender ließ er dort einst sein Leben und wartet seit dem vergeblich auf das jenseits.
	AI_Output(self, hero, "Info_Mod_Halfmar_GeistGetroffen_16_03"); //Erstaunlich. Ich wusste zwar, dass dieser Ort magische Energie anzieht und festhält.
	AI_Output(self, hero, "Info_Mod_Halfmar_GeistGetroffen_16_04"); //Dass er aber sogar dazu in der Lage wäre Tote davon abzuhalten ins jenseits zu gelangen, hätte ich nicht für möglich gehalten.
	AI_Output(hero, self, "Info_Mod_Halfmar_GeistGetroffen_15_05"); //Nun, er erwähnte Versprechen, dass er einst abgab.
	AI_Output(hero, self, "Info_Mod_Halfmar_GeistGetroffen_15_06"); //Nicht eher zu ruhen, als bis er seinen Bruder gefunden hätte, oder seine sterbliche Hülle ins Jenseits eingekehrt sei.
	AI_Output(self, hero, "Info_Mod_Halfmar_GeistGetroffen_16_07"); //Tatsächlich? Nun, dass ist schon nachvollziehbarer.
	AI_Output(self, hero, "Info_Mod_Halfmar_GeistGetroffen_16_08"); //Das Versprechen verhindert den Übergang ins jenseits und der Ort hindert ihn daran, sich frei zu bewegen.
	AI_Output(self, hero, "Info_Mod_Halfmar_GeistGetroffen_16_09"); //Er müsste sein Versprechen folglich einlösen, damit er Frieden finden könnte.
	AI_Output(hero, self, "Info_Mod_Halfmar_GeistGetroffen_15_10"); //Aber das alles hat sich vor sehr langer Zeit ereignet, vermutlich vor weit über 100 Jahren.
	AI_Output(hero, self, "Info_Mod_Halfmar_GeistGetroffen_15_11"); //Ist es da möglich, dass sein Bruder noch lebt?
	AI_Output(self, hero, "Info_Mod_Halfmar_GeistGetroffen_16_12"); //Hmm, ich weiß es nicht ... Es gibt viel Mystisches und Magisches in diesem Teil der Welt.
	AI_Output(self, hero, "Info_Mod_Halfmar_GeistGetroffen_16_13"); //Gut möglich, dass sich etwas Übernatürliches ereignet hat, was dies doch ermöglicht.
	AI_Output(self, hero, "Info_Mod_Halfmar_GeistGetroffen_16_14"); //Deinem Bericht nach zu urteilen, war sein Bruder unterwegs, fernab von jeder Siedlung.
	AI_Output(self, hero, "Info_Mod_Halfmar_GeistGetroffen_16_15"); //Vielleicht ist er da auf etwas uns Unbekanntes gestoßen. Mehr vermag ich auch nicht dazu zu sagen.
	AI_Output(self, hero, "Info_Mod_Halfmar_GeistGetroffen_16_16"); //Vielleicht werden dich irgendwann deine Schritte dort hin führen, wenn es das Schicksal will.
	AI_Output(self, hero, "Info_Mod_Halfmar_GeistGetroffen_16_17"); //Womöglich bleibt das Rätsel um das Schicksal des ruhelosen Geistes aber auch für immer im Dunkeln ...

	B_LogEntry	(TOPIC_MOD_GEIST_BRUDER, "Halfmar hält es für möglich, dass Strewak fernab der Zivilisation in dieser Welt etwas Übernatürlichem und Unbekanntem begegnete, was verhinderte, dass er über die Zeit verfiel. Vielleicht werde ich irgendwann herausfinden, was es war.");
};

INSTANCE Info_Mod_Halfmar_EXIT (C_INFO)
{
	npc		= Mod_7645_OUT_Halfmar_EIS;
	nr		= 1;
	condition	= Info_Mod_Halfmar_EXIT_Condition;
	information	= Info_Mod_Halfmar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Halfmar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Halfmar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};