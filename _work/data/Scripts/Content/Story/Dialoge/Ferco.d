INSTANCE Info_Mod_Ferco_Hi (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_Hi_Condition;
	information	= Info_Mod_Ferco_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ferco_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ferco_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Ferco_Hi_02_00"); //Hey du! Was willst du hier?
};

INSTANCE Info_Mod_Ferco_WerBistDu (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_WerBistDu_Condition;
	information	= Info_Mod_Ferco_WerBistDu_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Ferco_WerBistDu_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Ferco_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Ferco_Einnehmen)))
	|| (Npc_KnowsInfo(hero, Info_Mod_Ferco_Loser))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_WerBistDu_Info()
{
	AI_Output(hero, self, "Info_Mod_Ferco_WerBistDu_15_00"); //Wer bist du?
	AI_Output(self, hero, "Info_Mod_Ferco_WerBistDu_02_01"); //Mein Name ist Ferco. Ich bin einer der Torwächter hier, wie du siehst.
};

INSTANCE Info_Mod_Ferco_Guarding (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_Guarding_Condition;
	information	= Info_Mod_Ferco_Guarding_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was bewachst du?";
};

FUNC INT Info_Mod_Ferco_Guarding_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_WerBistDu))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_Guarding_Info()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Guarding_15_00"); //Was bewachst du?
	AI_Output(self, hero, "Info_Mod_Ferco_Guarding_02_01"); //Das hier ist das Lager der Verwandlungsmagier. Ich würde ihnen nicht zu nahe kommen.

	AI_PlayAni(self, "T_SEARCH");

	AI_Output(self, hero, "Info_Mod_Ferco_Guarding_02_02"); //Ich glaube sie spinnen ein wenig.
	AI_Output(hero, self, "Info_Mod_Ferco_Guarding_15_03"); //(zu sich) Das kommt mir doch bekannt vor ... (zu Ferco) Kann ich rein?
	AI_Output(self, hero, "Info_Mod_Ferco_Guarding_02_04"); //Nein, dazu bist du nicht bereit. Wir kennen dich ja gar nicht. Aber wenn du dich nützlich machen willst, kannst du das gerne tun. (lacht) Arbeit haben wir immer zu erledigen.
};

INSTANCE Info_Mod_Ferco_Aufgabe (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_Aufgabe_Condition;
	information	= Info_Mod_Ferco_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was gibt es zu tun?";
};

FUNC INT Info_Mod_Ferco_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_Guarding))
	&& (Mod_Gilde > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Aufgabe_15_00"); //Was gibt es zu tun?
	AI_Output(self, hero, "Info_Mod_Ferco_Aufgabe_02_01"); //Dort unten in einer Höhle hat mal ein Schattenläufer gehaust. Dort müssten einige Überreste zu finden sein. Die könntest du mir bringen, die Magier arbeiten nämlich an einem neuen Verwandlungszauber.
	AI_Output(hero, self, "Info_Mod_Ferco_Aufgabe_15_02"); //Alles klar.
	AI_Output(self, hero, "Info_Mod_Ferco_Aufgabe_02_03"); //Komm wieder, wenn du die Trophäen hast.

	Log_CreateTopic	(TOPIC_MOD_FERCO_SCHATTI, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FERCO_SCHATTI, LOG_RUNNING);
	Log_CreateTopic	(TOPIC_MOD_VMG_AUFNAHME, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_VMG_AUFNAHME, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_VMG_AUFNAHME, TOPIC_MOD_FERCO_SCHATTI, "Um ein Verwandlungsmagier zu werden sollte ich mich zuerst mal mit der Torwache Ferco gut stellen.", "Ferco, eine Torwache des Lagers der Verwandlungsmagier, hat mir aufgetragen, in der Nähe der ehemaligen Klosterruine nach Überresten eines Schattenläufers zu suchen.");
};

INSTANCE Info_Mod_Ferco_Einnehmen (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_Einnehmen_Condition;
	information	= Info_Mod_Ferco_Einnehmen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin gekommen, um die Klosterruine einzunehmen.";
};

