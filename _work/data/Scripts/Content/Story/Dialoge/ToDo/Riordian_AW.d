INSTANCE Info_Mod_Riordian_AW_Obelisk (C_INFO)
{
	npc		= Mod_9003_KDW_Riordian_AW;
	nr		= 1;
	condition	= Info_Mod_Riordian_AW_Obelisk_Condition;
	information	= Info_Mod_Riordian_AW_Obelisk_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Riordian_AW_Obelisk_Condition()
{	
	return 1;
};

FUNC VOID Info_Mod_Riordian_AW_Obelisk_Info()
{
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Obelisk_10_00"); //Du reist doch viel, vielleicht habe ich hier was für dich.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Obelisk_15_01"); //Was hast du?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Obelisk_10_02"); //Ich habe in den Ruinen diesen Obelisk hier gefunden.

	B_GiveInvItems	(self, hero, ItRu_TeleportObelisk, 1);

	AI_Output (self, hero, "Info_Mod_Riordian_AW_Obelisk_10_03"); //In den alten Schriften steht nichts genaues darüber, jedoch soll er mit Teleportrunen verbunden werden können.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Obelisk_15_04"); //Mit Teleportrunen verbunden werden? Und was genau bringt das?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Obelisk_10_05"); //Ich vermute, dass er zu einer Art Universalteleportrune wird, mit der du dich zu jedem Ort, den du über eine Rune eingefügt hast, teleportieren kannst.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Obelisk_10_06"); //Allerdings habe ich das noch nicht getestet.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Obelisk_15_07"); //Und wie kann ich die Runen mit dem Obelisk verbinden?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Obelisk_10_08"); //Vermutlich an einem Runentisch.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Obelisk_15_09"); //Ich werde es ausprobieren.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Obelisk_10_10"); //Gut, sag mir Bescheid, wenn es funktioniert.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Obelisk_10_11"); //Wegen des Irrlichtes habe ich auch ein paar Sachen herausgefunden.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Obelisk_10_12"); //Ich kann dir jetzt zeigen, wie du es weitere Gegenstände suchen lassen kannst.

	Log_CreateTopic	(TOPIC_MOD_OBELISK, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_OBELISK, "Riordian hat mir einen Obelisk gegeben, in den ich scheinbar sämtliche Teleportrunen einsetzen kann. Dazu soll ich mit dem Obelisk, einer Teleportrune und einem leeren Runenstein an einen Runentisch gehen. Dort kann ich dann die Rune mit dem Obelisk verbinden. Wenn ich es getestet habe, sollte ich Riordian noch Bescheid sagen.");
};

INSTANCE Info_Mod_Riordian_AW_ObeliskTeleportFunzt (C_INFO)
{
	npc		= Mod_9003_KDW_Riordian_AW;
	nr		= 1;
	condition	= Info_Mod_Riordian_AW_ObeliskTeleportFunzt_Condition;
	information	= Info_Mod_Riordian_AW_ObeliskTeleportFunzt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe den Obelisk ausprobiert.";
};

