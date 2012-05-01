INSTANCE Info_Mod_Lares_Hi (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_Hi_Condition;
	information	= Info_Mod_Lares_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lares_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lares_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Lares_Hi_09_00"); //Du lebst noch?
	AI_Output(hero, self, "Info_Mod_Lares_Hi_15_01"); //Sieht so aus.
	AI_Output(self, hero, "Info_Mod_Lares_Hi_09_02"); //Was machst du jetzt?
};

INSTANCE Info_Mod_Lares_Daemonisch (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_Daemonisch_Condition;
	information	= Info_Mod_Lares_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lares_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Lares_Daemonisch_09_00"); //Na, was treibt dich wieder so rum?
	AI_Output(hero, self, "Info_Mod_Lares_Daemonisch_15_01"); //Ach, ich wollte mich nur mal etwas umsehen ...
	AI_Output(hero, self, "Info_Mod_Lares_Daemonisch_15_02"); //Ist irgendetwas Besonderes bei euch auf dem Hof passiert in letzter Zeit?
	AI_Output(self, hero, "Info_Mod_Lares_Daemonisch_09_03"); //Ja, da war schon was. Pepe hatte nachts dunkle Schatten im Wald gesehen, vermutlich von Wölfen.
	AI_Output(self, hero, "Info_Mod_Lares_Daemonisch_09_04"); //Ich habe dann einige Jungs mit ihm zu dem kleinen Lager im Wald geschickt, um sich die Nacht über dort umzusehen.
	AI_Output(self, hero, "Info_Mod_Lares_Daemonisch_09_05"); //Pepe kam am frühen morgen panisch aus dem Wald gelaufen und blickte sich nach allen Richtungen verstört um.
	AI_Output(self, hero, "Info_Mod_Lares_Daemonisch_09_06"); //Als dann meine Jungs ebenfalls wieder aus dem Wald kamen, lief er schreiend in Richtung Dämonenkriegerlager davon.
	AI_Output(self, hero, "Info_Mod_Lares_Daemonisch_09_07"); //Die Jungs meinten, dass ein großes Rudel Wölfe sie überfallen hätte und Pepe daraufhin weggelaufen sei.
	AI_Output(self, hero, "Info_Mod_Lares_Daemonisch_09_08"); //Leider ist durch die Mistviecher auch einer meiner Söldner draufgegangen. Naja, das kommt schon alles wieder ins Lot.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Von Lares habe ich erfahren, dass Pepe dunkle Schatten im Wald gesehen hat, welche wohl von Wölfen gerührt haben. Einige Söldner hatten sich daher mit Pepe zum kleinen Lager im Wald begeben. Pepe kam am frühen morgen panisch aus dem Wald gerannt und verschwand Richtung Dämonenkriegerlager, als er hinter sich die Söldner aus dem Wald kommen sah. Angeblich hatte ein großes Rudel Wölfe sie überfallen, worauf Pepe in Panik verfiel. Ein Söldner kam dabei um.");
};

INSTANCE Info_Mod_Lares_Grog (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_Grog_Condition;
	information	= Info_Mod_Lares_Grog_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier was für dich.";
};

