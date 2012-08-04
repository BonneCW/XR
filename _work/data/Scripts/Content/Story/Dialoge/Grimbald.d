INSTANCE Info_Mod_Grimbald_Hi (C_INFO)
{
	npc		= Mod_765_NONE_Grimbald_NW;
	nr		= 1;
	condition	= Info_Mod_Grimbald_Hi_Condition;
	information	= Info_Mod_Grimbald_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Grimbald_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Grimbald_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Grimbald_Hi_07_00"); //Verdammt, mach hier nicht so ein Lärm! Oder willst du, dass uns der Schwarze Troll dort hört?
	AI_Output(hero, self, "Info_Mod_Grimbald_Hi_15_01"); //Na auf keinen Fall! Soll ich ihn für dich töten?
	AI_Output(self, hero, "Info_Mod_Grimbald_Hi_07_02"); //Um Adanos Willen, nein! Ich beobachte diese Kreatur schon seit Tagen und es ist faszinierend.
};

INSTANCE Info_Mod_Grimbald_Faszinierend (C_INFO)
{
	npc		= Mod_765_NONE_Grimbald_NW;
	nr		= 1;
	condition	= Info_Mod_Grimbald_Faszinierend_Condition;
	information	= Info_Mod_Grimbald_Faszinierend_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist so faszinierend an dieser hässlichen Kreatur?";
};

FUNC INT Info_Mod_Grimbald_Faszinierend_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Grimbald_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grimbald_Faszinierend_Info()
{
	AI_Output(hero, self, "Info_Mod_Grimbald_Faszinierend_15_00"); //Was ist so faszinierend an dieser hässlichen Kreatur?
	AI_Output(self, hero, "Info_Mod_Grimbald_Faszinierend_07_01"); //Hässliche Kreatur? Mein Junge, du hast keinen Sinn für Ästetik. Schau dir doch nur einmal diese grazielen Bewegungen an.
	AI_Output(hero, self, "Info_Mod_Grimbald_Faszinierend_15_02"); //Nunja ...
	AI_Output(self, hero, "Info_Mod_Grimbald_Faszinierend_07_03"); //Oder sieh nur das Rudel Snapper dort vorne ...
	AI_Output(hero, self, "Info_Mod_Grimbald_Faszinierend_15_04"); //Welche Snapper?
	AI_Output(self, hero, "Info_Mod_Grimbald_Faszinierend_07_05"); //Na die, die der Schwarze Troll erst Vorgestern in den Boden gestampft hat ...
	AI_Output(hero, self, "Info_Mod_Grimbald_Faszinierend_15_06"); //Aha ...
	AI_Output(self, hero, "Info_Mod_Grimbald_Faszinierend_07_07"); //Da fällt mir ein, dass die Snapper schon recht merkwürdig waren.
	AI_Output(self, hero, "Info_Mod_Grimbald_Faszinierend_07_08"); //Kein normales Tier würde einfach einen Schwarzen Troll angreifen, doch die sind einfach blindlings in den Tod gerannt.
	AI_Output(self, hero, "Info_Mod_Grimbald_Faszinierend_07_09"); //Unheimlich agressiv. Sie sahen eh schon ein wenig mitgenommen aus.
	AI_Output(hero, self, "Info_Mod_Grimbald_Faszinierend_15_10"); //Mitgenommen? Du meinst, sie waren verletzt?
	AI_Output(self, hero, "Info_Mod_Grimbald_Faszinierend_07_11"); //Nicht wirklich ... sie sahen einfach nicht gut aus.
	AI_Output(hero, self, "Info_Mod_Grimbald_Faszinierend_15_12"); //Geht es auch genauer?
	AI_Output(self, hero, "Info_Mod_Grimbald_Faszinierend_07_13"); //Ich habe nicht mehr gesehen, sie kamen bereits in den Morgenstunden, haben aber gefaucht wie verrückt.
};

INSTANCE Info_Mod_Grimbald_Dragomir (C_INFO)
{
	npc		= Mod_765_NONE_Grimbald_NW;
	nr		= 1;
	condition	= Info_Mod_Grimbald_Dragomir_Condition;
	information	= Info_Mod_Grimbald_Dragomir_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich komme von Dragomir.";
};

