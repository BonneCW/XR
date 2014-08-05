var int Bennet_Saebel_Repariert;

INSTANCE Info_Mod_Bennet_Hi (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Hi_Condition;
	information	= Info_Mod_Bennet_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, Schmied. Was macht die Arbeit?";
};

FUNC INT Info_Mod_Bennet_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bennet_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Hi_15_00"); //Hallo, Schmied. Was macht die Arbeit?
	AI_Output(self, hero, "Info_Mod_Bennet_Hi_30_01"); //Bennet heiße ich. Und wie die Arbeit läuft, kannst du dir ja denken, wenn du dich mal umschaust.
	AI_Output(self, hero, "Info_Mod_Bennet_Hi_30_02"); //Kaum einer trägt hier eine Waffe oder Rüstung, die nicht von mir kommt.
};

INSTANCE Info_Mod_Bennet_Haendler (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Haendler_Condition;
	information	= Info_Mod_Bennet_Haendler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Verkaufst du Schmiedezubehör?";
};

FUNC INT Info_Mod_Bennet_Haendler_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Hi)) {
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Haendler_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Haendler_15_00"); //Verkaufst du Schmiedezubehör?
	AI_Output(self, hero, "Info_Mod_Bennet_Haendler_30_01"); //Nur das, was ich entbehren kann. Wenn es ständig an etwas fehlt, dann an Nachschub.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_ONAR, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_ONAR, "Bennet ist Schmied auf dem Hof und kann mir sicher was verkaufen.");
};

INSTANCE Info_Mod_Bennet_DerHof (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_DerHof_Condition;
	information	= Info_Mod_Bennet_DerHof_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie gefällt es dir auf dem Hof?";
};

FUNC INT Info_Mod_Bennet_DerHof_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Hi)) {
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_DerHof_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_DerHof_15_00"); //Wie gefällt es dir auf dem Hof?
	AI_Output(self, hero, "Info_Mod_Bennet_DerHof_30_01"); //Mit meinem Platz hier bin ich ganz zufrieden. Aber sag mal - der Onar ist doch ein richtiger Arsch.
	AI_Output(self, hero, "Info_Mod_Bennet_DerHof_30_02"); //Den würd ich gern mal mit der flachen Seite meiner Klinge verdreschen.
	AI_Output(self, hero, "Info_Mod_Bennet_DerHof_30_03"); //Hab ich Lares auch schon vorgeschlagen. Aber der meint, das soll ich besser sein lassen.
};

INSTANCE Info_Mod_Bennet_Irdorath (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Irdorath_Condition;
	information	= Info_Mod_Bennet_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "He, Meister der Schmiede ...";
};

FUNC INT Info_Mod_Bennet_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Irdorath_15_00"); //He, Meister der Schmiede ...
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_01"); //Meister der Schmiede? Sprich nicht so geschwollen.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_02"); //Was willst du? Waffen kaufen? Wenn nicht, dann verschwinde.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_03"); //Ich habe viel zu tun und kaum brauchbares Material.
	AI_Output(hero, self, "Info_Mod_Bennet_Irdorath_15_04"); //Eigentlich wollte ich mit dem Schiff der Paladine zu einer Insel aufbrechen und hoffte, vielleicht einen kundigen Schmied mit an Bord zu haben ...
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_05"); //Eine Seereise? Nee, Onar würde mich kielholen, wenn er etwas von der Seefahrt verstünde.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_06"); //Ich muss noch einige Waffen schmieden, habe aber kaum genug Rohstoffe.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_07"); //Wenn ich doch nur 15 Erz und zumindest 20 rostige Schwerter hätte. Daraus ließe sich schon was machen ...
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_08"); //Mann, wenn ich daran denke, wie viel teures Rohmaterial in den Gräbern hinter der Kapelle vergraben liegt ...

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Tja, Bennet muss noch Schwerter schmieden. Er klagt darüber, dass er zu wenig Rohmaterial hat, mindestens 15 Erz und 20 rostige Schwerter bräuchte, wo doch so viel in den Gräbern hinter dem Hof herumliegt.");
};

