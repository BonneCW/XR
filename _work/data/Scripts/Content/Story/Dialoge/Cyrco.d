INSTANCE Info_Mod_Cyrco_Hi (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_Hi_Condition;
	information	= Info_Mod_Cyrco_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cyrco_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_GardistenZettel))
	&& (Npc_HasItems(hero, ItWr_MagicPaper) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cyrco_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_00"); //Ahh! Ein neues Gesicht. Man hat schon von dir gehört.
	AI_Output(hero, self, "Info_Mod_Cyrco_Hi_15_01"); //So? Ich hoffe doch nur Gutes ...
	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_02"); //Ei, gewiss doch. Du hast doch drüben dem Dragomir geholfen. Torgan hat mir davon berichtet.
	AI_Output(hero, self, "Info_Mod_Cyrco_Hi_15_03"); //Nun ...
	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_04"); //Und bist Torgan zur Hand gegangen. Hast die Lager besucht und die Gardisten besiegt.
	AI_Output(hero, self, "Info_Mod_Cyrco_Hi_15_05"); //Schon. Doch sagt, ehrwürdiger Mann, bin ich nun bei den Waldläufern aufgenommen?
	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_06"); //(lacht) Hi, hi, hi. Das Ungestüm der Jugend. Gemach, eine Kleinigkeit wirst du noch erledigen müssen.
	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_07"); //Dann wird deiner Aufnahme nichts mehr im Wege stehen, junger Streiter. Wie ist eigentlich dein Name?
	AI_Output(hero, self, "Info_Mod_Cyrco_Hi_15_08"); //Ich habe keinen Namen.
	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_09"); //Keinen Namen? Narr! Jedes Kind bekommt einen Namen.
	AI_Output(hero, self, "Info_Mod_Cyrco_Hi_15_10"); //Verzeiht, Ehrwürdiger, ich hatte einen Namen. Jedoch hindert mich ein Schwur, den Namen jemals wieder auszusprechen.
	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_11"); //Ein ungewöhnlicher Schwur ...
	AI_Output(hero, self, "Info_Mod_Cyrco_Hi_15_12"); //Das mag sein. Jedoch veranlassten mich schlimme Ereignisse in der Vergangenheit dazu.
	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_13"); //Das muss man akzeptieren. Doch sag, du hast sicher was für mich.
	AI_Output(hero, self, "Info_Mod_Cyrco_Hi_15_14"); //Ja, hier.

	B_GiveInvItems	(hero, self, ItWr_MagicPaper, Npc_HasItems(hero, ItWr_MagicPaper));

	if (Npc_HasItems(self, ItWr_MagicPaper) == 1)
	{
		AI_Output(hero, self, "Info_Mod_Cyrco_Hi_15_15"); //Diesen Zettel fand ich bei einem der Gardisten. Torgan sagt, ich soll ihn euch bringen.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Cyrco_Hi_15_16"); //Diese Zettel fand ich bei einem der Gardisten und bei den Banditen. Torgan sagt, ich soll sie euch bringen.
	};

	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_17"); //Aha. Eine Nachricht.

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_18"); //Aber Moment, diese Schrift ...
	AI_Output(hero, self, "Info_Mod_Cyrco_Hi_15_19"); //Ja?
	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_20"); //Geduld!

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_21"); //Hmm. Das scheint mir keine Tinte zu sein. Ist irgendwie eingebrannt.

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_22"); //Hm ... Irgendeine Magie. Hm ... Schwarze Magie, würde ich sagen. Und eine ungewisse Aura ...
	AI_Output(hero, self, "Info_Mod_Cyrco_Hi_15_23"); //Schwarze Magie? Aura?
	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_24"); //Gewiss. Alte schwarze Magie. Aber ich bin mir nicht sicher. Hmm.
	AI_Output(hero, self, "Info_Mod_Cyrco_Hi_15_25"); //Kann ich irgendwie helfen? Ich kann mit Spruchrollen und so umgehen.
	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_26"); //Umgehen? Nein. Aber gehen kannst du. Und zwar ins Sumpflager.
	AI_Output(hero, self, "Info_Mod_Cyrco_Hi_15_27"); //Ehrwürdiger?
	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_28"); //Frage da nach Baal Orun. Möglicherweise hilft ihm sein langer Umgang mit dem Schläfer, diese Magie zu erkennen.
	AI_Output(hero, self, "Info_Mod_Cyrco_Hi_15_29"); //Soll ich gleich los?
	AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_30"); //Ei, gewiss. Mir scheint, auf Khorinis braut sich neues Unheil zusammen.

	if (Npc_HasItems(self, ItWr_MagicPaper) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_31"); //Hier, das Dokument.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Cyrco_Hi_10_32"); //Hier, die Dokumente.
	};

	B_GiveInvItems	(self, hero, ItWr_MagicPaper, Npc_HasItems(self, ItWr_MagicPaper));

	B_LogEntry	(TOPIC_MOD_JG_GARDISTEN, "Noch nicht Waldläufer. Aber ich glaube, ich bin nahe dran. Ich soll nun den Zettel, den ich dem Gardisten abgenommen habe, Baal Orun im Sumpflager zeigen. Vielleicht kennt er die Aura, die um den Zettel liegt.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Cyrco_BaalOrun (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_BaalOrun_Condition;
	information	= Info_Mod_Cyrco_BaalOrun_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cyrco_BaalOrun_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orun_Cyrco))
	&& (Npc_HasItems(hero, ItMi_SpezielleRune) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cyrco_BaalOrun_Info()
{
	AI_Output(self, hero, "Info_Mod_Cyrco_BaalOrun_10_00"); //Gut, dass du kommst. Hast du gesehen, was draußen los ist?
	AI_Output(hero, self, "Info_Mod_Cyrco_BaalOrun_15_01"); //Hallo, Ehrwürdiger! Was los war: das hat sich erledigt.
	AI_Output(hero, self, "Info_Mod_Cyrco_BaalOrun_15_02"); //Aber ich habe Neuigkeiten für Euch.
	AI_Output(self, hero, "Info_Mod_Cyrco_BaalOrun_10_03"); //Lass hören, Waldläufer?
	AI_Output(hero, self, "Info_Mod_Cyrco_BaalOrun_15_04"); //(erstaunt) Waldläufer?
	AI_Output(self, hero, "Info_Mod_Cyrco_BaalOrun_10_05"); //Gewiss doch. Du bist nunmehr Mitglied des Lagers im Rang eines Waldläufers.
	AI_Output(self, hero, "Info_Mod_Cyrco_BaalOrun_10_06"); //Du kannst hier einkaufen und dich ausbilden lassen, falls du's nötig hast.
	AI_Output(self, hero, "Info_Mod_Cyrco_BaalOrun_10_07"); //Aber erstmal deinen Bericht, bitte.
	AI_Output(hero, self, "Info_Mod_Cyrco_BaalOrun_15_08"); //Diese Rune habe ich draußen bei einem der Angreifer gefunden.

	B_GiveInvItems	(hero, self, ItMi_SpezielleRune, 1);

	AI_Output(hero, self, "Info_Mod_Cyrco_BaalOrun_15_09"); //Musst du mal schauen, was damit los ist.
	AI_Output(self, hero, "Info_Mod_Cyrco_BaalOrun_10_10"); //Gut. Und der Zettel?
	AI_Output(hero, self, "Info_Mod_Cyrco_BaalOrun_15_11"); //Dieser Guru hatte eine Vision.
	AI_Output(hero, self, "Info_Mod_Cyrco_BaalOrun_15_12"); //Er sah diesen Zettel in der Nähe einer Höhle, umgeben von einer starken Präsenz von schwarzer Magie.
	AI_Output(hero, self, "Info_Mod_Cyrco_BaalOrun_15_13"); //Er warnte davor, allein da hinzugehen.
	AI_Output(self, hero, "Info_Mod_Cyrco_BaalOrun_10_14"); //Nun gut. Ich werde dir zwei Leute mitgeben.
	AI_Output(hero, self, "Info_Mod_Cyrco_BaalOrun_15_15"); //Mir?
	AI_Output(self, hero, "Info_Mod_Cyrco_BaalOrun_10_16"); //Gewiss. Du findest doch diesen Ort am ehesten, denke ich.
	AI_Output(hero, self, "Info_Mod_Cyrco_BaalOrun_15_17"); //Ja. Ich weiß auch schon, wo diese Höhle ist.
	AI_Output(hero, self, "Info_Mod_Cyrco_BaalOrun_15_18"); //Die Banditen mit dem Zettel saßen vor der alten Mine. Da muss diese Höhle sein.
	AI_Output(self, hero, "Info_Mod_Cyrco_BaalOrun_10_19"); //Gut. Ich will mir mal diese Rune ansehen. Vielleicht ist sie nützlich.
	AI_Output(self, hero, "Info_Mod_Cyrco_BaalOrun_10_20"); //Melde dich, wenn ihr bereit seid.
	AI_Output(hero, self, "Info_Mod_Cyrco_BaalOrun_15_21"); //Wie Ihr wünscht, Meister.

	B_LogEntry	(TOPIC_MOD_JG_GARDISTEN, "Ich habe Cyrco Bericht erstattet und ihm die Rune übergeben. Während er sie untersucht, soll ich mir zwei Begleiter suchen, mit denen ich dann zur alten Mine aufbrechen werde. Vorher soll ich aber noch mal zu Cyrco kommen.");
};

INSTANCE Info_Mod_Cyrco_SonorZelar (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_SonorZelar_Condition;
	information	= Info_Mod_Cyrco_SonorZelar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wir sind bereit. Ich nehme zwei Mann mit.";
};

FUNC INT Info_Mod_Cyrco_SonorZelar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sonor_CyrcoMine))
	&& (Npc_KnowsInfo(hero, Info_Mod_Zelar_CyrcoMine))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cyrco_SonorZelar_Info()
{
	AI_Output(hero, self, "Info_Mod_Cyrco_SonorZelar_15_00"); //Wir sind bereit. Ich nehme zwei Mann mit.
	AI_Output(self, hero, "Info_Mod_Cyrco_SonorZelar_10_01"); //Gut, gut. Hier ich hab noch was für dich. Ein Amulett.

	B_GiveInvItems	(self, hero, ItAm_CyrcoMinenAmulett, 1);

	AI_Output(hero, self, "Info_Mod_Cyrco_SonorZelar_15_02"); //Bin ich euch nicht schmuck genug?
	AI_Output(self, hero, "Info_Mod_Cyrco_SonorZelar_10_03"); //Kasper! Dieses Amulett ermöglich es dir, Magie aufzuspüren oder deren Illusionen zu durchschauen. Leg es gleich an.
	AI_Output(hero, self, "Info_Mod_Cyrco_SonorZelar_15_04"); //Wie praktisch. Sehe ich dann das wahre Gesicht der Leute?
	AI_Output(self, hero, "Info_Mod_Cyrco_SonorZelar_10_05"); //Scher dich!
	AI_Output(hero, self, "Info_Mod_Cyrco_SonorZelar_15_06"); //Ja doch ...

	B_LogEntry	(TOPIC_MOD_JG_GARDISTEN, "Cyrco hat mir noch ein Amulett gegeben, welches ich spätestens bei der Mine anlegen sollte. Es wird es mir ermöglichen, Magie aufzuspüren und so die geheime Höhle zu finden.");
};