FUNC INT Info_Mod_Grimbald_Dragomir_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Grimbald_Faszinierend))
	&& (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Mitmachen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grimbald_Dragomir_Info()
{
	AI_Output(hero, self, "Info_Mod_Grimbald_Dragomir_15_00"); //Ich komme von Dragomir, er möchte wissen, was du gefunden hast.
	AI_Output(self, hero, "Info_Mod_Grimbald_Dragomir_07_01"); //Hm, dich kenne ich noch gar nicht. Bist wohl noch nicht lange dabei, was?
	AI_Output(hero, self, "Info_Mod_Grimbald_Dragomir_15_02"); //Kann man so sagen, ja.
	AI_Output(self, hero, "Info_Mod_Grimbald_Dragomir_07_03"); //Ich bin Grimbald, einer von Dragomirs Jägern. Ausser dem Schwarzen Troll und den Snappern nicht viel.
	AI_Output(self, hero, "Info_Mod_Grimbald_Dragomir_07_04"); //Eigentlich ein schönes Tal hier zum Jagen, wenn nicht gerade der Schwarze Troll hier wäre und keine Magier stören würden.
	AI_Output(hero, self, "Info_Mod_Grimbald_Dragomir_15_05"); //Hier laufen Magier rum?
	AI_Output(self, hero, "Info_Mod_Grimbald_Dragomir_07_06"); //Ja, manchmal haben die Pfaffen hier irgendeine Zeremonie, verschwinden in der Grotte dort auf der anderen Seite des Sees, scheint aber nichts allzu wichtiges zu sein.
	AI_Output(hero, self, "Info_Mod_Grimbald_Dragomir_15_07"); //Na dann. Gibt es noch etwas?
	AI_Output(self, hero, "Info_Mod_Grimbald_Dragomir_07_08"); //Nein. Und ach, falls du noch nicht bei Nandor gewesen bist, er hat mich bis hierhin begleitet und ist dann den Weg durch die Schlucht weiter in Richtung des Waldes gegangen.
	AI_Output(hero, self, "Info_Mod_Grimbald_Dragomir_15_09"); //Danke, ich geh dann weiter.

	B_LogEntry	(TOPIC_MOD_JG_JAGDGEBIETE, "Grimbald hat ein gutes Jagdgebiet gefunden, welches allerdings durch den scharzen Troll und die Magier, die gelegentlich vorbeikommen, etwas gestört wird.");
};

INSTANCE Info_Mod_Grimbald_Erzbrocken (C_INFO)
{
	npc		= Mod_765_NONE_Grimbald_NW;
	nr		= 1;
	condition	= Info_Mod_Grimbald_Erzbrocken_Condition;
	information	= Info_Mod_Grimbald_Erzbrocken_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Grimbald_Erzbrocken_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Grimbald_Dragomir))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grimbald_Erzbrocken_Info()
{
	AI_Output(self, hero, "Info_Mod_Grimbald_Erzbrocken_07_00"); //Halt, warte mal, das hätte ich fast vergessen.

	B_Say	(hero, self, "$WASISTDENN");

	AI_Output(self, hero, "Info_Mod_Grimbald_Erzbrocken_07_01"); //Hier, diesen merkwürigen Erzbrocken habe ich zwischen den Knochen der toten Snappern gefunden, der ist mir nicht ganz geheuer.

	B_GiveInvItems	(self, hero, ItMi_Erzbrocken_Seltsam, 1);

	AI_Output(self, hero, "Info_Mod_Grimbald_Erzbrocken_07_02"); //Nimm ihn am besten mit zu Dragomir, vielleicht kann er etwas damit anfangen.

	B_LogEntry	(TOPIC_MOD_JG_JAGDGEBIETE, "Grimbald hat mir noch einen merkwürdigen Erzbrocken für Dragomir mitgegeben, den er bei den aggressiven Snappern gefunden hat.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Grimbald_NandorGrom (C_INFO)
{
	npc		= Mod_765_NONE_Grimbald_NW;
	nr		= 1;
	condition	= Info_Mod_Grimbald_NandorGrom_Condition;
	information	= Info_Mod_Grimbald_NandorGrom_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo Grimbald! Bin zurück. Gibt's was Neues?";
};

FUNC INT Info_Mod_Grimbald_NandorGrom_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Grimbald_Erzbrocken))
	&& (Npc_KnowsInfo(hero, Info_Mod_Grom_Dragomir))
	&& (Npc_KnowsInfo(hero, Info_Mod_Nandor_WoelfeTot))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grimbald_NandorGrom_Info()
{
	AI_Output(hero, self, "Info_Mod_Grimbald_NandorGrom_15_00"); //Hallo Grimbald! Bin zurück. Gibt's was Neues?
	AI_Output(self, hero, "Info_Mod_Grimbald_NandorGrom_07_01"); //Eigentlich nicht.
	AI_Output(hero, self, "Info_Mod_Grimbald_NandorGrom_15_02"); //Trotzdem: Bei Nandor hatten wir's mit unnormalen Wölfen zu tun. Hier waren es verrückte Snapper und bei Grom agressive Feldräuber.
	AI_Output(self, hero, "Info_Mod_Grimbald_NandorGrom_07_03"); //Schon seltsam das Ganze. Na ja, Dragomir wird sich schon darum kümmern.
	AI_Output(hero, self, "Info_Mod_Grimbald_NandorGrom_15_04"); //Gewiss doch, Herr Grimbald.
	AI_Output(self, hero, "Info_Mod_Grimbald_NandorGrom_07_05"); //Spinner! Übrigens, da ist mir noch was aufgefallen ...
	AI_Output(hero, self, "Info_Mod_Grimbald_NandorGrom_15_06"); //Hm ...?
	AI_Output(self, hero, "Info_Mod_Grimbald_NandorGrom_07_07"); //Ja. Da unten im Wald, neben dem See, ist auch was im Gange. Höre manchmal Stimmen und Geräusche.
	AI_Output(hero, self, "Info_Mod_Grimbald_NandorGrom_15_08"); //Vielleicht die Höhlenmagier?
	AI_Output(self, hero, "Info_Mod_Grimbald_NandorGrom_07_09"); //Glaube ich nicht. Die kommen immer den Weg.
	AI_Output(hero, self, "Info_Mod_Grimbald_NandorGrom_15_10"); //Verstehe. Ich werde es Dragomir berichten. So, ich muss weiter ...
	AI_Output(self, hero, "Info_Mod_Grimbald_NandorGrom_07_11"); //Mach's gut.
};

