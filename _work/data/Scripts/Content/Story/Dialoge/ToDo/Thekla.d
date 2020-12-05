INSTANCE Info_Mod_Thekla_Hi (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Hi_Condition;
	information	= Info_Mod_Thekla_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thekla_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Hi_17_00"); //Hello stranger. If you're looking for a place to get something to eat, you've come to the right place.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_ONAR, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_ONAR, "Thekla can sell me something to eat.");
};

INSTANCE Info_Mod_Thekla_Daemonisch (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Daemonisch_Condition;
	information	= Info_Mod_Thekla_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))	
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch_17_00"); //What's the matter, do you want to eat something?
	AI_Output(hero, self, "Info_Mod_Thekla_Daemonisch_15_01"); //No, I just wanted to say hello.
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch_17_02"); //Oh, excuse my tone of voice.
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch_17_03"); //Lares sends some of his mercenaries into the forest to hunt for wolves and now they think they have to eat all the food.
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch_17_04"); //If only there was something that could satisfy her irrepressible appetite.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Thekla curses that some of the mercenaries who had sent Lares out to hunt wolves in the forest have been eating her since the kitchen empty.");
};

INSTANCE Info_Mod_Thekla_Daemonisch2 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Daemonisch2_Condition;
	information	= Info_Mod_Thekla_Daemonisch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "You wanted the mercenaries to stop eating so much.";
};

FUNC INT Info_Mod_Thekla_Daemonisch2_Condition()
{
	if (Mod_HQ_Daemonisch == 1)
	&& ((Npc_HasItems(hero, ItFo_KWine) >= 1)
	|| (Npc_HasItems(hero, ItPo_HealBesessenheit) >= 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Daemonisch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Daemonisch2_15_00"); //You wanted the mercenaries to stop eating so much. I got something for you....
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch2_17_01"); //Yes, in Inno's name what?

	Info_ClearChoices	(Info_Mod_Thekla_Daemonisch2);

	if (Npc_HasItems(hero, ItPo_HealBesessenheit) >= 1)
	{
		Info_AddChoice	(Info_Mod_Thekla_Daemonisch2, "Healing of obsession", Info_Mod_Thekla_Daemonisch2_B);
	};
	if (Npc_HasItems(hero, ItFo_KWine) >= 1)
	{
		Info_AddChoice	(Info_Mod_Thekla_Daemonisch2, "Klosterwein", Info_Mod_Thekla_Daemonisch2_A);
	};
};

FUNC VOID Info_Mod_Thekla_Daemonisch2_C()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Daemonisch2_C_15_00"); //Here, this little soda should get your appetite back on track. Just put it in the food.
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch2_C_17_01"); //Yeah, I don't even want to know what it is.

	Info_ClearChoices	(Info_Mod_Thekla_Daemonisch2);
};

FUNC VOID Info_Mod_Thekla_Daemonisch2_B()
{
	B_GiveInvItems	(hero, self, ItPo_HealBesessenheit, 1);

	Info_Mod_Thekla_Daemonisch2_C();
};

FUNC VOID Info_Mod_Thekla_Daemonisch2_A()
{
	B_GiveInvItems	(hero, self, ItFo_KWine, 1);

	Info_Mod_Thekla_Daemonisch2_C();
};

INSTANCE Info_Mod_Thekla_Daemonisch3 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Daemonisch3_Condition;
	information	= Info_Mod_Thekla_Daemonisch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Daemonisch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_SoeldnerBeiThekla_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Daemonisch3_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch3_17_00"); //It worked out. Here, take some of my stew as a thank you.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "So, Onar's farm is finished.");

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Thekla_Dung (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Dung_Condition;
	information	= Info_Mod_Thekla_Dung_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Trying to draw away the Scla)";
};

