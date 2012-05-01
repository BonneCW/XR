INSTANCE Info_Mod_Nandor_Hi (C_INFO)
{
	npc		= Mod_1937_JGR_Nandor_NW;
	nr		= 1;
	condition	= Info_Mod_Nandor_Hi_Condition;
	information	= Info_Mod_Nandor_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Nandor_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nandor_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Nandor_Hi_15_00"); //Hi, warst du nicht einer dieser Typen, die von der Zivilisation genug hatten und nun draußen in der freien Natur autark über die Runden kommen?
	AI_Output(self, hero, "Info_Mod_Nandor_Hi_02_01"); //Ja, könnte man so sagen. Woher weisst du das?
	AI_Output(hero, self, "Info_Mod_Nandor_Hi_15_02"); //Wusste ich nicht, du hast es mir erst eben gesagt.
	AI_Output(self, hero, "Info_Mod_Nandor_Hi_02_03"); //Sehr lustig.
	AI_Output(hero, self, "Info_Mod_Nandor_Hi_15_04"); //Dann bist du Nandor, richtig?
	AI_Output(self, hero, "Info_Mod_Nandor_Hi_02_05"); //(genervt) Ja, woher weisst du das schon wieder?
	AI_Output(hero, self, "Info_Mod_Nandor_Hi_15_06"); //Du hast es mir doch eben gerade gesagt.
	AI_Output(self, hero, "Info_Mod_Nandor_Hi_02_07"); //Verarschen kann ich mich alleine, was willst du eigentlich?
};

INSTANCE Info_Mod_Nandor_NoIdea (C_INFO)
{
	npc		= Mod_1937_JGR_Nandor_NW;
	nr		= 1;
	condition	= Info_Mod_Nandor_NoIdea_Condition;
	information	= Info_Mod_Nandor_NoIdea_Info;
	permanent	= 1;
	important	= 0;
	description	= "DAS weiss ICH noch nicht.";
};

FUNC INT Info_Mod_Nandor_NoIdea_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nandor_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Nandor_Dragomir))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nandor_NoIdea_Info()
{
	AI_Output(hero, self, "Info_Mod_Nandor_NoIdea_15_00"); //DAS weiss ICH noch nicht.
	AI_Output(self, hero, "Info_Mod_Nandor_NoIdea_02_01"); //Dann verschwinde endlich.
};

INSTANCE Info_Mod_Nandor_Dragomir (C_INFO)
{
	npc		= Mod_1937_JGR_Nandor_NW;
	nr		= 1;
	condition	= Info_Mod_Nandor_Dragomir_Condition;
	information	= Info_Mod_Nandor_Dragomir_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dragomir möchte wissen, was du bisher herausgefunden hast.";
};

FUNC INT Info_Mod_Nandor_Dragomir_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nandor_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Mitmachen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nandor_Dragomir_Info()
{
	AI_Output(hero, self, "Info_Mod_Nandor_Dragomir_15_00"); //Dragomir möchte wissen, was du bisher herausgefunden hast.
	AI_Output(self, hero, "Info_Mod_Nandor_Dragomir_02_01"); //Und ich soll es gerade DIR sagen?
	AI_Output(hero, self, "Info_Mod_Nandor_Dragomir_15_02"); //Nun, wo ich schon einmal da bin ...
	AI_Output(self, hero, "Info_Mod_Nandor_Dragomir_02_03"); //(stöhnt auf) Also gut, du wirst eh nicht locker lassen. Seid einiger Zeit lungern hier ein paar äußerst aggressive Wölfe rum, die mir ein wenig Sorgen bereiten.
	AI_Output(self, hero, "Info_Mod_Nandor_Dragomir_02_04"); //Wenn du mir hilfst, sie zu erlegen, sage ich dir, was du wissen willst.
	AI_Output(hero, self, "Info_Mod_Nandor_Dragomir_15_05"); //(stöhnt auf) In Ordnung.

	AI_StopProcessInfos	(self);

	self.aivar[AIV_PARTYMEMBER] = TRUE;

	Wld_InsertNpc	(Wolf_Seltsam_01,	"FP_ROAM_WOLF_SELTSAM_01");
	Wld_InsertNpc	(Wolf_Seltsam_02,	"FP_ROAM_WOLF_SELTSAM_02");
	Wld_InsertNpc	(Wolf_Seltsam_03,	"FP_ROAM_WOLF_SELTSAM_03");
	Wld_InsertNpc	(Wolf_Seltsam_04,	"FP_ROAM_WOLF_SELTSAM_04");
	Wld_InsertNpc	(Wolf_Seltsam_05,	"FP_ROAM_WOLF_SELTSAM_05");

	B_StartOtherRoutine	(self, "WOELFE");
};