FUNC INT Info_Mod_Riordian_AW_ObeliskTeleportFunzt_Condition()
{
	if (Mod_TeleportObelisk_Funzt == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Riordian_AW_ObeliskTeleportFunzt_Info()
{
	AI_Output (hero, self, "Info_Mod_Riordian_AW_ObeliskTeleportFunzt_15_00"); //Ich habe den Obelisk ausprobiert.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_ObeliskTeleportFunzt_10_01"); //Und, hat er funktioniert?
	AI_Output (hero, self, "Info_Mod_Riordian_AW_ObeliskTeleportFunzt_15_02"); //Ja, er hat mich wie die normale Teleportrune zu meinem Ziel gebracht.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_ObeliskTeleportFunzt_10_03"); //Hervorragend. Das alte Volk ist wirklich erstaunlich. Hoffentlich finden wir noch mehr der alten Relikte.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_ObeliskTeleportFunzt_10_04"); //Hier hast du eine kleine Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Riordian_AW_SteinkreisTafel (C_INFO)
{
	npc		= Mod_9003_KDW_Riordian_AW;
	nr		= 1;
	condition	= Info_Mod_Riordian_AW_SteinkreisTafel_Condition;
	information	= Info_Mod_Riordian_AW_SteinkreisTafel_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Riordian_AW_SteinkreisTafel_Condition()
{
	if (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Riordian_AW_SteinkreisTafel_Info()
{
	AI_Output (self, hero, "Info_Mod_Riordian_AW_SteinkreisTafel_10_00"); //(aufgeregt) Hey, ich habe wieder was Interessantes in den Ruinen gefunden.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_SteinkreisTafel_15_01"); //Was hast du gefunden?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_SteinkreisTafel_10_02"); //Es ist eine Steintafel. Auf ihr steht eine Formel und darunter ist etwas abgebildet, was einem Steinkreis sehr ähnlich sieht.

	B_GiveInvItems	(self, hero, ItMi_SteinkreisTafel, 1);

	AI_Output (self, hero, "Info_Mod_Riordian_AW_SteinkreisTafel_10_03"); //Du solltest die Formel mal an einem Steinkreis ausprobieren, vielleicht funktioniert es ja.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_SteinkreisTafel_15_04"); //Und das ist nicht gefährlich?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_SteinkreisTafel_10_05"); //Ach was, was soll da schon passieren.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_SteinkreisTafel_15_06"); //Na gut, ich werde es versuchen.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_SteinkreisTafel_10_07"); //Gut, berichte mir dann, was vorgefallen ist.

	Log_CreateTopic	(TOPIC_MOD_STEINKREIS, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_STEINKREIS, "Riordian hat mir eine Steintafel gegeben, welche ich bei Steinkreisen verwenden soll. Mal sehen, was passiert ...");

	Mod_Riordian_Geister_Tag = Wld_GetDay();
};

INSTANCE Info_Mod_Riordian_AW_SteinkreisTafelFunzt (C_INFO)
{
	npc		= Mod_9003_KDW_Riordian_AW;
	nr		= 1;
	condition	= Info_Mod_Riordian_AW_SteinkreisTafelFunzt_Condition;
	information	= Info_Mod_Riordian_AW_SteinkreisTafelFunzt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Formel funktioniert tatsächlich.";
};

FUNC INT Info_Mod_Riordian_AW_SteinkreisTafelFunzt_Condition()
{
	if (Mod_TeleportSteinkreis_Funzt == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Riordian_AW_SteinkreisTafelFunzt_Info()
{
	AI_Output (hero, self, "Info_Mod_Riordian_AW_SteinkreisTafelFunzt_15_00"); //Die Formel funktioniert tatsächlich.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_SteinkreisTafelFunzt_10_01"); //Was bewirkt sie?
	AI_Output (hero, self, "Info_Mod_Riordian_AW_SteinkreisTafelFunzt_15_02"); //Es scheint sich um eine Art Teleportzauber zu handeln.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_SteinkreisTafelFunzt_15_03"); //Als ich die Formel ausgesprochen hatte, wurde ich in einen riesigen Steinkreis in einer Eislandschaft teleportiet.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_SteinkreisTafelFunzt_15_04"); //Danach konnte ich jeden beliebigen Steinkreis ansteuern.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_SteinkreisTafelFunzt_10_05"); //Sehr interessant. Das ist dir bestimmt sehr nützlich, du kannst die Tafel behalten. Die Formel kenne ich ohnehin noch.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_SteinkreisTafelFunzt_10_06"); //Hier hast du eine kleine Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_STEINKREIS, "Es hat sich herausgestellt, dass ich mit der Steintafel zwischen den Steinkreisen hin und herreisen kann.");
};

INSTANCE Info_Mod_Riordian_AW_Plagegeister (C_INFO)
{
	npc		= Mod_9003_KDW_Riordian_AW;
	nr		= 1;
	condition	= Info_Mod_Riordian_AW_Plagegeister_Condition;
	information	= Info_Mod_Riordian_AW_Plagegeister_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Riordian_AW_Plagegeister_Condition()
{
	if (Mod_Riordian_Geister == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Riordian_AW_Plagegeister_Info()
{
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Plagegeister_10_00"); //Gut, dass du kommst. Hier ist die Hölle ausgebrochen.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Plagegeister_15_01"); //Das sehe ich. Was ist geschehen?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Plagegeister_10_02"); //Nun, in letzter Zeit hatten wir sehr intensiv in den Ruinen geforscht und ihr viele Geheimnisse entlockt.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Plagegeister_10_03"); //Nur leider, nunja, waren wir wohl etwas zu unvorsichtig und haben dabei wohl einige Geister geweckt, die jetzt ruhelos und wütend hier ihr Unwesen treiben.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Plagegeister_10_04"); //Und sie scheinen sobald nicht damit aufhören zu wollen ...
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Plagegeister_15_05"); //Würden nicht vielleicht paar magische Geschosse sie wieder zur Ruhe ...
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Plagegeister_10_06"); //(unterbricht) Um Adanos Willen, nein. Die Gefahr, dass wir noch mehr schlafende Mächte wecken wäre zu groß.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Plagegeister_15_07"); //Und was können wir dann tun?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Plagegeister_10_08"); //Nun, bei meinen Forschungen bin ich zuletzt auf etwas gestoßen, das uns vielleicht helfen könnte.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Plagegeister_10_09"); //Es handelt sich dabei um eine Formel die in der Lage sein soll, ruhelose Geister zu besänftigen.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Plagegeister_15_10"); //Wird sie funktionieren?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Plagegeister_10_11"); //Vielleicht… aber sie muss gesprochen, während an einem Altar ein Totenopfer dargebracht wird und im Anschluss zwei Zauber gewirkt werden.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Plagegeister_15_12"); //Ein Totenopfer und Zauber?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Plagegeister_10_13"); //Bei dem Totenopfer handelt es sich vermutlich um drei Sumpfkrautpflanzen. Sie sollten den Kontakt zu den jenseitigen Sphären herstellen.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Plagegeister_10_14"); //Die Zauber wiederum sollen die Eigenschaft haben, Geschehenes vergessen zu lassen und wachen Geistern den Schlaf zu bringen.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Plagegeister_15_15"); //Hmm ...
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Plagegeister_10_16"); //Wir wissen zudem nicht genau, wo ein solcher Opferaltar zu finden ist, aber zweifelsohne wirst du in einer der alten Anlagen fündig werden.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Plagegeister_15_17"); //Ok, ich schau mich mal um. Die Formel?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Plagegeister_10_18"); //Hier hast du sie.

	B_GiveInvItems	(self, hero, ItWr_PlagegeisterFormel, 1);

	AI_Output (hero, self, "Info_Mod_Riordian_AW_Plagegeister_15_19"); //Gut, ich mach mich dann mal auf den Weg.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Plagegeister_10_20"); //Viel Glück. Adanos sei mit dir.

	Log_CreateTopic	(TOPIC_MOD_RIORDIAN_PLAGEGEISTER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_RIORDIAN_PLAGEGEISTER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_RIORDIAN_PLAGEGEISTER, "Die Wassermagier haben bei ihren Forschungen einige Geister verärgert, die dort nun ruhelos umherschwirren. Riordian meinte, dass man um sie wieder zu besänftigen ein Ritual an einem Opferaltar durchführen müsste. Dazu muss ich die Formel Aufsagen, 3 Sumpfkrautpflanzen opfern und 2 Zauber wirken. Die Zauber sollten die Eigenschaft haben Geschehnisse vergessen zu machen und wachen Geistern den Schlaf zu bringen.");
};

INSTANCE Info_Mod_Riordian_AW_Plagegeister2 (C_INFO)
{
	npc		= Mod_9003_KDW_Riordian_AW;
	nr		= 1;
	condition	= Info_Mod_Riordian_AW_Plagegeister2_Condition;
	information	= Info_Mod_Riordian_AW_Plagegeister2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Riordian_AW_Plagegeister2_Condition()
{
	if (Mod_Riordian_Geister == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Riordian_AW_Plagegeister2_Info()
{
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Plagegeister2_10_00"); //Du hast es geschafft! Die Ruhelosen Seelen und Geister sind besänftigt.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Plagegeister2_15_01"); //Ich hoffe ihr seid in Zukunft etwas vorsichtiger bei euren Forschungen.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Plagegeister2_10_02"); //Ja, natürlich! Dessen kannst du gewiss sein. Aber hier, nimm diese Steintafeln für deine Hilfe.

	B_ShowGivenThings	("2 Steintafeln erhalten");

	CreateInvItems	(hero, ItWr_DexStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItWr_HitPointStonePlate1_Addon, 1);

	AI_Output (self, hero, "Info_Mod_Riordian_AW_Plagegeister2_10_03"); //Mögen sie dir auf deinen weiteren Wegen von Nutzen sein.

	B_SetTopicStatus	(TOPIC_MOD_RIORDIAN_PLAGEGEISTER, LOG_SUCCESS);

	B_GivePlayerXP	(400);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Riordian_AW_ScrollJG (C_INFO)
{
	npc		= Mod_9003_KDW_Riordian_AW;
	nr		= 1;
	condition	= Info_Mod_Riordian_AW_ScrollJG_Condition;
	information	= Info_Mod_Riordian_AW_ScrollJG_Info;
	permanent	= 0;
	important	= 0;
	description	= "Vielleicht kannst du mir helfen.";
};

FUNC INT Info_Mod_Riordian_AW_ScrollJG_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Key2))
	&& (Npc_HasItems(hero, ItWr_TruhenNotizJG) == 1)
	&& (Npc_HasItems(hero, ItWr_TruhenScrollJG) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Riordian_AW_ScrollJG_Info()
{
	AI_Output (hero, self, "Info_Mod_Riordian_AW_ScrollJG_15_00"); //Vielleicht kannst du mir helfen.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_ScrollJG_10_01"); //Zeig her.

	B_UseFakeScroll ();

	AI_Output (self, hero, "Info_Mod_Riordian_AW_ScrollJG_10_02"); //Hm. Es ist die alte Schrift. Ich habe so Zeichen auch schon gesehen. Scheint eine höhere Sprache zu sein.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_ScrollJG_15_03"); //Und?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_ScrollJG_10_04"); //Ich habe sie noch nicht ganz entziffern können. Komm später wieder.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_ScrollJG_15_05"); //Adanos hilf! Den ganzen Weg umsonst ...
	AI_Output (self, hero, "Info_Mod_Riordian_AW_ScrollJG_10_06"); //Warte. Kennst du den Eremiten im Tal?
	AI_Output (hero, self, "Info_Mod_Riordian_AW_ScrollJG_15_07"); //Ähm ...
	AI_Output (self, hero, "Info_Mod_Riordian_AW_ScrollJG_10_08"); //Er kam vor langer Zeit mit den ersten Piraten nach Jhakendar. Hat auch die Schriften studiert.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_ScrollJG_10_09"); //Plötzlich jedoch hat er davon abgelassen und hat sich ins Tal zurückgezogen.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_ScrollJG_15_10"); //Woher  weißt du?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_ScrollJG_10_11"); //Dieser Pirat, dieser Greg, hat es mir erzählt.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_ScrollJG_15_12"); //Aha. Und du meinst, der könnte mir ...
	AI_Output (self, hero, "Info_Mod_Riordian_AW_ScrollJG_10_13"); //Versuch's einfach. Es ist die Plattform rechts außen.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_ScrollJG_15_14"); //Ich weiß.

	B_LogEntry	(TOPIC_MOD_JG_SCROLL, "Ich muss zum Eremit im Tal und da fragen. Wohl die letzte Möglichkeit.");
};

INSTANCE Info_Mod_Riordian_AW_ScrollJG2 (C_INFO)
{
	npc		= Mod_9003_KDW_Riordian_AW;
	nr		= 1;
	condition	= Info_Mod_Riordian_AW_ScrollJG2_Condition;
	information	= Info_Mod_Riordian_AW_ScrollJG2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Eremit konnte mir helfen. Ich muss nun eine bestimmte Opferschale suchen.";
};

FUNC INT Info_Mod_Riordian_AW_ScrollJG2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_ScrollJG))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Riordian_AW_ScrollJG2_Info()
{
	AI_Output (hero, self, "Info_Mod_Riordian_AW_ScrollJG2_15_00"); //Der Eremit konnte mir helfen. Ich muss nun eine bestimmte Opferschale suchen.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_ScrollJG2_10_01"); //Das wird nicht leicht sein. Du wirst dazu Glück brauchen. Übrigens ...
	AI_Output (hero, self, "Info_Mod_Riordian_AW_ScrollJG2_15_02"); //Ja?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_ScrollJG2_10_03"); //Cavalorn hat mir berichtet, du sollst schnellstens ins Lager zurückkommen.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_ScrollJG2_15_04"); //Ins Minental?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_ScrollJG2_10_05"); //Ja. Vielleicht kann dir dieser Wulfgar weiterhelfen.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_ScrollJG2_15_06"); //Bin schon unterwegs.

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_JG_OPFERSCHALE, "Auf zu Wulfgar. Vielleicht weiß der was ...");
};

INSTANCE Info_Mod_Riordian_AW_Zeremoniendolch (C_INFO)
{
	npc		= Mod_9003_KDW_Riordian_AW;
	nr		= 1;
	condition	= Info_Mod_Riordian_AW_Zeremoniendolch_Condition;
	information	= Info_Mod_Riordian_AW_Zeremoniendolch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Guten Tag. Merdarion sagt, du hast neue Erkenntnisse.";
};

FUNC INT Info_Mod_Riordian_AW_Zeremoniendolch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Merdarion_AW_Zeremoniendolch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Riordian_AW_Zeremoniendolch_Info()
{
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Zeremoniendolch_15_00"); //Guten Tag. Merdarion sagt, du hast neue Erkenntnisse.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Zeremoniendolch_10_01"); //Nun ja. Neulich konnte ich eine weitere Inschrift im Tempel entziffern.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Zeremoniendolch_10_02"); //Dabei handelt es sich um eine Waffe, die in den alten Zeiten offensichtlich für bestimmte Opferrituale benutzt wurde.
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Zeremoniendolch_10_03"); //Scheint absolut tödlich und vom Opfer nicht wahrnehmbar zu sein. Habe sie mal Ritualdolch genannt.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Zeremoniendolch_15_04"); //Aha. Und wo könnte man so eine Waffe finden?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Zeremoniendolch_10_05"); //Keine Ahnung. Aber wenn, dann hier in Jharkendar, denke ich.
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Zeremoniendolch_15_06"); //Und kannst du noch etwas weiter denken?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Zeremoniendolch_10_07"); //Nun ja. Eine Opferstätte ... oder ein Ritualplatz ... ein Tempel. So in der Art ... Hmm ...
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Zeremoniendolch_15_08"); //Vielleicht hier im Tempel?
	AI_Output (self, hero, "Info_Mod_Riordian_AW_Zeremoniendolch_10_09"); //Da hat sich Meriadon schon umgeschaut, da ist nichts. Eventuell der Adanostempel im Sumpf ...

	B_LogEntry	(TOPIC_MOD_ASS_ZEREMONIENDOLCH, "Der Dolch ist vermutlich an irgendeiner Opferstätte, einem Ritualplatz oder einem Tempel zu finden. Riordian meint, ich solle mal im Adanostempel im Sumpf suchen ...");
};

INSTANCE Info_Mod_Riordian_AW_Gast (C_INFO)
{
	npc		= Mod_9003_KDW_Riordian_AW;
	nr		= 1;
	condition	= Info_Mod_Riordian_AW_Gast_Condition;
	information	= Info_Mod_Riordian_AW_Gast_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum bist du überhaupt mitgekommen?";
};

FUNC INT Info_Mod_Riordian_AW_Gast_Condition()
{
	if (Mod_Saturas_Gast == 1)
	{
		Info_Mod_Riordian_AW_Gast.description = "Ich suche den Dieb eurer Ausrüstung.";
	}
	else
	{
		Info_Mod_Riordian_AW_Gast.description = "Jemand hat Teile eurer Ausrüstung gestohlen.";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_UngebeterBesucher))
	&& (Mod_Saturas_Gast_Fortschritt == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Riordian_AW_Gast_Info()
{
	if (Mod_Saturas_Gast == 1)
	{
		AI_Output(hero, self, "Info_Mod_Riordian_AW_Gast_15_00"); //Ich suche den Dieb eurer Ausrüstung.
		AI_Output(self, hero, "Info_Mod_Riordian_AW_Gast_10_01"); //Ja, genau, finde den Mistkerl!
		AI_Output(hero, self, "Info_Mod_Riordian_AW_Gast_15_02"); //Irgendwelche Anhaltspunkte?
		AI_Output(self, hero, "Info_Mod_Riordian_AW_Gast_10_03"); //Ich? Nein. Aber dieser Argez könnte es gewesen sein. Ich traue ihm nicht.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Riordian_AW_Gast_15_04"); //Jemand hat Teile eurer Ausrüstung gestohlen.
		AI_Output(self, hero, "Info_Mod_Riordian_AW_Gast_10_05"); //Wie bitte? Wer könnte uns hier etwas stehlen?
		AI_Output(hero, self, "Info_Mod_Riordian_AW_Gast_15_06"); //Weiß ich noch nicht. Du hast also nichts Ungewöhnliches mitbekommen?
		AI_Output(self, hero, "Info_Mod_Riordian_AW_Gast_10_07"); //Ich habe geschlummert wie ein Baby.
	};
};

instance Info_Mod_Riordian_AW_Irrlicht		(C_INFO)
{
	npc		= Mod_9003_KDW_Riordian_AW;
	nr		= 1;
	condition	= Info_Mod_Riordian_AW_Irrlicht_Condition;
	information	= Info_Mod_Riordian_AW_Irrlicht_Info;
	permanent	= 1;
	important	= 0;
	description	= "Zeig mir, wie ich mein Irrlicht unterrichte.";
};

var int Info_Mod_Riordian_AW_Irrlicht_NoPerm;

FUNC INT Info_Mod_Riordian_AW_Irrlicht_Condition()
{
	if (Npc_HasItems (hero, ItAm_Addon_WispDetector) == 1)
	&& ((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Riordian_AW_Irrlicht_Info()
{
	if ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE)
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE)	
	{                                            
		Info_ClearChoices (Info_Mod_Riordian_AW_Irrlicht);
		Info_AddChoice (Info_Mod_Riordian_AW_Irrlicht,DIALOG_BACK,Info_Mod_Riordian_AW_Irrlicht_BACK);
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice (Info_Mod_Riordian_AW_Irrlicht,B_BuildLearnString (NAME_ADDON_WISPSKILL_FF, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_FF)),Info_Mod_Riordian_AW_Irrlicht_WISPSKILL_FF);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice (Info_Mod_Riordian_AW_Irrlicht,B_BuildLearnString (NAME_ADDON_WISPSKILL_NONE, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_NONE)),Info_Mod_Riordian_AW_Irrlicht_WISPSKILL_NONE);
		};	
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE)
		&& (WISPSKILL_LEVEL >= 2)
		{
			Info_AddChoice (Info_Mod_Riordian_AW_Irrlicht,B_BuildLearnString (NAME_ADDON_WISPSKILL_RUNE, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_RUNE)),Info_Mod_Riordian_AW_Irrlicht_WISPSKILL_RUNE);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE)
		&& (WISPSKILL_LEVEL >= 2)
		{
			Info_AddChoice (Info_Mod_Riordian_AW_Irrlicht,B_BuildLearnString (NAME_ADDON_WISPSKILL_MAGIC, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_MAGIC)),Info_Mod_Riordian_AW_Irrlicht_WISPSKILL_MAGIC);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE)
		&& (WISPSKILL_LEVEL >= 3)
		{
			Info_AddChoice (Info_Mod_Riordian_AW_Irrlicht,B_BuildLearnString (NAME_ADDON_WISPSKILL_FOOD, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_FOOD)),Info_Mod_Riordian_AW_Irrlicht_WISPSKILL_FOOD);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE)
		&& (WISPSKILL_LEVEL >= 3)
		{
			Info_AddChoice (Info_Mod_Riordian_AW_Irrlicht,B_BuildLearnString (NAME_ADDON_WISPSKILL_POTIONS, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_POTIONS)),Info_Mod_Riordian_AW_Irrlicht_WISPSKILL_POTIONS);
		};
	};
};

