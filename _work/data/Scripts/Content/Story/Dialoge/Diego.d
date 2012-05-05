INSTANCE Info_Mod_Diego_Hi (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Hi_Condition;
	information	= Info_Mod_Diego_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Diego_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Diego_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Diego_Hi_11_00"); //Du lebst ja noch.
	AI_Output(hero, self, "Info_Mod_Diego_Hi_15_01"); //Mit einer kurzen Unterbrechung, ja.
	AI_Output(self, hero, "Info_Mod_Diego_Hi_11_02"); //Verdammt, die erste gute Nachricht seit Tagen. Wir hatten dich schon abgeschrieben.
	AI_Output(hero, self, "Info_Mod_Diego_Hi_15_03"); //Doch hier stehe ich.
	AI_Output(self, hero, "Info_Mod_Diego_Hi_11_04"); //Irgendwann musst du mir erzählen, was du da im Schläfertempel getrieben hast.
	AI_Output(self, hero, "Info_Mod_Diego_Hi_11_05"); //Aber du weißt sicher auch noch nicht alles, was seitdem geschehen ist.
};

INSTANCE Info_Mod_Diego_WasFuerWelt (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_WasFuerWelt_Condition;
	information	= Info_Mod_Diego_WasFuerWelt_Info;
	permanent	= 0;
	important	= 0;
	description	= "In was für einer Welt sind wir hier eigentlich gelandet?";
};

FUNC INT Info_Mod_Diego_WasFuerWelt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_WasFuerWelt_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_WasFuerWelt_15_00"); //In was für einer Welt sind wir hier eigentlich gelandet?
	AI_Output(self, hero, "Info_Mod_Diego_WasFuerWelt_11_01"); //In einer komplizierten. So weit ich es mitbekomme, neigt sich die idyllische Zeit der Insel dem Ende zu.
	AI_Output(self, hero, "Info_Mod_Diego_WasFuerWelt_11_02"); //Die Paladine versuchen verzweifelt, eine Lösung zu finden, wie sie uns, die Sträflinge, unschädlich machen können.
	AI_Output(self, hero, "Info_Mod_Diego_WasFuerWelt_11_03"); //Einige unter ihnen bevorzugen ziemlich rabiate Lösungen.
	AI_Output(self, hero, "Info_Mod_Diego_WasFuerWelt_11_04"); //Wir haben Glück, dass Lord Hagen so wankelmütig ist - andernfalls würden sie wohl zielgerichteter gegen uns vorgehen.
	AI_Output(self, hero, "Info_Mod_Diego_WasFuerWelt_11_05"); //Viele Koloniebewohner trauen sich wegen der Miliz nicht in die Stadt.
	AI_Output(self, hero, "Info_Mod_Diego_WasFuerWelt_11_06"); //Sie sammeln sich in Gruppen außerhalb, so zum Beispiel auf dem Hof des Bauern Onar.
	AI_Output(self, hero, "Info_Mod_Diego_WasFuerWelt_11_07"); //Ich bezweifle, dass das auf Dauer gut geht. Milizionäre und Paladine fühlen sich eingekreist, und dann ... ja, dann tut jemand etwas im falschen Moment, und mit dem Frieden ist es vorbei.
	AI_Output(hero, self, "Info_Mod_Diego_WasFuerWelt_15_08"); //Auf welcher Seite würdest du stehen?
	AI_Output(self, hero, "Info_Mod_Diego_WasFuerWelt_11_09"); //Ha! Als ob ich mich in die Kriegsspiele dieser Dummköpfe einmischen würde!
	AI_Output(hero, self, "Info_Mod_Diego_WasFuerWelt_15_10"); //Die Rolle des Beobachters gefällt dir wohl.
	AI_Output(self, hero, "Info_Mod_Diego_WasFuerWelt_11_11"); //Man erfährt so einiges. In jüngster Zeit wurde an mehreren Orten eine vermummte Gestalt gesehen, die die Bauern in Panik versetzt.
	AI_Output(hero, self, "Info_Mod_Diego_WasFuerWelt_15_12"); //Ich habe sie vor Xardas' Turm gesehen.
	AI_Output(self, hero, "Info_Mod_Diego_WasFuerWelt_11_13"); //Xardas?! Sag bloß, der Kerl hat immer noch seine Finger im Spiel!
	AI_Output(hero, self, "Info_Mod_Diego_WasFuerWelt_15_14"); //Auch er spricht von einer neuen Bedrohung.
	AI_Output(self, hero, "Info_Mod_Diego_WasFuerWelt_11_15"); //(murmelt) Hätte mich auch gewundert, wenn es mit Xardas jemals langweilig werden würde ... (laut) Was hast du jetzt als nächstes vor?

	Info_ClearChoices	(Info_Mod_Diego_WasFuerWelt);

	Info_AddChoice	(Info_Mod_Diego_WasFuerWelt, "Ich lasse mich einfach treiben.", Info_Mod_Diego_WasFuerWelt_B);
	Info_AddChoice	(Info_Mod_Diego_WasFuerWelt, "Ich mache mich als Erstes mit den Gruppierungen vertraut.", Info_Mod_Diego_WasFuerWelt_A);
};

FUNC VOID Info_Mod_Diego_WasFuerWelt_C()
{
	AI_Output(self, hero, "Info_Mod_Diego_WasFuerWelt_C_11_00"); //Ich kann dir etwas über den Ring des Wassers erzählen, wenn du möchtest.

	Info_ClearChoices	(Info_Mod_Diego_WasFuerWelt);
};

FUNC VOID Info_Mod_Diego_WasFuerWelt_B()
{
	AI_Output(hero, self, "Info_Mod_Diego_WasFuerWelt_B_15_00"); //Ich lasse mich einfach treiben.
	AI_Output(self, hero, "Info_Mod_Diego_WasFuerWelt_B_11_01"); //Du hast es dir zwar eigentlich verdient, aber Müßiggang können wir uns jetzt nicht mehr erlauben.

	Info_Mod_Diego_WasFuerWelt_C();
};

FUNC VOID Info_Mod_Diego_WasFuerWelt_A()
{
	AI_Output(hero, self, "Info_Mod_Diego_WasFuerWelt_A_15_00"); //Ich mache mich als Erstes mit den Gruppierungen vertraut.
	AI_Output(self, hero, "Info_Mod_Diego_WasFuerWelt_A_11_01"); //Wie in der Kolonie, was?

	Info_Mod_Diego_WasFuerWelt_C();
};

INSTANCE Info_Mod_Diego_WasJetzt (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_WasJetzt_Condition;
	information	= Info_Mod_Diego_WasJetzt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du jetzt?";
};

FUNC INT Info_Mod_Diego_WasJetzt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_WasJetzt_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_WasJetzt_15_00"); //Was machst du jetzt?
	AI_Output(self, hero, "Info_Mod_Diego_WasJetzt_11_01"); //Wenn ich nicht gerade bei den Wassermagiern gebraucht werde, versuche ich, meinem alten Gewerbe nachzugehen.
	AI_Output(self, hero, "Info_Mod_Diego_WasJetzt_11_02"); //Jeder muss sehen, wo er bleibt.
	AI_Output(hero, self, "Info_Mod_Diego_WasJetzt_15_03"); //Wo gibt es denn in Khorinis was zu holen?
	AI_Output(self, hero, "Info_Mod_Diego_WasJetzt_11_04"); //Im oberen Viertel. Aber da ist alles voll mit Paladinen.
	AI_Output(self, hero, "Info_Mod_Diego_WasJetzt_11_05"); //Hier im Hafenviertel sind die meisten arme Schlucker.
};

INSTANCE Info_Mod_Diego_RingDesWassers (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_RingDesWassers_Condition;
	information	= Info_Mod_Diego_RingDesWassers_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hat es mit dem Ring des Wassers auf sich?";
};

