INSTANCE Info_Mod_Halvor_Hi (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_Hi_Condition;
	information	= Info_Mod_Halvor_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Halvor_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Halvor_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Halvor_Hi_26_01"); //Ich bin Halvor. Bei mir kriegst du immer frische Fische.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Halvor im Hafenviertel ist Fischhändler.");
};

INSTANCE Info_Mod_Halvor_HolFische (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_HolFische_Condition;
	information	= Info_Mod_Halvor_HolFische_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Halvor_HolFische_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Halvor_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Farim_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_William_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Halvor_HolFische_Info()
{
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_26_00"); //Hast du einen Moment Zeit?

	Info_ClearChoices	(Info_Mod_Halvor_HolFische);

	Info_AddChoice	(Info_Mod_Halvor_HolFische, "Nein, momentan hab ich keine Zeit.", Info_Mod_Halvor_HolFische_Nein);
	Info_AddChoice	(Info_Mod_Halvor_HolFische, "Ja, was gibt's denn?", Info_Mod_Halvor_HolFische_Ja);
};

FUNC VOID Info_Mod_Halvor_HolFische_Nein()
{
	AI_Output(hero, self, "Info_Mod_Halvor_HolFische_Nein_15_00"); //Nein, momentan hab ich keine Zeit.
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Nein_26_01"); //Hm, dann muss ich mich wohl selbst darum kümmern.

	Info_ClearChoices	(Info_Mod_Halvor_HolFische);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Halvor_HolFische_Ja()
{
	AI_Output(hero, self, "Info_Mod_Halvor_HolFische_Ja_15_00"); //Ja, was gibt's denn?
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_26_01"); //Wie du weißt, bin ich ja hier der Fischhändler, und ich sitze gerade fast auf dem Trockenen.
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_26_02"); //Meine Fische bekomme ich normalerweise von den Fischern Farim und William, aber die beiden haben sich seit Tagen nicht blicken lassen.
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_26_03"); //Könntest du mir ihre Fische abholen? Bezahlt hab ich sie schon, nur kann ich meinen Stand nicht allein lassen.

	Info_ClearChoices	(Info_Mod_Halvor_HolFische);

	Info_AddChoice	(Info_Mod_Halvor_HolFische, "Nein, geh doch selber.", Info_Mod_Halvor_HolFische_Ja_Nein);
	Info_AddChoice	(Info_Mod_Halvor_HolFische, "Ja, aber wie stehts mit einer Belohnung?", Info_Mod_Halvor_HolFische_Ja_Ja);
};

FUNC VOID Info_Mod_Halvor_HolFische_Ja_Nein()
{
	AI_Output(hero, self, "Info_Mod_Halvor_HolFische_Ja_Nein_15_00"); //Nein, geh doch selber.
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_Nein_26_01"); //Hm, dann muss ich mich wohl selbst darum kümmern.

	Info_ClearChoices	(Info_Mod_Halvor_HolFische);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Halvor_HolFische_Ja_Ja()
{
	AI_Output(hero, self, "Info_Mod_Halvor_HolFische_Ja_Ja_15_00"); //Ja, aber wie steht's mit einer Belohnung?
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_Ja_26_01"); //(verächtlich) Natürlich, jede kleine Gefälligkeit will in barer Münze bezahlt werden, stimmt's?
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_Ja_26_02"); //Na schön, wenn du deine Sache gut erledigst, sind ein paar Goldstücke drin.
	AI_Output(hero, self, "Info_Mod_Halvor_HolFische_Ja_Ja_15_03"); //Das wollte ich hören. Ich mach mich dann mal auf den Weg.

	Mod_HalvorHolFischeQuest = TRUE;

	Log_CreateTopic	(TOPIC_MOD_HALVOR_HOLFISCHE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_HALVOR_HOLFISCHE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_HALVOR_HOLFISCHE, "Halvor, der Fischhändler im Hafenviertel, will, dass ich ihm die Fische von den Fischern Farim und William bringe.");

	Info_ClearChoices	(Info_Mod_Halvor_HolFische);
};

INSTANCE Info_Mod_Halvor_HierSindFische (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_HierSindFische_Condition;
	information	= Info_Mod_Halvor_HierSindFische_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab die Fische.";
};

FUNC INT Info_Mod_Halvor_HierSindFische_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Farim_HalvorHolFische))
	&& ((Mod_HalvorHolFischeQuest == 2)
	|| (Npc_IsDead(Mod_927_NONE_William_NW)))
	&& (Npc_HasItems(hero, ItFo_Fish) >= 20)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Halvor_HierSindFische_Info()
{
	AI_Output(hero, self, "Info_Mod_Halvor_HierSindFische_15_00"); //Ich hab die Fische.

	B_GiveInvItems	(hero, self, ItFo_Fish, 20);

	AI_Output(self, hero, "Info_Mod_Halvor_HierSindFische_26_01"); //Gut, das wird meinen Kunden gefallen.
	AI_Output(hero, self, "Info_Mod_Halvor_HierSindFische_15_02"); //Und dir gefällt's auch?
	AI_Output(self, hero, "Info_Mod_Halvor_HierSindFische_26_03"); //Ach ja, hier hast du ein paar Goldmünzen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_HALVOR_HOLFISCHE, "Ich habe Halvor die Fische gebracht und zum Dank ein paar Goldmünzen bekommen.");
	B_SetTopicStatus	(TOPIC_MOD_HALVOR_HOLFISCHE, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Halvor_Fenia (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_Fenia_Condition;
	information	= Info_Mod_Halvor_Fenia_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe da ein paar Frauengeschichten von dir gehört.";
};

FUNC INT Info_Mod_Halvor_Fenia_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fenia_AllesKlar))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Halvor_Fenia_Info()
{
	AI_Output(hero, self, "Info_Mod_Halvor_Fenia_15_00"); //Ich habe da ein paar Frauengeschichten von dir gehört.
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_26_01"); //Lachhaft! Aber darüber rede ich nicht mit Fremden. Mit Häftlingen.

	Info_ClearChoices	(Info_Mod_Halvor_Fenia);

	if (Mod_Verhandlungsgeschick > 0)
	{
		Info_AddChoice	(Info_Mod_Halvor_Fenia, "(Feilschen) Du könntest doch sicher Unterstützung gebrauchen.", Info_Mod_Halvor_Fenia_C);
	};

	if (Npc_HasItems(hero, ItMi_Gold) >= 20)
	{
		Info_AddChoice	(Info_Mod_Halvor_Fenia, "Könnte dich das Klimpern von Gold überzeugen? (- 20 Gold)", Info_Mod_Halvor_Fenia_B);
	};

	Info_AddChoice	(Info_Mod_Halvor_Fenia, "Na gut, lassen wir es sein.", Info_Mod_Halvor_Fenia_A);
};

FUNC VOID Info_Mod_Halvor_Fenia_D()
{
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_00"); //Abgemacht, aber da gibt es nicht viel zu erzählen.
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_01"); //Ich weiß nicht, was Fenia für Hirngespinste hat. Doch, ich weiß es, aber nicht, warum.
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_02"); //Sie ist eifersüchtig auf jede Frau, mit der ich rede, und das sind viele.
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_03"); //Als sie gesehen hat, dass Sonja einen Fisch bei mir gekauft hat, ist sie fast ausgerastet und hat mir unterstellt, Sonja würde mich nach einer tollen Nacht besuchen kommen.
	AI_Output(hero, self, "Info_Mod_Halvor_Fenia_D_15_04"); //An ihren Zweifeln ist also nichts dran?
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_05"); //Ich war schon seit Jahren nicht mehr im Puff!
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_06"); //Aber je mehr Fenia mich bedrängt, desto lieber würde ich ihr mal eins auswischen.
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_07"); //Das würde sie sicher zur Weißglut bringen.

	Info_ClearChoices	(Info_Mod_Halvor_Fenia);
};

FUNC VOID Info_Mod_Halvor_Fenia_C()
{
	AI_Output(hero, self, "Info_Mod_Halvor_Fenia_C_15_00"); //Du könntest doch sicher Unterstützung gebrauchen.

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		B_GivePlayerXP	(10);

		B_RaiseHandelsgeschick (2);

		Info_Mod_Halvor_Fenia_D();
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Halvor_Fenia_C_26_01"); //Deine Unterstützung brauche ich sicher nicht.

		Info_ClearChoices	(Info_Mod_Halvor_Fenia);
	};
};