FUNC VOID Info_Mod_Riordian_AW_Irrlicht_BACK ()
{
	Info_ClearChoices (Info_Mod_Riordian_AW_Irrlicht);
};

FUNC VOID Info_Mod_Riordian_AW_Irrlicht_WISPSKILL_FF ()
{
	if B_TeachPlayerTalentWispDetector  (self, other, WISPSKILL_FF)
	{
		if (WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
	};
	
	Info_ClearChoices (Info_Mod_Riordian_AW_Irrlicht);
};

FUNC VOID Info_Mod_Riordian_AW_Irrlicht_WISPSKILL_NONE ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_NONE)
	{
		if (WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
	};
	
	Info_ClearChoices (Info_Mod_Riordian_AW_Irrlicht);
};

FUNC VOID Info_Mod_Riordian_AW_Irrlicht_WISPSKILL_RUNE ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_RUNE)
	{
		if (WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
	};
	
	Info_ClearChoices (Info_Mod_Riordian_AW_Irrlicht);
};

FUNC VOID Info_Mod_Riordian_AW_Irrlicht_WISPSKILL_MAGIC ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_MAGIC)
	{
		if (WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
	};
	
	Info_ClearChoices (Info_Mod_Riordian_AW_Irrlicht);
};

FUNC VOID Info_Mod_Riordian_AW_Irrlicht_WISPSKILL_FOOD ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_FOOD)
	{
	};
	Info_ClearChoices (Info_Mod_Riordian_AW_Irrlicht);
};

