INSTANCE Info_Mod_Randolph_Hi (C_INFO)
{
	npc		= Mod_906_BAU_Randolph_NW;
	nr		= 1;
	condition	= Info_Mod_Randolph_Hi_Condition;
	information	= Info_Mod_Randolph_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Randolph_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Akil_Heilung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Randolph_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Randolph_Hi_06_00"); //Hab Dank, aber ich brauche ihn nicht. Ich fühle mich schon so viel besser.

	B_GiveInvItems	(self, hero, ItPo_HealBesessenheit, 1);

	AI_Output(hero, self, "Info_Mod_Randolph_Hi_15_01"); //Bist du sicher, dass du ihn nicht ...
	AI_Output(self, hero, "Info_Mod_Randolph_Hi_06_02"); //Jaja, wirklich. Ich fühle mich, als könnte ich Bäume ausreißen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Randolph_Hoehle (C_INFO)
{
	npc		= Mod_906_BAU_Randolph_NW;
	nr		= 1;
	condition	= Info_Mod_Randolph_Hoehle_Condition;
	information	= Info_Mod_Randolph_Hoehle_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Randolph_Hoehle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Akil_Randolph))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Randolph_Hoehle_Info()
{
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );

	AI_Output(self, hero, "Info_Mod_Randolph_Hoehle_06_00"); //(verstört) Was, wie, wer ist da?
	AI_Output(hero, self, "Info_Mod_Randolph_Hoehle_15_01"); //Ich bin es nur.
	AI_Output(self, hero, "Info_Mod_Randolph_Hoehle_06_02"); //(erleichtert) Ach du bist es, der Retter unseres Hofes.
	AI_Output(hero, self, "Info_Mod_Randolph_Hoehle_15_03"); //Hast du denn jemand anderen erwartet?
	AI_Output(self, hero, "Info_Mod_Randolph_Hoehle_06_04"); //Ja, diese grässlichen Schatten, die mich verfolgen, quälen und versuchen von mir besitzt zu ergreifen.
	AI_Output(self, hero, "Info_Mod_Randolph_Hoehle_06_05"); //Zuerst waren sie ganz leise, und wenn sie da waren, schienen sie mir Kraft zu schenken und ich fühlte mich wohl in ihrer Gegenwart.
	AI_Output(self, hero, "Info_Mod_Randolph_Hoehle_06_06"); //Doch jetzt gewinnen sie zunehmend Macht über mich, reden auf mich ein und verlangen mir ihnen zu folgen.
	AI_Output(hero, self, "Info_Mod_Randolph_Hoehle_15_07"); //Das musst du nicht. Wenn du mich zum Kloster begleitest, kann dir vielleicht geholfen werden.
	AI_Output(self, hero, "Info_Mod_Randolph_Hoehle_06_08"); //Zum Kloster? Ja, das will ich, lass uns ... (hält inne) ... ohh nein, sie sind hier.
	AI_Output(hero, self, "Info_Mod_Randolph_Hoehle_15_09"); //Was ...?

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_AKIL_RANDOLPH, "Täuschen mich meine Sinne, oder waren da eben einige dunkle Schatten? Und diese plötzliche Paralyse ... Vielleicht hat sich doch mehr abgespielt, als nur Gespinste in Randolph’s Kopf. Ob ich ihn jetzt noch einholen kann ... ?");

	B_StartOtherRoutine	(self, "FLUCHT");
};