INSTANCE Info_Mod_Cyrco_MinenPart (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_MinenPart_Condition;
	information	= Info_Mod_Cyrco_MinenPart_Info;
	permanent	= 0;
	important	= 0;
	description	= "Auftrag ausgeführt, Gelände sondiert, keine Gefallenen.";
};

FUNC INT Info_Mod_Cyrco_MinenPart_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_SonorZelar))
	&& (Mod_JG_MinenPart == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cyrco_MinenPart_Info()
{
	AI_Output(hero, self, "Info_Mod_Cyrco_MinenPart_15_00"); //Auftrag ausgeführt, Gelände sondiert, keine Gefallenen.
	AI_Output(self, hero, "Info_Mod_Cyrco_MinenPart_10_01"); //Und, wer war dieser unbekannte Zettelschreiber?
	AI_Output(hero, self, "Info_Mod_Cyrco_MinenPart_15_02"); //Es war keiner da. Nur ein paar kleine Skelette und ein paar Spruchrollen.
	AI_Output(hero, self, "Info_Mod_Cyrco_MinenPart_15_03"); //Ein Beliarschrein stand an der Wand und da war eine Plattform, die scheint aber nicht zu funktionieren.
	AI_Output(self, hero, "Info_Mod_Cyrco_MinenPart_10_04"); //Ahh, jaa. Das passt zusammen. Die Rune, die du mir vorhin gegeben hast, ist eine Teleportrune, die an einer Beliarstatue aufgeladen werden muss.
	AI_Output(self, hero, "Info_Mod_Cyrco_MinenPart_10_05"); //Dazu muss man bei der Beliarstatue Knochen eines Skelettes, eines Goblins, sowie einen Tropfen eigenen Blutes vereinen.
	AI_Output(hero, self, "Info_Mod_Cyrco_MinenPart_15_06"); //Was du nicht alles weißt.
	AI_Output(self, hero, "Info_Mod_Cyrco_MinenPart_10_07"); //Gewiss. Die Rune scheint auch nur in der Nähe der Plattform zu funktionieren.

	B_GiveInvItems	(self, hero, ItMi_SpezielleRune, 1);

	AI_Output(hero, self, "Info_Mod_Cyrco_MinenPart_15_08"); //Aha. Und jetzt soll ich ...
	AI_Output(self, hero, "Info_Mod_Cyrco_MinenPart_10_09"); //Ei, gewiss doch.
	AI_Output(hero, self, "Info_Mod_Cyrco_MinenPart_15_10"); //Bin schon unterwegs.

	B_LogEntry	(TOPIC_MOD_JG_GARDISTEN, "Noch mal zum Mitschreiben: Ich soll je einen großen und einen kleinen Knochen und einen Tropfen eigenes Blut beim Beliarschrein ablegen. Dann funktiniert die Rune wieder und ich kann mit ihr weiter. Das funktioniert aber wohl nur nahe der Plattform. Mal sehen ...");
};

INSTANCE Info_Mod_Cyrco_SuchenderZettel (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_SuchenderZettel_Condition;
	information	= Info_Mod_Cyrco_SuchenderZettel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe den Teleporter erfolgreich benutzt.";
};

FUNC INT Info_Mod_Cyrco_SuchenderZettel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Suchender_Hi))
	&& (Mod_JG_MinenPart == 4)
	&& (Npc_HasItems(hero, ItWr_JGSuchenderNotiz) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cyrco_SuchenderZettel_Info()
{
	AI_Output(hero, self, "Info_Mod_Cyrco_SuchenderZettel_15_00"); //Ich habe den Teleporter erfolgreich benutzt.
	AI_Output(hero, self, "Info_Mod_Cyrco_SuchenderZettel_15_01"); //Ich bin im versunkenen Turm von Xardas gelandet, wo ich auf einen Suchenden traf.
	AI_Output(hero, self, "Info_Mod_Cyrco_SuchenderZettel_15_02"); //Er meinte, dass wir uns bald wieder sehen würden und hat sich dann wegteleportiert.
	AI_Output(hero, self, "Info_Mod_Cyrco_SuchenderZettel_15_03"); //Ich bin mir nicht sicher, ob er wirklich der Mörder ist, der hinter allem steckt.
	AI_Output(hero, self, "Info_Mod_Cyrco_SuchenderZettel_15_04"); //Desweiteren habe ich noch diesen Zettel hier gefunden.

	B_GiveInvItems	(hero, self, ItWr_JGSuchenderNotiz, 1);

	B_UseFakeScroll ();

	AI_Output(self, hero, "Info_Mod_Cyrco_SuchenderZettel_10_05"); //Scheint ganz so, als ob der Suchende uns schwächen will, vielleicht sogar zerstören.
	AI_Output(self, hero, "Info_Mod_Cyrco_SuchenderZettel_10_06"); //Es ist merkwürdig, dass ich an diesem Dokument kaum magische Kraft spüre, während das andere davon geradezu durchtränkt war. Nicht sehr beruhigend.
	AI_Output(self, hero, "Info_Mod_Cyrco_SuchenderZettel_10_07"); //Ich werde jeden Jäger und Waldläufer nach diesem Kerl suchen lassen. Ich danke dir für deine Hilfe.

	B_SetTopicStatus	(TOPIC_MOD_JG_GARDISTEN, LOG_SUCCESS);

	AI_Output(self, hero, "Info_Mod_Cyrco_SuchenderZettel_10_08"); //Ach, noch was.
	AI_Output(hero, self, "Info_Mod_Cyrco_SuchenderZettel_15_09"); //Ja?
	AI_Output(self, hero, "Info_Mod_Cyrco_SuchenderZettel_10_10"); //Ich habe die Nachricht von Dragomirs Unglück vernommen und gleich einen kleinen Trupp Waldläufer mit Begleitung zusammengestellt, ihn zu unterstützen.
	AI_Output(self, hero, "Info_Mod_Cyrco_SuchenderZettel_10_11"); //Wir müssen unseren Posten in Khorinis unbedingt halten, doch scheinen wir starke Gegner zu haben.
	AI_Output(self, hero, "Info_Mod_Cyrco_SuchenderZettel_10_12"); //Geh los und suche Rangar auf. Er müsste sich in der Nähe des Passes in Khorinis aufhalten.
	AI_Output(self, hero, "Info_Mod_Cyrco_SuchenderZettel_10_13"); //Sage ihm, dass er sich der Gruppe Waldläufer anschließen soll und Dragomir unterstützen muss.
	AI_Output(hero, self, "Info_Mod_Cyrco_SuchenderZettel_15_14"); //Rangar? Ich kenne einen Rangar in der Stadt. Der ist dort aber bei der Stadtwache ...
	AI_Output(self, hero, "Info_Mod_Cyrco_SuchenderZettel_10_15"); //Genau der. Er ist wohl zu den Jägern übergelaufen. So lauten jedenfalls meine Informationen.
	AI_Output(self, hero, "Info_Mod_Cyrco_SuchenderZettel_10_16"); //Und dann ist da noch einer von der Sorte. Er nennt sich Ruga.
	AI_Output(hero, self, "Info_Mod_Cyrco_SuchenderZettel_15_17"); //Das stimmt. Dem bin ich bei Dragomir begegnet. Er ist Armbrustlehrer.

	Info_ClearChoices	(Info_Mod_Cyrco_SuchenderZettel);

	Info_AddChoice	(Info_Mod_Cyrco_SuchenderZettel, "Warum könnt ihr Dragomir nicht einfach zurückkommen lassen?", Info_Mod_Cyrco_SuchenderZettel_B);
	Info_AddChoice	(Info_Mod_Cyrco_SuchenderZettel, "Hm, gut. Ich werde es tun.", Info_Mod_Cyrco_SuchenderZettel_A);
};

FUNC VOID Info_Mod_Cyrco_SuchenderZettel_B()
{
	AI_Output(hero, self, "Info_Mod_Cyrco_SuchenderZettel_B_15_00"); //Warum könnt ihr Dragomir nicht einfach zurückkommen lassen? Das wäre doch für alle sicherer!
	AI_Output(self, hero, "Info_Mod_Cyrco_SuchenderZettel_B_10_01"); //Weil ... (Pause) Nimm bitte erst einmal hin, dass wir es uns gerade in der jetzigen Situation nicht leisten können.
	AI_Output(self, hero, "Info_Mod_Cyrco_SuchenderZettel_B_10_02"); //Hier hast du ein paar Tränke für ihn. Verteile sie weise.

	CreateInvItems	(hero, ItPo_Health_01, 10);
	CreateInvItems	(hero, ItPo_Mana_01, 10);

	B_ShowGivenThings	("20 Tränke erhalten");

	Log_CreateTopic	(TOPIC_MOD_JG_DRAGOMIRHILFE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_DRAGOMIRHILFE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_DRAGOMIRHILFE, "Ich soll ein paar Tränke zu Dragomir bringen. Rangar, der die Tränke entgegen nimmt, soll sich in der Nähe des Passes befinden.");

	Info_ClearChoices	(Info_Mod_Cyrco_SuchenderZettel);
};

FUNC VOID Info_Mod_Cyrco_SuchenderZettel_A()
{
	AI_Output(hero, self, "Info_Mod_Cyrco_SuchenderZettel_A_15_00"); //Hm, gut. Ich werde es tun.
	AI_Output(self, hero, "Info_Mod_Cyrco_SuchenderZettel_A_10_01"); //Gut. Nimm diese Heil- und Manatränke für ihn mit.

	CreateInvItems	(hero, ItPo_Health_01, 10);
	CreateInvItems	(hero, ItPo_Mana_01, 10);

	B_ShowGivenThings	("20 Tränke erhalten");

	Log_CreateTopic	(TOPIC_MOD_JG_DRAGOMIRHILFE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_DRAGOMIRHILFE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_DRAGOMIRHILFE, "Ich soll ein paar Tränke zu Dragomir bringen. Rangar, der die Tränke entgegen nimmt, soll sich in der Nähe des Passes befinden.");

	Info_ClearChoices	(Info_Mod_Cyrco_SuchenderZettel);
};

INSTANCE Info_Mod_Cyrco_NovizePass (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_NovizePass_Condition;
	information	= Info_Mod_Cyrco_NovizePass_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe einen Magiernovizen getroffen.";
};

FUNC INT Info_Mod_Cyrco_NovizePass_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Novize_JG_Pass_Hi))
	&& (Npc_HasItems(hero, ItWr_NovizeJGPass) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cyrco_NovizePass_Info()
{
	AI_Output(hero, self, "Info_Mod_Cyrco_NovizePass_15_00"); //Ich habe einen Magiernovizen getroffen. Er sah aus wie ein Magier des Feuers.
	AI_Output(self, hero, "Info_Mod_Cyrco_NovizePass_10_01"); //Schon wieder ein Feuermagier? Das ist merkwürdig. Hat er vielleicht etwas dabei gehabt?
	AI_Output(hero, self, "Info_Mod_Cyrco_NovizePass_15_02"); //Ja, diese Notiz habe ich ihm abgenommen.

	B_GiveInvItems	(hero, self, ItWr_NovizeJGPass, 1);

	B_UseFakeScroll ();

	AI_Output(self, hero, "Info_Mod_Cyrco_NovizePass_10_03"); //Hm, lasst einmal sehen. Der Name kommt mir irgendwoher bekannt vor.
	AI_Output(self, hero, "Info_Mod_Cyrco_NovizePass_10_04"); //Geht mit der Notiz am besten zu Wulfgar, er ist mit der alten Geschichte von uns am besten vertraut.

	B_GiveInvItems	(self, hero, ItWr_NovizeJGPass, 1);

	AI_Output(self, hero, "Info_Mod_Cyrco_NovizePass_10_05"); //Du findest ihn weiter hinten in der Höhle, dort hat er sein Alchemielabor.

	B_SetTopicStatus	(TOPIC_MOD_JG_GARDISTEN, LOG_SUCCESS);
};

INSTANCE Info_Mod_Cyrco_Turm (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_Turm_Condition;
	information	= Info_Mod_Cyrco_Turm_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cyrco_Turm_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Turm))
	&& (Mod_SuchenderAtTurm == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cyrco_Turm_Info()
{
	AI_Output(self, hero, "Info_Mod_Cyrco_Turm_10_00"); //Wohin so schnell?
	AI_Output(hero, self, "Info_Mod_Cyrco_Turm_15_01"); //Zum Nebelturm. Wulfgar meint, ich soll da mal nachschauen wegen Khorgor.
	AI_Output(self, hero, "Info_Mod_Cyrco_Turm_10_02"); //Viel Erfolg! Und Vorsicht.
	AI_Output(hero, self, "Info_Mod_Cyrco_Turm_15_03"); //Ich weiß ...

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Cyrco_DragoHilfeII (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_DragoHilfeII_Condition;
	information	= Info_Mod_Cyrco_DragoHilfeII_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cyrco_DragoHilfeII_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Turm2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cyrco_DragoHilfeII_Info()
{
	AI_Output(self, hero, "Info_Mod_Cyrco_DragoHilfeII_10_00"); //Stopp! Bleib stehen!
	AI_Output(hero, self, "Info_Mod_Cyrco_DragoHilfeII_15_01"); //Ja, Ehrwürdiger?
	AI_Output(self, hero, "Info_Mod_Cyrco_DragoHilfeII_10_02"); //Schlimme Kunde aus Khorinis.
	AI_Output(hero, self, "Info_Mod_Cyrco_DragoHilfeII_15_03"); //Oh, oh. Erzähl ...
	AI_Output(self, hero, "Info_Mod_Cyrco_DragoHilfeII_10_04"); //Die Mannen um Dragomir sind stärksten Angriffen ausgesetzt.
	AI_Output(self, hero, "Info_Mod_Cyrco_DragoHilfeII_10_05"); //Du bist gut in Form. Du musst ihnen helfen. Sofort.
	AI_Output(hero, self, "Info_Mod_Cyrco_DragoHilfeII_15_06"); //Bin schon unterwegs.

	AI_StopProcessInfos	(self);

	Log_CreateTopic	(TOPIC_MOD_JG_DRAGOMIRHILFE2, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_DRAGOMIRHILFE2, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_DRAGOMIRHILFE2, "Dragomir braucht Hilfe. Immer ich.");
};

INSTANCE Info_Mod_Cyrco_DragoHilfeII2 (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_DragoHilfeII2_Condition;
	information	= Info_Mod_Cyrco_DragoHilfeII2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bin zurück aus Khorinis.";
};

FUNC INT Info_Mod_Cyrco_DragoHilfeII2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_HilfeII))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cyrco_DragoHilfeII2_Info()
{
	AI_Output(hero, self, "Info_Mod_Cyrco_DragoHilfeII2_15_00"); //Bin zurück aus Khorinis.
	AI_Output(self, hero, "Info_Mod_Cyrco_DragoHilfeII2_10_01"); //Und? Was gibt's zu berichten?
	AI_Output(hero, self, "Info_Mod_Cyrco_DragoHilfeII2_15_02"); //Die Angriffe auf das neue Lager werden immer heftiger. Wir konnten den Feind mit Mühe zurückschlagen.
	AI_Output(self, hero, "Info_Mod_Cyrco_DragoHilfeII2_10_03"); //Gab es Tote bei euch?
	AI_Output(hero, self, "Info_Mod_Cyrco_DragoHilfeII2_15_04"); //Leider. Wild ist gefallen, Nandor wurde schwer verletzt.
	AI_Output(self, hero, "Info_Mod_Cyrco_DragoHilfeII2_10_05"); //Habt ihr den Heiler geholt?
	AI_Output(hero, self, "Info_Mod_Cyrco_DragoHilfeII2_15_06"); //Dragomir wird die Kräuterhexe verständigen.
	AI_Output(self, hero, "Info_Mod_Cyrco_DragoHilfeII2_10_07"); //Sehr gut. Dich kann man schicken. Ich ernenne dich hiermit zum Waldläufer dritten Grades.
	AI_Output(hero, self, "Info_Mod_Cyrco_DragoHilfeII2_15_08"); //Das bedeutet?
	AI_Output(self, hero, "Info_Mod_Cyrco_DragoHilfeII2_10_09"); //Du bekommst diese Rüstung hier.

	B_GiveInvItems	(self, hero, ItAr_Waldlaeufer_01, 1);

	AI_Output(self, hero, "Info_Mod_Cyrco_DragoHilfeII2_10_10"); //Und wahlweise bekommst du noch einen Knochenbogen oder eine Kriegsarmbrust.

	B_SetTopicStatus	(TOPIC_MOD_JG_DRAGOMIRHILFE2, LOG_SUCCESS);

	Info_ClearChoices	(Info_Mod_Cyrco_DragoHilfeII2);

	Info_AddChoice	(Info_Mod_Cyrco_DragoHilfeII2, "Ich hätte gerne die Armbrust.", Info_Mod_Cyrco_DragoHilfeII2_B);
	Info_AddChoice	(Info_Mod_Cyrco_DragoHilfeII2, "Ich hätte gerne den Bogen.", Info_Mod_Cyrco_DragoHilfeII2_A);
};

FUNC VOID Info_Mod_Cyrco_DragoHilfeII2_C()
{
	AI_Output(self, hero, "Info_Mod_Cyrco_DragoHilfeII2_C_10_00"); //Wie du willst.
	AI_Output(hero, self, "Info_Mod_Cyrco_DragoHilfeII2_C_15_01"); //Danke, Meister.
	AI_Output(self, hero, "Info_Mod_Cyrco_DragoHilfeII2_C_10_02"); //Adanos sei mit dir.
	AI_Output(self, hero, "Info_Mod_Cyrco_DragoHilfeII2_C_10_03"); //Komm später wieder.
	
	Info_ClearChoices	(Info_Mod_Cyrco_DragoHilfeII2);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Cyrco_DragoHilfeII2_B()
{
	AI_Output(hero, self, "Info_Mod_Cyrco_DragoHilfeII2_B_15_00"); //Ich hätte gerne die Armbrust.
	
	B_GiveInvItems	(self, hero, ItRw_Crossbow_M_02, 1);

	Info_Mod_Cyrco_DragoHilfeII2_C();
};

FUNC VOID Info_Mod_Cyrco_DragoHilfeII2_A()
{
	AI_Output(hero, self, "Info_Mod_Cyrco_DragoHilfeII2_A_15_00"); //Ich hätte gerne den Bogen.
	
	B_GiveInvItems	(self, hero, ItRw_Bow_H_01, 1);

	Info_Mod_Cyrco_DragoHilfeII2_C();
};

INSTANCE Info_Mod_Cyrco_Opferschale (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_Opferschale_Condition;
	information	= Info_Mod_Cyrco_Opferschale_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cyrco_Opferschale_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Riordian_AW_ScrollJG2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cyrco_Opferschale_Info()
{
	AI_Output(self, hero, "Info_Mod_Cyrco_Opferschale_10_00"); //Gut, dass du kommst.
	AI_Output(hero, self, "Info_Mod_Cyrco_Opferschale_15_01"); //Was ist jetzt schon wieder?
	AI_Output(self, hero, "Info_Mod_Cyrco_Opferschale_10_02"); //Frag lieber, was nicht ist.
	AI_Output(hero, self, "Info_Mod_Cyrco_Opferschale_15_03"); //Was ist nicht?
	AI_Output(self, hero, "Info_Mod_Cyrco_Opferschale_10_04"); //Unsere Mannstärke.
	AI_Output(hero, self, "Info_Mod_Cyrco_Opferschale_15_05"); //Das heißt, wir brauchen mehr Leute?
	AI_Output(self, hero, "Info_Mod_Cyrco_Opferschale_10_06"); //Gewiss. Wir haben hier zwei Mann verloren, Dragomir drei Mann, soviel ich weiß.
	AI_Output(hero, self, "Info_Mod_Cyrco_Opferschale_15_07"); //Das stimmt. Und an wen hast du dabei gedacht?
	AI_Output(self, hero, "Info_Mod_Cyrco_Opferschale_10_08"); //Nahkämpfer können wir brauchen. Nahkämpfer.
	AI_Output(hero, self, "Info_Mod_Cyrco_Opferschale_15_09"); //Hmm. Ich glaube, bei Onar auf dem Hof lungern immer ein paar Söldner rum. Könnte da mal fragen.
	AI_Output(self, hero, "Info_Mod_Cyrco_Opferschale_10_10"); //Und im neuen Lager?
	AI_Output(hero, self, "Info_Mod_Cyrco_Opferschale_15_11"); //Mal sehen, was sich dort ergibt.
	AI_Output(self, hero, "Info_Mod_Cyrco_Opferschale_10_12"); //Mach das.
	AI_Output(hero, self, "Info_Mod_Cyrco_Opferschale_15_13"); //Hab verstanden. Übrigens, weißt du was über eine Opferschale?
	AI_Output(self, hero, "Info_Mod_Cyrco_Opferschale_10_14"); //Meinst du eine bestimmte Schale?
	AI_Output(hero, self, "Info_Mod_Cyrco_Opferschale_15_15"); //Eigentlich ja. Aber was ist bestimmt? Werde mal Wulfgar fragen.

	Log_CreateTopic	(TOPIC_MOD_JG_NAHKAMPF, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_NAHKAMPF, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_NAHKAMPF, "Ich soll mindestens zwei Mann für die Waldläufer rekrutieren. Bei Onar lungern welche rum. Und im Neuen Lager kann ich auch mal fragen.");
};

INSTANCE Info_Mod_Cyrco_Nahkampf (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_Nahkampf_Condition;
	information	= Info_Mod_Cyrco_Nahkampf_Info;
	permanent	= 0;
	important	= 0;
	description	= "Auftrag ausgeführt. Sind die Kämpfer schon da?";
};

FUNC INT Info_Mod_Cyrco_Nahkampf_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Nahkampf2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cyrco_Nahkampf_Info()
{
	AI_Output(hero, self, "Info_Mod_Cyrco_Nahkampf_15_00"); //Auftrag ausgeführt. Sind die Kämpfer schon da?
	AI_Output(self, hero, "Info_Mod_Cyrco_Nahkampf_10_01"); //Einer ja. Er trainiert schon mit den Jägern. Ein fähiger Mann, scheint mir.
	AI_Output(hero, self, "Info_Mod_Cyrco_Nahkampf_15_02"); //Gut zu hören. Der Zweite kommt von Onars Hof.
	AI_Output(hero, self, "Info_Mod_Cyrco_Nahkampf_15_03"); //Allerdings musste ich dem Anführer dort versprechen, dass ihr im Austausch einen Jäger nach Khorinis schickt.
	AI_Output(hero, self, "Info_Mod_Cyrco_Nahkampf_15_04"); //Hoffe, das war in eurem Sinne.
	AI_Output(self, hero, "Info_Mod_Cyrco_Nahkampf_10_05"); //Ei, gewiss. Ein Nahkämpfer ist hier wichtiger. Ich werde den Sonor schicken, wenn der Neue hier eintrifft.

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_JG_NAHKAMPF, "Cyrco wird Sonor als Austausch zu Lares schicken.");
	B_SetTopicStatus	(TOPIC_MOD_JG_NAHKAMPF, LOG_SUCCESS);

	Wld_InsertNpc	(Mod_7679_SLD_Falin_JL,	"JL_45");
};

INSTANCE Info_Mod_Cyrco_Sweetwater (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_Sweetwater_Condition;
	information	= Info_Mod_Cyrco_Sweetwater_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tag Ehrwürdiger. Ist der Neue da?";
};

FUNC INT Info_Mod_Cyrco_Sweetwater_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_Nahkampf))
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cyrco_Sweetwater_Info()
{
	AI_Output(hero, self, "Info_Mod_Cyrco_Sweetwater_15_00"); //Tag, Ehrwürdiger. Ist der Neue da?
	AI_Output(self, hero, "Info_Mod_Cyrco_Sweetwater_10_01"); //Ei, gewiss, dieser Hock ist auch da. Und hat gleich eine Botschaft.
	AI_Output(hero, self, "Info_Mod_Cyrco_Sweetwater_15_02"); //Für mich?
	AI_Output(self, hero, "Info_Mod_Cyrco_Sweetwater_10_03"); //Genau. Er trainiert hinten.
};