FUNC INT Info_Mod_Diego_RingDesWassers_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_WasFuerWelt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_RingDesWassers_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_RingDesWassers_15_00"); //Was hat es mit dem Ring des Wassers auf sich?
	AI_Output(self, hero, "Info_Mod_Diego_RingDesWassers_11_01"); //Wir sind Augen und Ohren der Wassermagier.
	AI_Output(hero, self, "Info_Mod_Diego_RingDesWassers_15_02"); //Du lässt dich mit den Wassermagiern ein?
	AI_Output(self, hero, "Info_Mod_Diego_RingDesWassers_11_03"); //Sie sind die Einzigen, die vernünftig bleiben und nicht ihren ideologischen Quatsch vor alles andere stellen.
	AI_Output(self, hero, "Info_Mod_Diego_RingDesWassers_11_04"); //Wir müssen ja deswegen keine guten Freunde sein.
	AI_Output(self, hero, "Info_Mod_Diego_RingDesWassers_11_05"); //Vatras ist unser Ansprechpartner in Khorinis. Wenn du Interesse hast, solltest du dich bei ihm melden.
	AI_Output(self, hero, "Info_Mod_Diego_RingDesWassers_11_06"); //Wir sind da an einer großen Sache dran.
};

INSTANCE Info_Mod_Diego_Boring (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Boring_Condition;
	information	= Info_Mod_Diego_Boring_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Diego_Boring_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Hi))
	&& (Kapitel >= 3)
	&& (Mod_Mario_Diego == 0)
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Andre_Auftrag))
	|| (Mod_PalaKapitel3 >= 4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Boring_Info()
{
	AI_Output(self, hero, "Info_Mod_Diego_Boring_11_00"); //Hey, hast du mal 'nen Augenblick Zeit? Für einen kleinen Spaziergang?
	AI_Output(hero, self, "Info_Mod_Diego_Boring_15_01"); //Um der alten Zeiten willen?
	AI_Output(self, hero, "Info_Mod_Diego_Boring_11_02"); //Um der alten Zeiten willen, genau.
};

INSTANCE Info_Mod_Diego_Boring2 (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Boring2_Condition;
	information	= Info_Mod_Diego_Boring2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lass uns aufbrechen.";
};

FUNC INT Info_Mod_Diego_Boring2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Boring))
	&& (Mod_DiegoDabei == 0)
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Andre_Auftrag))
	|| (Mod_PalaKapitel3 >= 4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Boring2_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_Boring2_15_00"); //Lass uns aufbrechen.
	AI_Output(self, hero, "Info_Mod_Diego_Boring2_11_01"); //Los geht's.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "LIGHTHOUSE");
};

INSTANCE Info_Mod_Diego_Boring3 (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Boring3_Condition;
	information	= Info_Mod_Diego_Boring3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Diego_Boring3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Boring2))
	&& (Npc_GetDistToWP(self, "WP_DIEGO_ERINNERUNG_03") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Boring3_Info()
{
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_11_00"); //Hör mal - ich weiß nicht, wie lange ich noch in Khorinis bleibe.
	AI_Output(hero, self, "Info_Mod_Diego_Boring3_15_01"); //Was ist los?
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_11_02"); //Es gibt hier nichts zu tun für mich. Ich bin nicht für eine geregelte Arbeit geschaffen.
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_11_03"); //Aber im Hafenviertel ist nichts zu holen, und weiter oben hab ich die Stadtwache am Hals.
	AI_Output(hero, self, "Info_Mod_Diego_Boring3_15_04"); //Wir Sträflinge sind eben nicht gern gesehen.
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_11_05"); //Du sagst es! Manchmal glaube ich, dass die Zeit in der Barriere doch gar nicht so schlecht war.
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_11_06"); //In gewisser Hinsicht waren wir freier, als wir es jetzt sind.
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_11_07"); //(seufzt) Mann, die paar Schweine im Alten Lager wie die Erzbarone waren mir immer noch lieber als diese verdammten Paladine, die dich am liebsten aufknüpfen würden, sobald du die Nase hochziehst.
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_11_08"); //Was meinst du - war es damals vielleicht sogar besser als heutzutage hier?

	Info_ClearChoices	(Info_Mod_Diego_Boring3);

	Info_AddChoice	(Info_Mod_Diego_Boring3, "Man merkt, wie du die Vergangenheit verklärst.", Info_Mod_Diego_Boring3_B);
	Info_AddChoice	(Info_Mod_Diego_Boring3, "Ja, ich finde schon.", Info_Mod_Diego_Boring3_A);
};

FUNC VOID Info_Mod_Diego_Boring3_C()
{
	AI_Output(hero, self, "Info_Mod_Diego_Boring3_C_15_00"); //Warum kehrst du nicht zurück ins Alte Lager?
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_C_11_01"); //Es ist nicht mehr so wie früher.
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_C_11_02"); //Die Jungs dort müssen jetzt auch hart für ihr täglich Brot schuften, den ganzen Tag auf der faulen Haut liegen ist nicht mehr drin.
	AI_Output(hero, self, "Info_Mod_Diego_Boring3_C_15_03"); //Wohin willst du dann?
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_C_11_04"); //Auf Khorinis kann ich's vergessen.
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_C_11_05"); //Bis auf die Stadt gibt es nur kleine Gemeinschaften, da würde es auffallen, wenn ich mich austoben würde.
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_C_11_06"); //Nein, ich will weg von hier. Wie sieht's aus, kommst du mit?

	Info_ClearChoices	(Info_Mod_Diego_Boring3);

	Info_AddChoice	(Info_Mod_Diego_Boring3, "Nein, meine Zukunft liegt auf Khorinis.", Info_Mod_Diego_Boring3_E);
	Info_AddChoice	(Info_Mod_Diego_Boring3, "Ohne zu zögern, sobald ich hier fertig bin.", Info_Mod_Diego_Boring3_D);
};

FUNC VOID Info_Mod_Diego_Boring3_B()
{
	AI_Output(hero, self, "Info_Mod_Diego_Boring3_B_15_00"); //Man merkt, wie du die Vergangenheit verklärst.
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_B_11_01"); //Ich versteh schon, für dich war es immer schwerer.
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_B_11_02"); //Von den schönen Seiten hast du wenig mitgekriegt, warst ja permanent auf Achse und hast dich mit den Leitwölfen angelegt. (lacht)

	Info_Mod_Diego_Boring3_C();
};

FUNC VOID Info_Mod_Diego_Boring3_A()
{
	AI_Output(hero, self, "Info_Mod_Diego_Boring3_A_15_00"); //Ja, ich finde schon.
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_A_11_01"); //Schade, dass es vorbei ist. Meine Fingerfertigkeit wurde nicht oft in meinem Leben bewundert.

	Info_Mod_Diego_Boring3_C();
};

FUNC VOID Info_Mod_Diego_Boring3_F()
{
	AI_Output(hero, self, "Info_Mod_Diego_Boring3_F_15_00"); //Bis dann.

	Info_ClearChoices	(Info_Mod_Diego_Boring3);

	AI_StopProcessInfos	(hero);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_588_WNOV_Joe_NW, "START");
};

FUNC VOID Info_Mod_Diego_Boring3_E()
{
	AI_Output(hero, self, "Info_Mod_Diego_Boring3_E_15_00"); //Nein, meine Zukunft liegt auf Khorinis.
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_E_11_01"); //Ich habe fast vermutet, dass du das sagst.
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_E_11_02"); //Aber weißt du: Ich glaube nicht, dass du nach Khorinis gehörst.
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_E_11_03"); //Überleg's dir noch mal, ich breche ja nicht sofort auf.

	Info_Mod_Diego_Boring3_F();
};