INSTANCE Info_Mod_Bennet_Irdorath2 (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Irdorath2_Condition;
	information	= Info_Mod_Bennet_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe einige Erz und rostige Schwerter ...";
};

FUNC INT Info_Mod_Bennet_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Irdorath))
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 15)
	&& (Npc_HasItems(hero, ItMw_1h_MISC_Sword) >= 20)
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Irdorath2_15_00"); //Ich habe einige Erz und rostige Schwerter ...
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath2_30_01"); //Was, wirklich? Was verlangst du dafür?
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath2_30_02"); //Ach ja, du sprachst irgendwas von einer Seereise.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath2_30_03"); //Wenn du mir die Sachen gibst und einen Tag Zeit lässt für die Schwerter, komm ich mit an Bord. Was sagst du?
};

INSTANCE Info_Mod_Bennet_Irdorath3 (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Irdorath3_Condition;
	information	= Info_Mod_Bennet_Irdorath3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Klar, hier ist, was du brauchst ... und willkommen an Bord.";
};

FUNC INT Info_Mod_Bennet_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Irdorath2))
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 15)
	&& (Npc_HasItems(hero, ItMw_1h_MISC_Sword) >= 20)
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Irdorath3_15_00"); //Klar, hier ist, was du brauchst ... und willkommen an Bord.

	B_ShowGivenThings	("15 Erz und 20 rostige Schwerter gegeben");

	Npc_RemoveInvItems	(hero, ItMi_Nugget, 15);
	Npc_RemoveInvItems	(hero, ItMw_1h_MISC_Sword, 20);

	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath3_30_01"); //Ja, klar, super, danke. Bis morgen am Hafen dann.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Mit Bennet hätten wir dann einen Schmied an Bord.");

	B_GivePlayerXP	(300);

	Mod_BennetSchiffTag = Wld_GetDay();
	Mod_BennetDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Bennet_Irdorath4 (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Irdorath4_Condition;
	information	= Info_Mod_Bennet_Irdorath4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tut mir leid, aber es scheint, dass wir zu viele sind.";
};

FUNC INT Info_Mod_Bennet_Irdorath4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Irdorath3))
	&& (Mod_Irdorath == 0)
	&& (Mod_BennetDabei == 1)
	&& (Mod_JackDabei == 0)
	&& (Mod_CedricDabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Irdorath4_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Irdorath4_15_00"); //Tut mir leid, aber es scheint, dass wir zu viele sind. Ich kann dich doch nicht mitnehmen.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath4_30_01"); //Schade. Ich gehe dann wieder zurück.

	Mod_BennetDabei = 0;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Bennet_Gildenwaffe (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Gildenwaffe_Condition;
	information	= Info_Mod_Bennet_Gildenwaffe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du eine Waffe für mich?";
};

FUNC INT Info_Mod_Bennet_Gildenwaffe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Hi))
	&& (hero.guild == GIL_MIL)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Gildenwaffe_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Gildenwaffe_15_00"); //Hast du eine Waffe für mich?
	AI_Output(self, hero, "Info_Mod_Bennet_Gildenwaffe_30_01"); //Wie ich sehe, bist du nun auch ein Söldner.
	AI_Output(self, hero, "Info_Mod_Bennet_Gildenwaffe_30_02"); //Dann steht dir das gleiche Paket zu wie den anderen Neuen.
	AI_Output(self, hero, "Info_Mod_Bennet_Gildenwaffe_30_03"); //Hier hast du einen Einhänder, einen Zweihänder und einen Bogen.

	B_ShowGivenThings	("Grobes Kurzschwert, Grobe Axt und Bogen erhalten");

	CreateInvItems	(hero, ItMw_GrobesKurzschwert, 1);
	CreateInvItems	(hero, ItMw_2h_Sld_Axe, 1);
	CreateInvItems	(hero, ItRw_Sld_Bow, 1);
};