INSTANCE Info_Mod_Cyrco_Sweetwater2 (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_Sweetwater2_Condition;
	information	= Info_Mod_Cyrco_Sweetwater2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cyrco_Sweetwater2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Sweetwater2))
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cyrco_Sweetwater2_Info()
{
	AI_Output(self, hero, "Info_Mod_Cyrco_Sweetwater2_10_00"); //Du bist zurück. Was war los?
	AI_Output(hero, self, "Info_Mod_Cyrco_Sweetwater2_15_01"); //Die Leute in Jharkendar hatten Wasserprobleme. Hatten!
	AI_Output(self, hero, "Info_Mod_Cyrco_Sweetwater2_10_02"); //Jharkendar?
	AI_Output(hero, self, "Info_Mod_Cyrco_Sweetwater2_15_03"); //Gewiss. Ein neues Gebiet jenseits von Khorinis.
	AI_Output(hero, self, "Info_Mod_Cyrco_Sweetwater2_15_04"); //Könnte westlich von Relendel liegen, ist aber unzugänglich und nur über ein Portal zu erreichen.
	AI_Output(hero, self, "Info_Mod_Cyrco_Sweetwater2_15_05"); //Die Wassermagier haben es mit meiner Hilfe entdeckt.
	AI_Output(self, hero, "Info_Mod_Cyrco_Sweetwater2_10_06"); //Interessant. Und wie kommt man da hin?
	AI_Output(hero, self, "Info_Mod_Cyrco_Sweetwater2_15_07"); //Wie gesagt, südöstlich vom Durchgang nach Relendel ist ein großer alter Tempel, daneben eine Ausgrabungsstätte und darin das Portal.
	AI_Output(self, hero, "Info_Mod_Cyrco_Sweetwater2_10_08"); //Wo du gerade Relendel erwähnst. Mir kam zu Ohren, die hätten da ein neues Rezept erfunden.
	AI_Output(self, hero, "Info_Mod_Cyrco_Sweetwater2_10_09"); //Man erzählt sich wahre Wunderdinge darüber. Aber niemand weiß was Genaues. Du solltest ...
	AI_Output(hero, self, "Info_Mod_Cyrco_Sweetwater2_15_10"); //... da mal nachschauen. Ich weiß. Übrigens heißt das Zeug Freudenspender.
	AI_Output(hero, self, "Info_Mod_Cyrco_Sweetwater2_15_11"); //Soll die Wahrnehmung verändern. Die Leute werden seltsam davon.
	AI_Output(self, hero, "Info_Mod_Cyrco_Sweetwater2_10_12"); //Nun ja, ich bin persönlich daran interessiert. Du würdest es auch nicht umsonst tun.
	AI_Output(hero, self, "Info_Mod_Cyrco_Sweetwater2_15_13"); //Das heißt?
	AI_Output(self, hero, "Info_Mod_Cyrco_Sweetwater2_10_14"); //Ich hätte da noch einen Titel zu vergeben ...
	AI_Output(hero, self, "Info_Mod_Cyrco_Sweetwater2_15_15"); //Verstehe. Wenn sonst nichts anliegt ...
	AI_Output(self, hero, "Info_Mod_Cyrco_Sweetwater2_10_16"); //Nein, im Moment nicht. Wir dürfen aber diesen Khorgor nicht aus den Augen verlieren.
	AI_Output(hero, self, "Info_Mod_Cyrco_Sweetwater2_15_17"); //Bestimmt nicht. Bis später.
	AI_Output(self, hero, "Info_Mod_Cyrco_Sweetwater2_10_18"); //Adanos mit dir!

	Log_CreateTopic	(TOPIC_MOD_JG_RELENDEL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_RELENDEL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_RELENDEL, "Cyrco will, dass ich mich in Khorata nach etwas Freudenspender umsehe.");
};