INSTANCE Info_Mod_Grimbald_Kapitel2 (C_INFO)
{
	npc		= Mod_765_NONE_Grimbald_NW;
	nr		= 1;
	condition	= Info_Mod_Grimbald_Kapitel2_Condition;
	information	= Info_Mod_Grimbald_Kapitel2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieder was Neues?";
};

FUNC INT Info_Mod_Grimbald_Kapitel2_Condition()
{
	if (Mod_Drago == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grimbald_Kapitel2_Info()
{
	AI_Output(hero, self, "Info_Mod_Grimbald_Kapitel2_15_00"); //Wieder was Neues?
	AI_Output(self, hero, "Info_Mod_Grimbald_Kapitel2_07_01"); //Nicht so arg ... Na ja. Es wird kälter dieser Tage hier oben ... Gehe wohl bald ins Tal.
	AI_Output(hero, self, "Info_Mod_Grimbald_Kapitel2_15_02"); //Mach das. Ich muss ins Minental. Bis dann.
	AI_Output(self, hero, "Info_Mod_Grimbald_Kapitel2_07_03"); //Bis dann.
};

INSTANCE Info_Mod_Grimbald_Untier (C_INFO)
{
	npc		= Mod_765_NONE_Grimbald_NW;
	nr		= 1;
	condition	= Info_Mod_Grimbald_Untier_Condition;
	information	= Info_Mod_Grimbald_Untier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hattest du in letzter Zeit mit ungewöhnlichem Wild zu tun?";
};

FUNC INT Info_Mod_Grimbald_Untier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Grimbald_Untier))
	&& (Mod_Cronos_Artefakt == 2)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grimbald_Untier_Info()
{
	AI_Output(hero, self, "Info_Mod_Grimbald_Untier_15_00"); //Hattest du in letzter Zeit mit ungewöhnlichem Wild zu tun?
	AI_Output(self, hero, "Info_Mod_Grimbald_Untier_07_01"); //Also, abgesehen von lebensmüden Snappern und einem schwarzen Troll ... tatsächlich ...
	AI_Output(hero, self, "Info_Mod_Grimbald_Untier_15_02"); //Ja?
	AI_Output(self, hero, "Info_Mod_Grimbald_Untier_07_03"); //Nachdem ich vor einigen Tagen einige Eber erbeutet hatte, wurde ich des Nachts von einigen Geräuschen geweckt und konnte gerade noch erkennen, wie ein großes Raubtier – es war zu dunkel, um es genau zu erkennen – mit einem der erbeuteten Tiere in der Dunkelheit verschwand.
	AI_Output(hero, self, "Info_Mod_Grimbald_Untier_15_04"); //Wohin ist dieses Tier gelaufen?
	AI_Output(self, hero, "Info_Mod_Grimbald_Untier_07_05"); //Es lief Richtung des Steinkreises im kleinen Wald gleich dort hinten.
	AI_Output(hero, self, "Info_Mod_Grimbald_Untier_15_06"); //Danke, das war alles, was ich hören wollte.

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_ADANOS_NOVIZE, "Grimbald wurde nachts ein erbeutetes Wildtier von einem großen Raubtier gestohlen. Es machte sich Richtung Steinkreis davon.");
};