INSTANCE Info_Mod_Randolph_NoMoreDemon (C_INFO)
{
	npc		= Mod_906_BAU_Randolph_NW;
	nr		= 1;
	condition	= Info_Mod_Randolph_NoMoreDemon_Condition;
	information	= Info_Mod_Randolph_NoMoreDemon_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Randolph_NoMoreDemon_Condition()
{
	if (Mod_Randolph_Started == 16)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Randolph_NoMoreDemon_Info()
{
	AI_Output(self, hero, "Info_Mod_Randolph_NoMoreDemon_06_00"); //(zu sich selbst) Was ist geschehen? Ich fühle mich so befreit. Diese finsteren Kreaturen, Stimmen und Visionen.
	AI_Output(self, hero, "Info_Mod_Randolph_NoMoreDemon_06_01"); //Waren sie nur Alpträume? Nein, hier stehe ich doch, es war alles wirklich.
	AI_Output(self, hero, "Info_Mod_Randolph_NoMoreDemon_06_02"); //(zum Helden) Du? Du warst es, der mich davon erlöst hat. Ich weiß nicht, was ich sagen soll.
	AI_Output(hero, self, "Info_Mod_Randolph_NoMoreDemon_15_03"); //Geh am besten wieder zu Akil und ruhe dich erst mal aus.
	AI_Output(self, hero, "Info_Mod_Randolph_NoMoreDemon_06_04"); //(verwirrt) Ähh, ja, ja, das werde ich erst mal tun.

	AI_StopProcessInfos	(self);

	B_SetTopicStatus	(TOPIC_MOD_AKIL_RANDOLPH, LOG_SUCCESS);

	B_StartOtherRoutine	(self, "PRESTART");

	B_GivePlayerXP	(600);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Randolph_Irdorath (C_INFO)
{
	npc		= Mod_906_BAU_Randolph_NW;
	nr		= 1;
	condition	= Info_Mod_Randolph_Irdorath_Condition;
	information	= Info_Mod_Randolph_Irdorath_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Randolph_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Randolph_NoMoreDemon))
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Randolph_Irdorath_Info()
{
	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath_06_00"); //(gedrückte Freude) Ahh, da ist ja der Erretter unseres Hofes ... und meiner Seele ...
	AI_Output(hero, self, "Info_Mod_Randolph_Irdorath_15_01"); //Hallo Randolph. Wie ist es dir seither ergangen?
	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath_06_02"); //(etwas bedrückt) Ja, eigentlich ganz in Ordnung, die Arbeit auf dem Hof läuft wieder gut voran und mit den anderen auf dem Hof verstehe ich mich auch hervorragend ...
	AI_Output(hero, self, "Info_Mod_Randolph_Irdorath_15_03"); //Aber ...?
	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath_06_04"); //Es ist nur ... wie soll ich es sagen ...

	AI_PlayAni	(self, "T_SEARCH");

	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath_06_05"); //(flüstert) Es kommt immer noch vor, dass ich mich für kurze Zeit in diesen dämonischen Abkömmling verwandele ...
	AI_Output(hero, self, "Info_Mod_Randolph_Irdorath_15_06"); //Tatsächlich?
	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath_06_07"); //Ja, wenn ich schlecht Träume, oder wütend werde. Dann spüre ich wie das dämonische in mir erwacht.
	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath_06_08"); //Bislang konnte ich es noch jedes mal verhindern von den anderen dabei gesehen zu werden.
	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath_06_09"); //Ich weiß aber nicht, wie lange mir das noch gelingen wird.
	AI_Output(hero, self, "Info_Mod_Randolph_Irdorath_15_10"); //Warst du schon bei einem kundigen Magier und hast um Heilung ersucht?
	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath_06_11"); //Was?! Ich habe mich schon weit genug damit herausgewagt, als ich es dir anvertraute. Noch mehr Menschen müssen nicht davon wissen ...
	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath_06_12"); //(ausweichend) Berichte lieber, was es neues bei dir gibt.
	AI_Output(hero, self, "Info_Mod_Randolph_Irdorath_15_13"); //Nun, mich führt es auf das Meer hinaus.
	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath_06_14"); //Das Meer?
	AI_Output(hero, self, "Info_Mod_Randolph_Irdorath_15_15"); //Ja, ich suche mit dem Schiff der Paladine eine Insel auf. Es gilt einen finsteren Schergen des Xeres zu bannen.
	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath_06_16"); //Was Xeres? Dann waren es doch mehr als nur üble Träume und verworrene Erinnerungen ...
	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath_06_17"); //Hör zu, ich muss auf diese Insel mitkommen.
	AI_Output(hero, self, "Info_Mod_Randolph_Irdorath_15_18"); //Was?! Das ist aber eine nicht ungefährliche Angelegenheit.
	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath_06_19"); //Mag sein, aber nur so kann ich endgültige Erlösung finden, wenn der Unhold samt seiner Lakaien gebannt ist. Ich muss mitkommen!
};

INSTANCE Info_Mod_Randolph_Irdorath2 (C_INFO)
{
	npc		= Mod_906_BAU_Randolph_NW;
	nr		= 1;
	condition	= Info_Mod_Randolph_Irdorath2_Condition;
	information	= Info_Mod_Randolph_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nun gut, dann heiße ich dich an Bord willkommen.";
};

FUNC INT Info_Mod_Randolph_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Randolph_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Randolph_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Randolph_Irdorath2_15_00"); //Nun gut, dann heiße ich dich an Bord willkommen.
	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath2_06_01"); //Vielen dank. Ein weiteres Mal stehe ich in deiner Schuld.
	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath2_06_02"); //Ich mache mich sofort auf den Weg zum Hafen.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Randolph, in dem immer noch ein Teil dämonischen schlummert, wird mich zur Insel begleiten.");

	B_GivePlayerXP	(150);

	Mod_RandolphDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Randolph_Irdorath3 (C_INFO)
{
	npc		= Mod_906_BAU_Randolph_NW;
	nr		= 1;
	condition	= Info_Mod_Randolph_Irdorath3_Condition;
	information	= Info_Mod_Randolph_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tut mir leid, aber es scheint das wir zu viele sind.";
};

FUNC INT Info_Mod_Randolph_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Randolph_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_RandolphDabei == 1)
	&& (Mod_JackDabei == 1)
	&& (Mod_CrewCount > 15)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Randolph_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Randolph_Irdorath3_15_00"); //Tut mir leid, aber es scheint das wir zu viele sind. Ich kann dich doch nicht mitnehmen.
	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath3_06_01"); //Schade. Ich gehe dann wieder zurück. Du weißt wo du mich findest, wenn doch noch ein Platz frei werden sollte.

	Mod_RandolphDabei = 0;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Randolph_Irdorath4 (C_INFO)
{
	npc		= Mod_906_BAU_Randolph_NW;
	nr		= 1;
	condition	= Info_Mod_Randolph_Irdorath4_Condition;
	information	= Info_Mod_Randolph_Irdorath4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich kann dich doch mitnehmen.";
};