FUNC INT Info_Mod_Ferco_Einnehmen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Ferco_WerBistDu))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_Einnehmen_Info()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Einnehmen_15_00"); //Ich bin gekommen, um die Klosterruine einzunehmen.
	AI_Output(self, hero, "Info_Mod_Ferco_Einnehmen_02_01"); //Ach ja? Dann komm mal her, Bürschchen!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

INSTANCE Info_Mod_Ferco_Umgehauen (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_Umgehauen_Condition;
	information	= Info_Mod_Ferco_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ferco_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_Einnehmen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_Umgehauen_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Ferco_Umgehauen_02_00"); //Mannomann! Du hast ja 'nen ganz schönen Schlag drauf.

			Mod_FercoBesiegt	=	1;
		}
		else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Ferco_Umgehauen_02_01"); //Na, du Großmaul?
		};
							
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};
};

INSTANCE Info_Mod_Ferco_Loser (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_Loser_Condition;
	information	= Info_Mod_Ferco_Loser_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und? Immer noch große Klappe?";
};

FUNC INT Info_Mod_Ferco_Loser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_Umgehauen))
	&& (Mod_FercoBesiegt == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_Loser_Info()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Loser_15_00"); //Und? Immer noch große Klappe?
	AI_Output(self, hero, "Info_Mod_Ferco_Loser_02_01"); //Was willst du hier? Du bist kräftig, aber nicht sehr intelligent, wie mir scheint.
};

INSTANCE Info_Mod_Ferco_NotSpeaking (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_NotSpeaking_Condition;
	information	= Info_Mod_Ferco_NotSpeaking_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Ferco_NotSpeaking_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_Aufgabe))
	&& (Npc_IsInState(self, ZS_Talk))
	&& ((Npc_HasItems(hero, ItAt_ShadowFur) == 0)
	|| (Npc_HasItems(hero, ItAt_ShadowHorn) == 0)
	|| (Npc_HasItems(hero, ItAt_Claw) < 2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Ferco_AllesDabei))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_NotSpeaking_Info()
{
	AI_Output(self, hero, "Info_Mod_Ferco_NotSpeaking_02_00"); //Du weißt, was du zu tun hast.
};