INSTANCE Info_Mod_Nandor_WoelfeTot (C_INFO)
{
	npc		= Mod_1937_JGR_Nandor_NW;
	nr		= 1;
	condition	= Info_Mod_Nandor_WoelfeTot_Condition;
	information	= Info_Mod_Nandor_WoelfeTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Nandor_WoelfeTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nandor_Dragomir))
	&& (Npc_IsDead(Wolf_Seltsam_01))
	&& (Npc_IsDead(Wolf_Seltsam_02))
	&& (Npc_IsDead(Wolf_Seltsam_03))
	&& (Npc_IsDead(Wolf_Seltsam_04))
	&& (Npc_IsDead(Wolf_Seltsam_05))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nandor_WoelfeTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Nandor_WoelfeTot_02_00"); //Hast du den Blick in ihren Augen auch gesehen?
	AI_Output(hero, self, "Info_Mod_Nandor_WoelfeTot_15_01"); //Nun ja ...
	AI_Output(self, hero, "Info_Mod_Nandor_WoelfeTot_02_02"); //Er war einfach ... gefühlslos. Starr. Mit diesen Viechern stimmt etwas nicht.
	AI_Output(self, hero, "Info_Mod_Nandor_WoelfeTot_02_03"); //Ich werde auch weiterhin hier bleiben und den Wald beobachten. Du kannst Dragomir diese Nachricht überbringen und berichte ihm auf jeden Fall von diesen Wölfen.

	CreateInvItems	(self, ItWr_NandorToDragomir, 1);
	B_GiveInvItems	(self, hero, ItWr_NandorToDragomir, 1);

	AI_Output(hero, self, "Info_Mod_Nandor_WoelfeTot_15_04"); //Werd ich machen. Vergiss es nicht.
	AI_Output(self, hero, "Info_Mod_Nandor_WoelfeTot_02_05"); //Was soll ich nicht vergessen?
	AI_Output(hero, self, "Info_Mod_Nandor_WoelfeTot_15_06"); //Das wirst du schon wissen.

	B_LogEntry	(TOPIC_MOD_JG_JAGDGEBIETE, "Nandor hat mir eine Nachricht für Dragomir gegeben und mir gesagt, dass ich Dragomir unbedingt von den aggressiven Wölfen erzählen soll.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Nandor_Untier (C_INFO)
{
	npc		= Mod_1937_JGR_Nandor_NW;
	nr		= 1;
	condition	= Info_Mod_Nandor_Untier_Condition;
	information	= Info_Mod_Nandor_Untier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich wollte mich erkundigen, ob zufällig Wildtiere ...";
};

FUNC INT Info_Mod_Nandor_Untier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nandor_Hi))
	&& (Mod_Cronos_Artefakt == 2)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nandor_Untier_Info()
{
	AI_Output(hero, self, "Info_Mod_Nandor_Untier_15_00"); //Ich wollte mich erkundigen, ob zufällig Wildtiere ...
	AI_Output(self, hero, "Info_Mod_Nandor_Untier_02_01"); //Auch das noch. Wenn du dich über Wildtiere unterhalten willst, dann geh doch nach Südosten in die Berge  zu dem Untier, das mir mein ganzes Wild auffrisst.

	B_GivePlayerXP	(150);

	B_LogEntry	(TOPIC_MOD_ADANOS_NOVIZE, "Das ist doch mal ein ziemlich konkreter Hinweis, welchen Nandor mir geben hat. Nach Südosten in die Berge, von ihm aus gesehen.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Nandor_AlterMann (C_INFO)
{
	npc		= Mod_1937_JGR_Nandor_NW;
	nr		= 1;
	condition	= Info_Mod_Nandor_AlterMann_Condition;
	information	= Info_Mod_Nandor_AlterMann_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wegen altem Mann im Wald fragen.";
};

FUNC INT Info_Mod_Nandor_AlterMann_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morgahard_AlterWaldMann))
	&& (Mod_BDT_AlterWaldMann < 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nandor_AlterMann_Info()
{
	if (Mod_BDT_AlterWaldMann == 0)
	{
		B_Say	(hero, self, "$ALTERWALDMANN01");

		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_00"); //Ahh, du meinst den alten Mann des Waldes. Ja, etwas weiß ich über ihn.
		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_01"); //Er soll Jahrhunderte alt sein und die Tiere des Waldes Rund um Khorata behüten.
		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_02"); //Zwar sagt man, er sei blind, jedoch gleichzeitig auch magisch begabt.
		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_03"); //Mehr fällt mir gerade nicht ein. Vielleicht weiß ein anderer mehr.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Von dem ersten Waldläufer erfuhr ich nicht viel Neues. Der alte Mann des Waldes, behütet die Tiere, er ist uralt, blind und magisch begabt. Vielleicht weiß ein anderer Waldläufer mehr.");
	}
	else if (Mod_BDT_AlterWaldMann == 1)
	{
		B_Say	(hero, self, "$ALTERWALDMANN02");

		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_04"); //Der alte Mann des Waldes? Ja, ich hörte er solle einst ein Diener Adanos gewesen sein.
		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_05"); //Wobei unklar ist, ob er ein Waldläufer war wie wir, ein Magier des Wassers, oder ein Verwandlungsmagier.
		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_06"); //Seine magischen Fähigkeiten, wie auch seine starke Bindung zur Tier- und Pflanzenwelt zeugen davon, dass er von allem etwas hat.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Beim 2ten Waldläufer erfuhr ich auch nicht viel wissenswertes. Der alte Mann des Waldes soll Adanos und der Schöpfung verbunden sein, allem voran der Tier und Pflanzenwelt.");
	}
	else if (Mod_BDT_AlterWaldMann == 2)
	{
		B_Say	(hero, self, "$ALTERWALDMANN03");

		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_07"); //Tja, viel kann ich dir nicht über ihn verraten.
		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_08"); //Das Problem besteht auch darin, dass er mit keinem Menschen spricht, nicht mal mit uns, auch, wenn wir eigentlich ähnliche Ziele verfolgen.
		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_09"); //Allein mit den Tieren des Waldes unterhält er sich.
		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_10"); //Tja, wenn ich ein Keiler wäre, könnte ich dir bestimmt mehr über ihn verraten.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Acha, das könnte ein wichtiger Hinweis gewesen sein. Der alte Mann des Waldes meidet Menschen gänzlich, spricht nur mit Tieren.");
	}
	else if (Mod_BDT_AlterWaldMann == 3)
	{
		B_Say	(hero, self, "$ALTERWALDMANN04");

		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_11"); //Der alte Mann des Waldes? Nun, er soll in enger Beziehung zur Tier- und Pflanzenwelt stehen.
		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_12"); //Man sagt, er leite Rudeltiere wie Keiler, oder Wölfe dazu an, den Wald gegen Eindringlinge zu beschützen.
		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_13"); //Selbst, so sagt man, fände man ihn häufig in Gestalt eines grünen Wolfes vor.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Er soll vor allem auch größere Rudeltiere wie Keiler und Wölfe dazu anleiten den Wald gegen Eindringlinge zu beschützen.");
	}
	else if (Mod_BDT_AlterWaldMann == 4)
	{
		B_Say	(hero, self, "$ALTERWALDMANN05");

		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_14"); //Du interessierst dich für Geschichten über den alten Mann des Waldes?
		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_15"); //Nun, viel weiß ich nicht über diesen mystischen Kauz.
		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_16"); //Er soll sich meistens im dunklen Wald aufhalten, aber auch immer in der Nähe von Gewässern, wie Seen.
		AI_Output(self, hero, "Info_Mod_Nandor_AlterMann_02_17"); //Selten hat ihn jemand zu Gesicht bekommen ...

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Man findet ihn höchst wahrscheinlich im dichten Wald Khorata’s in der Nähe eines Sees.");
	};

	Mod_BDT_AlterWaldMann += 1;
};