INSTANCE Info_Mod_Bennet_Piraten (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Piraten_Condition;
	information	= Info_Mod_Bennet_Piraten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier einen Säbel, der aufgearbeitet werden soll.";
};

FUNC INT Info_Mod_Bennet_Piraten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Greg_Aufgabe))
	&& (Npc_HasItems(hero, ItMw_Piratensaebel_Greg) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Piraten_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_00"); //Ich hab hier einen Säbel, der aufgearbeitet werden soll.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_01"); //Zeig her, Bursche.

	B_GiveInvItems	(hero, self, ItMw_Piratensaebel_Greg, 1);

	AI_UnequipWeapons	(self);

	EquipWeapon	(self, ItMw_Piratensaebel_Greg);

	AI_ReadyMeleeWeapon	(self);
	AI_PlayAni	(self, "T_1HSINSPECT");
	AI_RemoveWeapon	(self);
	AI_UnequipWeapons	(self);

	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_02"); //Ja. Eine schöne Arbeit! So was mache ich gern.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_03"); //Und was kostet das?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_04"); //Am liebsten gar nichts.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_05"); //Gar nichts?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_06"); //Weil ich den am liebsten behalten würde.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_07"); //Unmöglich. Mein Boss jagt mich über die Planke.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_08"); //Hm ...

	AI_UnequipWeapons	(self);
	EquipItem	(self, ItMw_Piratensaebel_Greg);
	AI_ReadyMeleeWeapon	(self);
	AI_PlayAni	(self, "T_1HSINSPECT");
	AI_RemoveWeapon	(self);
	AI_UnequipWeapons	(self);

	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_09"); //Ich mach dir nen Vorschlag.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_10"); //Und der wäre?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_11"); //Dein Boss bekommt dafür eine Waffe, die doppelt so stabil und dreimal so scharf ist wie alles, was er jemals geschwungen hat.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_12"); //Geh hin und frag ihn mal.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_13"); //Er wird das nicht glauben. Ich übrigens auch nicht. Wie willst du das hinkriegen?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_14"); //Dir erklär ich's. Aber nicht weitersagen.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_15"); //Also, es war eher ein Zufall. Ich hab immer einen Bottich mit Moleratfett. Damit fette ich die Waffen ein, wenn sie fertig sind.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_16"); //Nun stand eines Tages der Kübel hier draußen und ich hab mein Teil zum Abkühlen aus Versehen in das Fett getaucht, statt in den Wassereimer.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_17"); //'Ne stinkende Rauchwolke gab's und wie ich das Schwert rausziehe, ist es schwarz wie die Nacht.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_18"); //Und dann?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_19"); //Dann hab ich gemerkt, dass es viel schwerer zu hämmern ist als vorher.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_20"); //Ich hab den schwereren Hammer genommen und weiter. Zum Schluss hab ich's selbst geschliffen.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_21"); //Scharf wie ein Rasiermesser, sag ich dir! So was hab ich selbst noch nie gesehen.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_22"); //Ich auch nicht. Wo hast du das Teil?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_23"); //Ich hab es stets bei mir.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_24"); //Weißt du was? Ich geb dir das Schwert einfach mal mit.

	B_GiveInvItems	(self, hero, ItMw_BennetGreg, 1);

	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_25"); //Soll sich dein Boss selber überzeugen.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_26"); //Dir muss ja sehr viel an der alten Klinge liegen.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_27"); //Gut, ich denke, so kann man's machen.

	B_LogEntry	(TOPIC_MOD_GREG_ROST, "Bennet hat mir im Austausch gegen Gregs Säbel ein besonderes Schwert gegeben. Es scheint sehr stabil und scharf zu sein. Hoffentlich ist Greg damit zufrieden.");
};

INSTANCE Info_Mod_Bennet_Blutkelch (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Blutkelch_Condition;
	information	= Info_Mod_Bennet_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Man sagt, du machst auch Spezialwerkzeuge.";
};