FUNC INT Info_Mod_Lares_Grog_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lares_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	&& (Npc_HasItems(hero, Mod_GrogPaket) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_Grog_Info()
{
	AI_Output(hero, self, "Info_Mod_Lares_Grog_15_00"); //Ich hab hier was für dich.
	AI_Output(self, hero, "Info_Mod_Lares_Grog_09_01"); //Was denn?
	AI_Output(hero, self, "Info_Mod_Lares_Grog_15_02"); //Ein Paket voller Grog.

	B_GiveInvItems	(hero, self, Mod_GrogPaket, 1);

	AI_Output(self, hero, "Info_Mod_Lares_Grog_09_03"); //Wurde aber auch langsam Zeit. Endlich kann ich mit meinen Jungs mal wieder ein wenig feiern.
	AI_Output(self, hero, "Info_Mod_Lares_Grog_09_04"); //Hier ist dein Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);
};

INSTANCE Info_Mod_Lares_BronkoMehlsack (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_BronkoMehlsack_Condition;
	information	= Info_Mod_Lares_BronkoMehlsack_Info;
	permanent	= 0;
	important	= 0;
	description	= "Könnt ihr etwas mit einer kostenlosen Lieferung Mehl anfangen?";
};

FUNC INT Info_Mod_Lares_BronkoMehlsack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bronko_Ambient01))
	&& (Npc_HasItems(hero, ItMi_Mehlsack_Bronko) == 5)
	&& (Mod_BronkoMehlsack == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_BronkoMehlsack_Info()
{
	AI_Output(hero, self, "Info_Mod_Lares_BronkoMehlsack_15_00"); //Könnt ihr etwas mit einer kostenlosen Lieferung Mehl anfangen?
	AI_Output(self, hero, "Info_Mod_Lares_BronkoMehlsack_09_01"); //Gib nur her. Wo hast du das aufgetrieben?

	B_GiveInvItems	(hero, self, ItMi_Mehlsack_Bronko, 5);

	AI_Output(hero, self, "Info_Mod_Lares_BronkoMehlsack_15_02"); //Das ist mir sozusagen zugefallen.
	AI_Output(self, hero, "Info_Mod_Lares_BronkoMehlsack_09_03"); //(lacht) Dann frag ich lieber nicht weiter nach. Jedenfalls vielen Dank.
	AI_Output(self, hero, "Info_Mod_Lares_BronkoMehlsack_09_04"); //Hier, diese paar Tränke hab ich übrig. Bin momentan eh nicht so viel unterwegs, als dass ich die brauchen würde.

	CreateInvItems	(hero, ItPo_Health_01, 2);
	CreateInvItems	(hero, ItPo_Mana_01, 2);

	B_ShowGivenThings	("2 Essenzen der Heilung und 2 Manaessenzen erhalten");

	B_GivePlayerXP	(100);

	B_Göttergefallen(3, 1);

	Mod_BronkoMehlsack = 3;
};

INSTANCE Info_Mod_Lares_WillSoeldner (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_WillSoeldner_Condition;
	information	= Info_Mod_Lares_WillSoeldner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will mich euch anschließen.";
};

FUNC INT Info_Mod_Lares_WillSoeldner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lares_Hi))
	&& (Mod_Gilde	==	0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_WillSoeldner_Info()
{
	AI_Output(hero, self, "Info_Mod_Lares_WillSoeldner_15_00"); //Ich will mich euch anschließen.
	AI_Output(self, hero, "Info_Mod_Lares_WillSoeldner_09_01"); //Das ist gut. Aber bevor ich dich aufnehmen kann, musst du uns deine Loyalität beweisen.
	AI_Output(self, hero, "Info_Mod_Lares_WillSoeldner_09_02"); //Geh zu Torlof und sage ihm, dass ich dich schicke.

	B_LogEntry	(TOPIC_MOD_SÖLDNER, "Um bei den Söldner aufgenommen zu werden muss ich meine Loyalität beweisen. Ich soll mal mit Torlof sprechen.");
};

INSTANCE Info_Mod_Lares_AndereSoeldner (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_AndereSoeldner_Condition;
	information	= Info_Mod_Lares_AndereSoeldner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo sind eigentlich die anderen Söldner?";
};

FUNC INT Info_Mod_Lares_AndereSoeldner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lares_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_AndereSoeldner_Info()
{
	AI_Output(hero, self, "Info_Mod_Lares_AndereSoeldner_15_00"); //Wo sind eigentlich die anderen Söldner?
	AI_Output(self, hero, "Info_Mod_Lares_AndereSoeldner_09_01"); //Die sind noch im Neuen Lager.
	AI_Output(self, hero, "Info_Mod_Lares_AndereSoeldner_09_02"); //Lee hat mich zusammen mit Torlof und Cord hierher geschickt, damit wir ein paar Leute aus Khorinis dazu überreden sich uns anzuschließen.
	AI_Output(hero, self, "Info_Mod_Lares_AndereSoeldner_15_03"); //Wieviele habt ihr schon überredet?
	AI_Output(self, hero, "Info_Mod_Lares_AndereSoeldner_09_04"); //Wir haben schon einige überzeugt.
};

INSTANCE Info_Mod_Lares_Lehrer (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_Lehrer_Condition;
	information	= Info_Mod_Lares_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Lares_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lares_Hi))
	&& ((Mod_Gilde == 5)
	|| (Mod_Gilde == 4)
	|| (Mod_Gilde == 19))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Lares_Lehrer_09_00"); //Ich kann dir helfen geschickter zu werden.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_SOELDNER_ONAR, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_SOELDNER_ONAR, "Lares kann mir helfen geschickter zu werden.");
};

INSTANCE Info_Mod_Lares_Aufnahme (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_Aufnahme_Condition;
	information	= Info_Mod_Lares_Aufnahme_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich bin bereit Söldner zu werden.";
};