FUNC INT Info_Mod_Thekla_Dung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thekla_Hi))
	&& (Npc_HasItems(hero, ItMi_Scavengerdung) == 1)
	&& (Mod_Suppenwuerze_Thekla == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Dung_Info()
{
	Info_ClearChoices	(Info_Mod_Thekla_Dung);

	Info_AddChoice	(Info_Mod_Thekla_Dung, "I just want to play a little joke on the mercenaries.", Info_Mod_Thekla_Dung_04);
	Info_AddChoice	(Info_Mod_Thekla_Dung, "Didn't I just see someone in the pantry?", Info_Mod_Thekla_Dung_03);
	Info_AddChoice	(Info_Mod_Thekla_Dung, "One of the servants just stole a plate.", Info_Mod_Thekla_Dung_02);
	Info_AddChoice	(Info_Mod_Thekla_Dung, "Onar wants something from you.", Info_Mod_Thekla_Dung_01);
};

FUNC VOID Info_Mod_Thekla_Dung_01()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Dung_01_15_00"); //Onar wants something from you. He's expecting you at the manor.
	AI_Output(self, hero, "Info_Mod_Thekla_Dung_01_17_01"); //Tell the fat guy to come here if he wants something. He's getting as lazy as those degenerate mercenaries.

	Info_ClearChoices	(Info_Mod_Thekla_Dung);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Thekla_Dung_02()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Dung_02_15_00"); //One of the servants just stole a plate. He just stepped out.
	AI_Output(self, hero, "Info_Mod_Thekla_Dung_02_17_01"); //What plates? I didn't give out any plates at all. Are you kidding me?

	Info_ClearChoices	(Info_Mod_Thekla_Dung);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Thekla_Dung_03()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Dung_03_15_00"); //Didn't I just see someone in the pantry?
	AI_Output(self, hero, "Info_Mod_Thekla_Dung_03_17_01"); //What? The hoodlums! Well, wait...

	Info_ClearChoices	(Info_Mod_Thekla_Dung);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "VORRATSKAMMER");

	Mod_Suppenwuerze_Thekla = 1;
};

FUNC VOID Info_Mod_Thekla_Dung_04()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Dung_04_15_00"); //I just want to play a little joke on the mercenaries. Look away for a moment, please.
	AI_Output(self, hero, "Info_Mod_Thekla_Dung_04_17_01"); //I'd rather not, kid. Guys don't get any fun out of this.

	Info_ClearChoices	(Info_Mod_Thekla_Dung);

	AI_StopProcessInfos	(self);

	Mod_Suppenwuerze_Thekla = 2;
};

INSTANCE Info_Mod_Thekla_Dung2 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Dung2_Condition;
	information	= Info_Mod_Thekla_Dung2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Dung2_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Herd_Scavengerdung))
	&& (Mod_Suppenwuerze_Thekla == 1)	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Dung2_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Dung2_17_00"); //You lied to me! Don't ever do that again.
	AI_Output(self, hero, "Info_Mod_Thekla_Dung2_17_01"); //When it comes to my supplies, I can't take a joke.
};

INSTANCE Info_Mod_Thekla_Dung3 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Dung3_Condition;
	information	= Info_Mod_Thekla_Dung3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Dung3_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Herd_Scavengerdung))
	&& (Mod_Suppenwuerze_Thekla == 2)
	&& (Mod_Scavengerdung_Tag > Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Dung3_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Dung3_17_00"); //Have you anything to do with the mercenaries' stomachaches?
	AI_Output(hero, self, "Info_Mod_Thekla_Dung3_15_01"); //What makes you think that?
	AI_Output(self, hero, "Info_Mod_Thekla_Dung3_17_02"); //You spoke of a prank you wanted to play before they started complaining.
	AI_Output(hero, self, "Info_Mod_Thekla_Dung3_15_03"); //Um...
	AI_Output(self, hero, "Info_Mod_Thekla_Dung3_17_04"); //I don't care what about the mercenaries, but keep your hands off my stove, remember that!
};

