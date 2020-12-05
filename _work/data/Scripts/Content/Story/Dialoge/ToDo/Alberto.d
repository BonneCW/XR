INSTANCE Info_Mod_Alberto_Hi (C_INFO)
{
	npc		= Mod_7800_SMK_Alberto_OM;
	nr		= 1;
	condition	= Info_Mod_Alberto_Hi_Condition;
	information	= Info_Mod_Alberto_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "I can trade with you?";
};

FUNC INT Info_Mod_Alberto_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alberto_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Alberto_Hi_15_00"); //I can trade with you?
	AI_Output(self, hero, "Info_Mod_Alberto_Hi_12_01"); //Juuup, anything you want when you have ore. And for a handful of crawler pliers, I'd pay you a particularly good price.
	AI_Output(hero, self, "Info_Mod_Alberto_Hi_15_02"); //Why?
	AI_Output(self, hero, "Info_Mod_Alberto_Hi_12_03"); //The secretion of the forceps can increase the magical power and is therefore very much retained by the demon magicians.
	AI_Output(hero, self, "Info_Mod_Alberto_Hi_15_04"); //Then why don't you just hunt the crawlers yourself?
	AI_Output(self, hero, "Info_Mod_Alberto_Hi_12_05"); //Well, do we look like Templars? We don't even know how to gut the animals.
	AI_Output(self, hero, "Info_Mod_Alberto_Hi_12_06"); //Of the cult spinners of that time, only Na Kosh is left, and he only sells bog cabbage nowadays and smokes like an idiot.
	AI_Output(self, hero, "Info_Mod_Alberto_Hi_12_07"); //Gor Na Bar and his colleague, they were always good at hunting. But during the quake, they were buried in the cave below...
};

INSTANCE Info_Mod_Alberto_Crawlerzangen (C_INFO)
{
	npc		= Mod_7800_SMK_Alberto_OM;
	nr		= 1;
	condition	= Info_Mod_Alberto_Crawlerzangen_Condition;
	information	= Info_Mod_Alberto_Crawlerzangen_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have some crawler tongs.";
};

FUNC INT Info_Mod_Alberto_Crawlerzangen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alberto_Hi))
	&& (Npc_HasItems(hero, ItAt_CrawlerMandibles) >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_Info()
{
	AI_Output(hero, self, "Info_Mod_Alberto_Crawlerzangen_15_00"); //I have some crawler tongs.
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_12_01"); //Really? Great! I'll give you one for that... 10 ore and 200 gold.

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);

	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "It's not enough for me.", Info_Mod_Alberto_Crawlerzangen_B);
	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "Done.", Info_Mod_Alberto_Crawlerzangen_A);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_Gekauft()
{
	AI_Output(hero, self, "Info_Mod_Alberto_Crawlerzangen_Gekauft_15_00"); //Bought.
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_Gekauft2()
{
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_Gekauft2_12_00"); //Nice doing business with you.
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_B()
{
	AI_Output(hero, self, "Info_Mod_Alberto_Crawlerzangen_B_15_00"); //It's not enough for me.
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_B_12_01"); //Okey-- I'll put these ancient stone tablets on top of it. The earthquake uncovered an ancient tunnel where we found it. Must be worth a lot...

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);

	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "Still not enough.", Info_Mod_Alberto_Crawlerzangen_D);
	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "Done.", Info_Mod_Alberto_Crawlerzangen_C);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_D()
{
	AI_Output(hero, self, "Info_Mod_Alberto_Crawlerzangen_D_15_00"); //Still not enough.
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_D_12_01"); //Listen, do you want me to go to the dogs? I'll add three more good healing potions... and this is my final offer.

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);

	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "I want more.", Info_Mod_Alberto_Crawlerzangen_F);
	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "Done.", Info_Mod_Alberto_Crawlerzangen_E);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_F()
{
	AI_Output(hero, self, "Info_Mod_Alberto_Crawlerzangen_F_15_00"); //I want more.
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_F_12_01"); //You know what?! So keep your dirty tongs!
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_F_12_02"); //And from now on, find another idiot to deal with you!

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_E()
{
	Info_Mod_Alberto_Crawlerzangen_Gekauft();

	B_GiveInvItems	(hero, self, ItAt_CrawlerMandibles, 5);

	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_E_12_00"); //Okay, then we would have put it on stage.

	B_ShowGivenThings	("200 gold, 10 ore, 3 stone tablets and 3 healing potions preserved");

	CreateInvItems	(hero, ItMi_Gold, 200);
	CreateInvItems	(hero, ItMi_Nugget, 10);
	CreateInvItems	(hero, ItWr_StrStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItWr_HitPointStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItWr_ManaStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItPo_Health_02, 2);
	CreateInvItems	(hero, ItPo_Health_03, 1);

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_E_12_01"); //He's a cutthroat.

	AI_TurnToNpc	(self, hero);

	B_GivePlayerXP	(250);

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_C()
{
	Info_Mod_Alberto_Crawlerzangen_Gekauft();

	B_GiveInvItems	(hero, self, ItAt_CrawlerMandibles, 5);

	Info_Mod_Alberto_Crawlerzangen_Gekauft2();

	B_ShowGivenThings	("200 gold, 10 ore and 3 stone tablets preserved");

	CreateInvItems	(hero, ItMi_Gold, 200);
	CreateInvItems	(hero, ItMi_Nugget, 10);
	CreateInvItems	(hero, ItWr_StrStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItWr_HitPointStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItWr_ManaStonePlate1_Addon, 1);

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_C_12_00"); //Fortunately, I was able to shove the old things under him.

	AI_TurnToNpc	(self, hero);

	B_GivePlayerXP	(250);

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_A()
{
	Info_Mod_Alberto_Crawlerzangen_Gekauft();

	B_GiveInvItems	(hero, self, ItAt_CrawlerMandibles, 5);

	Info_Mod_Alberto_Crawlerzangen_Gekauft2();

	B_ShowGivenThings	("200 gold and 10 ore obtained");

	CreateInvItems	(hero, ItMi_Gold, 200);
	CreateInvItems	(hero, ItMi_Nugget, 10);

	B_GivePlayerXP	(250);

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);
};

INSTANCE Info_Mod_Alberto_Trade (C_INFO)
{
	npc		= Mod_7800_SMK_Alberto_OM;
	nr		= 1;
	condition	= Info_Mod_Alberto_Trade_Condition;
	information	= Info_Mod_Alberto_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Alberto_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alberto_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alberto_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Alberto_EXIT (C_INFO)
{
	npc		= Mod_7800_SMK_Alberto_OM;
	nr		= 1;
	condition	= Info_Mod_Alberto_EXIT_Condition;
	information	= Info_Mod_Alberto_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alberto_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alberto_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