INSTANCE Info_Mod_Grimbald_Snorre (C_INFO)
{
	npc		= Mod_765_NONE_Grimbald_NW;
	nr		= 1;
	condition	= Info_Mod_Grimbald_Snorre_Condition;
	information	= Info_Mod_Grimbald_Snorre_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Grimbald_Snorre_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragon_Snorre))
	&& (!Npc_KnowsInfo(hero, Info_Mod_KoboldDragon_Stab))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grimbald_Snorre_Info()
{
	AI_Output(self, hero, "Info_Mod_Grimbald_Snorre_07_00"); //Hast du auch diese kleine Flammenkreatur gesehen?
	AI_Output(hero, self, "Info_Mod_Grimbald_Snorre_15_01"); //Flammenkreatur?
	AI_Output(self, hero, "Info_Mod_Grimbald_Snorre_07_02"); //Ja, ist von Richtung Steinkreis gekommen und an mir vorbeigeflitzt. Und wenn mich nicht alles täuscht voll beladen mit Gold.
	AI_Output(self, hero, "Info_Mod_Grimbald_Snorre_07_03"); //Ungewöhnliche Dinge scheinen zurzeit Hochkonjunktur zu haben.
	AI_Output(hero, self, "Info_Mod_Grimbald_Snorre_15_04"); //Und wohin ist das Geschöpf gelaufen?
	AI_Output(self, hero, "Info_Mod_Grimbald_Snorre_07_05"); //Nun, es lief über die Brücke. Und von weitem habe ich dann, wenn mich nicht alles täuscht, den Flammenpunkt im Zugang zu Relendel verschwinden sehen.

	B_LogEntry	(TOPIC_MOD_NL_STAB, "Der Jäger sah Snorre im Zugang zu Relendel verschwinden.");
};

INSTANCE Info_Mod_Grimbald_Moor (C_INFO)
{
	npc		= Mod_765_NONE_Grimbald_NW;
	nr		= 1;
	condition	= Info_Mod_Grimbald_Moor_Condition;
	information	= Info_Mod_Grimbald_Moor_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weißt du zufällig, wo sich ein Moor befindet?";
};

FUNC INT Info_Mod_Grimbald_Moor_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Moorhexe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Moorhexe_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grimbald_Moor_Info()
{
	AI_Output(hero, self, "Info_Mod_Grimbald_Moor_15_00"); //Weißt du zufällig, wo sich ein Moor befindet?
	AI_Output(self, hero, "Info_Mod_Grimbald_Moor_07_01"); //Ein Moor auf Khorinis? Mir ist nur eines bekannt, das "verfluchte Moor". Es befindet sich im Osten von Relendel.

	Info_ClearChoices	(Info_Mod_Grimbald_Moor);

	Info_AddChoice	(Info_Mod_Grimbald_Moor, "Danke, das war alles, was ich wissen wollte.", Info_Mod_Grimbald_Moor_B);
	Info_AddChoice	(Info_Mod_Grimbald_Moor, "Kannst du mich dorthin bringen?", Info_Mod_Grimbald_Moor_A);
};