FUNC INT Info_Mod_Lares_Aufnahme_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Torlof_KristallEntgelt))
	|| (Npc_KnowsInfo(hero, Info_Mod_Torlof_Alvares)))
	&& (Mod_Gilde	==	0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Lares_Aufnahme_15_00"); //Ich bin bereit Söldner zu werden.
	
	if (hero.level	>=	5)
	&& (Gardist_Dabei == FALSE)
	&& (Orks_Dabei == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Lares_Aufnahme_09_01"); //Du bist bereit ein Söldner zu werden.
		AI_Output(self, hero, "Info_Mod_Lares_Aufnahme_09_02"); //Doch wenn du einmal eine von unseren Rüstungen trägst, dann gibt es kein zurück mehr.
		
		if (Mod_HatPlayerNeutraleKlamotten())
		{
			Info_ClearChoices	(Info_Mod_Lares_Aufnahme);

			Info_AddChoice	(Info_Mod_Lares_Aufnahme, "Ich habs mir anders überlegt.", Info_Mod_Lares_Aufnahme_Nein);
			Info_AddChoice	(Info_Mod_Lares_Aufnahme, "Ich will mich euch anschließen.", Info_Mod_Lares_Aufnahme_Ja);
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Lares_Aufnahme_09_04"); //Su solltest dir vorher aber noch eine neutrale Rüstung besorgen.
		};
	}
	else if (Gardist_Dabei == TRUE)
	|| (Orks_Dabei == TRUE)
	{
		if (Gardist_Dabei == TRUE)
		{
			AI_Output(self, hero, "Info_Mod_Lares_Aufnahme_09_05"); //Du glaubst doch nicht ernsthaft, dass wir einen Gardisten in unseren Reihen dulden.
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Lares_Aufnahme_09_06"); //Unter uns sind auch Orkjäger, da ist ein Orkfreund bei uns falsch.
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Lares_Aufnahme_09_03"); //Du solltest lieber noch etwas Erfahrung sammeln.
	};
};

FUNC VOID Info_Mod_Lares_Aufnahme_Nein()
{
	AI_Output(hero, self, "Info_Mod_Lares_Aufnahme_Nein_15_00"); //Ich hab's mir anders überlegt.
	AI_Output(self, hero, "Info_Mod_Lares_Aufnahme_Nein_09_01"); //Wie du meinst.

	Info_ClearChoices	(Info_Mod_Lares_Aufnahme);
};

FUNC VOID Info_Mod_Lares_Aufnahme_Ja()
{
	AI_Output(hero, self, "Info_Mod_Lares_Aufnahme_Ja_15_00"); //Ich will mich euch anschließen.
	
	AI_Output(self, hero, "Info_Mod_Lares_Aufnahme_Ja_09_01"); //Wenn du eine Waffe brauchst, dann solltest du mal Bennet fragen.
	AI_Output(self, hero, "Info_Mod_Lares_Aufnahme_Ja_09_02"); //Hier ist deine Rüstung.

	CreateInvItems	(self, ITAR_SLD_L, 1);
	B_GiveInvItems	(self, hero, ITAR_SLD_L, 1);

	AI_UnequipArmor	(hero);
	AI_EquipArmor	(hero, ItAr_SLD_L);
	
	AI_Output(self, hero, "Info_Mod_Lares_Aufnahme_Ja_14_03"); //Geh mit der Rüstung aber nicht in die Stadt, die Miliz würde dich nicht reinlassen.
	
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_WieStehts))
	{
		Log_CreateTopic	(TOPIC_MOD_SLD_ORKJAEGER, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_MOD_SLD_ORKJAEGER, LOG_RUNNING);
		B_LogEntry_NMore	(TOPIC_MOD_GILDENAUFNAHME, TOPIC_MOD_SÖLDNER, TOPIC_MOD_SLD_ORKJAEGER, "Ich bin jetzt ein Söldner.", "Ich bin jetzt ein Söldner.", "Sylvio entscheidet, wer bei den Orkjägern aufgenommen wird.");
	}
	else
	{
		B_LogEntry_More	(TOPIC_MOD_GILDENAUFNAHME, TOPIC_MOD_SÖLDNER, "Ich bin jetzt ein Söldner.", "Ich bin jetzt ein Söldner.");
	};

	B_SetTopicStatus	(TOPIC_MOD_GILDENAUFNAHME, LOG_SUCCESS);
	B_SetTopicStatus	(TOPIC_MOD_SÖLDNER, LOG_SUCCESS);

	B_SetTopicStatus	(TOPIC_MOD_FEUERMAGIER, LOG_FAILED);
	B_SetTopicStatus	(TOPIC_MOD_WASSERMAGIER, LOG_FAILED);
	B_SetTopicStatus	(TOPIC_MOD_MILIZ, LOG_FAILED);
	B_SetTopicStatus	(TOPIC_MOD_DAEMONENBESCHWOERER, LOG_FAILED);
	
	Mod_Gilde	=	4;

	Snd_Play ("LEVELUP");

	B_GivePlayerXP	(400);

	hero.guild = GIL_MIL;
	Npc_SetTrueGuild	(hero, GIL_MIL);

	Monster_Max += 6;

	Info_ClearChoices	(Info_Mod_Lares_Aufnahme);
};