INSTANCE Info_Mod_Ferco_AllesDabei (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_AllesDabei_Condition;
	information	= Info_Mod_Ferco_AllesDabei_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ferco_AllesDabei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_Aufgabe))
	&& (Npc_IsInState(self, ZS_Talk))
	&& (Npc_HasItems(hero, ItAt_ShadowFur) >= 1)
	&& (Npc_HasItems(hero, ItAt_ShadowHorn) >= 1)
	&& (Npc_HasItems(hero, ItAt_Claw) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_AllesDabei_Info()
{
	AI_Output(self, hero, "Info_Mod_Ferco_AllesDabei_02_00"); //Was willst du noch?
};

INSTANCE Info_Mod_Ferco_HabAlles (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_HabAlles_Condition;
	information	= Info_Mod_Ferco_HabAlles_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe die Überreste gefunden.";
};

FUNC INT Info_Mod_Ferco_HabAlles_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_AllesDabei))
	&& (Npc_HasItems(hero, ItAt_ShadowFur) >= 1)
	&& (Npc_HasItems(hero, ItAt_ShadowHorn) >= 1)
	&& (Npc_HasItems(hero, ItAt_Claw) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_HabAlles_Info()
{
	AI_Output(hero, self, "Info_Mod_Ferco_HabAlles_15_00"); //Ich habe die Überreste gefunden.
	AI_Output(self, hero, "Info_Mod_Ferco_HabAlles_02_01"); //Dann zeig mal her.
	AI_Output(hero, self, "Info_Mod_Ferco_HabAlles_15_02"); //Hier. Das sollte genügen.

	Npc_RemoveInvItems	(hero, ItAt_ShadowFur, 1);
	Npc_RemoveInvItems	(hero, ItAt_ShadowHorn, 1);
	Npc_RemoveInvItems	(hero, ItAt_Claw, 2);

	B_ShowGivenThings	("Gegenstände gegeben");

	AI_Output(self, hero, "Info_Mod_Ferco_HabAlles_02_03"); //Vielen Dank. Du bist in Ordnung, Mann. Hast du Lust noch einen Job zu übernehmen?

	B_SetTopicStatus	(TOPIC_MOD_FERCO_SCHATTI, LOG_SUCCESS);

	B_LogEntry	(TOPIC_MOD_VMG_AUFNAHME, "Die erste Aufgabe habe ich erfüllt. Mal sehen, ob Ferco noch mehr für mich hat.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Ferco_ZweiteQuest (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_ZweiteQuest_Condition;
	information	= Info_Mod_Ferco_ZweiteQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was gibt es zu tun?";
};

FUNC INT Info_Mod_Ferco_ZweiteQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_HabAlles))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_ZweiteQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Ferco_ZweiteQuest_15_00"); //Was gibt es zu tun?
	AI_Output(self, hero, "Info_Mod_Ferco_ZweiteQuest_02_01"); //Irgendein Idiot hat die Klosterruine mal als Fleischwanze durch einen Spalt in der Mauer betreten.
	AI_Output(hero, self, "Info_Mod_Ferco_ZweiteQuest_15_02"); //(betont überrascht) Wer kommt denn auf solche Ideen?
	AI_Output(self, hero, "Info_Mod_Ferco_ZweiteQuest_02_03"); //Ich weiß es nicht. Aber bei der Aktion ist die letzte bekannte Spruchrolle dieser Art verbraucht worden.
	AI_Output(self, hero, "Info_Mod_Ferco_ZweiteQuest_02_04"); //Wäre schön, wenn du eine neue beschaffen könntest.
};

INSTANCE Info_Mod_Ferco_Crazy (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_Crazy_Condition;
	information	= Info_Mod_Ferco_Crazy_Info;
	permanent	= 0;
	important	= 0;
	description	= "Willst du mich verarschen?";
};

FUNC INT Info_Mod_Ferco_Crazy_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_ZweiteQuest))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_Crazy_Info()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Crazy_15_00"); //Willst du mich verarschen? Wo soll ich die denn herbekommen, wenn es keine mehr gibt?
	AI_Output(self, hero, "Info_Mod_Ferco_Crazy_02_01"); //Ich habe gesagt, die letzte bekannte. Die Magier glauben, dass es noch einige gibt. Angeblich in kälteren Gebieten, da sie dort gut konserviert wurden.
	AI_Output(hero, self, "Info_Mod_Ferco_Crazy_15_02"); //Warum gehen sie dann nicht in diese kälteren Gebiete und suchen danach?
	AI_Output(self, hero, "Info_Mod_Ferco_Crazy_02_03"); //Sie kommen aus einem Land namens Tugettso. Vielleicht hast du schon davon gehört. Dort sind die Temperaturen höher als hier.
	AI_Output(self, hero, "Info_Mod_Ferco_Crazy_02_04"); //Sie sind gegen solchen Temperaturen nicht widerstandsfähig genug und könnten ihre Arbeit nicht fortsetzen.

	Info_ClearChoices	(Info_Mod_Ferco_Crazy);

	Info_AddChoice	(Info_Mod_Ferco_Crazy, "Als Laufbursche bin ich mir zu schade.", Info_Mod_Ferco_Crazy_C);
	Info_AddChoice	(Info_Mod_Ferco_Crazy, "Ich komme auch aus warmen Gefilden.", Info_Mod_Ferco_Crazy_B);
	Info_AddChoice	(Info_Mod_Ferco_Crazy, "Okay, ich mach’s. Hast du noch weitere nützliche Tipps?", Info_Mod_Ferco_Crazy_A);
};