INSTANCE Info_Mod_Cyrco_Drachental (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_Drachental_Condition;
	information	= Info_Mod_Cyrco_Drachental_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bin zurück, Meister. Hab viel zu berichten.";
};

FUNC INT Info_Mod_Cyrco_Drachental_Condition()
{
	if (Mod_JG_SuchenderDT == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cyrco_Drachental_Info()
{
	AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_00"); //Bin zurück, Meister. Hab viel zu berichten.
	AI_Output(self, hero, "Info_Mod_Cyrco_Drachental_10_01"); //(eifrig) Und.? Hast du ...

	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 2)
	{
		AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_02"); //Ei, gewiss. Hier hast du zwei Phiolen.

		B_GiveInvItems	(hero, self, ItMi_Freudenspender, 2);

		AI_Output(self, hero, "Info_Mod_Cyrco_Drachental_10_03"); //Gut. Und weißt du wie ...
		AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_04"); //Leider nein. Selbst die Bewohner Khoratas wissen nicht, wie das Zeug gebraut wird.
		AI_Output(self, hero, "Info_Mod_Cyrco_Drachental_10_05"); //Aber woher bekommen die es?
		AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_06"); //Es gibt da irgendwo eine Enklave, die sich Hofstaat nennt. Da kommt es wohl her.
		AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_07"); //Bevor du weiter fragst: Nur wenigen ist es erlaubt, dieses Gebiet zu betreten.
		AI_Output(self, hero, "Info_Mod_Cyrco_Drachental_10_08"); //Nun gut. Und wie wirkt das Zeug?
		AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_09"); //Ähnlich wie Sumpfkraut. Nur viel intensiver. Und man wird abhängig davon.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_10"); //Leider nein.
		AI_Output(self, hero, "Info_Mod_Cyrco_Drachental_10_11"); //Hmm ... sehr schade.
	};

	AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_12"); //Aber ist das alles, was du wissen willst?
	AI_Output(self, hero, "Info_Mod_Cyrco_Drachental_10_13"); //Bei Adanos, nein! Was hast du sonst noch erfahren?
	AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_14"); //Dieser Suchende, der die Überfälle auf die Jäger und das Lager veranlasst hat, ist tot.
	AI_Output(self, hero, "Info_Mod_Cyrco_Drachental_10_15"); //Sprich weiter. Woher weißt du das?
	AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_16"); //Ich habe ihn endlich erwischt. Er hauste in einem kleinen Tal.
	AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_17"); //Und ich denke, dass dieser Khorgor auch dort zu finden ist.
	AI_Output(self, hero, "Info_Mod_Cyrco_Drachental_10_18"); //Und warum hast du nicht gleich ...
	AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_19"); //Mach langsam, alter Herr. Ich wurde zurückgeworfen in die geheime Höhle bei der Alten Mine.
	AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_20"); //Bin nur hier, um Bericht zu erstatten. Und wie war das mit dem Titel, den du zu vergeben hast?
	AI_Output(self, hero, "Info_Mod_Cyrco_Drachental_10_21"); //Hm ... der Waldläufer erster Klasse. Also gut: Bringe mir Khorgors Kopf und ich verleihe dir den Rang des höchsten Waldläufers.
	AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_22"); //Das ist doch ein Wort. Hast du vielleicht einen Tipp?
	AI_Output(self, hero, "Info_Mod_Cyrco_Drachental_10_23"); //Hast du noch diesen seltsamen Runenquader?
	AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_24"); //Schon. Aber dafür braucht's die Opferschale.
	AI_Output(self, hero, "Info_Mod_Cyrco_Drachental_10_25"); //Die wird schon da sein, wenn sie gebraucht wird.
	AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_26"); //Na hoffentlich.
	AI_Output(self, hero, "Info_Mod_Cyrco_Drachental_10_27"); //Viel Glück, Läufer!
	AI_Output(hero, self, "Info_Mod_Cyrco_Drachental_15_28"); //Danke, Meister.

	B_LogEntry	(TOPIC_MOD_JG_DRACHENTAL, "Habe Cyrco Bericht erstattet. Er ernennt mich zum Ober-Waldläufer, wenn ich ihm Khorgors Kopf bringe. Und er hat mich an diese seltsame Quaderrune erinnert. Mal sehen.");
};