FUNC INT Info_Mod_Bennet_Blutkelch_Condition()
{
	if (Mod_ASS_Blutkelch3 == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_15_00"); //Man sagt, du machst auch Spezialwerkzeuge.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_30_01"); //Wohl war. Derzeit arbeite ich zum Beispiel mit Stahl.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_15_02"); //Stahl?
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_30_03"); //Genau. Ein Material, dreimal so hart wie normales Eisen.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_15_04"); //Das trifft sich gut. Ich habe hier eine Spitzhacke, die irgendwie zu weich ist.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_30_05"); //Kein Problem für mich. Ich baue dir eine Stahlhacke.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_15_06"); //Und wann kann ich die haben?
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_30_07"); //Nun, die Herstellung ist aufwändig und nicht billig. 500 Gold müssen es schon sein.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_15_08"); //Was? 500 Gold für eine Hacke?
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_30_09"); //Stahlhacke! Außerdem bin ich der Einzge, der dir so was machen kann.

	Mod_ASS_Bennet = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Bennet_Blutkelch);

	Info_AddChoice	(Info_Mod_Bennet_Blutkelch, "Trotzdem. So viel kann ich nicht ausgeben.", Info_Mod_Bennet_Blutkelch_B);

	if (Npc_HasItems(hero, ItMi_Gold) >= 500)
	{
		Info_AddChoice	(Info_Mod_Bennet_Blutkelch, "Hier hast du das Gold. Wann ist das Teil fertig?", Info_Mod_Bennet_Blutkelch_A);
	};
};

FUNC VOID Info_Mod_Bennet_Blutkelch_B()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_B_15_00"); //Trotzdem. So viel kann ich nicht ausgeben.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_01"); //Dann mache ich dir einen Vorschlag: Ich brauche demnächst eine größere Menge Moleratfett.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_02"); //Wenn du mir so 50 Portionen besorgst, lass ich dir 200 Gold nach.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_B_15_03"); //Wo soll ich so einen Haufen herbekommen? Das krieg ich bei den Händlern nicht zusammen.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_04"); //Genau das ist auch mein Problem. Du solltest es selbst herstellen.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_B_15_05"); //Wie soll ich das anstellen? Ich bin kein Fleischer.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_06"); //Genau. Den solltest du aber fragen.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_B_15_07"); //Und wo finde ...
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_08"); //Ich hörte, in Khorata gibt's einen. Für sein gepökeltes Lamm zahlen die Leute in der Stadt Unsummen.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_B_15_09"); //Also gut. Ich hoffe, die Hacke ist fertig, wenn ich zurückkomme.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_10"); //Bestimmt.

	Mod_ASS_Blutkelch3 = 4;

	Log_CreateTopic	(TOPIC_MOD_ASS_FETT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_FETT, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_ASS_STAHLHACKE, TOPIC_MOD_ASS_FETT, "Beim Schmied Bennet bin ich fündig geworden. Er wird mir eine Stahlhacke machen. Allerdings muss ich ihm 50 Moleratfett besorgen. Der Metzger in Khorata könnte helfen.", "Ich muss für Bennet 50 Portionen Moleratfett besorgen. Der Metzger in Khorata könnte helfen.");

	Info_ClearChoices	(Info_Mod_Bennet_Blutkelch);
};

FUNC VOID Info_Mod_Bennet_Blutkelch_A()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_A_15_00"); //Hier hast du das Gold. Wann ist das Teil fertig?

	B_GiveInvItems	(hero, self, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_A_30_01"); //Wie das so üblich ist bei uns. Komm morgen wieder.

	Mod_ASS_Blutkelch3 = 3;

	B_LogEntry	(TOPIC_MOD_ASS_STAHLHACKE, "Beim Schmied Bennet bin ich fündig geworden. Er wird mir eine Stahlhacke machen. Das sollte reichen für den Grünspan.");

	Info_ClearChoices	(Info_Mod_Bennet_Blutkelch);
};