INSTANCE Info_Mod_Lares_Drachen (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_Drachen_Condition;
	information	= Info_Mod_Lares_Drachen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lares_Drachen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Drachen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_Drachen_Info()
{
	AI_Output(self, hero, "Info_Mod_Lares_Drachen_09_00"); //Verdammte Drecksviecher.
	AI_Output(hero, self, "Info_Mod_Lares_Drachen_15_01"); //Was ist los?
	AI_Output(self, hero, "Info_Mod_Lares_Drachen_09_02"); //Das fragst du noch? Hast du nicht die Drachen auf dem Feld gesehen?
	AI_Output(self, hero, "Info_Mod_Lares_Drachen_09_03"); //Haben dem Bauern Sekob alle Schafe und sogar den Hirtenhund gefressen.
	AI_Output(self, hero, "Info_Mod_Lares_Drachen_09_04"); //Als wir gegen sie vorgerückt sind, mussten wir feststellen, dass unsere Waffen nicht viel gegen sie vermochten.
	AI_Output(self, hero, "Info_Mod_Lares_Drachen_09_05"); //Einen Mann haben wir auch dabei verloren.
	AI_Output(hero, self, "Info_Mod_Lares_Drachen_15_06"); //Tja, was kann man da machen ...
	AI_Output(self, hero, "Info_Mod_Lares_Drachen_09_07"); //Das fragst du mich? Du bist doch ständig unterwegs, löst Rätsel und schnappst Informationen von Menschen, Magiern und Orks auf.
	AI_Output(self, hero, "Info_Mod_Lares_Drachen_09_08"); //Wenn du einen Weg findest die Drachen zu töten, lass es mich wissen. Drecksviecher ...

	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Lares hat sich über die Drachen beklagt, und den Schaden, welchen sie verursacht haben. Er und die Söldner konnten ihnen nichts anhaben. Er bat mich darum ihn darüber zu informieren, sobald ich einen Weg gefunden hätte, sie zu erledigen.");
};

INSTANCE Info_Mod_Lares_LeeDJGHelfer (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_LeeDJGHelfer_Condition;
	information	= Info_Mod_Lares_LeeDJGHelfer_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lares_LeeDJGHelfer_Condition()
{
	if (Mod_NL_HasKamm >= 3)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Lee_Gormgniez))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_LeeDJGHelfer_Info()
{
	AI_Output(self, hero, "Info_Mod_Lares_LeeDJGHelfer_09_00"); //Verdammt, wo bleibt die Verstärkung? Hast du Lee bescheid gesagt? Wenn nicht, dann beeile dich.
};

INSTANCE Info_Mod_Lares_LeeDJGHelfer2 (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_LeeDJGHelfer2_Condition;
	information	= Info_Mod_Lares_LeeDJGHelfer2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lares_LeeDJGHelfer2_Condition()
{
	if (Mod_NL_HasKamm >= 3)
	&& (Npc_KnowsInfo(hero, Info_Mod_Lee_Gormgniez))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_LeeDJGHelfer2_Info()
{
	AI_Output(self, hero, "Info_Mod_Lares_LeeDJGHelfer2_09_00"); //Wie sieht es aus? Gibt es endlich mal was Neues wegen der hässlichen Riesenechsen?
	AI_Output(self, hero, "Info_Mod_Lares_LeeDJGHelfer2_09_01"); //Mit der Verstärkung aus dem Minental sind wir jetzt auf jeden Fall gut gerüstet.
	AI_Output(hero, self, "Info_Mod_Lares_LeeDJGHelfer2_15_02"); //Ja, jetzt sollten wir sie erledigen können. Der Zauber der sie schützte, ist gebrochen.
	AI_Output(self, hero, "Info_Mod_Lares_LeeDJGHelfer2_09_03"); //Wirklich?! Dann lass uns keine Sekunde zögern.
	AI_Output(self, hero, "Info_Mod_Lares_LeeDJGHelfer2_09_04"); //Jungs, habt ihr gehört? Es kann losgehen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_798_SLD_Wolf_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_527_SLD_Torlof_NW, "HEXEN");
	B_StartOtherRoutine	(self, "HEXEN");
	B_StartOtherRoutine	(Mod_1200_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1201_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1202_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1203_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1204_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1205_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1206_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1207_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1208_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1209_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_7296_DJG_Drachenjaeger_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_7297_DJG_Drachenjaeger_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_7298_DJG_Butch_NW, "HEXEN");
};

INSTANCE Info_Mod_Lares_Knucker (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_Knucker_Condition;
	information	= Info_Mod_Lares_Knucker_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lares_Knucker_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lares_LeeDJGHelfer2))
	&& (Npc_GetDistToWP(self, "NW_BIGFARM_CROSS") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_Knucker_Info()
{
	AI_Output(self, hero, "Info_Mod_Lares_Knucker_09_00"); //Na, dann. Jetzt geht’s ans Eingemachte.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_798_SLD_Wolf_NW, "KNUCKER");
	B_StartOtherRoutine	(Mod_527_SLD_Torlof_NW, "KNUCKER");
	B_StartOtherRoutine	(self, "KNUCKER");
	B_StartOtherRoutine	(Mod_1200_SLD_Soeldner_NW, "KNUCKER");
	B_StartOtherRoutine	(Mod_1201_SLD_Soeldner_NW, "KNUCKER");
	B_StartOtherRoutine	(Mod_1202_SLD_Soeldner_NW, "KNUCKER");
	B_StartOtherRoutine	(Mod_1203_SLD_Soeldner_NW, "KNUCKER");
	B_StartOtherRoutine	(Mod_1204_SLD_Soeldner_NW, "KNUCKER");
	B_StartOtherRoutine	(Mod_1205_SLD_Soeldner_NW, "KNUCKER");
	B_StartOtherRoutine	(Mod_1206_SLD_Soeldner_NW, "KNUCKER");
	B_StartOtherRoutine	(Mod_1207_SLD_Soeldner_NW, "KNUCKER");
	B_StartOtherRoutine	(Mod_1208_SLD_Soeldner_NW, "KNUCKER");
	B_StartOtherRoutine	(Mod_1209_SLD_Soeldner_NW, "KNUCKER");
	B_StartOtherRoutine	(Mod_7296_DJG_Drachenjaeger_NW, "KNUCKER");
	B_StartOtherRoutine	(Mod_7297_DJG_Drachenjaeger_NW, "KNUCKER");
	B_StartOtherRoutine	(Mod_7298_DJG_Butch_NW, "KNUCKER");

	Mod_798_SLD_Wolf_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_527_SLD_Torlof_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1200_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1201_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1202_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1203_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1204_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1205_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1206_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1207_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1208_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1209_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_7296_DJG_Drachenjaeger_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_7297_DJG_Drachenjaeger_NW.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_7298_DJG_Butch_NW.aivar[AIV_PARTYMEMBER] = TRUE;
};

INSTANCE Info_Mod_Lares_KnuckerTot (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_KnuckerTot_Condition;
	information	= Info_Mod_Lares_KnuckerTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lares_KnuckerTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lares_Knucker))
	&& (Npc_IsDead(Knucker_11001_NW))
	&& (Npc_IsDead(Feuerdrache_11002_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_KnuckerTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Lares_KnuckerTot_09_00"); //Na, das war ja leichter, als ich gedacht habe. Und die Jungs hatten auch mal wieder etwas Bewegung. Das müssen wir unbedingt irgendwann wiederholen.
	AI_Output(hero, self, "Info_Mod_Lares_KnuckerTot_15_01"); //Wo ist eigentlich Gorn? Ich habe ihn beim Kampf vermisst.
	AI_Output(self, hero, "Info_Mod_Lares_KnuckerTot_09_02"); //Der darf bei der Kapelle Wache schieben. Wir wollen ja keine unerfreuliche Überraschung aus dem Wald erleben.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_798_SLD_Wolf_NW, "START");
	B_StartOtherRoutine	(Mod_527_SLD_Torlof_NW, "PRESTART");
	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_1200_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1201_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1202_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1203_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1204_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1205_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1206_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1207_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1208_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_1209_SLD_Soeldner_NW, "START");
	B_StartOtherRoutine	(Mod_7296_DJG_Drachenjaeger_NW, "START");
	B_StartOtherRoutine	(Mod_7297_DJG_Drachenjaeger_NW, "START");
	B_StartOtherRoutine	(Mod_7298_DJG_Butch_NW, "START");

	Mod_798_SLD_Wolf_NW.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_527_SLD_Torlof_NW.aivar[AIV_PARTYMEMBER] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1200_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1201_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1202_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1203_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1204_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1205_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1206_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1207_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1208_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1209_SLD_Soeldner_NW.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_7296_DJG_Drachenjaeger_NW.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_7297_DJG_Drachenjaeger_NW.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_7298_DJG_Butch_NW.aivar[AIV_PARTYMEMBER] = FALSE;
};

INSTANCE Info_Mod_Lares_Hexen (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_Hexen_Condition;
	information	= Info_Mod_Lares_Hexen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lares_Hexen_Condition()
{
	if (Mod_WM_HexenTot == 1)
	&& (!Npc_IsDead(DienerDesBoesen_01))
	&& (Mod_WM_GornAttack == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_Hexen_Info()
{
	AI_Output(self, hero, "Info_Mod_Lares_Hexen_09_00"); //Hey, die Untoten bei Sekobs Hof haben sich zerstreut. Jetzt könnten wir sie aufmischen.
	AI_Output(self, hero, "Info_Mod_Lares_Hexen_09_01"); //Wenn du mitmachst müsste unsere Schlagkraft ausreichen.
	
	Info_ClearChoices	(Info_Mod_Lares_Hexen);

	Info_AddChoice	(Info_Mod_Lares_Hexen, "Nein, ich habe gerade wichtigeres zu tun.", Info_Mod_Lares_Hexen_B);
	Info_AddChoice	(Info_Mod_Lares_Hexen, "Klar, ich bin dabei.", Info_Mod_Lares_Hexen_A);
};

FUNC VOID Info_Mod_Lares_Hexen_B()
{
	AI_Output(hero, self, "Info_Mod_Lares_Hexen_B_15_00"); //Nein, ich habe gerade wichtigeres zu tun.
	AI_Output(self, hero, "Info_Mod_Lares_Hexen_B_09_01"); //Hmm, schade, hätte ich nicht gedacht, dass du dir das entgehen lassen willst.
	AI_Output(self, hero, "Info_Mod_Lares_Hexen_B_09_02"); //Dann müssen wir eben noch etwas mit dem Angriff warten, bis wir Verstärkung bekommen.

	Info_ClearChoices	(Info_Mod_Lares_Hexen);
	
	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Lares_Hexen_A()
{
	AI_Output(hero, self, "Info_Mod_Lares_Hexen_A_15_00"); //Klar, ich bin dabei.
	AI_Output(self, hero, "Info_Mod_Lares_Hexen_A_09_01"); //Sehr gut, ich habe auch nichts anderes von dir erwartet. Dann kann es ja losgehen.
	AI_Output(self, hero, "Info_Mod_Lares_Hexen_A_09_02"); //Wir sammeln uns dann an der Kreuzung. Wie in alten Zeiten.

	Mod_WM_GornAttack = 1;

	Info_ClearChoices	(Info_Mod_Lares_Hexen);
	
	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_798_SLD_Wolf_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_527_SLD_Torlof_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_526_SLD_Lares_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_528_SLD_Cord_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_533_SLD_Gorn_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1200_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1201_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1202_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1203_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1204_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1205_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1206_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1207_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1208_SLD_Soeldner_NW, "HEXEN");
	B_StartOtherRoutine	(Mod_1209_SLD_Soeldner_NW, "HEXEN");
};

INSTANCE Info_Mod_Lares_NahkampfJG (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_NahkampfJG_Condition;
	information	= Info_Mod_Lares_NahkampfJG_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Waldläufer suchen Leute. Möglichst Schwertkämpfer.";
};

FUNC INT Info_Mod_Lares_NahkampfJG_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_Opferschale))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_NahkampfJG_Info()
{
	AI_Output(hero, self, "Info_Mod_Lares_NahkampfJG_15_00"); //Die Waldläufer suchen Leute. Möglichst Schwertkämpfer.
	AI_Output(self, hero, "Info_Mod_Lares_NahkampfJG_09_01"); //Hm. Hier sind einige, die den ganzen Tag nur rumgammeln. Aber da musst du Cord fragen.
	AI_Output(hero, self, "Info_Mod_Lares_NahkampfJG_15_02"); //Gut. Bis später.
};

INSTANCE Info_Mod_Lares_NahkampfJG2 (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_NahkampfJG2_Condition;
	information	= Info_Mod_Lares_NahkampfJG2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Cord hat mir den Hock mitgegeben. Dafür bekommt ihr einen Jäger geschickt.";
};

FUNC INT Info_Mod_Lares_NahkampfJG2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cord_NW_NahkampfJG))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_NahkampfJG2_Info()
{
	AI_Output(hero, self, "Info_Mod_Lares_NahkampfJG2_15_00"); //Cord hat mir den Hock mitgegeben. Dafür bekommt ihr einen Jäger geschickt.
	AI_Output(self, hero, "Info_Mod_Lares_NahkampfJG2_09_01"); //Nur zu. Der kann dann mit mir auf Jagt gehen.
	AI_Output(hero, self, "Info_Mod_Lares_NahkampfJG2_15_02"); //Bis dann.
};

INSTANCE Info_Mod_Lares_AndereGilde (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_AndereGilde_Condition;
	information	= Info_Mod_Lares_AndereGilde_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lares_AndereGilde_Condition()
{
	if (Mod_Gilde > 0)
	&& (hero.guild != GIL_MIL)
	&& (Npc_KnowsInfo(hero, Info_Mod_Lares_WillSoeldner))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_AndereGilde_Info()
{
	AI_Output(self, hero, "Info_Mod_Lares_AndereGilde_09_00"); //Hey, mir ist zu Ohren gekommen, dass du schon einem anderen großen Lager angehörst.
	AI_Output(hero, self, "Info_Mod_Lares_AndereGilde_15_01"); //Ähh, nun ...
	AI_Output(self, hero, "Info_Mod_Lares_AndereGilde_09_02"); //Tja, in dem Fall kannst du uns nun leider nicht mehr beitreten.
	AI_Output(self, hero, "Info_Mod_Lares_AndereGilde_09_03"); //Das Risiko wäre zu groß, dass du die Interessen anderer vertrittst, wenn du verstehst.
};

INSTANCE Info_Mod_Lares_Friedensbote (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_Friedensbote_Condition;
	information	= Info_Mod_Lares_Friedensbote_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lares_Friedensbote_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_AndreVermaechtnis))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_Friedensbote_Info()
{
	AI_Output(self, hero, "Info_Mod_Lares_Friedensbote_09_00"); //(neckisch) Na, haben die Paladine dich mal wieder auf Landurlaub geschickt?
	AI_Output(hero, self, "Info_Mod_Lares_Friedensbote_15_01"); //Ja, gewissermaßen. Ich soll dir diese Botschaft von Lord Hagen persönlich überbringen.
	AI_Output(self, hero, "Info_Mod_Lares_Friedensbote_09_02"); //(neckisch, ungläubig) Von Lord Kastrat-des-Königs Hagilein höchst persönlich? Du willst mich veralbern ...
	AI_Output(hero, self, "Info_Mod_Lares_Friedensbote_15_03"); //Hier.

	B_GiveInvItems	(hero, self, ItWr_HagenLares, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Lares_Friedensbote_09_04"); //Tatsache ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Lares_Friedensbote_09_05"); //... unterbreite ich den Vorschlag ... bla ... die Konflikte ... bla ... Paladine und Söldner ... usw. ... soso, aha ... Zeichen des Vertrauens ... Aspirant auf Posten des Hauptmanns ... oha.
	AI_Output(hero, self, "Info_Mod_Lares_Friedensbote_15_06"); //Und?
	AI_Output(self, hero, "Info_Mod_Lares_Friedensbote_09_07"); //Ich muss schon sagen, du hast es aber verdammt weit gebracht, Junge. Meine Fresse.
	AI_Output(self, hero, "Info_Mod_Lares_Friedensbote_09_08"); //Höchster Ritter und Anwärter auf den Hauptmannsposten in der Stadt.
	AI_Output(self, hero, "Info_Mod_Lares_Friedensbote_09_09"); //Als du uns damals in der Kolonie die Bedarfsliste des Alten Lagers gebracht hast, wäre wohl das letzte was ich erwartet hätte, dass du mal bei der Truppe des Königs weit vorne mitmischt.
	AI_Output(hero, self, "Info_Mod_Lares_Friedensbote_15_10"); //Und was sagst du nun zu Hagens Anfrage?
	AI_Output(self, hero, "Info_Mod_Lares_Friedensbote_09_11"); //Wenn du als zugkünftiger Hauptmann für die Einhaltung der Waffenruhe bürgst, sehe ich keinen Grund, warum nicht auch wir uns daran halten sollten.
	AI_Output(self, hero, "Info_Mod_Lares_Friedensbote_09_12"); //Die Orks im Minental werden ja wirklich immer mehr zur Bedrohung.
	AI_Output(self, hero, "Info_Mod_Lares_Friedensbote_09_13"); //Da wäre so eine kleine Waffenpause gar nicht schlecht, um in Ruhe unsere Position in Khorinis zu festigen und uns auf alles weitere vorzubereiten.
	AI_Output(self, hero, "Info_Mod_Lares_Friedensbote_09_14"); //Du kannst also Hagen ausrichten, dass wir uns für unseren Teil daran halten werden.
	AI_Output(self, hero, "Info_Mod_Lares_Friedensbote_09_15"); //(neckisch) Da wird er auch gewiss mit dir zufrieden sein, gell, hähä?
	AI_Output(self, hero, "Info_Mod_Lares_Friedensbote_09_16"); //Nichts für ungut. Ich bin gespannt, wie sich das weiterentwickelt. Mach’s gut.

	B_LogEntry	(TOPIC_MOD_MILIZ_FRIEDENSBOTE, "Lares hat der Waffenruhe zugestimmt. Ich sollte Lord Hagen davon berichten.");
};

var int Lares_LastPetzCounter;
var int Lares_LastPetzCrime;

INSTANCE Info_Mod_Lares_PMSchulden (C_INFO)
{
	npc         	= Mod_526_SLD_Lares_NW;
	nr          	= 1;
	condition   	= Info_Mod_Lares_PMSchulden_Condition;
	information 	= Info_Mod_Lares_PMSchulden_Info;
	permanent   	= 1;
	important 	= 1; 
};

FUNC INT Info_Mod_Lares_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Lares_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Lares_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Lares_PMSchulden_Info()
{
	AI_Output (self, hero, "Info_Mod_Lares_PMSchulden_09_00"); //Bist du gekommen, um deine Strafe zu zahlen?

	if (B_GetTotalPetzCounter(self) > Lares_LastPetzCounter)
	{
		AI_Output (self, hero, "Info_Mod_Lares_PMSchulden_09_01"); //Ich hatte mich schon gefragt, ob du es überhaupt noch wagst, hierher zu kommen!
		AI_Output (self, hero, "Info_Mod_Lares_PMSchulden_09_02"); //Anscheinend ist es nicht bei den letzten Anschuldigungen geblieben!

		if (Lares_Schulden < 1000)
		{
			AI_Output (self, hero, "Info_Mod_Lares_PMSchulden_09_03"); //Ich hatte dich gewarnt! Die Strafe, die du jetzt zahlen musst, ist höher!
			AI_Output (hero, self, "Info_Mod_Lares_PMAdd_15_00"); //Wieviel?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Lares_LastPetzCounter);
		
			if (diff > 0)
			{
				Lares_Schulden = Lares_Schulden + (diff * 50);
			};
		
			if (Lares_Schulden > 1000)	{	Lares_Schulden = 1000;	};
		
			B_Say_Gold (self, hero, Lares_Schulden);
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Lares_PMSchulden_09_04"); //Du hast mich schwer enttäuscht!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Lares_LastPetzCrime)
	{
		AI_Output (self, hero, "Info_Mod_Lares_PMSchulden_09_05"); //Es haben sich einige neue Dinge ergeben.
		
		if (Lares_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, hero, "Info_Mod_Lares_PMSchulden_09_06"); //Plötzlich gibt es niemanden mehr, der dich des Mordes bezichtigt.
		};
		
		if (Lares_LastPetzCrime == CRIME_THEFT)
		|| ( (Lares_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, hero, "Info_Mod_Lares_PMSchulden_09_07"); //Niemand erinnert sich mehr, dich bei einem Diebstahl gesehen zu haben.
		};
		
		if (Lares_LastPetzCrime == CRIME_ATTACK)
		|| ( (Lares_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, hero, "Info_Mod_Lares_PMSchulden_09_08"); //Es gibt keine Zeugen mehr dafür, dass du jemals in eine Schlägerei verwickelt warst.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Lares_PMSchulden_09_09"); //Anscheinend haben sich alle Anklagen gegen dich in Wohlgefallen aufgelöst.
		};
		
		AI_Output (self, hero, "Info_Mod_Lares_PMSchulden_09_10"); //Ich weiß nicht, was da gelaufen ist, aber ich warne dich: Spiel keine Spielchen mit mir.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Lares_PMSchulden_09_11"); //Ich habe mich jedenfalls entschieden, dir deine Schulden zu erlassen.
			AI_Output (self, hero, "Info_Mod_Lares_PMSchulden_09_12"); //Sieh zu, dass du nicht wieder in Schwierigkeiten kommst.
	
			Lares_Schulden			= 0;
			Lares_LastPetzCounter 	= 0;
			Lares_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Lares_PMSchulden_09_13"); //Damit eins klar ist: Deine Strafe musst du trotzdem in voller Höhe zahlen.
			B_Say_Gold (self, hero, Lares_Schulden);
			AI_Output (self, hero, "Info_Mod_Lares_PMSchulden_09_14"); //Also, was ist?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(Info_Mod_Lares_PMSchulden);
		Info_ClearChoices  	(Info_Mod_Lares_PETZMASTER);
		Info_AddChoice		(Info_Mod_Lares_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Lares_PETZMASTER_PayLater);
		Info_AddChoice		(Info_Mod_Lares_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Lares_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(hero, itmi_gold) >= Lares_Schulden)
		{
			Info_AddChoice 	(Info_Mod_Lares_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Lares_PETZMASTER_PayNow);
		};
	};
};

func void Info_Mod_Lares_PMSchulden_HowMuchAgain()
{
	AI_Output (hero, self, "Info_Mod_Lares_PMSchulden_HowMuchAgain_15_00"); //Wie viel war es noch mal?
	B_Say_Gold (self, hero, Lares_Schulden);

	Info_ClearChoices  	(Info_Mod_Lares_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Lares_PETZMASTER);
	Info_AddChoice		(Info_Mod_Lares_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Lares_PETZMASTER_PayLater);
	Info_AddChoice		(Info_Mod_Lares_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Lares_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(hero, itmi_gold) >= Lares_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Lares_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Lares_PETZMASTER_PayNow);
	};
};

INSTANCE Info_Mod_Lares_PETZMASTER   (C_INFO)
{
	npc         	= Mod_526_SLD_Lares_NW;
	nr          	= 1;
	condition   	= Info_Mod_Lares_PETZMASTER_Condition;
	information 	= Info_Mod_Lares_PETZMASTER_Info;
	permanent   	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Lares_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Lares_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Lares_PETZMASTER_Info()
{
	Lares_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_01"); //Gut, dass du zu mir kommst, bevor alles noch schlimmer für dich wird.
		AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_02"); //Mord ist ein schweres Vergehen!

		Lares_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50

		Lares_Schulden = Lares_Schulden + 500;						//PLUS Mörder-Malus

		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_03"); //Ganz zu schweigen von den anderen Sachen, die du angerichtet hast.
		};

		AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_06"); //Ich habe kein Interesse daran, dich an den Galgen zu bringen. Wir sind im Krieg und wir brauchen jeden Mann.
		AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_07"); //Aber es wird nicht leicht sein, die Leute wieder gnädig zu stimmen.
		AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_08"); //Du könntest deine Reue zeigen, indem du eine Strafe zahlst - natürlich muss die Strafe angemessen hoch sein.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_09"); //Gut, dass du kommst! Du wirst des Diebstahls bezichtigt! Es gibt Zeugen!

		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_10"); //Von den anderen Dingen, die mir zu Ohren gekommen sind, will ich gar nicht erst reden.
		};

		AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_11"); //Ich werde so ein Verhalten bei uns nicht dulden!
		AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_12"); //Du wirst eine Strafe zahlen müssen, um dein Verbrechen wieder gutzumachen!
		
		Lares_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_13"); //Wenn du dich mit dem Gesindel in der Stadt herumprügelst, ist das eine Sache ...
		AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_14"); //Aber wenn du die Bauern oder andere Söldner angreifst, muss ich dich zur Rechenschaft ziehen.

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_15"); //Und die Sache mit den Schafen musste wohl auch nicht sein.
		};

		AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_16"); //Wenn ich dir das durchgehen lasse, macht hier bald jeder, was er will.
		AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_17"); //Also wirst du eine angemessene Strafe zahlen - und die Sache ist vergessen.
		
		Lares_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_18"); //Mir ist zu Ohren gekommen, du hättest dich an unseren Schafen vergriffen.
		AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_19"); //Dir ist klar, dass ich das nicht durchgehen lassen kann.
		AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_09_20"); //Du wirst eine Entschädigung zahlen müssen!
		
		Lares_Schulden = 100;
	};
	
	AI_Output (hero, self, "Info_Mod_Lares_PETZMASTER_15_21"); //Wie viel?
	
	if (Lares_Schulden > 1000)	{	Lares_Schulden = 1000;	};
		
	B_Say_Gold (self, hero, Lares_Schulden);
	
	Info_ClearChoices  	(Info_Mod_Lares_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Lares_PETZMASTER);
	Info_AddChoice		(Info_Mod_Lares_PETZMASTER,"Ich habe nicht genug Gold!",Info_Mod_Lares_PETZMASTER_PayLater);
	if (Npc_HasItems(hero, itmi_gold) >= Lares_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Lares_PETZMASTER,"Ich will die Strafe zahlen.",Info_Mod_Lares_PETZMASTER_PayNow);
	};
};

