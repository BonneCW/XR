INSTANCE Info_Mod_Geist_EIS_Hi (C_INFO)
{
	npc		= Mod_7646_DMR_Geist_EIS;
	nr		= 1;
	condition	= Info_Mod_Geist_EIS_Hi_Condition;
	information	= Info_Mod_Geist_EIS_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Geist_EIS_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Geist_EIS_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_00"); //(irgendein komisches Geistgeräusch)
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Hi_15_01"); //Was, wie ... woher kommt das?
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_02"); //Von mir ...
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Hi_15_03"); //Ein ... Geist?!
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_04"); //Ein Mensch. Wie viele Äonen ist es her, dass ich ein lebendiges Geschöpf vor mir sah ...
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Hi_15_05"); //Was ... wer bist du?
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_06"); //Ich ... ich bin eine ruhelose Seele, gefangen an dem Ort, wo ich einst mein Leben ließ.
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Hi_15_07"); //Aber ... wie kommt das? Warum bist du nicht ins Jenseits eingegangen, wie jeder Sterbliche eines Tages?
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_08"); //Nun, die Umstände meines Schicksals sind mir selbst bislang nicht völlig klar ... und lange liegt alles zurück.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_09"); //Mag sein, dass die Magie dieses Ortes eine Rolle dabei spielt ... dagegen spricht jedoch, dass die Seelen anderer Geschöpfe und Menschen, die hier ihr Leben nach mir ließen, nicht mehr unter uns weilen.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_10"); //Dann gibt es noch eine mögliche Erklärung, die aber nach all den Jahren immer unwahrscheinlicher erscheint ...
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Hi_15_11"); //Sprich ...
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_12"); //Ein Versprechen, dass ich abgab, ehe ich meine Schritte hierhin ins Verderben lenkten.
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Hi_15_13"); //Ein Versprechen?
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_14"); //Ja ... solange nicht zu ruhen, bis ich meinen Bruder gefunden habe ... oder seine sterbliche Hülle ins Reich der Erde eingekehrt ist.
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Hi_15_15"); //Aber ... was hat sich damals ereignet? Und wie lange bist du denn nun schon an diesen Ort gebunden?
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_16"); //Wie lange ...? Sind es viele Jahrzehnte, oder gar schon Jahrhunderte? Genauer vermag ich es nicht sagen.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_17"); //Damals war ich ein junger Mann, in der Blüte meines Lebens.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_18"); //Mein Bruder Strewak ... er war Jäger. Er durchstreifte immer wieder für mehrere Tage die Gegend nach Beute.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_19"); //Einmal blieb er jedoch viel länger fort, als gewohnt und wir begannen uns Sorgen zu machen ... bis er nach vielen Tagen doch endlich wieder auftauchte.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_20"); //Aber er war verändert ... und berichtete von einer vermummten Gestalt.
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Hi_15_21"); //Ein vermummte Gestalt?
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_22"); //Ja, mein Bruder berichtete von dieser Gestalt. Dieser Wanderer soll er aus einer gänzlich anderen Region der Erde bis hierhin gepilgert sein.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_23"); //Es müsste zweifelsfrei Jahre gedauert haben ... falls Strewak sich die ganze Geschichte nicht nur eingebildet hatte.
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Hi_15_24"); //Eingebildet? Wieso? Und was wollte der Pilger eigentlich hier?
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_25"); //Nun, da berichtete mein Bruder Strewak mir eben so manches, was mich zweifeln lässt, ob es wirklich wahr sein kann.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_26"); //Denn dieser Wanderer war auf der Suche nach einer uralten Kultstätte.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_27"); //Er versprach meinem Bruder eine große Belohnung, wenn er ihn durch das Eisgebiet führen würde.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_28"); //Mein Bruder willigte ein und sie zogen los. Viele Tage waren sie unterwegs, bis sie irgendwo im Norden auf einen Turm trafen.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_29"); //Dort soll der Wanderer mit seinen Händen auf einen Schlag ein Feuermeer entfacht haben, welches das Eis vor ihnen Schmolz und einen Zugang zu einem großen Tempel freilegte.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_30"); //Sie schritten hinein und sollen dort zunächst einer Scharr untoter und dämonischer Geschöpfe begegnet sein, welche der Vermummte jedoch unbeeindruckt bezwang.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_31"); //Sie gingen weiter und kamen an einen Gang der von Flammen durchzogen war.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_32"); //Nun wandte sich der Wanderer an meinen Bruder, übergab ihm einige magische Artefakte oder Schriftstücke, von denen er sagte, dass er sie nicht mehr bräuchte ... und durchschritt die Flammen, bis meines Bruders Augen ihn nicht mehr vernahmen.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_33"); //An dieser Stelle der Erzählung brach mein Bruder in sich zusammen.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_34"); //Ich vernahm nur noch, dass er etwas von einer Sprache erzählte, die ihm magisch vermittelt worden sei und von dem Innersten des magischen Frostes, welches ihm den Zugang ermöglichen sollte.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_35"); //Wir brachten ihn ins Bett, damit er sich erholen könne. Am nächsten Morgen war er jedoch verschwunden.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_36"); //Ein Dorfbewohner meinte noch ihn nach Süden habe gehen zu sehen.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_37"); //Ich brach sofort auf und versprach meiner besorgten Mutter, solange nicht zu ruhen, bis ich meinen Bruder gefunden habe ... oder – so fügte ich leise hinzu, als ich mich abgewandt hatte - seine sterbliche Hülle ins Reich der Erde eingekehrt sei.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_38"); //Denn mir waren die Gefahren da draußen durchaus bewusst ...
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Hi_15_39"); //Das hat es also damit auf sich ... aber, was geschah dann?
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_40"); //Nun, viel zu berichten gibt es nicht mehr. Ich hatte einst von diesem magischen Ort im Südwesten gehört.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_41"); //Hier begab ich mich hin ... und ließ mein Leben durch die Hand eines Dämons.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_42"); //Seitdem bin ich an diesen Ort gebunden ... und leider sieht es nicht danach aus, als könnte sich in absehbarer Zeit daran etwas ändern.
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Hi_15_43"); //Nun, ich könnte mich etwas umsehen, oder umhören.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_44"); //Hab Dank. Jedoch lebt von den Menschen meiner Zeit sicher niemand mehr.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_45"); //Und in dem langen Zeitraum und den weiten dieses Gebietes wird es kein leichtes Unterfangen werden, Hinweise zu finden.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_46"); //Und doch ... trotzdem weckt dein Erscheinen wieder etwas Hoffnung in mir ...
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Hi_15_47"); //Ja, mal schauen. Wenn ich etwas erfahren habe, gebe ich dir bescheid.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_48"); //Nun, wie dir mein Schicksal vermittelt haben sollte, ist es nicht ganz ungefährlich.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Hi_10_49"); //Pass also gut auf dich auf ... auf dass wir uns im Diesseits wieder sehen.

	Log_CreateTopic	(TOPIC_MOD_GEIST_BRUDER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GEIST_BRUDER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GEIST_BRUDER, "In der Höhle nahe dem Eremiten begegnete mir ein Geist. Er scheint seit Ewigkeiten an diesen Ort gebunden zu sein. Dies könnte mit einem Versprechen zusammenhängen, dass er einst gab: nicht eher zu ruhen, bis er seinen Bruder Strewak gefunden habe – oder dessen Leib in den Schoß der Erde eingekehrt sei. Dieser war einst einem vermummten Wanderer begegnet, der von weit weg her kam und hier etwas suchte. Strewak begleitete ihn, bis sie im Norden auf einen Steinkreis trafen und der Pilger magisch einen Tempel freilegte. Später durchschritt er im Inneren einen Gang voller Flammen, während Strewak zurückblieb und zu seinen Verwandten ins Dorf zurückkehrte. Er berichtete noch etwas von dem Innersten des magischen Frostes, welche ihm Zugang ermöglichen sollte und verschwand am nächsten morgen gen Westen. Sein Bruder gab das Versprechen ab und kam auf der Suche nach Strewak um. Ich werde schauen, ob ich bei meinen weiteren Erkundungen in dieser Welt etwas herausfinde und seinem ruhelosen Geist zur längst überfälligen Einkehr ins Jenseits verhelfen kann.");
};