FUNC VOID Info_Mod_Riordian_AW_Irrlicht_WISPSKILL_POTIONS ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_POTIONS)
	{
	};
	Info_ClearChoices (Info_Mod_Riordian_AW_Irrlicht);
};

INSTANCE Info_Mod_Riordian_AW_Lehrer (C_INFO)
{
	npc		= Mod_9003_KDW_Riordian_AW;
	nr		= 1;
	condition	= Info_Mod_Riordian_AW_Lehrer_Condition;
	information	= Info_Mod_Riordian_AW_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kann ich bei dir lernen?";
};

FUNC INT Info_Mod_Riordian_AW_Lehrer_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Riordian_Hi))
	&& ((Mod_Gilde == 9)
	|| (Mod_Gilde == 10)
	|| (Mod_Gilde == 11))
	&& (Mod_IstLehrling == 1)
	{	
		return 1;
	};
};

FUNC VOID Info_Mod_Riordian_AW_Lehrer_Info()
{
	AI_Output (hero, self, "Info_Mod_Riordian_AW_Lehrer_15_00"); //Kann ich bei dir lernen?
	
	if (Mod_Gilde == 9)
	|| (Mod_Gilde == 10)
	|| (Mod_Gilde == 11)
	{
		AI_Output (self, hero, "Info_Mod_Riordian_AW_Lehrer_10_01"); //Ich werde dich in die Geheimnisse der Alchemie einweihen.
		
		if (!Npc_KnowsInfo(hero, Info_Mod_Riordian_AW_Lehrer))
		{
			Log_CreateTopic	(TOPIC_MOD_LEHRER_WASSERMAGIER, LOG_NOTE);
			B_LogEntry	(TOPIC_MOD_LEHRER_WASSERMAGIER, "Riordian kann mir etwas über die Alchemie beibringen.");
		};

		Info_ClearChoices 	(Info_Mod_Riordian_AW_Lehrer);
		Info_AddChoice 		(Info_Mod_Riordian_AW_Lehrer,DIALOG_BACK,Info_Mod_Riordian_AW_Lehrer_BACK);
	
		if ( PLAYER_TALENT_ALCHEMY[POTION_Genesung] == FALSE)
		{
			Info_AddChoice 		(Info_Mod_Riordian_AW_Lehrer,B_BuildLearnString ("Trank der Genesung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Genesung)),Info_Mod_Riordian_AW_Lehrer_Genesung);
		};
	
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
		&& (Mod_LehrlingBei != 1)
		{
			Info_AddChoice 		(Info_Mod_Riordian_AW_Lehrer,B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_01)),Info_Mod_Riordian_AW_Lehrer_HEALTH_01);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
		{
			Info_AddChoice	  (Info_Mod_Riordian_AW_Lehrer, B_BuildLearnString ("Extrakt der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_02)), Info_Mod_Riordian_AW_Lehrer_Health_02);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
		{
			Info_AddChoice	  (Info_Mod_Riordian_AW_Lehrer, B_BuildLearnString ("Elixier der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_03)), Info_Mod_Riordian_AW_Lehrer_Health_03);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
		&& (Mod_LehrlingBei != 1)
		&& (Kapitel >= 4)
		{
			Info_AddChoice	  (Info_Mod_Riordian_AW_Lehrer, B_BuildLearnString ("Elixier des Lebens", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), Info_Mod_Riordian_AW_Lehrer_Perm_Health);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
		&& (Mod_LehrlingBei != 1)
		{
			Info_AddChoice	  (Info_Mod_Riordian_AW_Lehrer, B_BuildLearnString ("Mana Essenz", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_01)), Info_Mod_Riordian_AW_Lehrer_Mana_01);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
		{
			Info_AddChoice	  (Info_Mod_Riordian_AW_Lehrer, B_BuildLearnString ("Mana Extrakt", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_02)), Info_Mod_Riordian_AW_Lehrer_Mana_02);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
		{
			Info_AddChoice	  (Info_Mod_Riordian_AW_Lehrer, B_BuildLearnString ("Mana Elixier", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_03)), Info_Mod_Riordian_AW_Lehrer_Mana_03);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
		&& (Kapitel >= 4)
		{
			Info_AddChoice	  (Info_Mod_Riordian_AW_Lehrer, B_BuildLearnString ("Elixier des Geistes", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), Info_Mod_Riordian_AW_Lehrer_Perm_Mana);
		};                                                                                                                                                                            
		if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) 
		&& (Kapitel >= 4)
		{                                                                                                                                                                                     
			Info_AddChoice (Info_Mod_Riordian_AW_Lehrer, B_BuildLearnString ("Elixier der Stärke", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), Info_Mod_Riordian_AW_Lehrer_PermSTR);               
		};
		if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
		&& (Kapitel >= 4)
		{
			Info_AddChoice (Info_Mod_Riordian_AW_Lehrer,B_BuildLearnString ("Elixier der Geschicklichkeit", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), Info_Mod_Riordian_AW_Lehrer_Perm_DEX);
		};
		
	};
};
FUNC VOID Info_Mod_Riordian_AW_Lehrer_BACK()
{
	Info_ClearChoices 	(Info_Mod_Riordian_AW_Lehrer);
};
FUNC VOID Info_Mod_Riordian_AW_Lehrer_Genesung()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Genesung);
};
FUNC VOID Info_Mod_Riordian_AW_Lehrer_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_01);
};
FUNC VOID Info_Mod_Riordian_AW_Lehrer_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_02);
};
FUNC VOID Info_Mod_Riordian_AW_Lehrer_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_03);
};
FUNC VOID Info_Mod_Riordian_AW_Lehrer_PermStr()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_STR);
};
FUNC VOID Info_Mod_Riordian_AW_Lehrer_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_DEX);
};
FUNC VOID Info_Mod_Riordian_AW_Lehrer_Perm_Health()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Health);
};
FUNC VOID Info_Mod_Riordian_AW_Lehrer_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_01);
};
FUNC VOID Info_Mod_Riordian_AW_Lehrer_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_02);
};
FUNC VOID Info_Mod_Riordian_AW_Lehrer_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_03);
};
FUNC VOID Info_Mod_Riordian_AW_Lehrer_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Mana);
};

