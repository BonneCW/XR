INSTANCE Info_Mod_Morpheus_Hi (C_INFO)
{
	npc		= Mod_7581_OUT_Morpheus_REL;
	nr		= 1;
	condition	= Info_Mod_Morpheus_Hi_Condition;
	information	= Info_Mod_Morpheus_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Everything all right with you?";
};

FUNC INT Info_Mod_Morpheus_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Morpheus_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Morpheus_Hi_15_00"); //Everything okay with you?
	AI_Output(self, hero, "Info_Mod_Morpheus_Hi_37_01"); //Hats off! This world is not real!
	AI_Output(hero, self, "Info_Mod_Morpheus_Hi_15_02"); //Oh, so...
	AI_Output(self, hero, "Info_Mod_Morpheus_Hi_37_03"); //(laughs) The saying is always good for customers who have taken too much pleasure.
	AI_Output(hero, self, "Info_Mod_Morpheus_Hi_15_04"); //And that'll boost your business?
	AI_Output(self, hero, "Info_Mod_Morpheus_Hi_37_05"); //A mystical aura can't hurt. I mainly sell talismans like amulets and rings.
	AI_Output(self, hero, "Info_Mod_Morpheus_Hi_37_06"); //Just take a look around.
};

INSTANCE Info_Mod_Morpheus_Kissen (C_INFO)
{
	npc		= Mod_7581_OUT_Morpheus_REL;
	nr		= 1;
	condition	= Info_Mod_Morpheus_Kissen_Condition;
	information	= Info_Mod_Morpheus_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm looking for something soft for the head. For sleeping...";
};

FUNC INT Info_Mod_Morpheus_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morpheus_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Malik_Aufgabe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morpheus_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen_15_00"); //I'm looking for something soft for the head. For sleeping...
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen_37_01"); //Uh-huh. A pillow for the head. A pillow.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen_15_02"); //You could say that. Do you have one?
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen_37_03"); //It's a rarity, but I don't have it. I can tell you how to get one, though.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen_15_04"); //I'm listening.
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen_37_05"); //You go to the butcher's and get a bag of Venger feathers. Laced tightly this gives a great pillow.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen_15_06"); //What are Venger?
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen_37_07"); //Don't you know? These are tiny scavengers without red eyes and completely harmless.
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen_37_08"); //The farmer keeps them because of the eggs and the tender flesh. You have to try it. It'll melt in your mouth.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen_15_09"); //Like a cheese?
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen_37_10"); //You could say that. You can bring me one of those. For my tip.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen_15_11"); //Thank you first.

	B_LogEntry	(TOPIC_MOD_ASS_KISSEN, "Morpheus thinks I should fill a bag of Venger feathers. The butcher should have some.");
};

INSTANCE Info_Mod_Morpheus_Kissen02 (C_INFO)
{
	npc		= Mod_7581_OUT_Morpheus_REL;
	nr		= 1;
	condition	= Info_Mod_Morpheus_Kissen02_Condition;
	information	= Info_Mod_Morpheus_Kissen02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hello, I'm back. I got the pillow.";
};

FUNC INT Info_Mod_Morpheus_Kissen02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Metzger_Kissen))
	&& (Npc_HasItems(hero, ItMi_Federbeutel) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morpheus_Kissen02_Info()
{
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen02_15_00"); //Hello, I'm back. I got the pillow.
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen02_37_01"); //Well, are you satisfied?
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen02_15_02"); //Well, well. It's soft, but the bag is a bit scratchy and musty.
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen02_37_03"); //Hm... Then you go to the separator and have a pillow made of linen.
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen02_37_04"); //Then you'll need a handful of hay, and you'll put it in. Smells very pleasant.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen02_15_05"); //Where...?
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen02_37_06"); //At the back of the lake by the water pipe the grass was recently mowed. You'll find it, I think.
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen02_37_07"); //You have ideas! Sounds like a good idea. Thanks. See you another time.

	Wld_InsertItem	(ItMi_Heu, "FP_ITEM_HEU_01");

	B_LogEntry	(TOPIC_MOD_ASS_KISSEN, "Morpheus says I should have a linen pillow made by Versage. Beside the feathers I should fill it with some hay for the smell. That's what I find by the lake by the water pipe.");
};

INSTANCE Info_Mod_Morpheus_Kimon (C_INFO)
{
	npc		= Mod_7581_OUT_Morpheus_REL;
	nr		= 1;
	condition	= Info_Mod_Morpheus_Kimon_Condition;
	information	= Info_Mod_Morpheus_Kimon_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you have joy dispensers?";
};