FUNC VOID Info_Mod_Ferco_Crazy_C()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Crazy_C_15_00"); //Als Laufbursche bin ich mir zu schade.

	VMG_Second = 1;

	Info_ClearChoices	(Info_Mod_Ferco_Crazy);
};

FUNC VOID Info_Mod_Ferco_Crazy_B()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Crazy_B_15_00"); //Ich komme auch aus warmen Gefilden.
	AI_Output(self, hero, "Info_Mod_Ferco_Crazy_B_02_01"); //Machst du’s jetzt oder nicht?

	Info_ClearChoices	(Info_Mod_Ferco_Crazy);

	Info_AddChoice	(Info_Mod_Ferco_Crazy, "Als Laufbursche bin ich mir zu schade.", Info_Mod_Ferco_Crazy_C);
	Info_AddChoice	(Info_Mod_Ferco_Crazy, "Okay, ich mach’s. Hast du noch weitere nützliche Tipps?", Info_Mod_Ferco_Crazy_A);
};

FUNC VOID Info_Mod_Ferco_Crazy_A()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Crazy_A_15_00"); //Okay, ich mach’s. Hast du noch weitere nützliche Tipps?
	AI_Output(self, hero, "Info_Mod_Ferco_Crazy_A_02_01"); //Ich wusste, dass ich mich auf dich verlassen kann. Ich habe von einem Ort namens Gelato gehört.
	AI_Output(self, hero, "Info_Mod_Ferco_Crazy_A_02_02"); //Sprich mal mit Ken. Er weiß vielleicht etwas darüber.

	VMG_Second = 2;

	Log_CreateTopic	(TOPIC_MOD_FERCO_WANZE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FERCO_WANZE, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_VMG_AUFNAHME, TOPIC_MOD_FERCO_WANZE, "Hm, ich soll eine Spruchrolle 'Verwandlung Fleischwanze' finden. Mal sehen, wie mir Ken dabei helfen kann.", "Ferco meinte, ich solle mit Ken sprechen, um herauszufinden, wo das Gelato liegt, um dort den Verwandlungszauber Fleischwanze zu bergen.");

	Info_ClearChoices	(Info_Mod_Ferco_Crazy);
};

INSTANCE Info_Mod_Ferco_CrazyTwo (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_CrazyTwo_Condition;
	information	= Info_Mod_Ferco_CrazyTwo_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Ferco_CrazyTwo_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_Crazy))
	&& (VMG_Second == 1)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_CrazyTwo_Info()
{
	AI_Output(self, hero, "Info_Mod_Ferco_CrazyTwo_02_00"); //Was willst du noch?

	Info_ClearChoices	(Info_Mod_Ferco_CrazyTwo);

	Info_AddChoice	(Info_Mod_Ferco_CrazyTwo, "Als Laufbursche bin ich mir zu schade.", Info_Mod_Ferco_Crazy_C);
	Info_AddChoice	(Info_Mod_Ferco_CrazyTwo, "Okay, ich mach’s. Hast du noch weitere nützliche Tipps?", Info_Mod_Ferco_Crazy_A);
};