INSTANCE Info_Mod_Geist_EIS_Strewak (C_INFO)
{
	npc		= Mod_7646_DMR_Geist_EIS;
	nr		= 1;
	condition	= Info_Mod_Geist_EIS_Strewak_Condition;
	information	= Info_Mod_Geist_EIS_Strewak_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe deinen Bruder gefunden?";
};

FUNC INT Info_Mod_Geist_EIS_Strewak_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Geist_EIS_Hi))
	&& (Mod_Geist_EIS_Bruder == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Geist_EIS_Strewak_Info()
{
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Strewak_15_00"); //Ich habe deinen Bruder gefunden?
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Strewak_10_01"); //(ungläubig, verwirrt) Wie, was sagst du ...? Das klingt unglaublich. Du möchtest mich hoffentlich nicht zum Narren halten ...
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Strewak_10_02"); //Aber so sprich ... wo und unter welchen Umständen? Was ist mit ihm?
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Strewak_15_03"); //Er hat unlängst das Zeitliche gesegnet.
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Strewak_15_04"); //Sein Körper jedoch befand sich in den eisigen Klauen eines Ungetümes, was ihn vor dem Verfall bewahrte.
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Strewak_15_05"); //Daher ging sein Körper niemals in das Reich der Erde über.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Strewak_10_06"); //Das innerste des magischen Frostes ... das meinte er also. Ich… würde gerne wissen, ob ...
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Strewak_15_07"); //Ja?
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Strewak_10_08"); //Nein, das ist gar nicht notwendig. Ich spüre, wie sich mein Geist allmählich vom Diesseits löst. In kurzer Zeit werde ich meinen Bruder selbst fragen können.
	AI_Output(hero, self, "Info_Mod_Geist_EIS_Strewak_15_09"); //Dann war es also tatsächlich das Versprechen.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Strewak_10_10"); //Ja, mit Gewissheit. Ich ... aber, wie kann ich dir nur danken?
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Strewak_10_11"); //a, die Magie des Ortes, mit der ich so lange verbunden war, werde ich zum Teil auf dich übergehen lassen.
	AI_Output(self, hero, "Info_Mod_Geist_EIS_Strewak_10_12"); //Ich ... leb wohl.

	B_SetTopicStatus	(TOPIC_MOD_GEIST_BRUDER, LOG_SUCCESS);

	B_GivePlayerXP	(2000);

	hero.attribute[ATR_MANA_MAX] += 10;
	hero.attribute[ATR_MANA] += 10;

	hero.protection[PROT_MAGIC] += 10;
	hero.protection[PROT_FIRE] += 5;

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Geist_EIS_EXIT (C_INFO)
{
	npc		= Mod_7646_DMR_Geist_EIS;
	nr		= 1;
	condition	= Info_Mod_Geist_EIS_EXIT_Condition;
	information	= Info_Mod_Geist_EIS_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Geist_EIS_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Geist_EIS_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};