INSTANCE Info_Mod_Riordian_AW_Pickpocket (C_INFO)
{
	npc		= Mod_9003_KDW_Riordian_AW;
	nr		= 1;
	condition	= Info_Mod_Riordian_AW_Pickpocket_Condition;
	information	= Info_Mod_Riordian_AW_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Riordian_AW_Pickpocket_Condition()
{
	C_Beklauen	(148, ItPo_Health_Addon_04, 2);
};

FUNC VOID Info_Mod_Riordian_AW_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Riordian_AW_Pickpocket);

	Info_AddChoice	(Info_Mod_Riordian_AW_Pickpocket, DIALOG_BACK, Info_Mod_Riordian_AW_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Riordian_AW_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Riordian_AW_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Riordian_AW_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Riordian_AW_Pickpocket);
};

FUNC VOID Info_Mod_Riordian_AW_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Riordian_AW_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Riordian_AW_Pickpocket);

		Info_AddChoice	(Info_Mod_Riordian_AW_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Riordian_AW_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Riordian_AW_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Riordian_AW_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Riordian_AW_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Riordian_AW_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Riordian_AW_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Riordian_AW_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Riordian_AW_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Riordian_AW_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Riordian_AW_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Riordian_AW_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Riordian_AW_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Riordian_AW_EXIT (C_INFO)
{
	npc		= Mod_9003_KDW_Riordian_AW;
	nr		= 1;
	condition	= Info_Mod_Riordian_AW_EXIT_Condition;
	information	= Info_Mod_Riordian_AW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Riordian_AW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Riordian_AW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};