INSTANCE Info_Mod_Bennet_Blutkelch2 (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Blutkelch2_Condition;
	information	= Info_Mod_Bennet_Blutkelch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bennet_Blutkelch2_Condition()
{
	if (Mod_ASS_Blutkelch3 == 3)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500)
	&& (Wld_GetDay() > Mod_ASS_Bennet)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Blutkelch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch2_30_00"); //Da kommst du ja. Deine Hacke ist fertig.

	B_GiveInvItems	(self, hero, ItMw_Stahlhacke, 1);

	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch2_15_01"); //Und hier dein Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 500);

	B_SetTopicStatus	(TOPIC_MOD_ASS_STAHLHACKE, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	Mod_ASS_Blutkelch3 = 5;
};

INSTANCE Info_Mod_Bennet_Blutkelch3 (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Blutkelch3_Condition;
	information	= Info_Mod_Bennet_Blutkelch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bennet_Blutkelch3_Condition()
{
	if (Mod_ASS_Blutkelch3 == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 300)
	&& (Npc_HasItems(hero, ItMi_Moleratlubric_MIS) >= 50)
	&& (Wld_GetDay() > Mod_ASS_Bennet)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Blutkelch3_Info()
{
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch3_30_00"); //Da kommst du ja. Deine Hacke ist fertig.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch3_15_01"); //Zeig mal her das Teil.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch3_30_02"); //Wo ist mein Fett?
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch3_15_03"); //Hier. Zu was brauchst du das eigentlich alles?

	B_GiveInvItems	(hero, self, ItMi_Moleratlubric_MIS, 50);

	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch3_30_04"); //Betriebsgeheimnis ...
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch3_15_05"); //Auch gut. Hier, das Restgold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 300);

	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch3_30_06"); //Immer gern zu Diensten.

	B_GiveInvItems	(self, hero, ItMw_Stahlhacke, 1);

	B_SetTopicStatus	(TOPIC_MOD_ASS_STAHLHACKE, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	Mod_ASS_Blutkelch3 = 5;
};

INSTANCE Info_Mod_Bennet_HaradLehrling (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_HaradLehrling_Condition;
	information	= Info_Mod_Bennet_HaradLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie läuft's?";
};

FUNC INT Info_Mod_Bennet_HaradLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_HaradLehrling4))
	&& (Mod_HaradLehrling_Kampf == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_HaradLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_HaradLehrling_15_00"); //Wie läuft's?
	AI_Output(self, hero, "Info_Mod_Bennet_HaradLehrling_30_01"); //Im Moment nicht so gut. Möge mich Beliar holen, von gestern auf heute hat Torlof mir den Auftrag entzogen.
	AI_Output(self, hero, "Info_Mod_Bennet_HaradLehrling_30_02"); //Ich darf jetzt ausschließlich Rüstungen schmieden. Das ganze Gold geht nun an Harad.
	AI_Output(self, hero, "Info_Mod_Bennet_HaradLehrling_30_03"); //Will gar nicht wissen, was der wieder für schmutzige Geschäfte gemacht hat, um mir die Arbeit wegzunehmen.
};

instance Info_Mod_Bennet_Lehrer (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Lehrer_Condition;
	information	= Info_Mod_Bennet_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kannst du mir beibringen, ein Schwert zu schmieden?";
};

func int Info_Mod_Bennet_Lehrer_Condition ()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Hi))
	&& (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == FALSE)
	{
		return 1;
	};
};

func void Info_Mod_Bennet_Lehrer_Info ()
{
	AI_Output (hero, self, "Info_Mod_Bennet_Lehrer_15_00"); //Kannst du mir beibringen, ein Schwert zu schmieden?
	AI_Output (self, hero, "Info_Mod_Bennet_Lehrer_30_01"); //Klar.
	AI_Output (self, hero, "Info_Mod_Bennet_Lehrer_30_02"); //Das kostet aber 'ne Kleinigkeit. Sagen wir 30 Goldstücke.
	
	Info_ClearChoices	(Info_Mod_Bennet_Lehrer);
	Info_AddChoice	(Info_Mod_Bennet_Lehrer, "Später vielleicht.", Info_Mod_Bennet_Lehrer_Later);
	Info_AddChoice	(Info_Mod_Bennet_Lehrer, "Gut - hier hast du 30.", Info_Mod_Bennet_Lehrer_Pay);
};