FUNC VOID Info_Mod_Diego_Boring3_D()
{
	AI_Output(hero, self, "Info_Mod_Diego_Boring3_D_15_00"); //Ohne zu zögern, sobald ich hier fertig bin.
	AI_Output(self, hero, "Info_Mod_Diego_Boring3_D_11_01"); //Wenn es soweit ist, sag mir Bescheid. Du weißt ja, wo ich bin.

	Info_Mod_Diego_Boring3_F();
};

INSTANCE Info_Mod_Diego_Daemonisch (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Daemonisch_Condition;
	information	= Info_Mod_Diego_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Diego_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Diego_Daemonisch_11_00"); //Wieder auf der Jagd nach Monstern und Orks.
	AI_Output(hero, self, "Info_Mod_Diego_Daemonisch_15_01"); //Ja, das übliche ... im Moment aber eher auf der Jagd nach Informationen.
	AI_Output(hero, self, "Info_Mod_Diego_Daemonisch_15_02"); //Vielleicht kannst du mir ja erzählen, ob du etwas gehört hast, da du schon den Tag in der Kneipe verbringst.
	AI_Output(self, hero, "Info_Mod_Diego_Daemonisch_11_03"); //Naja, es ist eben wenig los am Hafen, nicht viel, was ich im Auge behalten müsste.
	AI_Output(self, hero, "Info_Mod_Diego_Daemonisch_11_04"); //Dafür soll  bei den Stadttoren allerlei vorgefallen sein. Habe nur Waages gehört.
	AI_Output(self, hero, "Info_Mod_Diego_Daemonisch_11_05"); //Ziemlich viele Leute gehen Zurzeit aus und ein - vor allem beim Osttor - und andere wollen dunkle Erscheinungen gesichtet haben.
	AI_Output(self, hero, "Info_Mod_Diego_Daemonisch_11_06"); //Du solltest dich am besten Vorort umschauen, wenn du mehr erfahren willst.
	AI_Output(self, hero, "Info_Mod_Diego_Daemonisch_11_07"); //Achja, und in der Taverne ’Zur fröhlichen Mastsau’ tummeln sich ebenfalls viele Leute Zurzeit.
	AI_Output(self, hero, "Info_Mod_Diego_Daemonisch_11_08"); //(lacht) Coragon wird wohl bald Engpässe befürchten müssen, wenn die Leute weiterhin so viel verschlingen.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Diego berichtete mir davon, dass vor den Stadttoren viel vor sich geht. Zahlreiche Leute gehen ein und aus und dunkle Erscheinungen sollen gesichtet worden sein. In Coragon’s Taverne treiben sich ebenfalls häufig viele Leute herum und stopfen sich die Wänste voll für drei.");
};

INSTANCE Info_Mod_Diego_Daemonisch2 (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Daemonisch2_Condition;
	information	= Info_Mod_Diego_Daemonisch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Diego_Daemonisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Hi))
	&& (Mod_HQ_Daemonisch == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Daemonisch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Diego_Daemonisch2_11_00"); //Alles in Ordnung?
	AI_Output(hero, self, "Info_Mod_Diego_Daemonisch2_15_01"); //Ja, denke schon ... war nur ein harmloser Schlafzauber.
	AI_Output(hero, self, "Info_Mod_Diego_Daemonisch2_15_02"); //Konntest du sehen, wohin er gelaufen ist?
	AI_Output(self, hero, "Info_Mod_Diego_Daemonisch2_11_03"); //Er war verdammt schnell, aber ich glaubte noch erkennen zu können, wie er zum Südtor lief.
	AI_Output(hero, self, "Info_Mod_Diego_Daemonisch2_15_04"); //Dann habe ich keine Zeit zu verlieren. Erklärungen gibt’s später.
	AI_Output(self, hero, "Info_Mod_Diego_Daemonisch2_11_05"); //In Ordnung, lass sich nicht aufhalten.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Das muss er sein. Zum Südtor, hinterher.");

	AI_StopProcessInfos	(self);

	if (Mod_HQ_Daemonisch_SP_01 == 2)
	{
		B_StartOtherRoutine	(Mod_753_NOV_Ulf_NW, "DAEMONISCH3");
	}
	else if (Mod_HQ_Daemonisch_SP_02 == 2)
	{
		B_StartOtherRoutine	(Mod_541_NONE_Till_NW, "DAEMONISCH3");
	}
	else if (Mod_HQ_Daemonisch_SP_03 == 2)
	{
		B_StartOtherRoutine	(Mod_754_NONE_Valentino_NW, "DAEMONISCH3");
	};
};

INSTANCE Info_Mod_Diego_Irdorath (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Irdorath_Condition;
	information	= Info_Mod_Diego_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich muss mit einem Schiff zu einer nicht ungefährlichen Insel aufbrechen (...)";
};

FUNC INT Info_Mod_Diego_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_Irdorath_15_00"); //Ich muss mit einem Schiff zu einer nicht ungefährlichen Insel aufbrechen und Suche nach einer geeigneten Mannschaft.
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath_11_01"); //Aha, nun führt dich der Kampf gegen Xeres also mit dem Schiff von der Insel ...
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath_11_02"); //Nun, ich denke Vatras wäre nicht abgeneigt, dich zu begleiten ... er hat ja durchaus wahrgenommen, welcher Gefahr sich die Stadt durch Xeres und seinen Schergen ausgesetzt sah.
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath_11_03"); //Und wenn es um die Unterstützung durch kampferprobte Wasserkrieger geht, so solltest du dich an den Hüter Ethan wenden ...
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath_11_04"); //Achja, zu allererst solltest du natürlich einen Kapitän finden. Hast du schon einen?
	AI_Output(hero, self, "Info_Mod_Diego_Irdorath_15_05"); //Ähh, nein.
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath_11_06"); //Nun, ohne Kapitän läuft natürlich nichts.
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath_11_07"); //Unter seinem Kommando muss das Schiff die Insel heil erreichen und er wird einiges mitbestimmen, auch, was die Zusammensetzung der Mannschaft betrifft ...
	AI_Output(hero, self, "Info_Mod_Diego_Irdorath_15_08"); //Ja, ok. Kannst du mir denn  fähige Kapitäne empfehlen?
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath_11_09"); //Tja, viele gibt es nicht.
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath_11_10"); //Als erstes wäre da Paladin Cedric. Er hat das Schiff sicher in den Hafen von Khorinis geführt.
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath_11_11"); //Zweifelsfrei ein fähiger Kapitän ... allerdings wird er es sich bestimmt nicht nehmen lassen einige Auflagen zu machen, wer mitgenommen wird und wer nicht.
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath_11_12"); //Ich glaube zur Zeit trainiert er neben dem Rathaus im oberen Viertel.
	AI_Output(hero, self, "Info_Mod_Diego_Irdorath_15_13"); //Hmm, ok, wen gibt es noch?
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath_11_14"); //Ich habe davon gehört, dass Jack vor nicht allzu ferner Zeit einmal Kapitän  gewesen ist.
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath_11_15"); //Auch, wenn er nicht mehr der jüngste ist, so hat er doch unheimlich viel Erfahrung in der Schifffahrt.
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath_11_16"); //Er wird bestimmt teilweise sehr pragmatische Entscheidungen treffen, dir aber auch ansonsten freie Hand lassen, wen du mit an Bord nimmst.
	AI_Output(hero, self, "Info_Mod_Diego_Irdorath_15_17"); //Ok, gut und wen gibt es noch?
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath_11_18"); //Tja, das waren dann auch schon alle, die mir bekannt sind.
	AI_Output(hero, self, "Info_Mod_Diego_Irdorath_15_19"); //Was?! Wirklich keine große Auswahl ...
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath_11_20"); //Du kommst ja viel herum. Vielleicht begegnest du ja noch jemanden irgendwo auf Khorinis, der geeignet ist, dass Kapitänsamt zu bekleiden. Viel Glück.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Diego hat mir als weitere mögliche Kandidaten Vatras und den Hüter Ethan genannt. Als Kapitäne kommen in der Stadt nur Jack oder der Paladin Cedric in Frage, falls ich nicht noch anderswo auf der Insel jemanden finde.");
};