INSTANCE Info_Mod_Ferco_CrazyThree (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_CrazyThree_Condition;
	information	= Info_Mod_Ferco_CrazyThree_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Ferco_CrazyThree_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_Crazy))
	&& (VMG_Second == 2)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_CrazyThree_Info()
{
	AI_Output(self, hero, "Info_Mod_Ferco_CrazyThree_02_00"); //Sprich mit Ken.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Ferco_Thys (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_Thys_Condition;
	information	= Info_Mod_Ferco_Thys_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ferco_Thys_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thys_Fisch))
	&& (Npc_HasItems(hero, ItSc_TrfMeatbug) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_Thys_Info()
{
	AI_Output(self, hero, "Info_Mod_Ferco_Thys_02_00"); //Hast du den Zauber?
	AI_Output(hero, self, "Info_Mod_Ferco_Thys_15_01"); //Ja, ich habe ihn.

	B_GiveInvItems	(hero, self, ItSc_TrfMeatbug, 1);

	AI_Output(self, hero, "Info_Mod_Ferco_Thys_02_02"); //Alles klar, ich werde die Magier davon in Kenntnis setzen. Komm in ein paar Tagen wieder.

	VMG_Second_Time = Wld_GetDay();

	B_GivePlayerXP	(300);

	B_LogEntry	(TOPIC_MOD_VMG_AUFNAHME, "Ich war bei Ferco und soll in ein paar Tagen wiederkommen.");
	B_SetTopicStatus	(TOPIC_MOD_FERCO_WANZE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Ferco_QuestThree (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_QuestThree_Condition;
	information	= Info_Mod_Ferco_QuestThree_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ferco_QuestThree_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_Thys))
	&& (VMG_Second_Time < Wld_GetDay())
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_QuestThree_Info()
{
	AI_Output(self, hero, "Info_Mod_Ferco_QuestThree_02_00"); //Faice war sehr erfreut über die Spruchrolle. Hier, das hat er mir für dich mitgegeben.
	AI_Output(hero, self, "Info_Mod_Ferco_QuestThree_15_01"); //Er hat nicht zufällig etwas von einem neuen Auftrag erzählt? Ich könnte noch ein wenig mehr Gold gebrauchen.
	AI_Output(self, hero, "Info_Mod_Ferco_QuestThree_02_02"); //Doch, zufällig hat er das.
	AI_Output(self, hero, "Info_Mod_Ferco_QuestThree_02_03"); //Du musst wissen, die Magier kommen aus einem idyllischen Fleckchen Land im Westen. Man kann es ohne weiteres nicht erreichen.
	AI_Output(self, hero, "Info_Mod_Ferco_QuestThree_02_04"); //Aber das wird Turendil dir alles erklären. Du sollst gleich zu ihm gehen.

	Wld_SendTrigger	("EVT_OW_FOKUS_GATE_MOVER_01");
	Wld_SendTrigger	("EVT_FOKUSTOR");

	Log_CreateTopic	(TOPIC_MOD_FERCO_GOBLIN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FERCO_GOBLIN, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_VMG_AUFNAHME, TOPIC_MOD_FERCO_GOBLIN, "Und noch eine Aufgabe. Ob ich überhaupt mal aufgenommen werde?", "Ich habe einen neuen Auftrag. Anscheinend geht es um den Heimatort der Verwandlungsmagier. Ich soll mich bei einem gewissen Turendil melden.");
};

INSTANCE Info_Mod_Ferco_Aufnahmequest (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_Aufnahmequest_Condition;
	information	= Info_Mod_Ferco_Aufnahmequest_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ferco_Aufnahmequest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faice_Aufnahmequest))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_Aufnahmequest_Info()
{
	AI_Output(self, hero, "Info_Mod_Ferco_Aufnahmequest_02_00"); //Was kann ich für dich tun?
	AI_Output(hero, self, "Info_Mod_Ferco_Aufnahmequest_15_01"); //Faice hat gesagt, du sollst mich in meinen letzten Auftrag einweisen.
	AI_Output(self, hero, "Info_Mod_Ferco_Aufnahmequest_02_02"); //Ah, du wurdest also geschickt. Es soll sich ein neuer Bewerber aus dem Alten Lager auf den Weg gemacht haben. Du darfst ihm die erste Prüfungsaufgabe stellen.

	Log_CreateTopic	(TOPIC_MOD_FERCO_MUD, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FERCO_MUD, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_VMG_AUFNAHME, TOPIC_MOD_FERCO_MUD, "Eine letzte Aufgabe vor meiner Aufnahme.", "Es kommt ein neuer Bewerber aus dem Alten Lager und ich soll ihm die erste Aufgabe geben.");

	Info_ClearChoices	(Info_Mod_Ferco_Aufnahmequest);

	Info_AddChoice	(Info_Mod_Ferco_Aufnahmequest, "Nein danke, ich muss noch was erledigen.", Info_Mod_Ferco_Aufnahmequest_B);
	Info_AddChoice	(Info_Mod_Ferco_Aufnahmequest, "Vielen Dank. Das werde ich tun.", Info_Mod_Ferco_Aufnahmequest_A);
};

FUNC VOID Info_Mod_Ferco_Aufnahmequest_B()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Aufnahmequest_B_15_00"); //Nein danke, ich muss noch was erledigen.
	AI_Output(self, hero, "Info_Mod_Ferco_Aufnahmequest_B_02_01"); //Ah, du wurdest also geschickt. Es soll sich ein neuer Bewerber aus dem Alten Lager auf den Weg gemacht haben. Du darfst ihm die erste Prüfungsaufgabe stellen.

	Info_ClearChoices	(Info_Mod_Ferco_Aufnahmequest);

	B_StartOtherRoutine	(Mod_803_STT_Mud_MT, "ATVMG");
	AI_Teleport	(Mod_803_STT_Mud_MT, "OW_PATH_179");
};