INSTANCE Info_Mod_Nandor_VinoBrennerei (C_INFO)
{
	npc		= Mod_1937_JGR_Nandor_NW;
	nr		= 1;
	condition	= Info_Mod_Nandor_VinoBrennerei_Condition;
	information	= Info_Mod_Nandor_VinoBrennerei_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Nandor_VinoBrennerei_Condition()
{
	if (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Nandor_VinoBrennerei_Info()
{
	AI_Output(self, hero, "Info_Mod_Nandor_VinoBrennerei_02_00"); //He, was machst du hier?
	AI_Output(hero, self, "Info_Mod_Nandor_VinoBrennerei_15_01"); //Also ...
	AI_Output(self, hero, "Info_Mod_Nandor_VinoBrennerei_02_02"); //Ich will dich warnen lieber nicht hier weiter hinein zu gehen. Ich habe keine Lust auch noch dich da raus zu holen.
	AI_Output(hero, self, "Info_Mod_Nandor_VinoBrennerei_15_03"); //Was meinst du?
	AI_Output(self, hero, "Info_Mod_Nandor_VinoBrennerei_02_04"); //Ich meine die garstigen Spinnenviecher, die unter der Türe in die Brennerei gelangen.
	AI_Output(self, hero, "Info_Mod_Nandor_VinoBrennerei_02_05"); //Vino kann von Glück reden, dass ich ihn habe schreien hören, sonst wäre er als Mittagshappen für die widerlichen Biester geendet.
	AI_Output(self, hero, "Info_Mod_Nandor_VinoBrennerei_02_06"); //Ich habe ihn bewusstlos hier liegen gefunden und ihn in mein Lager gebracht.
	AI_Output(self, hero, "Info_Mod_Nandor_VinoBrennerei_02_07"); //Scheint einige Bisse abbekommen zu haben, aber er wird sich wieder erholen.
	AI_Output(self, hero, "Info_Mod_Nandor_VinoBrennerei_02_08"); //Also, denk lieber gut darüber nach, ob du dich da hineinbegeben möchtest.

	if (!Npc_KnowsInfo(hero, Info_Mod_Vino_Brennerei))
	{
		Log_CreateTopic	(TOPIC_MOD_VINO_WO, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_MOD_VINO_WO, LOG_RUNNING);
		B_LogEntry	(TOPIC_MOD_VINO_WO, "Vino ist in Nandors Lager. Er wurde von kleinen Spinnen angegriffen, wird sich aber bald wieder erholen.");
	};
};

INSTANCE Info_Mod_Nandor_Pickpocket (C_INFO)
{
	npc		= Mod_1937_JGR_Nandor_NW;
	nr		= 1;
	condition	= Info_Mod_Nandor_Pickpocket_Condition;
	information	= Info_Mod_Nandor_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Nandor_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Nandor_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Nandor_Pickpocket);

	Info_AddChoice	(Info_Mod_Nandor_Pickpocket, DIALOG_BACK, Info_Mod_Nandor_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Nandor_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Nandor_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Nandor_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Nandor_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Nandor_EXIT (C_INFO)
{
	npc		= Mod_1937_JGR_Nandor_NW;
	nr		= 1;
	condition	= Info_Mod_Nandor_EXIT_Condition;
	information	= Info_Mod_Nandor_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Nandor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Nandor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};