func void Info_Mod_Lares_PETZMASTER_PayNow()
{
	AI_Output (hero, self, "Info_Mod_Lares_PETZMASTER_PayNow_15_00"); //Ich will die Strafe zahlen!
	B_GiveInvItems (hero, self, itmi_gold, Lares_Schulden);
	AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_PayNow_09_01"); //Gut! Ich werde dafür sorgen, dass es jeder Bauer und Söldner erfährt - damit wäre dein Ruf einigermaßen wiederhergestellt.

	B_GrantAbsolution (LOC_FARM);
	
	Lares_Schulden			= 0;
	Lares_LastPetzCounter 	= 0;
	Lares_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(Info_Mod_Lares_PETZMASTER);
	Info_ClearChoices  	(Info_Mod_Lares_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void Info_Mod_Lares_PETZMASTER_PayLater()
{
	AI_Output (hero, self, "Info_Mod_Lares_PETZMASTER_PayLater_15_00"); //Ich habe nicht genug Gold!
	AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_PayLater_09_01"); //Dann sieh zu, dass du das Gold so schnell wie möglich beschaffst.
	AI_Output (self, hero, "Info_Mod_Lares_PETZMASTER_PayLater_09_02"); //Und ich warne dich: Wenn du dir noch was zu schulden kommen lässt, wird die Sache noch schlimmer für dich!
	
	Lares_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Lares_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Lares_Lernen (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_Lernen_Condition;
	information	= Info_Mod_Lares_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir was bei.";
};

FUNC INT Info_Mod_Lares_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lares_Lehrer))
	&& ((Mod_Gilde == 5)
	|| (Mod_Gilde == 4)
	|| (Mod_Gilde == 19))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lares_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Lares_Lernen_15_00"); //Bring mir was bei.
	AI_Output(self, hero, "Info_Mod_Lares_Lernen_09_01"); //Was willst du lernen?

	Info_ClearChoices	(Info_Mod_Lares_Lernen);

	Info_AddChoice 		(Info_Mod_Lares_Lernen, DIALOG_BACK, Info_Mod_Lares_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Lares_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5	, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Lares_Lernen_Geschick_5);
	Info_AddChoice		(Info_Mod_Lares_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1	, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Lares_Lernen_Geschick_1);
};