INSTANCE Info_Mod_Diego_Irdorath2 (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Irdorath2_Condition;
	information	= Info_Mod_Diego_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und wie ist es mit dir? Würdest du meiner Mannschaft beitreten?";
};

FUNC INT Info_Mod_Diego_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_Irdorath2_15_00"); //Und wie ist es mit dir? Würdest du meiner Mannschaft beitreten?
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath2_11_01"); //Natürlich, ich habe nur darauf gewartet, dass du fragst.
	AI_Output(hero, self, "Info_Mod_Diego_Irdorath2_15_02"); //Freut mich. Dann willkommen an Bord. Wir sehen uns dann beim Schiff.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Sehr gut, Diego ist schon mal mit dabei.");

	B_GivePlayerXP	(150);

	Mod_DiegoDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Diego_Irdorath3 (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Irdorath3_Condition;
	information	= Info_Mod_Diego_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tut mir leid, aber es scheint das wir zu viele sind.";
};

FUNC INT Info_Mod_Diego_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_DiegoDabei == 1)
	&& (Mod_JackDabei == 1)
	&& (Mod_CrewCount > 15)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_Irdorath3_15_00"); //Tut mir leid, aber es scheint das wir zu viele sind. Ich kann dich doch nicht mitnehmen.
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath3_11_01"); //Schade. Ich gehe dann wieder zurück. Du weißt wo du mich findest, wenn doch noch ein Platz frei werden sollte.

	Mod_DiegoDabei = 0;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Diego_Irdorath4 (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Irdorath4_Condition;
	information	= Info_Mod_Diego_Irdorath4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich kann dich doch mitnehmen.";
};

FUNC INT Info_Mod_Diego_Irdorath4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_DiegoDabei == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Irdorath4_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_Irdorath4_15_00"); //Ich kann dich doch mitnehmen. Es hat sich noch ein Platz auf dem Schiff gefunden.
	AI_Output(self, hero, "Info_Mod_Diego_Irdorath4_11_01"); //Sehr gut, ich bin dann wieder am Hafen.

	Mod_DiegoDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Diego_Kap6 (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Kap6_Condition;
	information	= Info_Mod_Diego_Kap6_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Diego_Kap6_Condition()
{
	if (Mod_Xardas_Ende == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Kap6_Info()
{
	var c_npc Diego; Diego = Hlp_GetNpc(Mod_538_RDW_Diego_NW);
	var c_npc Lester; Lester = Hlp_GetNpc(Mod_557_PSINOV_Lester_NW);
	var c_npc Milten; Milten = Hlp_GetNpc(Mod_534_KDF_Milten_NW);
	var c_npc Gorn; Gorn = Hlp_GetNpc(Mod_533_SLD_Gorn_NW);

	TRIA_Invite(Lester);
	TRIA_Invite(Milten);
	TRIA_Invite(Gorn);

	TRIA_Start();

	AI_TurnToNpc	(Diego, hero);
	AI_TurnToNpc	(Lester, hero);
	AI_TurnToNpc	(Milten, hero);
	AI_TurnToNpc	(Gorn, hero);

	TRIA_Next(Diego);

	AI_Output(hero, self, "Info_Mod_Diego_Kap6_15_00"); //(verwundert) Was macht ihr denn hier?
	AI_Output(self, hero, "Info_Mod_Diego_Kap6_11_01"); //Wir haben gehört, dass du den ganzen Spaß für dich willst.

	TRIA_Next(Gorn);

	AI_Output(self, hero, "Info_Mod_Diego_Kap6_12_02"); //Dabei hab ich doch meine Axt gerade erst frisch geschliffen.

	TRIA_Next(Milten);

	AI_Output(self, hero, "Info_Mod_Diego_Kap6_03_03"); //Xardas hat uns erzählt, was du vorhast.

	TRIA_Next(Lester);

	AI_Output(self, hero, "Info_Mod_Diego_Kap6_13_04"); //Und da dachten wir: Wäre doch schlimm, wenn wir dich noch mal allein da reinlassen.
	AI_Output(hero, self, "Info_Mod_Diego_Kap6_15_05"); //Ihr wisst aber schon, dass es gefährlich wird? Dass wir alle sterben können?

	TRIA_Next(Gorn);

	AI_Output(self, hero, "Info_Mod_Diego_Kap6_12_06"); //Wenn du's nicht schaffst, gehen wir eh früher oder später drauf.

	TRIA_Next(Lester);

	AI_Output(self, hero, "Info_Mod_Diego_Kap6_13_07"); //Wir sind zu fünft. Wer könnte uns aufhalten?
	AI_Output(hero, self, "Info_Mod_Diego_Kap6_15_08"); //Na schön. Freut mich, dass ihr dabei seid.

	TRIA_Next(Diego);

	AI_Output(self, hero, "Info_Mod_Diego_Kap6_11_09"); //Du hättest uns eh nicht mehr umgestimmt. Darin warst du noch nie gut.

	TRIA_Next(Milten);

	AI_Output(self, hero, "Info_Mod_Diego_Kap6_03_10"); //Ich glaube, Xardas wollte dich noch sprechen, bevor wir uns auf den Weg machen. Du musst dir noch deine Rune abholen.
	AI_Output(hero, self, "Info_Mod_Diego_Kap6_15_11"); //Meine Rune?
	AI_Output(self, hero, "Info_Mod_Diego_Kap6_03_12"); //Na, mach schon.

	TRIA_Finish();

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Diego_Kap6_2 (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Kap6_2_Condition;
	information	= Info_Mod_Diego_Kap6_2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Diego_Kap6_2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Kap6))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Kap6_2_Info()
{
	AI_Output(self, hero, "Info_Mod_Diego_Kap6_2_11_00"); //Los jetzt! Uns wird schon langweilig.
	AI_Output(hero, self, "Info_Mod_Diego_Kap6_2_15_01"); //Lass uns starten.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Diego_PlateauAngriff (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_PlateauAngriff_Condition;
	information	= Info_Mod_Diego_PlateauAngriff_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wir planen einen Vorstoß gegen die Ungetüme auf dem Weidenplateau (...)";
};

FUNC INT Info_Mod_Diego_PlateauAngriff_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_25))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_01))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_26))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_PlateauAngriff_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_PlateauAngriff_15_00"); //Wir planen einen Vorstoß gegen die Ungetüme auf dem Weidenplateau und könnten noch ein wenig Unterstützung brauchen.
	AI_Output(self, hero, "Info_Mod_Diego_PlateauAngriff_11_01"); //Ungetüme?! Ganz wie in alten Zeiten. Du erinnerst dich doch noch an den Troll ...? Es wäre mir eine Freude mal wieder an deiner Seite zu kämpfen.
	AI_Output(hero, self, "Info_Mod_Diego_PlateauAngriff_15_02"); //Sehr gut. Wir treffen uns dann bei Orlans Taverne.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SAMMELN");
};

INSTANCE Info_Mod_Diego_BalrogGigantTot (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_BalrogGigantTot_Condition;
	information	= Info_Mod_Diego_BalrogGigantTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Diego_BalrogGigantTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_PlateauAngriff))
	&& (Mod_WM_CronosAttack == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_BalrogGigantTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Diego_BalrogGigantTot_11_00"); //Ja, ganz genau wie in alten Zeiten ... nur mit mehr Monstern und Mitstreitern. Wenn du mal wieder so was vorhast, weißt du ja, wo ich zu finden bin.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Diego_Treffen (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Treffen_Condition;
	information	= Info_Mod_Diego_Treffen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gorn schickt mich.";
};