func void Info_Mod_Bennet_Lehrer_Pay()
{
	AI_Output (hero, self, "Info_Mod_Bennet_Lehrer_Pay_15_00"); //Gut - hier hast du 30.
	
	if (B_GiveInvItems (hero, self, ItMi_Gold, 30))
	{
		AI_Output (self, hero, "Info_Mod_Bennet_Lehrer_Pay_30_01"); //Und das war noch verdammt günstig! Wir können anfangen, sobald du so weit bist.
		
		Bennet_TeachCommon = 1;
		Log_CreateTopic	(TOPIC_MOD_LEHRER_SOELDNER_ONAR, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_SOELDNER_ONAR, "Bennet kann mich im Schmieden unterrichten.");
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Bennet_Lehrer_Pay_30_02"); //Verarsch mich nicht. 30 und keine Münze weniger.
	};

	Info_ClearChoices (Info_Mod_Bennet_Lehrer);
};

func void Info_Mod_Bennet_Lehrer_Later()
{
	AI_Output (hero, self, "Info_Mod_Bennet_Lehrer_Later_15_00"); //Später vielleicht.

	Info_ClearChoices	(Info_Mod_Bennet_Lehrer);
};

instance Info_Mod_Bennet_KlingeSchaerfen (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_KlingeSchaerfen_Condition;
	information	= Info_Mod_Bennet_KlingeSchaerfen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Perk: Klinge schärfen (5 LP)";
};

func int Info_Mod_Bennet_KlingeSchaerfen_Condition ()
{
	if (Mod_Schwierigkeit == 4)
	{
		Info_Mod_Bennet_KlingeSchaerfen.description = "Perk: Klinge schärfen (500 Gold)";
	}
	else
	{
		Info_Mod_Bennet_KlingeSchaerfen.description = "Perk: Klinge schärfen (5 LP)";
	};

	if (Schaerfen_Perk == FALSE)
	&& (hero.guild == GIL_MIL)
	{
		return 1;
	};
};

func void Info_Mod_Bennet_KlingeSchaerfen_Info ()
{
	AI_Output (hero, self, "Info_Mod_Bennet_KlingeSchaerfen_15_00"); //Ich will lernen Klingen zu schärfen.

	if ((Mod_Schwierigkeit == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500))
	|| ((Mod_Schwierigkeit != 4)
	&& (hero.lp >= 5))
	{
		AI_Output (self, hero, "Info_Mod_Bennet_KlingeSchaerfen_30_01"); //Dazu musst du deine Klinge zu einem Schleifstein bringen. Das funktioniert allerdings nur mit scharfen Waffen.

		Schaerfen_Perk = TRUE;

		if (Mod_Schwierigkeit == 4)
		{
			Npc_RemoveInvItems	(hero, ItMi_Gold, 500);
		}
		else
		{
			hero.lp -= 5;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Bennet_KlingeSchaerfen_30_02"); //Komm wieder, wenn du bereit bist.
	};
};

instance Info_Mod_Bennet_TeachCOMMON (C_INFO)
{
	npc			= Mod_562_NONE_Bennet_NW;
	nr          = 1;
	condition	= Info_Mod_Bennet_TeachCOMMON_Condition;
	information	= Info_Mod_Bennet_TeachCOMMON_Info;
	permanent	= TRUE;
	description	= B_BuildLearnString("Schmieden lernen", B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common));
};

func int Info_Mod_Bennet_TeachCOMMON_Condition ()
{
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == TRUE)
	{
		return TRUE;
	};
};