FUNC VOID Info_Mod_Grimbald_Moor_C()
{
	AI_Output(self, hero, "Info_Mod_Grimbald_Moor_C_07_00"); //Viele Glücksritter haben bereits versucht die Schätze des Moores zu bergen und alle bezahlten es mit dem Leben.
	AI_Output(self, hero, "Info_Mod_Grimbald_Moor_C_07_01"); //Giftige Dämpfe und Moorleichen sollen jedem Eindringling einen grausamen Tot bereiten, so sagt man ... bedenke, worauf du dich da einlässt.

	Info_ClearChoices	(Info_Mod_Grimbald_Moor);
};

FUNC VOID Info_Mod_Grimbald_Moor_B()
{
	AI_Output(hero, self, "Info_Mod_Grimbald_Moor_B_15_00"); //Danke, das war alles, was ich wissen wollte.
	AI_Output(self, hero, "Info_Mod_Grimbald_Moor_B_07_01"); //Falls du dorthin willst, so würde ich dir ernsthaft davon abraten.

	Info_Mod_Grimbald_Moor_C();

	Info_ClearChoices	(Info_Mod_Grimbald_Moor);
};

FUNC VOID Info_Mod_Grimbald_Moor_A()
{
	AI_Output(hero, self, "Info_Mod_Grimbald_Moor_A_15_00"); //Kannst du mich dorthin bringen?
	AI_Output(self, hero, "Info_Mod_Grimbald_Moor_A_07_01"); //Ins verfluchte Moor?! Bist des Wahnsinns?!
	AI_Output(hero, self, "Info_Mod_Grimbald_Moor_A_15_02"); //Es ist wichtig. Das Schicksal von Khorinis könnte davon abhängen.
	AI_Output(self, hero, "Info_Mod_Grimbald_Moor_A_07_03"); //Bist du sicher, dass du mir keinen Troll aufbindest?
	AI_Output(self, hero, "Info_Mod_Grimbald_Moor_A_07_04"); //Falls du dorthin willst mit der Hoffnung dir die Taschen mit Gold zu füllen, so würde ich dir eindringlich davon abraten.

	Info_Mod_Grimbald_Moor_C();

	AI_Output(hero, self, "Info_Mod_Grimbald_Moor_A_15_05"); //Ich schwöre, dass ich die Wahrheit sage.
	AI_Output(hero, self, "Info_Mod_Grimbald_Moor_A_15_06"); //Das Verderben lauert näher, als du denkst (im Stillen) genau genommen in der Kerkerhöhle des Magiers um die Ecke.
	AI_Output(self, hero, "Info_Mod_Grimbald_Moor_A_07_07"); //Hmm, ja vielleicht sprichst du wahr. Ich hörte in letzter Zeit von vielen seltsamen und beunruhigenden Vorkommnissen ...
	AI_Output(self, hero, "Info_Mod_Grimbald_Moor_A_07_08"); //Ist gut, ich bringe dich dorthin. Bleib dicht hinter mir.

	Mod_NL_Grimbald = 1;

	self.aivar[AIV_Partymember] = TRUE;

	Info_ClearChoices	(Info_Mod_Grimbald_Moor);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "RELENDEL");
};

