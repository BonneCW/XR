INSTANCE Info_Mod_Luis_Hi (C_INFO)
{
	npc		= Mod_7567_OUT_Luis_EIS;
	nr		= 1;
	condition	= Info_Mod_Luis_Hi_Condition;
	information	= Info_Mod_Luis_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dein Freund hat ja eine Laune.";
};

FUNC INT Info_Mod_Luis_Hi_Condition()
{
	if (Wld_IsTime(07,15,00,15))
	&& (Npc_KnowsInfo(hero, Info_Mod_Pilar_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Luis_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Luis_Hi_15_00"); //Dein Freund hat ja eine Laune. Scheint so, als würde es euch nicht gefallen, den ganzen Tag hier rum zu sitzen.
	AI_Output(self, hero, "Info_Mod_Luis_Hi_06_01"); //Das würde wohl jeden Jäger belasten!
	AI_Output(hero, self, "Info_Mod_Luis_Hi_15_02"); //Aber das kann man doch ändern. Warum geht ihr nicht vor die Stadt und jagt ein wenig?
	AI_Output(self, hero, "Info_Mod_Luis_Hi_06_03"); //Du meinst so wie ein Dutzend anderer Jäger?
	AI_Output(self, hero, "Info_Mod_Luis_Hi_06_04"); //Der Konkurrenzkampf vor der Stadt ist nicht mehr auszuhalten und viel bekommt man auch nicht für ein einfaches Fell.
	AI_Output(hero, self, "Info_Mod_Luis_Hi_15_05"); //Das Eisgebiet ist doch recht groß, irgendwo muss da doch was zu holen sein?
	AI_Output(self, hero, "Info_Mod_Luis_Hi_06_06"); //Mein Kumpel Randi hat was ähnliches gesagt, bevor er aufgebrochen ist, und bis heute habe ich nichts mehr von ihm gehört.
	AI_Output(hero, self, "Info_Mod_Luis_Hi_15_07"); //Was hatte er denn vor?
	AI_Output(self, hero, "Info_Mod_Luis_Hi_06_08"); //Er wollte den alten Turm am Eissee als ein Lager für die Nacht nutzen.
	AI_Output(self, hero, "Info_Mod_Luis_Hi_06_09"); //Eigentlich keine schlechte Idee, nur wer weiß, was sich nach all den Jahren dort eingenistet hat.
	AI_Output(hero, self, "Info_Mod_Luis_Hi_15_10"); //Na ja, es könnte ja sein, dass er sich dort eine goldene Nase verdient.
	AI_Output(hero, self, "Info_Mod_Luis_Hi_15_11"); //Ich glaube, dass ich mir den Turm auch mal ansehen werde.
	AI_Output(self, hero, "Info_Mod_Luis_Hi_06_12"); //Wenn du unbedingt auch dort sterben willst, bitte!
	AI_Output(self, hero, "Info_Mod_Luis_Hi_06_13"); //Aber du solltest vorher noch bei Keith vorbei schauen. Randi wollte ihn von seiner Idee überzeugen.
	AI_Output(self, hero, "Info_Mod_Luis_Hi_06_14"); //Vielleicht hast du ja Glück und sie sind noch nicht aufgebrochen.
	AI_Output(self, hero, "Info_Mod_Luis_Hi_06_15"); //Hier hast du eine Karte, mit ihr solltest du zu seiner Hütte im Wald gelangen, Viel Erfolg.

	B_GiveInvItems	(self, hero, ItWr_Map_Eisgebiet_Keith, 1);

	AI_Output(hero, self, "Info_Mod_Luis_Hi_15_16"); //Danke. Wenn sie noch Leben, geb ich dir Bescheid.

	Log_CreateTopic	(TOPIC_MOD_EIS_ALTERTURM, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EIS_ALTERTURM, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_EIS_ALTERTURM, "Luis' Freund Randi hat sich auf den Weg zum alten Turm am Eissee gemacht, um sich dort nach neuen Jagdgebieten umzusehen. Seitdem hat Luis nichts mehr von ihm gehört. Er hat mir nun eine Karte gegeben, auf der Keiths Hütte markiert ist. Wenn ich Glück habe, sind Randi und Keith noch dort.");

	Wld_InsertNpc	(Mod_7569_OUT_Randi_EIS,	"EIS_338");

	B_KillNpc	(Mod_7569_OUT_Randi_EIS);

	Wld_InsertNpc	(Mod_7570_OUT_Bandit_EIS,	"EIS_338");
	Wld_InsertNpc	(Mod_7571_OUT_Bandit_EIS,	"EIS_338");
};

INSTANCE Info_Mod_Luis_Vigonza (C_INFO)
{
	npc		= Mod_7567_OUT_Luis_EIS;
	nr		= 1;
	condition	= Info_Mod_Luis_Vigonza_Condition;
	information	= Info_Mod_Luis_Vigonza_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe eine schlechte Nachricht für dich, dein Kumpel Randi ist tot.";
};

FUNC INT Info_Mod_Luis_Vigonza_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Keith_Dalma))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Luis_Vigonza_Info()
{
	AI_Output(hero, self, "Info_Mod_Luis_Vigonza_15_00"); //Ich habe eine schlechte Nachricht für dich, dein Kumpel Randi ist tot.
	AI_Output(self, hero, "Info_Mod_Luis_Vigonza_06_01"); //Ich hab es ja befürchtet, allerdings hab ich gehofft, dass ich falsch liege.
	AI_Output(self, hero, "Info_Mod_Luis_Vigonza_06_02"); //Jetzt, wo ich die Gewissheit von seinem Tod habe, mache ich mir noch mehr sorgen um Pilar.
	AI_Output(hero, self, "Info_Mod_Luis_Vigonza_15_03"); //Jetzt, wo du es sagst: Wo ist er eigentlich?
	AI_Output(self, hero, "Info_Mod_Luis_Vigonza_06_04"); //Er ist vor kurzem abgehauen, meinte, er hält es hier nicht mehr aus.
	AI_Output(self, hero, "Info_Mod_Luis_Vigonza_06_05"); //Er wollte zu seinem Bruder, er wohnt in der Nähe des Goblinfriedhofes, beim zerfallenen Wachturm.
	AI_Output(hero, self, "Info_Mod_Luis_Vigonza_15_06"); //Was zu Teufel ist ein Goblinfriedhof? Ich dachte die Viecher haben nicht mal genug Verstand, den sie wegsaufen könnten. Wie kommen die dann auf die Idee einen Friedhof anzulegen?
	AI_Output(self, hero, "Info_Mod_Luis_Vigonza_06_07"); //Bei den normalen Goblins trifft das auch zu, allerding gab es vor ein paar Jahren einen Dämonenbeschwörer unter ihnen.
	AI_Output(self, hero, "Info_Mod_Luis_Vigonza_06_08"); //Der hat anscheinend den anderen beigebracht einen Friedhof anzulegen.
	AI_Output(hero, self, "Info_Mod_Luis_Vigonza_15_09"); //Das klingt für mich aber nicht sehr gut.
	AI_Output(self, hero, "Info_Mod_Luis_Vigonza_06_10"); //Keine Panik, die Goblins haben wir vor langer Zeit in einer Schlacht an einem der Wachtürme besiegt.
	AI_Output(self, hero, "Info_Mod_Luis_Vigonza_06_11"); //Als die Goblins versucht haben ihn einzunehmen haben wir fast den ganzen Klan getötet. Und die paar, die überlebt haben, wollten nur ihre Toten beerdigen.
	AI_Output(hero, self, "Info_Mod_Luis_Vigonza_15_12"); //Und der Dämonenbeschwörer?
	AI_Output(self, hero, "Info_Mod_Luis_Vigonza_06_13"); //Ist auch tot. Er hat sogar den größten Grabstein auf dem Friedhof.
	AI_Output(self, hero, "Info_Mod_Luis_Vigonza_06_14"); //Wenn du willst zeig ich dir den Friedhof. Ich will sowieso zu Pilar und das liegt auf dem Weg.
	AI_Output(hero, self, "Info_Mod_Luis_Vigonza_15_15"); //In Ordnung.

	Log_CreateTopic	(TOPIC_MOD_EIS_FRIEDHOF, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EIS_FRIEDHOF, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_EIS_FRIEDHOF, "Pilar ist bei seinem Bruder in der Nähe eines Goblinfriedhofs. Luis will nach ihm sehen und hat mir angeboten, mir den Weg zum Friedhof zu zeigen.");

	self.aivar[AIV_Partymember] = TRUE;

	B_StartOtherRoutine	(self, "FRIEDHOF");
};