func void Info_Mod_Bennet_TeachCOMMON_Info ()
{
	AI_Output (other, self, "Info_Mod_Bennet_TeachCOMMON_15_00"); //Bring mir bei, wie man ein Schwert schmiedet!
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "Info_Mod_Bennet_TeachCOMMON_30_01"); //Ganz einfach: Besorge dir ein Stück Rohstahl, halte es ins Feuer, bis es glüht.
		AI_Output (self, other, "Info_Mod_Bennet_TeachCOMMON_30_02"); //Dann schlägst du am Amboss die Klinge zurecht.
		AI_Output (self, other, "Info_Mod_Bennet_TeachCOMMON_30_03"); //Achte vor allem darauf, dass die Klinge nicht zu kalt wird. Du hast immer nur wenige Minuten Zeit, an deiner Waffe zu arbeiten ...
		AI_Output (self, other, "Info_Mod_Bennet_TeachCOMMON_30_04"); //Den Rest findest du schon raus - reine Übungssache.
	};
};

instance Info_Mod_Bennet_WannaSmithORE (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_WannaSmithORE_Condition;
	information	= Info_Mod_Bennet_WannaSmithORE_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir bei, wie man magische Erzwaffen schmiedet!";
};

func int Info_Mod_Bennet_WannaSmithORE_Condition ()
{
	if (Bennet_TeachSmith == FALSE)
	&& (hero.guild == GIL_MIL)	
	{
		return 1;
	};
};

func void Info_Mod_Bennet_WannaSmithORE_Info ()
{
	AI_Output (hero, self, "Info_Mod_Bennet_WannaSmithORE_15_00"); //Bring mir bei, wie man magische Erzwaffen schmiedet!
		
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_01"); //Du kennst dich doch nicht mal mit den Grundlagen aus.
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_02"); //Lerne erst mal, ein ordentliches Schwert zu schmieden. Dann sehen wir weiter.
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_03"); //Gut, du kannst bereits ein ordentliches Schwert schmieden.
		AI_Output (hero, self, "Info_Mod_Bennet_WannaSmithORE_15_04"); //Na, dann leg mal los ...
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_05"); //Also, das Wichtigste ist: Es ist völlig egal, ob deine Waffe aus reinem Erz ist oder ob du eine einfache Stahlklinge mit einer Schicht aus Erz überziehst. Es kommt nur auf die Oberfläche an.
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_06"); //Und weil das verdammte Zeug so teuer ist, nimmst du dir einen Stahlrohling und ein paar Brocken Erz.
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_07"); //Es reicht natürlich nicht, einfach ein fertiges Schwert mit Erz zu überziehen. Du musst die Waffe schon selber schmieden.
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_08"); //Alles Weitere hängt von der Waffe ab, die du herstellen willst.

		Bennet_TeachSmith = 1;
	};
};

var int Bennet_Kap2Smith;
var int Bennet_Kap3Smith;
var int Bennet_Kap4Smith;
var int Bennet_Kap5Smith;

instance Info_Mod_Bennet_TeachSmith		(C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 30;
	condition	= Info_Mod_Bennet_TeachSmith_Condition;
	information	= Info_Mod_Bennet_TeachSmith_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will mehr über das Schmieden von magischen Erzwaffen wissen.";
};

func int Info_Mod_Bennet_TeachSmith_Condition ()
{
	if (Bennet_TeachSmith == 1)
	{
		return 1;
	};
};