FUNC INT Info_Mod_Diego_Treffen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_AtCastlemine))
	&& (Npc_KnowsInfo(hero, Info_Mod_Diego_Hi))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Diego_Mario))
	|| (Npc_KnowsInfo(hero, Info_Mod_Diego_Mario2)))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Diego_Joe))
	|| (Npc_KnowsInfo(hero, Info_Mod_Diego_HierKristall)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Treffen_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_Treffen_15_00"); //Gorn schickt mich. Ich soll dir sagen, dass ihr euch in der Taverne 'Zur Toten Harpie'.
	AI_Output(self, hero, "Info_Mod_Diego_Treffen_11_01"); //Gut, ich mach mich sofort auf den Weg.

	B_LogEntry	(TOPIC_MOD_TREFFEN, "Diego macht sich sofort auf den Weg zur Taverne.");

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "TREFFEN");
};

INSTANCE Info_Mod_Diego_Dieb (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Dieb_Condition;
	information	= Info_Mod_Diego_Dieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab gehört du gehörst zur Diebesgilde.";
};

FUNC INT Info_Mod_Diego_Dieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Lothar_Bier))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_CITY_HABOUR_02_B"))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Dieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_Dieb_15_00"); //Ich hab gehört du gehörst zur Diebesgilde.
	AI_Output(self, hero, "Info_Mod_Diego_Dieb_11_01"); //Na klar, deswegen haben sie mich ja in die Kolonie geworfen. Aber woher weißt du das?
	AI_Output(hero, self, "Info_Mod_Diego_Dieb_15_02"); //Einer der Paladine hat mir erzählt, dass einer der Diebe ihren wertvollen Kristall gestohlen hat und ich suche jetzt den Kristall.
	AI_Output(self, hero, "Info_Mod_Diego_Dieb_11_03"); //Ach der Kristall. Ja, den hab ich den Paladine gestohlen, um sie zu ärgern. Er liegt in der Kanalisaton im alten Zimmer von Fingers.
	AI_Output(self, hero, "Info_Mod_Diego_Dieb_11_04"); //Hier ist der Schlüssel zum Eingang der Kanalisation. Aber pass auf, die anderen wissen nicht, wer du bist, und könnten dir Ärger machen.
	AI_Output(self, hero, "Info_Mod_Diego_Dieb_11_05"); //Viel Glück!

	B_LogEntry	(TOPIC_MOD_DIEGO_KRISTALL, "Diego hat mir einen Schlüssel zur Kanalisation gegeben, wo der Kristall versteckt sein soll. Dort liegt er im alten Zimmer von Fingers.");

	CreateInvItems	(self, ItKe_ThiefGuildKey_MIS, 1);
	B_GiveInvItems	(self, hero, ItKe_ThiefGuildKey_MIS, 1);

	DiegoGibtDiebesQuest = Wld_GetDay();

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Diego_Kristall (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Kristall_Condition;
	information	= Info_Mod_Diego_Kristall_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir bei der Sache mit dem Kristall helfen?";
};

FUNC INT Info_Mod_Diego_Kristall_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Dieb))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_CITY_HABOUR_02_B"))
	&& (Npc_HasItems(hero, Mod_PaladinKristall) == 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Lothar_Kristall))
	&& (Mod_PalaKristall == 0)
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Diego_Treffen))
	|| (Npc_KnowsInfo(hero, Info_Mod_Gorn_Treffen)))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Diego_Mario))
	|| (Npc_KnowsInfo(hero, Info_Mod_Diego_Mario2)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Kristall_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_Kristall_15_00"); //Kannst du mir bei der Sache mit dem Kristall helfen?
	AI_Output(self, hero, "Info_Mod_Diego_Kristall_11_01"); //Ich könnte dir den Kristall holen, allerdings kann ich meinen Posten hier nicht verlassen.
	AI_Output(self, hero, "Info_Mod_Diego_Kristall_11_02"); //Wenn du mir eine Ablösung besorgst, kann ich gehen.
	AI_Output(self, hero, "Info_Mod_Diego_Kristall_11_03"); //Und bring noch fünf Dietriche mit.

	B_LogEntry	(TOPIC_MOD_DIEGO_KRISTALL, "Damit ich den Kristall nicht selber holen muss, bietet mir Diego seine Hilfe an. Er braucht jedoch fünf Dietriche und eine Ablösung. Ich sollte mal die anderen Mitglieder des Ring des Wassers oder die Wasser Novizen fragen.");
};

INSTANCE Info_Mod_Diego_Joe (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Joe_Condition;
	information	= Info_Mod_Diego_Joe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es ist alles vorbereitet.";
};

FUNC INT Info_Mod_Diego_Joe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joe_Diego))
	&& (Npc_HasItems(hero, ItKe_Lockpick) >= 5)
	&& (Mod_PalaKristall == 0)
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Diego_Treffen))
	|| (Npc_KnowsInfo(hero, Info_Mod_Gorn_Treffen)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Joe_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_Joe_15_00"); //Es ist alles vorbereitet. Joe übernimmt deinen Posten und hier sind die Dietriche.

	B_GiveInvItems	(hero, self, ItKe_Lockpick, 5);

	AI_Output(self, hero, "Info_Mod_Diego_Joe_11_01"); //Sehr gut, ich mach mich sofort auf den Weg. Komm morgen wieder, dann sollte ich fertig sein.

	B_LogEntry	(TOPIC_MOD_DIEGO_KRISTALL, "Diego ist unterwegs. Morgen kann ich mir den Kristall bei ihm abholen.");

	Mod_DiegoHoltKristall = Wld_GetDay();

	Mod_PalaKristall = 2;

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "KRISTALL");
};