INSTANCE Info_Mod_Cyrco_Khorgor (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_Khorgor_Condition;
	information	= Info_Mod_Cyrco_Khorgor_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cyrco_Khorgor_Condition()
{
	if (Mod_JG_Khorgor == 2)
	&& (Npc_HasItems(hero, ItAt_KhorgorKopf) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cyrco_Khorgor_Info()
{
	AI_Output(self, hero, "Info_Mod_Cyrco_Khorgor_10_00"); //Adanos zum Gruß!
	AI_Output(hero, self, "Info_Mod_Cyrco_Khorgor_15_01"); //Auf das Gleichgewicht, Meister.
	AI_Output(self, hero, "Info_Mod_Cyrco_Khorgor_10_02"); //Berichte. Was hast du zu melden?
	AI_Output(hero, self, "Info_Mod_Cyrco_Khorgor_15_03"); //Einen kopflosen irren Magier. Er wollte das absolute Chaos erschaffen. Und es beherrschen.

	B_GiveInvItems	(hero, self, ItAt_KhorgorKopf, 1);

	AI_StopProcessInfos	(hero);
};

INSTANCE Info_Mod_Cyrco_Khorgor2 (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_Khorgor2_Condition;
	information	= Info_Mod_Cyrco_Khorgor2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cyrco_Khorgor2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Khorgor))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cyrco_Khorgor2_Info()
{
	AI_Output(self, hero, "Info_Mod_Cyrco_Khorgor2_10_00"); //So sollst du die versprochene Weihe erhalten. Ich ernenne dich hiermit zum Waldläufer ersten Grades. Wulfgar ist mein Zeuge.
	AI_Output(hero, self, "Info_Mod_Cyrco_Khorgor2_15_01"); //Untertänigsten Dank, Meister. Stets zu Diensten. Aber nun muss ich erst mal zurück nach Khorinis.
	AI_Output(self, hero, "Info_Mod_Cyrco_Khorgor2_10_02"); //Ei, gewiss. Viel Glück noch.

	B_SetTopicStatus	(TOPIC_MOD_JG_DRACHENTAL, LOG_SUCCESS);

	B_GivePlayerXP	(500);
};

INSTANCE Info_Mod_Cyrco_Pickpocket (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_Pickpocket_Condition;
	information	= Info_Mod_Cyrco_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Cyrco_Pickpocket_Condition()
{
	C_Beklauen	(175, ItMi_Gold, 1200);
};

FUNC VOID Info_Mod_Cyrco_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Cyrco_Pickpocket);

	Info_AddChoice	(Info_Mod_Cyrco_Pickpocket, DIALOG_BACK, Info_Mod_Cyrco_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Cyrco_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Cyrco_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Cyrco_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Cyrco_Pickpocket);
};

FUNC VOID Info_Mod_Cyrco_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Cyrco_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Cyrco_Pickpocket);

		Info_AddChoice	(Info_Mod_Cyrco_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Cyrco_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Cyrco_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Cyrco_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Cyrco_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Cyrco_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Cyrco_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Cyrco_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Cyrco_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Cyrco_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Cyrco_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Cyrco_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Cyrco_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Cyrco_EXIT (C_INFO)
{
	npc		= Mod_7417_JG_Cyrco_JL;
	nr		= 1;
	condition	= Info_Mod_Cyrco_EXIT_Condition;
	information	= Info_Mod_Cyrco_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Cyrco_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cyrco_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};