INSTANCE Info_Mod_Luis_AtFriedhof (C_INFO)
{
	npc		= Mod_7567_OUT_Luis_EIS;
	nr		= 1;
	condition	= Info_Mod_Luis_AtFriedhof_Condition;
	information	= Info_Mod_Luis_AtFriedhof_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Luis_AtFriedhof_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Luis_Vigonza))
	&& (Npc_GetDistToWP(self, "FRIEDHOFF_3") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Luis_AtFriedhof_Info()
{
	AI_Output(self, hero, "Info_Mod_Luis_AtFriedhof_06_00"); //So, da wären wir. Ist heute ja nicht viel los hier.
	AI_Output(self, hero, "Info_Mod_Luis_AtFriedhof_06_01"); //Komm mit, ich zeig dir das Grab des Dämonenbeschwörers.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FRIEDHOF2");
};

INSTANCE Info_Mod_Luis_AtFriedhof2 (C_INFO)
{
	npc		= Mod_7567_OUT_Luis_EIS;
	nr		= 1;
	condition	= Info_Mod_Luis_AtFriedhof2_Condition;
	information	= Info_Mod_Luis_AtFriedhof2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Luis_AtFriedhof2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Luis_AtFriedhof))
	&& (Npc_GetDistToWP(self, "FRIEDHOFF_6") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Luis_AtFriedhof2_Info()
{
	AI_Output(self, hero, "Info_Mod_Luis_AtFriedhof2_06_00"); //Hier ist es. Schon irgendwie eigenartig, wie ein schlauer Goblin die Goblin-Masse zu so etwas wie dem Bau dieses Friedhofs bewegen kann.
	AI_Output(self, hero, "Info_Mod_Luis_AtFriedhof2_06_01"); //Was war das ... hast du das auch gehört?!

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Gobbo_Warrior, "FRIEDHOFF_7");
	Wld_InsertNpc	(Gobbo_Warrior, "FRIEDHOFF_7");
	Wld_InsertNpc	(Gobbo_Warrior, "FRIEDHOFF_7");
	Wld_InsertNpc	(Gobbo_Warrior, "FRIEDHOFF_7");
	Wld_InsertNpc	(Gobbo_Warrior, "FRIEDHOFF_7");
	Wld_InsertNpc	(Gobbo_Warrior, "FRIEDHOFF_7");
};