FUNC INT Info_Mod_Morpheus_Kimon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morpheus_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Penner_Kimon))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morpheus_Kimon_Info()
{
	AI_Output(hero, self, "Info_Mod_Morpheus_Kimon_15_00"); //Do you have joy dispensers?
	AI_Output(self, hero, "Info_Mod_Morpheus_Kimon_37_01"); //Of course not, of course. You can't do that in public. Prohibition of the governor.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kimon_15_02"); //And unofficially?
	AI_Output(self, hero, "Info_Mod_Morpheus_Kimon_37_03"); //Not even. That bum over there can probably help you out.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kimon_15_04"); //He can't. I already asked him.
	AI_Output(self, hero, "Info_Mod_Morpheus_Kimon_37_05"); //Then he's lying. I'm sure he knows something.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kimon_15_06"); //Then I'll try again.
};

INSTANCE Info_Mod_Morpheus_Blutkelch (C_INFO)
{
	npc		= Mod_7581_OUT_Morpheus_REL;
	nr		= 1;
	condition	= Info_Mod_Morpheus_Blutkelch_Condition;
	information	= Info_Mod_Morpheus_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hello! And? Already sold pillows?";
};

FUNC INT Info_Mod_Morpheus_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morpheus_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Morpheus_Blutkelch_15_00"); //Hello! And? Already sold pillows?
	AI_Output(self, hero, "Info_Mod_Morpheus_Blutkelch_37_01"); //But yes, yes. The dames are tearing these things off my display.
	AI_Output(hero, self, "Info_Mod_Morpheus_Blutkelch_15_02"); //Nice to meet you. Then you're gonna help me again.
	AI_Output(hero, self, "Info_Mod_Morpheus_Blutkelch_15_03"); //I'm looking for a blood calyx. Should look kind of unusual.
	AI_Output(self, hero, "Info_Mod_Morpheus_Blutkelch_37_04"); //That should be a rarity. But no, I've never seen such a thing.
	AI_Output(hero, self, "Info_Mod_Morpheus_Blutkelch_15_05"); //Too bad. Do you have any idea who...?
	AI_Output(self, hero, "Info_Mod_Morpheus_Blutkelch_37_06"); //Maybe the magicians in town....
	AI_Output(hero, self, "Info_Mod_Morpheus_Blutkelch_15_07"); //Which are there?
	AI_Output(self, hero, "Info_Mod_Morpheus_Blutkelch_37_08"); //A group of fire magicians. Arrogant bunch. Living in the city's most beautiful house.
	AI_Output(self, hero, "Info_Mod_Morpheus_Blutkelch_37_09"); //And a water magician. Strange fellow. Hanging out in the old neighborhood.
	AI_Output(hero, self, "Info_Mod_Morpheus_Blutkelch_15_10"); //Thank you first.

	B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Morpheus has referred me to the local magicians.");
};

INSTANCE Info_Mod_Morpheus_Trade (C_INFO)
{
	npc		= Mod_7581_OUT_Morpheus_REL;
	nr		= 1;
	condition	= Info_Mod_Morpheus_Trade_Condition;
	information	= Info_Mod_Morpheus_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Morpheus_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morpheus_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morpheus_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Morpheus_Pickpocket (C_INFO)
{
	npc		= Mod_7581_OUT_Morpheus_REL;
	nr		= 1;
	condition	= Info_Mod_Morpheus_Pickpocket_Condition;
	information	= Info_Mod_Morpheus_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Morpheus_Pickpocket_Condition()
{
	C_Beklauen	(107, ItMi_Gold, 35);
};

FUNC VOID Info_Mod_Morpheus_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Morpheus_Pickpocket);

	Info_AddChoice	(Info_Mod_Morpheus_Pickpocket, DIALOG_BACK, Info_Mod_Morpheus_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Morpheus_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Morpheus_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Morpheus_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Morpheus_Pickpocket);
};

FUNC VOID Info_Mod_Morpheus_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Morpheus_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Morpheus_Pickpocket);

		Info_AddChoice	(Info_Mod_Morpheus_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Morpheus_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Morpheus_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Morpheus_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Morpheus_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Morpheus_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Morpheus_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Morpheus_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Morpheus_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Morpheus_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Morpheus_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Morpheus_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Morpheus_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Morpheus_EXIT (C_INFO)
{
	npc		= Mod_7581_OUT_Morpheus_REL;
	nr		= 1;
	condition	= Info_Mod_Morpheus_EXIT_Condition;
	information	= Info_Mod_Morpheus_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Morpheus_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Morpheus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
