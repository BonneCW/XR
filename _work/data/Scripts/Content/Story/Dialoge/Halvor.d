INSTANCE Info_Mod_Halvor_Hi (C_INFO)
{
	npc		= Mod_582_NONE_Halvor_NW;
	nr		= 1;
	condition	= Info_Mod_Halvor_Hi_Condition;
	information	= Info_Mod_Halvor_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who are you?";
};

FUNC INT Info_Mod_Halvor_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Halvor_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Halvor_Hi_26_01"); //I'm Halvor. I always give you fresh fish.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Halvor in the harbour district is a fishmonger.");
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
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_26_00"); //Do you have a minute?

	Info_ClearChoices	(Info_Mod_Halvor_HolFische);

	Info_AddChoice	(Info_Mod_Halvor_HolFische, "No, I don't have time right now.", Info_Mod_Halvor_HolFische_Nein);
	Info_AddChoice	(Info_Mod_Halvor_HolFische, "Yeah, what's up?", Info_Mod_Halvor_HolFische_Ja);
};

FUNC VOID Info_Mod_Halvor_HolFische_Nein()
{
	AI_Output(hero, self, "Info_Mod_Halvor_HolFische_Nein_15_00"); //No, I don't have time right now.
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Nein_26_01"); //Well, I guess I'll have to take care of it myself.

	Info_ClearChoices	(Info_Mod_Halvor_HolFische);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Halvor_HolFische_Ja()
{
	AI_Output(hero, self, "Info_Mod_Halvor_HolFische_Ja_15_00"); //Yeah, what's up?
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_26_01"); //As you know, I'm the fishmonger here, and I'm almost dry right now.
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_26_02"); //I usually get my fish from the fishermen Farim and William, but they haven't seen each other for days.
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_26_03"); //Could you pick up her fish for me? I've already paid for them, but I can't leave my stand alone.

	Info_ClearChoices	(Info_Mod_Halvor_HolFische);

	Info_AddChoice	(Info_Mod_Halvor_HolFische, "No, go yourself.", Info_Mod_Halvor_HolFische_Ja_Nein);
	Info_AddChoice	(Info_Mod_Halvor_HolFische, "Yeah, but how about a reward?", Info_Mod_Halvor_HolFische_Ja_Ja);
};

FUNC VOID Info_Mod_Halvor_HolFische_Ja_Nein()
{
	AI_Output(hero, self, "Info_Mod_Halvor_HolFische_Ja_Nein_15_00"); //No, go yourself.
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_Nein_26_01"); //Well, I guess I'll have to take care of it myself.

	Info_ClearChoices	(Info_Mod_Halvor_HolFische);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Halvor_HolFische_Ja_Ja()
{
	AI_Output(hero, self, "Info_Mod_Halvor_HolFische_Ja_Ja_15_00"); //Yeah, but how about a reward?
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_Ja_26_01"); //Of course, every little favor wants to be paid in hard cash, right?
	AI_Output(self, hero, "Info_Mod_Halvor_HolFische_Ja_Ja_26_02"); //All right, if you do your thing well, there's some gold in it.
	AI_Output(hero, self, "Info_Mod_Halvor_HolFische_Ja_Ja_15_03"); //That's what I wanted to hear. I'll be on my way, then.

	Mod_HalvorHolFischeQuest = TRUE;

	Log_CreateTopic	(TOPIC_MOD_HALVOR_HOLFISCHE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_HALVOR_HOLFISCHE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_HALVOR_HOLFISCHE, "Halvor, the fish merchant in the harbour district, wants me to bring him the fish from the fishermen Farim and William.");

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
	description	= "I got the fish.";
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
	AI_Output(hero, self, "Info_Mod_Halvor_HierSindFische_15_00"); //I got the fish.

	B_GiveInvItems	(hero, self, ItFo_Fish, 20);

	AI_Output(self, hero, "Info_Mod_Halvor_HierSindFische_26_01"); //Well, my customers will like that.
	AI_Output(hero, self, "Info_Mod_Halvor_HierSindFische_15_02"); //You like it too?
	AI_Output(self, hero, "Info_Mod_Halvor_HierSindFische_26_03"); //Oh, yeah, here's some gold coins.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_HALVOR_HOLFISCHE, "I brought Halvor the fish and got some gold coins to thank him.");
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
	description	= "I've heard some woman stories from you.";
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
	AI_Output(hero, self, "Info_Mod_Halvor_Fenia_15_00"); //I've heard some woman stories from you.
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_26_01"); //Laughable! But I don't talk to strangers about that. With detainees.

	Info_ClearChoices	(Info_Mod_Halvor_Fenia);

	if (Mod_Verhandlungsgeschick > 0)
	{
		Info_AddChoice	(Info_Mod_Halvor_Fenia, "I'm sure you could use some support.", Info_Mod_Halvor_Fenia_C);
	};

	if (Npc_HasItems(hero, ItMi_Gold) >= 20)
	{
		Info_AddChoice	(Info_Mod_Halvor_Fenia, "Could the tinkling of gold convince you? (- 20 gold)", Info_Mod_Halvor_Fenia_B);
	};

	Info_AddChoice	(Info_Mod_Halvor_Fenia, "All right, let's drop it.", Info_Mod_Halvor_Fenia_A);
};

FUNC VOID Info_Mod_Halvor_Fenia_D()
{
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_00"); //Deal, but there's not much to tell.
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_01"); //I don't know what fenia's fantasy is. Yes, I do, but I don't know why.
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_02"); //She's jealous of every woman I talk to, and that's a lot of women.
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_03"); //When she saw that Sonja bought a fish from me, she nearly went crazy and assumed that Sonja would come to visit me after a great night.
	AI_Output(hero, self, "Info_Mod_Halvor_Fenia_D_15_04"); //So there's nothing to their doubts?
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_05"); //I haven't been to a whorehouse in years!
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_06"); //But the more Fenia pushes me, the better I'd like to take one out on her.
	AI_Output(self, hero, "Info_Mod_Halvor_Fenia_D_26_07"); //I'm sure that would make them livid.

	Info_ClearChoices	(Info_Mod_Halvor_Fenia);
};

FUNC VOID Info_Mod_Halvor_Fenia_C()
{
	AI_Output(hero, self, "Info_Mod_Halvor_Fenia_C_15_00"); //Surely you could use some support.

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		B_GivePlayerXP	(10);

		B_RaiseHandelsgeschick (2);

		Info_Mod_Halvor_Fenia_D();
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Halvor_Fenia_C_26_01"); //I certainly don't need your support.

		Info_ClearChoices	(Info_Mod_Halvor_Fenia);
	};
};

FUNC VOID Info_Mod_Halvor_Fenia_B()
{
	AI_Output(hero, self, "Info_Mod_Halvor_Fenia_B_15_00"); //Could the tinkling of gold convince you?

	B_GiveInvItems	(hero, self, ItMi_Gold, 20);

	Info_Mod_Halvor_Fenia_D();
};

FUNC VOID Info_Mod_Halvor_Fenia_A()
{
	AI_Output(hero, self, "Info_Mod_Halvor_Fenia_A_15_00"); //All right, let's drop it.

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
	description	= "So you have fresh fish?";
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
	AI_Output(hero, self, "Info_Mod_Halvor_Kap2_15_00"); //So you have fresh fish?
	AI_Output(self, hero, "Info_Mod_Halvor_Kap2_26_01"); //That's what I keep telling you. Fresh fish.
	AI_Output(hero, self, "Info_Mod_Halvor_Kap2_15_02"); //Which one is freshest?
	AI_Output(self, hero, "Info_Mod_Halvor_Kap2_26_03"); //They're all equally good. Fresh fish, that's all.
	AI_Output(hero, self, "Info_Mod_Halvor_Kap2_15_04"); //So really fresh herring?
	AI_Output(self, hero, "Info_Mod_Halvor_Kap2_26_05"); //Watch this, hero. See that herring on the far left?
	AI_Output(hero, self, "Info_Mod_Halvor_Kap2_15_06"); //You mean that one?
	AI_Output(self, hero, "Info_Mod_Halvor_Kap2_26_07"); //Yeah, that's the one. It's so fresh, it was swimming in the ocean yesterday, chasing sharks. It's so fresh. Now go away and leave me alone.
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