INSTANCE Info_Mod_Luis_AtFriedhof3 (C_INFO)
{
	npc		= Mod_7567_OUT_Luis_EIS;
	nr		= 1;
	condition	= Info_Mod_Luis_AtFriedhof3_Condition;
	information	= Info_Mod_Luis_AtFriedhof3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Luis_AtFriedhof3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Luis_AtFriedhof2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Luis_AtFriedhof3_Info()
{
	AI_Output(self, hero, "Info_Mod_Luis_AtFriedhof3_06_00"); //Verdammt, die haben mich gerade aber erschreckt. Ich hab die wirklich nicht kommen gehört.
	AI_Output(hero, self, "Info_Mod_Luis_AtFriedhof3_15_01"); //Vielleicht fanden sie es nicht so toll, das wir auf ihrem Friedhof sind.
	AI_Output(self, hero, "Info_Mod_Luis_AtFriedhof3_06_02"); //Ach und wenn schon. Hier liegen doch sowieso nur Leichen.
	AI_Output(self, hero, "Info_Mod_Luis_AtFriedhof3_06_03"); //Die sollten sich besser um ihre Rübenfelder kümmern, als hier den ganzen Tag rumzulungern.
	AI_Output(self, hero, "Info_Mod_Luis_AtFriedhof3_06_04"); //Lass uns jetzt zur Hütte von Pilars Bruder gehen.

	B_LogEntry	(TOPIC_MOD_EIS_FRIEDHOF, "Auf dem Friedhof haben uns einige Goblins überrascht. Luis wird mich jetzt noch zu Pilars Bruder führen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "PILARSBRUDER");
};

INSTANCE Info_Mod_Luis_AtFriedhof4 (C_INFO)
{
	npc		= Mod_7567_OUT_Luis_EIS;
	nr		= 1;
	condition	= Info_Mod_Luis_AtFriedhof4_Condition;
	information	= Info_Mod_Luis_AtFriedhof4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Luis_AtFriedhof4_Condition()
{
	if (Mod_Pilar_Gobbos == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Luis_AtFriedhof4_Info()
{
	AI_Output(self, hero, "Info_Mod_Luis_AtFriedhof4_06_00"); //Lass mich raten, wir kommen gerade zu spät, oder?
	AI_Output(hero, self, "Info_Mod_Luis_AtFriedhof4_15_01"); //Sieht so aus. Allerdings vermisse ich den Dämonenbeschwörer. Aus seinem Grab kam kein Skelett.
	AI_Output(self, hero, "Info_Mod_Luis_AtFriedhof4_06_02"); //Mhm ... das könnte heißen, das er vielleicht doch nicht tot ist.
	AI_Output(self, hero, "Info_Mod_Luis_AtFriedhof4_06_03"); //Wir sollten mal den zerfallenen Turm unter die Lupe nehmen. Vielleicht gibt es ja da einen Hinweis auf seinen verbleib.
	AI_Output(self, hero, "Info_Mod_Luis_AtFriedhof4_06_04"); //Ich lass die Wachen hier Posten beziehen, falls doch noch ein paar von denen aus der Erde kommen.

	B_LogEntry	(TOPIC_MOD_EIS_FRIEDHOF, "Luis ist mit zwei Wachen am Friedhof angekommen. Die Wachen werden noch ein Weilchen hier bleiben, während wir am Turm nach dem Dämonenbeschwörer sehen werden.");

	AI_StopProcessInfos	(self);

	self.aivar[AIV_Partymember] = TRUE;

	B_StartOtherRoutine	(self, "ATTURM");
	B_StartOtherRoutine	(Mod_7566_OUT_Pilar_EIS, "START");

	Wld_InsertNpc	(Gobbo_Eis_Beschwoerer,	"NORTDGEBIET_88");
	Wld_InsertNpc	(Gobbo_Skeleton,	"NORTDGEBIET_88");
	Wld_InsertNpc	(Gobbo_Skeleton,	"NORTDGEBIET_88");
	Wld_InsertNpc	(Gobbo_Skeleton,	"NORTDGEBIET_88");
};

INSTANCE Info_Mod_Luis_AtFriedhof5 (C_INFO)
{
	npc		= Mod_7567_OUT_Luis_EIS;
	nr		= 1;
	condition	= Info_Mod_Luis_AtFriedhof5_Condition;
	information	= Info_Mod_Luis_AtFriedhof5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Luis_AtFriedhof5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Luis_AtFriedhof4))
	&& (Npc_IsDead(Gobbo_Eis_Beschwoerer))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Luis_AtFriedhof5_Info()
{
	AI_Output(self, hero, "Info_Mod_Luis_AtFriedhof5_06_00"); //Wollen wir hoffen, dass es von dem wirklich nur einen gab.
	AI_Output(self, hero, "Info_Mod_Luis_AtFriedhof5_06_01"); //Wenn die alle so stark wären, hätten wir ein ganz schönes Problem.
	AI_Output(self, hero, "Info_Mod_Luis_AtFriedhof5_06_02"); //Ich denke für heute haben die Goblins erst mal genug. Ich geh jetzt zurück in die Taverne.
	AI_Output(self, hero, "Info_Mod_Luis_AtFriedhof5_06_03"); //Ach ja, du sollst dich auch bei Thys melden. Ich glaube er will sich bedanken.

	B_LogEntry	(TOPIC_MOD_EIS_FRIEDHOF, "Der Dämonenbeschwörer ist Geschichte und Luis kehrt in die Taverne zurück. Ich soll mich nochmal bei Thys melden.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	self.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Luis_Pickpocket (C_INFO)
{
	npc		= Mod_7567_OUT_Luis_EIS;
	nr		= 1;
	condition	= Info_Mod_Luis_Pickpocket_Condition;
	information	= Info_Mod_Luis_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Luis_Pickpocket_Condition()
{
	C_Beklauen	(75, ItMi_Gold, 25);
};

FUNC VOID Info_Mod_Luis_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Luis_Pickpocket);

	Info_AddChoice	(Info_Mod_Luis_Pickpocket, DIALOG_BACK, Info_Mod_Luis_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Luis_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Luis_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Luis_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Luis_Pickpocket);
};

FUNC VOID Info_Mod_Luis_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Luis_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Luis_Pickpocket);

		Info_AddChoice	(Info_Mod_Luis_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Luis_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Luis_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Luis_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Luis_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Luis_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Luis_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Luis_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Luis_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Luis_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Luis_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Luis_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Luis_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Luis_EXIT (C_INFO)
{
	npc		= Mod_7567_OUT_Luis_EIS;
	nr		= 1;
	condition	= Info_Mod_Luis_EXIT_Condition;
	information	= Info_Mod_Luis_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Luis_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Luis_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};