FUNC VOID Info_Mod_Lares_Lernen_BACK()
{
	Info_ClearChoices (Info_Mod_Lares_Lernen);
};

FUNC VOID Info_Mod_Lares_Lernen_Geschick_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_DEXTERITY, 5, 140);
	
	Info_ClearChoices	(Info_Mod_Lares_Lernen);

	Info_AddChoice 		(Info_Mod_Lares_Lernen, DIALOG_BACK, Info_Mod_Lares_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Lares_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5	, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Lares_Lernen_Geschick_5);
	Info_AddChoice		(Info_Mod_Lares_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1	, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Lares_Lernen_Geschick_1);
};

FUNC VOID Info_Mod_Lares_Lernen_Geschick_1()
{
	B_TeachAttributePoints (self, hero, ATR_DEXTERITY, 1, 140);
	
	Info_ClearChoices	(Info_Mod_Lares_Lernen);

	Info_AddChoice 		(Info_Mod_Lares_Lernen, DIALOG_BACK, Info_Mod_Lares_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Lares_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5	, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Lares_Lernen_Geschick_5);
	Info_AddChoice		(Info_Mod_Lares_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1	, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Lares_Lernen_Geschick_1);
};

INSTANCE Info_Mod_Lares_Pickpocket (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_Pickpocket_Condition;
	information	= Info_Mod_Lares_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Lares_Pickpocket_Condition()
{
	C_Beklauen	(94, ItMi_Gold, 600);
};

FUNC VOID Info_Mod_Lares_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Lares_Pickpocket);

	Info_AddChoice	(Info_Mod_Lares_Pickpocket, DIALOG_BACK, Info_Mod_Lares_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Lares_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Lares_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Lares_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Lares_Pickpocket);
};

FUNC VOID Info_Mod_Lares_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Lares_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Lares_Pickpocket);

		Info_AddChoice	(Info_Mod_Lares_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Lares_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Lares_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Lares_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Lares_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Lares_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Lares_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Lares_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Lares_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Lares_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Lares_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Lares_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Lares_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Lares_EXIT (C_INFO)
{
	npc		= Mod_526_SLD_Lares_NW;
	nr		= 1;
	condition	= Info_Mod_Lares_EXIT_Condition;
	information	= Info_Mod_Lares_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lares_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lares_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};