FUNC VOID Info_Mod_Halvor_Fenia_B()
{
	AI_Output(hero, self, "Info_Mod_Halvor_Fenia_B_15_00"); //Könnte dich das Klimpern von Gold überzeugen?

	B_GiveInvItems	(hero, self, ItMi_Gold, 20);

	Info_Mod_Halvor_Fenia_D();
};

FUNC VOID Info_Mod_Halvor_Fenia_A()
{
	AI_Output(hero, self, "Info_Mod_Halvor_Fenia_A_15_00"); //Na gut, lassen wir es sein.

	Info_ClearChoices	(Info_Mod_Halvor_Fenia);
};

INSTANCE Info_Mod_Halvor_Kap2 (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_Kap2_Condition;
	information	= Info_Mod_Halvor_Kap2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du hast also frischen Fisch?";
};

FUNC INT Info_Mod_Halvor_Kap2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Halvor_Hi))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Halvor_Kap2_Info()
{
	AI_Output(hero, self, "Info_Mod_Halvor_Kap2_15_00"); //Du hast also frischen Fisch?
	AI_Output(self, hero, "Info_Mod_Halvor_Kap2_26_01"); //Das sage ich doch die ganze Zeit. Frische Fische.
	AI_Output(hero, self, "Info_Mod_Halvor_Kap2_15_02"); //Welcher ist denn am frischesten?
	AI_Output(self, hero, "Info_Mod_Halvor_Kap2_26_03"); //Die sind alle gleich gut. Frischer Fisch eben.
	AI_Output(hero, self, "Info_Mod_Halvor_Kap2_15_04"); //Also wirklich frischer Hering?
	AI_Output(self, hero, "Info_Mod_Halvor_Kap2_26_05"); //(genervt) Pass mal auf, du Held. Siehst du den Hering ganz links?
	AI_Output(hero, self, "Info_Mod_Halvor_Kap2_15_06"); //Meinst du den da?
	AI_Output(self, hero, "Info_Mod_Halvor_Kap2_26_07"); //Ja, genau den. Der ist so frisch, der schwamm gestern noch im Ozean und hat die Haie gejagt. So frisch ist der. Und jetzt hau ab und lass mich in Ruhe.
};

INSTANCE Info_Mod_Halvor_Trade (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_Trade_Condition;
	information	= Info_Mod_Halvor_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Halvor_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Halvor_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Halvor_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Halvor_Pickpocket (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_Pickpocket_Condition;
	information	= Info_Mod_Halvor_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Halvor_Pickpocket_Condition()
{
	C_Beklauen	(52, ItFo_Fish, 12);
};

FUNC VOID Info_Mod_Halvor_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Halvor_Pickpocket);

	Info_AddChoice	(Info_Mod_Halvor_Pickpocket, DIALOG_BACK, Info_Mod_Halvor_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Halvor_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Halvor_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Halvor_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Halvor_Pickpocket);
};

FUNC VOID Info_Mod_Halvor_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Halvor_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Halvor_Pickpocket);

		Info_AddChoice	(Info_Mod_Halvor_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Halvor_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Halvor_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Halvor_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Halvor_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Halvor_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Halvor_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Halvor_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Halvor_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Halvor_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Halvor_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Halvor_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Halvor_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Halvor_EXIT (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_EXIT_Condition;
	information	= Info_Mod_Halvor_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Halvor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Halvor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};