INSTANCE Info_Mod_Diego_HierKristall (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_HierKristall_Condition;
	information	= Info_Mod_Diego_HierKristall_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Diego_HierKristall_Condition()
{
	if (Mod_DiegoHoltKristall < Wld_GetDay())
	&& (Npc_GetDistToWP(self, "NW_CITY_HABOUR_02_B") < 500)
	&& (Npc_KnowsInfo(hero, Info_Mod_Diego_Joe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_HierKristall_Info()
{
	if (Npc_HasItems(hero, Mod_PaladinKristall) == 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Lothar_Kristall))
	{
		AI_Output(self, hero, "Info_Mod_Diego_HierKristall_11_00"); //Hier ist der Kristall.

		B_GiveInvItems	(self, hero, Mod_PaladinKristall, 1);

		B_LogEntry	(TOPIC_MOD_DIEGO_KRISTALL, "Ich habe den Kristall. Entweder gehe ich jetzt zu Lothar oder ich bringe ihn zu jemand anderem. Die anderen Gildenanführer wären über diesen wertvollen Kristall sicher sehr erfreut.");
		B_SetTopicStatus	(TOPIC_MOD_DIEGO_KRISTALL, LOG_SUCCESS);

		Wld_RemoveItem	(Mod_PaladinKristall);

		Mod_KristallDiego = 1;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Diego_HierKristall_11_01"); //Der Kristall ist schon weg, da kann ich dir auch nicht helfen.
	};
};

INSTANCE Info_Mod_Diego_Gerbrandt (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Gerbrandt_Condition;
	information	= Info_Mod_Diego_Gerbrandt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe ein Problem.";
};

FUNC INT Info_Mod_Diego_Gerbrandt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Esteban_NW_Gerbrandt))
	&& (Npc_KnowsInfo(hero, Info_Mod_Diego_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Gerbrandt_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_Gerbrandt_15_00"); //Ich habe ein Problem. Ich muss Gerbrandt nachweisen, dass er für die Verbannung von Morgahard mitverantwortlich ist.
	AI_Output(self, hero, "Info_Mod_Diego_Gerbrandt_11_01"); //Durchsuche sein Haus, einer seiner Kerzenleuchter ist ein Schalter zum öffnen eines geheimen Winkels im Haus gegenüber.
	AI_Output(self, hero, "Info_Mod_Diego_Gerbrandt_11_02"); //Dort wirst du Beweise finden. Gib sie aber erst mir, Morgahard ist nicht der Einzige, der wegen Gerbrandt und seiner Bande in der Kolonie war.
	AI_Output(hero, self, "Info_Mod_Diego_Gerbrandt_15_03"); //Gut, ich werde sie dir besorgen.

	B_LogEntry	(TOPIC_MOD_AL_MORGAHARD, "Diego sagte mir, dass Gerbrandt die Beweise in einer geheimen Nische des gegenüberliegenden Hauses aufbewahrt, die sich durch einen Kerzenhalter in seinem Haus öffnen lässt. Ich soll die Beweise ihm geben, wenn ich sie habe.");
};

INSTANCE Info_Mod_Diego_HabBeweise (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_HabBeweise_Condition;
	information	= Info_Mod_Diego_HabBeweise_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab die Beweise.";
};

FUNC INT Info_Mod_Diego_HabBeweise_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Gerbrandt))
	&& (Npc_HasItems(hero, ItWr_AL_GebrandtDokumente) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_HabBeweise_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_HabBeweise_15_00"); //Ich die Beweise.

	B_GiveInvItems	(hero, self, ItWr_AL_GebrandtDokumente, 1);

	B_UseFakeScroll ();

	AI_Output(self, hero, "Info_Mod_Diego_HabBeweise_11_01"); //Sehr gut, zeig Lord Andre diese Beweise. Wir treffen uns danach vor Gerbrandts Haus.

	B_GiveInvItems	(self, hero, ItWr_AL_GebrandtDokumente, 1);

	B_LogEntry	(TOPIC_MOD_AL_MORGAHARD, "Diego hat die Beweise gesehen. Ich soll sie Lord Andre geben und ihn dann vor Gerbrandts Haus treffen.");

	B_StartOtherRoutine	(self, "GERBRANDT");
};

INSTANCE Info_Mod_Diego_GerbrandtGefangen (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_GerbrandtGefangen_Condition;
	information	= Info_Mod_Diego_GerbrandtGefangen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sie wurden festgenommen.";
};

FUNC INT Info_Mod_Diego_GerbrandtGefangen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Gerbrandt))
	&& (Mod_AL_Gebrandt_Gefangen == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_GerbrandtGefangen_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_GerbrandtGefangen_15_00"); //Sie wurden festgenommen.
	AI_Output(self, hero, "Info_Mod_Diego_GerbrandtGefangen_11_01"); //Gut, Gerbrandts Haus gehört jetzt mir. Ich habe noch etwas von Gerbrandts Geld gefunden. Ich glaube, du kannst es brauchen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

	B_LogEntry	(TOPIC_MOD_AL_MORGAHARD, "Diego gab mir das Geld von Gerbrandt als Lohn. Jetzt sollte ich Esteban berichten, dass Morgahard in die Stadt darf.");

	B_StartOtherRoutine	(Mod_1928_BDT_Morgahard_NW, "STADT");
};

INSTANCE Info_Mod_Diego_Lehrer (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Lehrer_Condition;
	information	= Info_Mod_Diego_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Diego_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Diego_Lehrer_11_00"); //Ich kann dir beibringen wie du Schlösser knackst.

	if (Mod_Schwierigkeit != 4)
	{
		AI_Output(self, hero, "Info_Mod_Diego_Lehrer_11_01"); //Außerdem kann ich dir wieder helfen, geschickter zu werden.

		Log_CreateTopic	(TOPIC_MOD_LEHRER_STADT, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_STADT, "Diego kann mir beibringen Schlösser zu knacken und geschickter zu werden.");
	}
	else
	{
		Log_CreateTopic	(TOPIC_MOD_LEHRER_STADT, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_STADT, "Diego kann mir beibringen Schlösser zu knacken.");
	};
};

INSTANCE Info_Mod_Diego_Flugblatt (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Flugblatt_Condition;
	information	= Info_Mod_Diego_Flugblatt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Diego_Flugblatt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Diego_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Flugblatt_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Diego_Flugblatt_11_01"); //Oh danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Diego_Flugblatt_11_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Diego_RDW (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_RDW_Condition;
	information	= Info_Mod_Diego_RDW_Info;
	permanent	= 0;
	important	= 0;
	description	= "Vatras schickt mich.";
};

FUNC INT Info_Mod_Diego_RDW_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Aufgabe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_RDW_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_RDW_15_00"); //Vatras schickt mich. Er hat gesagt du könntest mir bei der Suche nach den Vermissten behilflich sein.
	AI_Output(self, hero, "Info_Mod_Diego_RDW_11_01"); //Willst dich uns wohl anschließen?
	AI_Output(hero, self, "Info_Mod_Diego_RDW_15_02"); //Klar, wieso nicht. Also sagst du mir jetzt was du weißt?
	AI_Output(self, hero, "Info_Mod_Diego_RDW_11_03"); //Jaja. Es fing vor etwa zwei Wochen an. Einer der Bürger hat gesagt, dass sein Freund verschwunden sei.
	AI_Output(self, hero, "Info_Mod_Diego_RDW_11_04"); //Wir haben ihn natürlich gleich gesucht und ausgefragt, aber er schien nichts zu wissen.
	AI_Output(self, hero, "Info_Mod_Diego_RDW_11_05"); //In den folgenden Tagen sind immer mehr Leute verschwunden. Das einzige was wir wissen ist, dass sie immer nachts verschwinden.

	B_LogEntry	(TOPIC_MOD_VERMISSTE, "Die verschwunden Leute scheinen immer nachts zu verschwinden.");
};

INSTANCE Info_Mod_Diego_Person (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Person_Condition;
	information	= Info_Mod_Diego_Person_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer ist dieser Bürger der den ersten Vermissten gemeldet hat?";
};

FUNC INT Info_Mod_Diego_Person_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_RDW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Person_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_Person_15_00"); //Wer ist dieser Bürger der den ersten Vermissten gemeldet hat?
	AI_Output(self, hero, "Info_Mod_Diego_Person_11_01"); //Sein Name ist Gerbrandt. Er ist im Oberen Viertel, aber du wirst da nicht reinkommen.
	
	B_LogEntry	(TOPIC_MOD_VERMISSTE, "Derjenige, der den ersten Vermissten gemeldet hat, heißt Gerbrandt und wohnt im Oberen Viertel.");
};

INSTANCE Info_Mod_Diego_Mario (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Mario_Condition;
	information	= Info_Mod_Diego_Mario_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du Lust auf ein Abenteuer?";
};