FUNC VOID Info_Mod_Ferco_Aufnahmequest_A()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Aufnahmequest_A_15_00"); //Vielen Dank. Das werde ich tun.
	AI_Output(self, hero, "Info_Mod_Ferco_Aufnahmequest_A_02_01"); //Da kommt er schon. Viel Erfolg.

	Info_ClearChoices	(Info_Mod_Ferco_Aufnahmequest);

	B_StartOtherRoutine	(Mod_803_STT_Mud_MT, "ATVMG");
	AI_Teleport	(Mod_803_STT_Mud_MT, "OW_PATH_179");
};

INSTANCE Info_Mod_Ferco_Mud (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_Mud_Condition;
	information	= Info_Mod_Ferco_Mud_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ferco_Mud_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mud_VMG))
	&& (Mod_Mud_Unterwegs > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_Mud_Info()
{
	if (Mod_Mud_Unterwegs == 2)
	{	
		AI_Output(self, hero, "Info_Mod_Ferco_Mud_02_00"); //Was hast du mit ihm gemacht? Du hast ihn in den sicheren Tod geschickt!

		Info_ClearChoices	(Info_Mod_Ferco_Mud);

		Info_AddChoice	(Info_Mod_Ferco_Mud, "Es tut mir Leid.", Info_Mod_Ferco_Mud_B);
		Info_AddChoice	(Info_Mod_Ferco_Mud, "Er hat es verdient.", Info_Mod_Ferco_Mud_A);
	}
	else if (Mod_Mud_Unterwegs == 3)
	{
		AI_Output(self, hero, "Info_Mod_Ferco_Mud_02_01"); //Gut gemacht, den sehen wir so schnell nicht wieder. (lacht) Du kannst zu Faice gehen. Er wird das Nötige veranlassen.
		AI_Output(hero, self, "Info_Mod_Ferco_Mud_15_02"); //Vielen Dank.

		B_KillNpc	(Mod_803_STT_Mud_MT);

		B_LogEntry	(TOPIC_MOD_VMG_AUFNAHME, "Ich habe die Prüfung bestanden und sollte nun zu Faice gehen.");
	}
	else if (Mod_Mud_Unterwegs == 4)
	{
		AI_Output(self, hero, "Info_Mod_Ferco_Mud_02_03"); //Du willst ihn wohl unbedingt loswerden, was?

		Info_ClearChoices	(Info_Mod_Ferco_Mud);

		Info_AddChoice	(Info_Mod_Ferco_Mud, "Ist das so schlimm?", Info_Mod_Ferco_Mud_D);
		Info_AddChoice	(Info_Mod_Ferco_Mud, "Du etwa nicht?", Info_Mod_Ferco_Mud_C);
	}
	else if (Mod_Mud_Unterwegs == 5)
	{
		AI_Output(self, hero, "Info_Mod_Ferco_Mud_02_04"); //Das ging ja schnell. Ich denke, das kann man so gelten lassen.
		AI_Output(self, hero, "Info_Mod_Ferco_Mud_02_05"); //Nun geh zu Faice. Er wird das Nötige für deine Aufnahme veranlassen.
		AI_Output(hero, self, "Info_Mod_Ferco_Mud_15_02"); //Vielen Dank.

		B_LogEntry	(TOPIC_MOD_VMG_AUFNAHME, "Ich habe die Prüfung bestanden und sollte nun zu Faice gehen.");

		if (Npc_HasItems(hero, ItSc_TrfBloodfly) > 0)
		{
			AI_Output(self, hero, "Info_Mod_Ferco_Mud_02_06"); //Eins noch: Die Spruchrolle hätte ich gerne.

			Info_ClearChoices	(Info_Mod_Ferco_Mud);

			Info_AddChoice	(Info_Mod_Ferco_Mud, "Warum?", Info_Mod_Ferco_Mud_F);
			Info_AddChoice	(Info_Mod_Ferco_Mud, "Natürlich. Hier.", Info_Mod_Ferco_Mud_E);
		};
	};
};

FUNC VOID Info_Mod_Ferco_Mud_F()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Mud_F_15_00"); //Warum?
	AI_Output(self, hero, "Info_Mod_Ferco_Mud_F_02_01"); //Das war schließlich Teil deiner Aufgabe.

	Info_ClearChoices	(Info_Mod_Ferco_Mud);

	Info_AddChoice	(Info_Mod_Ferco_Mud, "Ja, ein Teil MEINER Aufgabe.", Info_Mod_Ferco_Mud_G);
	Info_AddChoice	(Info_Mod_Ferco_Mud, "Natürlich. Hier.", Info_Mod_Ferco_Mud_E);
};

