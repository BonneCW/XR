INSTANCE Info_Mod_Alberto_Hi (C_INFO)
{
	npc		= Mod_7800_SMK_Alberto_OM;
	nr		= 1;
	condition	= Info_Mod_Alberto_Hi_Condition;
	information	= Info_Mod_Alberto_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Moge handlowac z Toba?";
};

FUNC INT Info_Mod_Alberto_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alberto_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Alberto_Hi_15_00"); //Moge handlowac z Toba?
	AI_Output(self, hero, "Info_Mod_Alberto_Hi_12_01"); //Juuup, wszystko czego chcesz, gdy masz rude. A za garstke szczypiec gasienicowych zaplacilbym ci szczególnie dobra cene.
	AI_Output(hero, self, "Info_Mod_Alberto_Hi_15_02"); //Dlaczego?
	AI_Output(self, hero, "Info_Mod_Alberto_Hi_12_03"); //Wydzielanie kleszczy moze zwiekszyc magiczna moc i dlatego jest w duzej mierze zatrzymywane przez magów demonów.
	AI_Output(hero, self, "Info_Mod_Alberto_Hi_15_04"); //Dlaczego wiec nie polujecie sami na gasienice?
	AI_Output(self, hero, "Info_Mod_Alberto_Hi_12_05"); //Cóz, czy wygladamy jak templariusze? Nawet nie wiemy, jak jesc zwierzeta.
	AI_Output(self, hero, "Info_Mod_Alberto_Hi_12_06"); //Z ówczesnych kultowych blystek pozostalo tylko Na Kosh, sprzedaje on dzis tylko kapuste bagienna i pali jak idiota.
	AI_Output(self, hero, "Info_Mod_Alberto_Hi_12_07"); //Gor Na Bar i jego kolega byli zawsze dobrzy w polowaniu. Ale podczas trzesienia, zostaly one zakopane w jaskini ponizej....
};

INSTANCE Info_Mod_Alberto_Crawlerzangen (C_INFO)
{
	npc		= Mod_7800_SMK_Alberto_OM;
	nr		= 1;
	condition	= Info_Mod_Alberto_Crawlerzangen_Condition;
	information	= Info_Mod_Alberto_Crawlerzangen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam szczypce do gasienic.";
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
	AI_Output(hero, self, "Info_Mod_Alberto_Crawlerzangen_15_00"); //Mam szczypce do gasienic.
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_12_01"); //Naprawde? Wspanialy! Dam ci jeden na to..... 10 rudy i 200 zlota.

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);

	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "Nie wystarczy dla mnie.", Info_Mod_Alberto_Crawlerzangen_B);
	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "Kupiony.", Info_Mod_Alberto_Crawlerzangen_A);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_Gekauft()
{
	AI_Output(hero, self, "Info_Mod_Alberto_Crawlerzangen_Gekauft_15_00"); //Kupiony.
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_Gekauft2()
{
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_Gekauft2_12_00"); //Mile robienie interesów z Toba.
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_B()
{
	AI_Output(hero, self, "Info_Mod_Alberto_Crawlerzangen_B_15_00"); //Nie wystarczy dla mnie.
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_B_12_01"); //Ok. Umieszcze te stare kamienne tabliczki. Trzesienie ziemi odkrylo starozytny tunel, gdzie je znalezlismy. Musi miec duzo wartosci....

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);

	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "Nadal nie wystarczy.", Info_Mod_Alberto_Crawlerzangen_D);
	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "Kupiony.", Info_Mod_Alberto_Crawlerzangen_C);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_D()
{
	AI_Output(hero, self, "Info_Mod_Alberto_Crawlerzangen_D_15_00"); //Nadal nie wystarczy.
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_D_12_01"); //Sluchaj, czy chcesz, abym poszedl do psów? Dodam jeszcze trzy inne dobre mikstury lecznicze.... i to jest moja ostatnia oferta.

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);

	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "Chce wiecej.", Info_Mod_Alberto_Crawlerzangen_F);
	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "Kupiony.", Info_Mod_Alberto_Crawlerzangen_E);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_F()
{
	AI_Output(hero, self, "Info_Mod_Alberto_Crawlerzangen_F_15_00"); //Chce wiecej.
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_F_12_01"); //Wiesz co wiesz! Wiec trzymaj brudne szczypce!
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_F_12_02"); //I od tej pory znajdz kolejnego idiote, z którym mozesz sie z Toba uporac!

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_E()
{
	Info_Mod_Alberto_Crawlerzangen_Gekauft();

	B_GiveInvItems	(hero, self, ItAt_CrawlerMandibles, 5);

	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_E_12_00"); //No cóz, wtedy by to bylo na scenie.

	B_ShowGivenThings	("200 zlota, 10 rud, 3 kamienne tabletki i 3 zachowane eliksiry lecznicze.");

	CreateInvItems	(hero, ItMi_Gold, 200);
	CreateInvItems	(hero, ItMi_Nugget, 10);
	CreateInvItems	(hero, ItWr_StrStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItWr_HitPointStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItWr_ManaStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItPo_Health_02, 2);
	CreateInvItems	(hero, ItPo_Health_03, 1);

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_E_12_01"); //To jest kutroat.

	AI_TurnToNpc	(self, hero);

	B_GivePlayerXP	(250);

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_C()
{
	Info_Mod_Alberto_Crawlerzangen_Gekauft();

	B_GiveInvItems	(hero, self, ItAt_CrawlerMandibles, 5);

	Info_Mod_Alberto_Crawlerzangen_Gekauft2();

	B_ShowGivenThings	("200 zlota, 10 rud i 3 kamienne tabletki zakonserwowane");

	CreateInvItems	(hero, ItMi_Gold, 200);
	CreateInvItems	(hero, ItMi_Nugget, 10);
	CreateInvItems	(hero, ItWr_StrStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItWr_HitPointStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItWr_ManaStonePlate1_Addon, 1);

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_C_12_00"); //Na szczescie udalo mi sie zalamac stare rzeczy pod nim.

	AI_TurnToNpc	(self, hero);

	B_GivePlayerXP	(250);

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_A()
{
	Info_Mod_Alberto_Crawlerzangen_Gekauft();

	B_GiveInvItems	(hero, self, ItAt_CrawlerMandibles, 5);

	Info_Mod_Alberto_Crawlerzangen_Gekauft2();

	B_ShowGivenThings	("200 zlota i 10 rudy uzyskano");

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