INSTANCE Info_Mod_Grimbald_DragomirErzbrocken (C_INFO)
{
	npc		= Mod_765_NONE_Grimbald_NW;
	nr		= 1;
	condition	= Info_Mod_Grimbald_DragomirErzbrocken_Condition;
	information	= Info_Mod_Grimbald_DragomirErzbrocken_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Grimbald_DragomirErzbrocken_Condition()
{
	if (Mod_JG_GrimbaldTeacher == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grimbald_DragomirErzbrocken_Info()
{
	AI_Output(self, hero, "Info_Mod_Grimbald_DragomirErzbrocken_07_00"); //Hast du mit Dragomir über den Erzbrocken gesprochen?
	AI_Output(hero, self, "Info_Mod_Grimbald_DragomirErzbrocken_15_01"); //Ja, er ist ihm nicht geheuer und deswegen hat er ihn mir wieder mitgegeben.
	AI_Output(self, hero, "Info_Mod_Grimbald_DragomirErzbrocken_07_02"); //Sag ich ja. Aber danke, dass du ihn mir abgenommen hast, ich hätte ihn nicht länger in meiner Nähe haben wollen.
	AI_Output(self, hero, "Info_Mod_Grimbald_DragomirErzbrocken_07_03"); //Wenn du willst, dann kann ich dir ein bisschen was über die Jagd beibringen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_KHORINIS, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_KHORINIS, "Der Jäger Grimbald kann mir etwas über die Jagd beibringen.");
};

INSTANCE Info_Mod_Grimbald_Lernen (C_INFO)
{
	npc		= Mod_765_NONE_Grimbald_NW;
	nr          	= 1;
	condition	= Info_Mod_Grimbald_Lernen_Condition;
	information	= Info_Mod_Grimbald_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Was kannst du mir beibringen?";
};

FUNC INT Info_Mod_Grimbald_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Grimbald_DragomirErzbrocken))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grimbald_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Grimbald_Lernen_15_00"); //Was kannst du mir beibringen?

	if ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE))
	{
		AI_Output(self, hero, "Info_Mod_Grimbald_Lernen_07_01"); //Kommt darauf an, was du wissen willst.

		Info_ClearChoices	(Info_Mod_Grimbald_Lernen);

		Info_AddChoice	(Info_Mod_Grimbald_Lernen, DIALOG_BACK, Info_Mod_Grimbald_Lernen_BACK);

		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Grimbald_Lernen, B_BuildLearnString("Zähne reissen", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), Info_Mod_Grimbald_Lernen_Teeth);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Grimbald_Lernen, B_BuildLearnString("Tiere häuten", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ReptileSkin)), Info_Mod_Grimbald_Lernen_ReptileSkin);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Grimbald_Lernen, B_BuildLearnString("Klauen hacken", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)), Info_Mod_Grimbald_Lernen_Claws);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Grimbald_Lernen, B_BuildLearnString("Fliegenstachel", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)), Info_Mod_Grimbald_Lernen_BFSting);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Grimbald_Lernen, B_BuildLearnString("Fliegenflügel", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)), Info_Mod_Grimbald_Lernen_BFWing);
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Grimbald_Lernen_07_02"); //Ich kann dir im Moment nicht mehr beibringen, als du ohnehin schon weißt. Tut mir Leid.
	};
};

FUNC void Info_Mod_Grimbald_Lernen_BACK()
{
	Info_ClearChoices (Info_Mod_Grimbald_Lernen);
};

FUNC void Info_Mod_Grimbald_Lernen_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Claws))
	{
		AI_Output(self, hero, "Info_Mod_Grimbald_Lernen_Claws_07_00"); //Tiere geben ihre Klauen nicht sehr gerne her. Du musst schon sehr genau den Punkt treffen, an dem du mit deinem Messer ansetzt.
		AI_Output(self, hero, "Info_Mod_Grimbald_Lernen_Claws_07_01"); //Die Haltung deiner Hand sollte etwas verschränkt sein. Mit einem kräftigen Ruck trennst du dann die Klaue ab.
		AI_Output(self, hero, "Info_Mod_Grimbald_Lernen_Claws_07_02"); //Klauen sind immer ein begehrtes Zahlungsmittel bei einem Händler.
	};

	Info_ClearChoices	(Info_Mod_Grimbald_Lernen);

	Info_AddChoice	(Info_Mod_Grimbald_Lernen, DIALOG_BACK, Info_Mod_Grimbald_Lernen_BACK);
		
};

FUNC void Info_Mod_Grimbald_Lernen_ReptileSkin()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_ReptileSkin))
	{
		AI_Output(self, hero, "Info_Mod_Grimbald_Lernen_ReptileSkin_07_00"); //Und immer nur am Bauch aufschneiden, sonst verminderst du die Qualität.
	};

	Info_ClearChoices	(Info_Mod_Grimbald_Lernen);

	Info_AddChoice	(Info_Mod_Grimbald_Lernen, DIALOG_BACK, Info_Mod_Grimbald_Lernen_BACK);
};

FUNC void Info_Mod_Grimbald_Lernen_Teeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Teeth))
	{
		AI_Output(self, hero, "Info_Mod_Grimbald_Lernen_Teeth_07_00"); //Das einfachste, was du Tieren entnehmen kannst, sind seine Zähne. Du fährst mit deinem Messer in seinem Maul um das Gebiss.
		AI_Output(self, hero, "Info_Mod_Grimbald_Lernen_Teeth_07_01"); //Dann trennst es geschickt mit einem Ruck vom Schädel des Tieres.
	};

	Info_ClearChoices	(Info_Mod_Grimbald_Lernen);

	Info_AddChoice	(Info_Mod_Grimbald_Lernen, DIALOG_BACK, Info_Mod_Grimbald_Lernen_BACK);
};