FUNC VOID Info_Mod_Ferco_Mud_G()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Mud_G_15_00"); //Ja, ein Teil MEINER Aufgabe.
	AI_Output(self, hero, "Info_Mod_Ferco_Mud_G_02_01"); //Gut, dann behalte sie halt. Nun aber los.

	Info_ClearChoices	(Info_Mod_Ferco_Mud);
};

FUNC VOID Info_Mod_Ferco_Mud_E()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Mud_E_15_00"); //Natürlich. Hier.

	B_GiveInvItems	(hero, self, ItSc_TrfBloodfly, 1);

	AI_Output(self, hero, "Info_Mod_Ferco_Mud_E_02_01"); //Danke. Nun geh schon.

	Info_ClearChoices	(Info_Mod_Ferco_Mud);
};

FUNC VOID Info_Mod_Ferco_Mud_D()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Mud_D_15_00"); //Ist das so schlimm?
	AI_Output(self, hero, "Info_Mod_Ferco_Mud_D_02_01"); //Nein nein. (lacht) Du kannst zu Faice gehen. Er wird das Nötige für deine Aufnahme veranlassen.
	AI_Output(hero, self, "Info_Mod_Ferco_Mud_D_15_02"); //Vielen Dank.

	B_LogEntry	(TOPIC_MOD_VMG_AUFNAHME, "Ich habe die Prüfung bestanden und sollte nun zu Faice gehen.");

	Info_ClearChoices	(Info_Mod_Ferco_Mud);

	B_KillNpc	(Mod_803_STT_Mud_MT);
};

FUNC VOID Info_Mod_Ferco_Mud_C()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Mud_C_15_00"); //Du etwa nicht?
	AI_Output(self, hero, "Info_Mod_Ferco_Mud_C_02_01"); //Doch, ja. (lacht) Du kannst zu Faice gehen. Er wird das Nötige für deine Aufnahme veranlassen.
	AI_Output(hero, self, "Info_Mod_Ferco_Mud_D_15_02"); //Vielen Dank.

	B_LogEntry	(TOPIC_MOD_VMG_AUFNAHME, "Ich habe die Prüfung bestanden und sollte nun zu Faice gehen.");

	Info_ClearChoices	(Info_Mod_Ferco_Mud);

	B_KillNpc	(Mod_803_STT_Mud_MT);
};