FUNC INT Info_Mod_Randolph_Irdorath4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Randolph_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_RandolphDabei == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Randolph_Irdorath4_Info()
{
	AI_Output(hero, self, "Info_Mod_Randolph_Irdorath4_15_00"); //Ich kann dich doch mitnehmen. Es hat sich noch ein Platz auf dem Schiff gefunden.
	AI_Output(self, hero, "Info_Mod_Randolph_Irdorath4_06_01"); //Sehr gut, ich bin dann wieder am Hafen.

	Mod_RandolphDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Randolph_Pickpocket (C_INFO)
{
	npc		= Mod_906_BAU_Randolph_NW;
	nr		= 1;
	condition	= Info_Mod_Randolph_Pickpocket_Condition;
	information	= Info_Mod_Randolph_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Randolph_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 75);
};

FUNC VOID Info_Mod_Randolph_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Randolph_Pickpocket);

	Info_AddChoice	(Info_Mod_Randolph_Pickpocket, DIALOG_BACK, Info_Mod_Randolph_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Randolph_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Randolph_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Randolph_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Randolph_Pickpocket);
};

FUNC VOID Info_Mod_Randolph_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Randolph_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Randolph_Pickpocket);

		Info_AddChoice	(Info_Mod_Randolph_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Randolph_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Randolph_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Randolph_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Randolph_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Randolph_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Randolph_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Randolph_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Randolph_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Randolph_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Randolph_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Randolph_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Randolph_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Randolph_EXIT (C_INFO)
{
	npc		= Mod_906_BAU_Randolph_NW;
	nr		= 1;
	condition	= Info_Mod_Randolph_EXIT_Condition;
	information	= Info_Mod_Randolph_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Randolph_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Randolph_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};