FUNC void Info_Mod_Grimbald_Lernen_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Fur))
	{
		AI_Output(self, hero, "Info_Mod_Grimbald_Lernen_Fur_07_00"); //Felle ziehst du am besten ab, indem du einen tiefen Schnitt an den Hinterläufen des Tieres vornimmst.
		AI_Output(self, hero, "Info_Mod_Grimbald_Lernen_Fur_07_01"); //Dann kannst du das Fell von vorne nach hinten eigentlich immer sehr leicht abziehen.
	};

	Info_ClearChoices	(Info_Mod_Grimbald_Lernen);

	Info_AddChoice	(Info_Mod_Grimbald_Lernen, DIALOG_BACK, Info_Mod_Grimbald_Lernen_BACK);
};

FUNC void Info_Mod_Grimbald_Lernen_BFSting()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_BFSting))
	{
		AI_Output(self, hero, "Info_Mod_Grimbald_Lernen_BFSting_07_00"); //Die Fliege hat am Rücken eine weiche Stelle.
		AI_Output(self, hero, "Info_Mod_Grimbald_Lernen_BFSting_07_01"); //Wenn du dort mit der Hand gegen drückst, fährt der Stachel sehr weit aus und du kannst ihn mit dem Messer abtrennen.
	};

	Info_ClearChoices	(Info_Mod_Grimbald_Lernen);

	Info_AddChoice	(Info_Mod_Grimbald_Lernen, DIALOG_BACK, Info_Mod_Grimbald_Lernen_BACK);
};

FUNC void Info_Mod_Grimbald_Lernen_BFWing()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_BFWing))
	{
		AI_Output(self, hero, "Info_Mod_Grimbald_Lernen_BFWing_07_00"); //Die Flügel einer Fliege entfernst du am besten mit einem Hieb einer scharfen Klinge sehr nah am Körper der Fliege.
		AI_Output(self, hero, "Info_Mod_Grimbald_Lernen_BFWing_07_01"); //Du musst nur darauf achten, dass du das feine Gewebe der Flügel nicht verletzt. Sie sind nichts mehr wert, wenn du es nicht vorsichtig machst.
	};

	Info_ClearChoices	(Info_Mod_Grimbald_Lernen);

	Info_AddChoice	(Info_Mod_Grimbald_Lernen, DIALOG_BACK, Info_Mod_Grimbald_Lernen_BACK);
};

INSTANCE Info_Mod_Grimbald_Pickpocket (C_INFO)
{
	npc		= Mod_765_NONE_Grimbald_NW;
	nr		= 1;
	condition	= Info_Mod_Grimbald_Pickpocket_Condition;
	information	= Info_Mod_Grimbald_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Grimbald_Pickpocket_Condition()
{
	C_Beklauen	(80, ItAt_Sting, 4);
};

FUNC VOID Info_Mod_Grimbald_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Grimbald_Pickpocket);

	Info_AddChoice	(Info_Mod_Grimbald_Pickpocket, DIALOG_BACK, Info_Mod_Grimbald_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Grimbald_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Grimbald_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Grimbald_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Grimbald_Pickpocket);
};

FUNC VOID Info_Mod_Grimbald_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Grimbald_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Grimbald_Pickpocket);

		Info_AddChoice	(Info_Mod_Grimbald_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Grimbald_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Grimbald_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Grimbald_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Grimbald_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Grimbald_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Grimbald_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Grimbald_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Grimbald_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Grimbald_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Grimbald_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Grimbald_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Grimbald_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Grimbald_EXIT (C_INFO)
{
	npc		= Mod_765_NONE_Grimbald_NW;
	nr		= 1;
	condition	= Info_Mod_Grimbald_EXIT_Condition;
	information	= Info_Mod_Grimbald_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Grimbald_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Grimbald_EXIT_Info()
{
	AI_StopProcessInfos	(self);

	if (Npc_KnowsInfo(hero, Info_Mod_Grimbald_Dragomir))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Grimbald_Erzbrocken))
	{
		AI_Wait	(hero, 1);
	};
};