FUNC INT Info_Mod_Diego_Mario_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mario_Hilfe4))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Diego_Treffen))
	|| (Npc_KnowsInfo(hero, Info_Mod_Gorn_Treffen)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Mario_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_Mario_15_00"); //Hast du Lust auf ein Abenteuer?
	AI_Output(self, hero, "Info_Mod_Diego_Mario_11_01"); //Wie wäre wohl mein Leben verlaufen, wenn ich jemals auf diese Frage mit Nein geantwortet hätte?
	AI_Output(self, hero, "Info_Mod_Diego_Mario_11_02"); //(lacht) Was hast du denn anzubieten?
	AI_Output(hero, self, "Info_Mod_Diego_Mario_15_03"); //Eine Menge bösartiger Goblins. Drei tapfere Recken.
	AI_Output(self, hero, "Info_Mod_Diego_Mario_11_04"); //Ich mag Goblins. Sie verstecken immer viel Gold. Aber sie verstecken es nicht gut.
	AI_Output(self, hero, "Info_Mod_Diego_Mario_11_05"); //Wer ist denn der dritte Mitstreiter?
	AI_Output(hero, self, "Info_Mod_Diego_Mario_15_06"); //Der in den eigenen Reihen unbeliebte Milizionär Mario.
	AI_Output(self, hero, "Info_Mod_Diego_Mario_11_07"); //Wer es mit dem Gehorsam nicht so hat, ist dort falsch aufgehoben. Na gut, ich bin dabei. Wenn ich was von der Beute abbekomme.
	AI_Output(hero, self, "Info_Mod_Diego_Mario_15_08"); //Selbstverständlich.
	AI_Output(self, hero, "Info_Mod_Diego_Mario_11_09"); //Wann brechen wir auf?
	AI_Output(hero, self, "Info_Mod_Diego_Mario_15_10"); //Genau jetzt.
	AI_Output(self, hero, "Info_Mod_Diego_Mario_11_11"); //Gut, geh voran.
	
	B_LogEntry	(TOPIC_MOD_MARIO_UPGRADE, "Diego hat sich uns angeschlossen. Jetzt muss ich nur noch Mario abholen, und schon sind wir komplett.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

INSTANCE Info_Mod_Diego_Mario2 (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Mario2_Condition;
	information	= Info_Mod_Diego_Mario2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Diego_Mario2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mario_Hilfe6))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Mario2_Info()
{
	AI_Output(self, hero, "Info_Mod_Diego_Mario2_11_00"); //So muss das laufen.
	AI_Output(self, hero, "Info_Mod_Diego_Mario2_11_01"); //Äh, wenn ich das richtig sehe, hat Mario dir eine kleine Belohnung in Form von Goldmünzen gegeben?

	B_StartOtherRoutine	(self, "START");

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	Info_ClearChoices	(Info_Mod_Diego_Mario2);

	Info_AddChoice	(Info_Mod_Diego_Mario2, "Das hast du falsch gesehen. Es gibt keine Belohnung.", Info_Mod_Diego_Mario2_C);
	Info_AddChoice	(Info_Mod_Diego_Mario2, "Ja, hier hast du einen kleinen Teil.", Info_Mod_Diego_Mario2_B);
	Info_AddChoice	(Info_Mod_Diego_Mario2, "Ja, hier ist deine Hälfte.", Info_Mod_Diego_Mario2_A);
};

FUNC VOID Info_Mod_Diego_Mario2_C()
{
	AI_Output(hero, self, "Info_Mod_Diego_Mario2_C_15_00"); //Das hast du falsch gesehen. Es gibt keine Belohnung.
	AI_Output(self, hero, "Info_Mod_Diego_Mario2_C_11_01"); //Hey, du hast wohl den Diebeskodex falsch verstanden? Freunde bescheißt man nicht!

	Mod_Mario_Diego = 1;

	Info_ClearChoices	(Info_Mod_Diego_Mario2);
};

FUNC VOID Info_Mod_Diego_Mario2_B()
{
	AI_Output(hero, self, "Info_Mod_Diego_Mario2_B_15_00"); //Ja, hier hast du einen kleinen Teil.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Diego_Mario2_B_11_01"); //Ein bisschen mager, was? Aber was soll man von einem Milizionär auch anderes erwarten?

	Info_ClearChoices	(Info_Mod_Diego_Mario2);
};

FUNC VOID Info_Mod_Diego_Mario2_A()
{
	AI_Output(hero, self, "Info_Mod_Diego_Mario2_A_15_00"); //Ja, hier ist deine Hälfte.

	B_GiveInvItems	(hero, self, ItMi_Gold, 150);

	AI_Output(self, hero, "Info_Mod_Diego_Mario2_A_11_01"); //Hat sich ja gelohnt, unser kleiner Ausflug. Ein gutes Gefühl, die alten Knochen noch mal zu bewegen.

	Info_ClearChoices	(Info_Mod_Diego_Mario2);
};

INSTANCE Info_Mod_Diego_VermissteFertig (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_VermissteFertig_Condition;
	information	= Info_Mod_Diego_VermissteFertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Diego_VermissteFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_RealInfos))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_VermissteFertig_Info()
{
	AI_Output(self, hero, "Info_Mod_Diego_VermissteFertig_11_00"); //Die Rätsel um die verschwundenen Bürger hast du wirklich fein gelöst.
	AI_Output(self, hero, "Info_Mod_Diego_VermissteFertig_11_01"); //In die Minen der Dämonenmagier ... wer hätte das gedacht.
	AI_Output(self, hero, "Info_Mod_Diego_VermissteFertig_11_02"); //(zu sich selbst) Hoffentlich führt das aber nicht zu militärischen Auseinandersetzungen ...

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Mod_7660_MIL_Miliz_NW,	"NW_CASTLEMINE_01");
	Wld_InsertNpc	(Mod_7661_MIL_Miliz_NW,	"NW_CASTLEMINE_01");
	Wld_InsertNpc	(Mod_7662_MIL_Miliz_NW,	"NW_CASTLEMINE_01");
	Wld_InsertNpc	(Mod_7663_MIL_Miliz_NW,	"NW_CASTLEMINE_01");
	Wld_InsertNpc	(Mod_7664_MIL_Miliz_NW,	"NW_CASTLEMINE_01");

	Wld_InsertNpc	(Mod_7665_MIL_Miliz_NW,	"XARDAS");
	Wld_InsertNpc	(Mod_7666_MIL_Miliz_NW,	"XARDAS");
	Wld_InsertNpc	(Mod_7667_MIL_Miliz_NW,	"XARDAS");

	B_KillNpc	(Mod_7665_MIL_Miliz_NW);
	B_KillNpc	(Mod_7665_MIL_Miliz_NW);

	Wld_InsertNpc	(Gobbo_Skeleton,	"XARDAS");
	Wld_InsertNpc	(Gobbo_Skeleton,	"XARDAS");
	Wld_InsertNpc	(Gobbo_Skeleton,	"XARDAS");
};

INSTANCE Info_Mod_Diego_DrachenFrei (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_DrachenFrei_Condition;
	information	= Info_Mod_Diego_DrachenFrei_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Diego_DrachenFrei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Drachen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_DrachenFrei_Info()
{
	AI_Output(self, hero, "Info_Mod_Diego_DrachenFrei_11_00"); //Hey, wie ich gehört habe, wurde die Umgebung von mächtigen Dämonen heimgesucht.
	AI_Output(hero, self, "Info_Mod_Diego_DrachenFrei_15_01"); //Du meinst vermutlich die Drachen ...
	AI_Output(self, hero, "Info_Mod_Diego_DrachenFrei_11_02"); //Drachen? Wirklich? Und ich dachte, es seien nur Geschöpfe aus Büchern ...
	AI_Output(hero, self, "Info_Mod_Diego_DrachenFrei_15_03"); //(zu sich selbst) Hmm, na ja, irgendwie stimmt das auch ...
};

INSTANCE Info_Mod_Diego_Lernen (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Lernen_Condition;
	information	= Info_Mod_Diego_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= B_BuildLearnString("Schlösser knacken", B_GetLearnCostTalent(hero, NPC_TALENT_PICKLOCK, 1));
};

FUNC INT Info_Mod_Diego_Lernen_Condition()
{
	Info_Mod_Diego_Lernen.description = B_BuildLearnString("Schlösser knacken", B_GetLearnCostTalent(hero, NPC_TALENT_PICKLOCK, 1));

	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Lehrer))
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_Lernen_15_00"); //Bring mir bei wie man Schlösser knackt.

	if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK))
	{
		AI_Output(self, hero, "Info_Mod_Diego_Lernen_11_01"); //Wenn du ein Schloss knacken willst solltest du auf jedenfall genug Dietriche dabei haben. Außerdem solltest du ziemlich geschickt sein.
	};
};