INSTANCE Info_Mod_Thekla_Wasili_01 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Wasili_01_Condition;
	information	= Info_Mod_Thekla_Wasili_01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Wasili_01_Condition()
{
	if (Mod_WM_WasiliQuest == 3)	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Wasili_01_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_01_17_00"); //Poor Wasili. He was banished from the court by Onar because he gave money to a stranger on Mary's instructions.
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_01_17_01"); //Now he's sitting in the cave drinking all day. And Maria won't lift a finger to help Wasili get out of there.
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_01_17_02"); //You're on the road a lot. Couldn't you bring him something to eat from me?

	Info_ClearChoices	(Info_Mod_Thekla_Wasili_01);

	Info_AddChoice	(Info_Mod_Thekla_Wasili_01, "No, I don't have time for that.", Info_Mod_Thekla_Wasili_01_B);
	Info_AddChoice	(Info_Mod_Thekla_Wasili_01, "Sure, I'll be glad to help.", Info_Mod_Thekla_Wasili_01_A);
};

FUNC VOID Info_Mod_Thekla_Wasili_01_B()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Wasili_01_B_15_00"); //No, I don't have time for that.
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_01_B_17_01"); //Too bad. I'll have to go myself later.

	Info_ClearChoices	(Info_Mod_Thekla_Wasili_01);
};

FUNC VOID Info_Mod_Thekla_Wasili_01_A()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Wasili_01_A_15_00"); //Sure, I'll be glad to help.
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_01_A_17_01"); //Thanks a lot, you'll get some of my stew I'm preparing later.

	B_GiveInvItems	(self, hero, ItMi_EsspaketWasili, 1);

	B_LogEntry	(TOPIC_MOD_ADANOS_WASILI, "Thekla asked me to bring Wasili something to eat.");

	Info_ClearChoices	(Info_Mod_Thekla_Wasili_01);
};

INSTANCE Info_Mod_Thekla_Wasili_02 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Wasili_02_Condition;
	information	= Info_Mod_Thekla_Wasili_02_Info;
	permanent	= 0;
	important	= 0;
	description	= "I brought Wasili his food.";
};

FUNC INT Info_Mod_Thekla_Wasili_02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wasili_Verbannt_02))	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Wasili_02_Info()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Wasili_02_15_00"); //I brought Wasili his food.
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_02_17_01"); //Thank you very much. Here's the promised stew I just finished with. Enjoy your meal.

	B_GiveInvItems	(self, hero, ItFo_XPStew, 1);

	B_LogEntry	(TOPIC_MOD_ADANOS_WASILI, "I brought Wasili his food and got the stew.");
};

INSTANCE Info_Mod_Thekla_Zauberwasser (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Zauberwasser_Condition;
	information	= Info_Mod_Thekla_Zauberwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "I've got a shipment of magic water.";
};

FUNC INT Info_Mod_Thekla_Zauberwasser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thekla_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Constantino_Zauberwasser))
	&& (Npc_HasItems(hero, ItMi_Zauberwasser_MIS) > 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Zauberwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Zauberwasser_15_00"); //I've got a shipment of magic water.

	B_GiveInvItems	(hero, self, ItMi_Zauberwasser_MIS, 8);

	AI_Output(self, hero, "Info_Mod_Thekla_Zauberwasser_17_01"); //It's about time.
};

INSTANCE Info_Mod_Thekla_Trade (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Trade_Condition;
	information	= Info_Mod_Thekla_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Thekla_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thekla_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Trade_Info()
{
	B_GiveTradeInv	(self);
	B_Say	(hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Thekla_Pickpocket (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Pickpocket_Condition;
	information	= Info_Mod_Thekla_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120_Female;
};

FUNC INT Info_Mod_Thekla_Pickpocket_Condition()
{
	C_Beklauen	(112, ItFo_XPStew, 1);
};

FUNC VOID Info_Mod_Thekla_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);

	Info_AddChoice	(Info_Mod_Thekla_Pickpocket, DIALOG_BACK, Info_Mod_Thekla_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Thekla_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Thekla_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Thekla_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);
};

FUNC VOID Info_Mod_Thekla_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);

		Info_AddChoice	(Info_Mod_Thekla_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Thekla_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Thekla_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Thekla_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Thekla_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Thekla_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Thekla_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Thekla_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Thekla_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Thekla_EXIT (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_EXIT_Condition;
	information	= Info_Mod_Thekla_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Thekla_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thekla_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