func void Info_Mod_Bennet_TeachSmith_Info ()
{
	AI_Output (hero, self, "Info_Mod_Bennet_TeachSmith_15_00"); //Ich will mehr über das Schmieden von magischen Erzwaffen wissen.
	
	if (Kapitel == 1)//HACK Mattes  
	{
		AI_Output(self, hero, "Info_Mod_Bennet_TeachSmith_30_07"); //Nein, noch nicht. Komm später wieder.
	}
	else if (Kapitel == 2)
	&& (Bennet_Kap2Smith == FALSE)
	{
		AI_Output (self, hero, "Info_Mod_Bennet_TeachSmith_30_01"); //Ich kann dir beibringen, wie man Erzschwerter oder sogar Zweihänder schmiedet.
		Bennet_Kap2Smith = 1;
	}
	else if (Kapitel == 3)
	&& (Bennet_Kap3Smith == FALSE)
	{
		AI_Output (self, hero, "Info_Mod_Bennet_TeachSmith_30_02"); //Ich habe meine Technik verbessert. Ich kann dir jetzt beibringen, wie du Bastardschwerter oder schwere Zweihänder mit Erz herstellst.
		Bennet_Kap3Smith = 1;
	};
	
	Info_ClearChoices (Info_Mod_Bennet_TeachSmith);
	Info_AddChoice (Info_Mod_Bennet_TeachSmith, DIALOG_BACK, Info_Mod_Bennet_TeachSmith_BACK);

	// ------ Kapitel 2 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
	&& (Kapitel >= 2) 
	{
		Info_AddChoice		(Info_Mod_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_01 , B_GetLearnCostTalent(hero, NPC_TALENT_SMITH, WEAPON_1H_Special_01))		,Info_Mod_Bennet_TeachSmith_1hSpecial1);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
	&& (Kapitel >= 2) 
	{
		Info_AddChoice		(Info_Mod_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_01, B_GetLearnCostTalent(hero, NPC_TALENT_SMITH, WEAPON_2H_Special_01))		,Info_Mod_Bennet_TeachSmith_2hSpecial1);
	};
	// ------ Kapitel 3 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice		(Info_Mod_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_02, B_GetLearnCostTalent(hero, NPC_TALENT_SMITH, WEAPON_1H_Special_02))		,Info_Mod_Bennet_TeachSmith_1hSpecial2);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice		(Info_Mod_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_02, B_GetLearnCostTalent(hero, NPC_TALENT_SMITH, WEAPON_2H_Special_02))		,Info_Mod_Bennet_TeachSmith_2hSpecial2);
	};
};

FUNC VOID Info_Mod_Bennet_TeachSmith_Back ()
{
	Info_ClearChoices (Info_Mod_Bennet_TeachSmith);
};
func VOID Info_Mod_Bennet_TeachSmith_1hSpecial1 ()
{
	
	B_TeachPlayerTalentSmith (self, hero, WEAPON_1H_Special_01);	
};
FUNC VOID Info_Mod_Bennet_TeachSmith_2hSpecial1 ()
{

	B_TeachPlayerTalentSmith (self, hero, WEAPON_2H_Special_01);
};
FUNC VOID Info_Mod_Bennet_TeachSmith_1hSpecial2 ()
{

	B_TeachPlayerTalentSmith (self, hero, WEAPON_1H_Special_02);
};
FUNC VOID Info_Mod_Bennet_TeachSmith_2hSpecial2 ()
{

	B_TeachPlayerTalentSmith (self, hero, WEAPON_2H_Special_02);
};

INSTANCE Info_Mod_Bennet_Trade (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Trade_Condition;
	information	= Info_Mod_Bennet_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Bennet_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Bennet_Pickpocket (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Pickpocket_Condition;
	information	= Info_Mod_Bennet_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Bennet_Pickpocket_Condition()
{
	C_Beklauen	(88, ItMiSwordraw, 6);
};

FUNC VOID Info_Mod_Bennet_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);

	Info_AddChoice	(Info_Mod_Bennet_Pickpocket, DIALOG_BACK, Info_Mod_Bennet_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bennet_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bennet_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bennet_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);
};

FUNC VOID Info_Mod_Bennet_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);

		Info_AddChoice	(Info_Mod_Bennet_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Bennet_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Bennet_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Bennet_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Bennet_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Bennet_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Bennet_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Bennet_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Bennet_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Bennet_EXIT (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_EXIT_Condition;
	information	= Info_Mod_Bennet_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bennet_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bennet_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};