INSTANCE Info_Mod_Diego_GeschickteFinger (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_GeschickteFinger_Condition;
	information	= Info_Mod_Diego_GeschickteFinger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Meine Dietriche brechen immer ab - hast du da einen Tipp für mich?";
};

FUNC INT Info_Mod_Diego_GeschickteFinger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Lehrer))
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_GeschickteFinger_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_GeschickteFinger_15_00"); //Meine Dietriche brechen immer ab - hast du da einen Tipp für mich?
	AI_Output(self, hero, "Info_Mod_Diego_GeschickteFinger_11_01"); //Wie häufig deine Dietriche abbrechen, hängt von deinem Geschick ab.
	AI_Output(self, hero, "Info_Mod_Diego_GeschickteFinger_11_02"); //Es gibt aber einen Trick, wie du vorsichtiger zu Werke gehen kannst.
};

INSTANCE Info_Mod_Diego_GeschickteFinger2 (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_GeschickteFinger2_Condition;
	information	= Info_Mod_Diego_GeschickteFinger2_Info;
	permanent	= 1;
	important	= 0;
	description	= "";
};

FUNC INT Info_Mod_Diego_GeschickteFinger2_Condition()
{
	if (Mod_Schwierigkeit == 4)
	{
		Info_Mod_Diego_GeschickteFinger2.description = "Zeig mir den Trick zum Öffnen von Schlössern. (500 Gold)";
	}
	else
	{
		Info_Mod_Diego_GeschickteFinger2.description = "Zeig mir den Trick zum Öffnen von Schlössern. (5 LP)";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Diego_GeschickteFinger))
	&& (Dietrich_Perk == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_GeschickteFinger2_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_GeschickteFinger2_15_00"); //Zeig mir den Trick zum Öffnen von Schlössern.

	if ((Mod_Schwierigkeit == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500))
	|| ((Mod_Schwierigkeit != 4)
	&& (hero.lp >= 5))
	{
		AI_Output(self, hero, "Info_Mod_Diego_GeschickteFinger2_11_01"); //Ein normales Schloss besteht aus mehreren Sperrzuhaltungen.
		AI_Output(self, hero, "Info_Mod_Diego_GeschickteFinger2_11_02"); //Die musst du in die richtige Richtung schieben, damit du am Ende den Riegel bewegen kannst.
		AI_Output(self, hero, "Info_Mod_Diego_GeschickteFinger2_11_03"); //Wenn du eine der Zuhaltungen in die falsche Richtung schiebst, bricht der Dietrich normalerweise ab.
		AI_Output(self, hero, "Info_Mod_Diego_GeschickteFinger2_11_04"); //Allerdings kannst du es schon vorher spüren, wenn du in der falschen Richtung unterwegs bist, und zwar an einem winzig kleinen Widerstand etwa auf der halben Strecke.
		AI_Output(self, hero, "Info_Mod_Diego_GeschickteFinger2_11_05"); //Um diesen Widerstand zu bemerken, musst du konzentriert und geübt sein.
		AI_Output(self, hero, "Info_Mod_Diego_GeschickteFinger2_11_06"); //Es wird dir nicht gelingen, in allen Fällen ein Abbrechen zu verhindern, aber immerhin in einigen.
		AI_Output(self, hero, "Info_Mod_Diego_GeschickteFinger2_11_07"); //Am besten probierst du es einfach mal aus.

		if (Mod_Schwierigkeit == 4)
		{
			Npc_RemoveInvItems	(hero, ItMi_Gold, 500);
		}
		else
		{
			hero.lp -= 5;
		};

		Dietrich_Perk = TRUE;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Diego_GeschickteFinger2_11_08"); //Komm wieder, wenn du bereit bist.
	};
};

INSTANCE Info_Mod_Diego_Lernen_DEX (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Lernen_DEX_Condition;
	information	= Info_Mod_Diego_Lernen_DEX_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir was bei.";
};

FUNC INT Info_Mod_Diego_Lernen_DEX_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Lehrer))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Diego_Lernen_DEX_Info()
{
	AI_Output(hero, self, "Info_Mod_Diego_Lernen_DEX_15_00"); //Bring mir was bei.
	AI_Output(self, hero, "Info_Mod_Diego_Lernen_DEX_16_01"); //Was willst du lernen?

	Info_ClearChoices	(Info_Mod_Diego_Lernen_DEX);

	Info_AddChoice 		(Info_Mod_Diego_Lernen_DEX, DIALOG_BACK, Info_Mod_Diego_Lernen_DEX_BACK);
	Info_AddChoice		(Info_Mod_Diego_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX5	, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Diego_Lernen_DEX_Geschick_5);
	Info_AddChoice		(Info_Mod_Diego_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX1	, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Diego_Lernen_DEX_Geschick_1);
};

FUNC VOID Info_Mod_Diego_Lernen_DEX_BACK()
{
	Info_ClearChoices (Info_Mod_Diego_Lernen_DEX);
};

FUNC VOID Info_Mod_Diego_Lernen_DEX_Geschick_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_DEXTERITY, 5, 200);
	
	Info_ClearChoices	(Info_Mod_Diego_Lernen_DEX);

	Info_AddChoice 		(Info_Mod_Diego_Lernen_DEX, DIALOG_BACK, Info_Mod_Diego_Lernen_DEX_BACK);
	Info_AddChoice		(Info_Mod_Diego_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX5	, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Diego_Lernen_DEX_Geschick_5);
	Info_AddChoice		(Info_Mod_Diego_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX1	, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Diego_Lernen_DEX_Geschick_1);
};

FUNC VOID Info_Mod_Diego_Lernen_DEX_Geschick_1()
{
	B_TeachAttributePoints (self, hero, ATR_DEXTERITY, 1, 200);
	
	Info_ClearChoices	(Info_Mod_Diego_Lernen_DEX);

	Info_AddChoice 		(Info_Mod_Diego_Lernen_DEX, DIALOG_BACK, Info_Mod_Diego_Lernen_DEX_BACK);
	Info_AddChoice		(Info_Mod_Diego_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX5	, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Diego_Lernen_DEX_Geschick_5);
	Info_AddChoice		(Info_Mod_Diego_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX1	, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Diego_Lernen_DEX_Geschick_1);
};

INSTANCE Info_Mod_Diego_Pickpocket (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_Pickpocket_Condition;
	information	= Info_Mod_Diego_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_210;
};

FUNC INT Info_Mod_Diego_Pickpocket_Condition()
{
	C_Beklauen	(200, ItKe_Lockpick, 25);
};

FUNC VOID Info_Mod_Diego_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Diego_Pickpocket);

	Info_AddChoice	(Info_Mod_Diego_Pickpocket, DIALOG_BACK, Info_Mod_Diego_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Diego_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Diego_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Diego_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Diego_Pickpocket);
};

FUNC VOID Info_Mod_Diego_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Diego_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Diego_Pickpocket);

		Info_AddChoice	(Info_Mod_Diego_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Diego_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Diego_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Diego_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Diego_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Diego_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Diego_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Diego_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Diego_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Diego_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Diego_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Diego_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Diego_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Diego_EXIT (C_INFO)
{
	npc		= Mod_538_RDW_Diego_NW;
	nr		= 1;
	condition	= Info_Mod_Diego_EXIT_Condition;
	information	= Info_Mod_Diego_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Diego_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Diego_EXIT_Info()
{
	AI_Output(self, hero, "Info_Mod_Diego_EXIT_11_00"); //Wir sehen uns ... hoffentlich.

	AI_StopProcessInfos	(self);
};