FUNC VOID Info_Mod_Ferco_Mud_B()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Mud_B_15_00"); //Es tut mir Leid.
	AI_Output(self, hero, "Info_Mod_Ferco_Mud_B_02_01"); //Guck nicht so verdrießlich. Wir wollten ihn auch loswerden.
	AI_Output(hero, self, "Info_Mod_Ferco_Mud_B_15_02"); //...
	AI_Output(self, hero, "Info_Mod_Ferco_Mud_B_02_03"); //Wir wollten eigentlich nur wissen, wie du auf ihn reagierst. (lacht) Nun geh zu Faice, er wird das Nötige veranlassen.

	B_LogEntry	(TOPIC_MOD_VMG_AUFNAHME, "Ich habe die Prüfung bestanden und sollte nun zu Faice gehen.");

	Info_ClearChoices	(Info_Mod_Ferco_Mud);

	B_KillNpc	(Mod_803_STT_Mud_MT);
};

FUNC VOID Info_Mod_Ferco_Mud_A()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Mud_A_15_00"); //Er hat es verdient.
	AI_Output(self, hero, "Info_Mod_Ferco_Mud_A_02_01"); //Vielleicht hat er es, doch das kannst du nicht entscheiden.

	Info_ClearChoices	(Info_Mod_Ferco_Mud);

	Info_AddChoice	(Info_Mod_Ferco_Mud, "Es tut mir Leid.", Info_Mod_Ferco_Mud_B);
};

INSTANCE Info_Mod_Ferco_Falin (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_Falin_Condition;
	information	= Info_Mod_Ferco_Falin_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier ich habe ein Paket vom neuen Lager. Soll es hier abgeben.";
};

FUNC INT Info_Mod_Ferco_Falin_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Falin_Hi))
	&& (Npc_HasItems(hero, ItMi_PaketFalin) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_Falin_Info()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Falin_15_00"); //Hier ich habe ein Paket vom neuen Lager. Soll es hier abgeben.

	B_GiveInvItems	(hero, self, ItMi_PaketFalin, 1);

	AI_Output(self, hero, "Info_Mod_Ferco_Falin_02_01"); //Danke, wusste gar nicht, dass ihr Waldläufer jetzt als Kuriere agiert.
	AI_Output(hero, self, "Info_Mod_Ferco_Falin_15_02"); //Das ist eine Ausnahme.

	B_GivePlayerXP	(50);

	B_StartOtherRoutine	(Mod_7475_SLD_Falin_MT, "TOT");
};

INSTANCE Info_Mod_Ferco_Urs (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_Urs_Condition;
	information	= Info_Mod_Ferco_Urs_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bringe den Ring des Lichtes.";
};

FUNC INT Info_Mod_Ferco_Urs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Urs_Hi))
	&& (Npc_HasItems(hero, ItRi_Licht) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferco_Urs_Info()
{
	AI_Output(hero, self, "Info_Mod_Ferco_Urs_15_00"); //Ich bringe den Ring des Lichtes.

	B_GiveInvItems	(hero, self, ItRi_Licht, 1);

	AI_Output(self, hero, "Info_Mod_Ferco_Urs_02_01"); //Ahh, ausgezeichnet. Das wird Faice freuen.
	AI_Output(self, hero, "Info_Mod_Ferco_Urs_02_02"); //Hier hast du deine Verwandlungsrune. Viel Spaß damit.

	B_GivePlayerXP	(200);

	B_GiveInvItems	(self, hero, ItRu_TrfMolerat, 1);

	B_LogEntry	(TOPIC_MOD_URS_HUND, "Ich habe die Verwandlungsrune von Ferco.");
};

INSTANCE Info_Mod_Ferco_EXIT (C_INFO)
{
	npc		= Mod_1630_VMG_Ferco_MT;
	nr		= 1;
	condition	= Info_Mod_Ferco_EXIT_Condition;
	information	= Info_Mod_Ferco_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ferco_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ferco_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};