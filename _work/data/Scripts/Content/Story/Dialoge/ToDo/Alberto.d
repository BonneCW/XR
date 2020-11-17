INSTANCE Info_Mod_Alberto_Hi (C_INFO)
{
	npc		= Mod_7800_SMK_Alberto_OM;
	nr		= 1;
	condition	= Info_Mod_Alberto_Hi_Condition;
	information	= Info_Mod_Alberto_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bei dir kann ich tauschen?";
};

FUNC INT Info_Mod_Alberto_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alberto_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Alberto_Hi_15_00"); //Bei dir kann ich tauschen?
	AI_Output(self, hero, "Info_Mod_Alberto_Hi_12_01"); //Juuup, alles was du willst, wenn du Erz hast. Und für eine Hand voll Crawlerzangen, würde ich dir einen besonders guten Preis zahlen.
	AI_Output(hero, self, "Info_Mod_Alberto_Hi_15_02"); //Wieso?
	AI_Output(self, hero, "Info_Mod_Alberto_Hi_12_03"); //Das Sekret der Zangen kann die magische Kraft steigern und ist daher bei den Dämonenmagiern sehr bliebt.
	AI_Output(hero, self, "Info_Mod_Alberto_Hi_15_04"); //Und wieso jagt ihr die Crawler dann nicht einfach selbst?
	AI_Output(self, hero, "Info_Mod_Alberto_Hi_12_05"); //Naja, sehen wir aus wie Templer? Wir wissen doch nicht mal, die man die Viecher ausnimmt.
	AI_Output(self, hero, "Info_Mod_Alberto_Hi_12_06"); //Von den Sektenspinnern von damals ist nur Na Kosh übrig, und der verkauft mittlerweile nur noch Sumpfkraut und kifft wie ein blöder.
	AI_Output(self, hero, "Info_Mod_Alberto_Hi_12_07"); //Gor Na Bar und sein Kollege, die waren immer gut bei der Jagd dabei. Aber bei dem Beben wurden sie in der Höhle weiter unten verschüttet ...
};

INSTANCE Info_Mod_Alberto_Crawlerzangen (C_INFO)
{
	npc		= Mod_7800_SMK_Alberto_OM;
	nr		= 1;
	condition	= Info_Mod_Alberto_Crawlerzangen_Condition;
	information	= Info_Mod_Alberto_Crawlerzangen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe einige Crawlerzangen.";
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
	AI_Output(hero, self, "Info_Mod_Alberto_Crawlerzangen_15_00"); //Ich habe einige Crawlerzangen.
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_12_01"); //Echt? Spitze! Ich geb dir dafür ... 10 Erz und 200 Gold.

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);

	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "Ist mir zu wenig.", Info_Mod_Alberto_Crawlerzangen_B);
	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "Gekauft.", Info_Mod_Alberto_Crawlerzangen_A);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_Gekauft()
{
	AI_Output(hero, self, "Info_Mod_Alberto_Crawlerzangen_Gekauft_15_00"); //Gekauft.
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_Gekauft2()
{
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_Gekauft2_12_00"); //Hat mich gefreut mit dir Geschäfte gemacht zu haben.
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_B()
{
	AI_Output(hero, self, "Info_Mod_Alberto_Crawlerzangen_B_15_00"); //Ist mir zu wenig.
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_B_12_01"); //Okey ... ich lege noch diese antiken Steintafeln drauf. Bei dem Erdbeben wurde ein uralter Stollen freigelegt, wo wir sie fanden. Sind bestimmt ne Menge wert ...

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);

	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "Immer noch zu wenig.", Info_Mod_Alberto_Crawlerzangen_D);
	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "Gekauft.", Info_Mod_Alberto_Crawlerzangen_C);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_D()
{
	AI_Output(hero, self, "Info_Mod_Alberto_Crawlerzangen_D_15_00"); //Immer noch zu wenig.
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_D_12_01"); //Hör mal, willst du, dass ich vor die Hunde gehe? (mahnend) Ich leg noch drei gute Heiltränke drauf ... und das ist mein letztes Angebot.

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);

	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "Ich will noch mehr.", Info_Mod_Alberto_Crawlerzangen_F);
	Info_AddChoice	(Info_Mod_Alberto_Crawlerzangen, "Gekauft.", Info_Mod_Alberto_Crawlerzangen_E);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_F()
{
	AI_Output(hero, self, "Info_Mod_Alberto_Crawlerzangen_F_15_00"); //Ich will noch mehr.
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_F_12_01"); //(wütend) Weißt du was?! Dann behalt deine dreckigen Zangen eben!
	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_F_12_02"); //Und such dir von jetzt an gefälligst einen anderen Idioten, der mit dir handelt!

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_E()
{
	Info_Mod_Alberto_Crawlerzangen_Gekauft();

	B_GiveInvItems	(hero, self, ItAt_CrawlerMandibles, 5);

	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_E_12_00"); //(erleichtert) Ok, dann hätten wir das über die Bühne gebracht.

	B_ShowGivenThings	("200 Gold, 10 Erz, 3 Steintafeln und 3 Heiltränke erhalten");

	CreateInvItems	(hero, ItMi_Gold, 200);
	CreateInvItems	(hero, ItMi_Nugget, 10);
	CreateInvItems	(hero, ItWr_StrStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItWr_HitPointStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItWr_ManaStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItPo_Health_02, 2);
	CreateInvItems	(hero, ItPo_Health_03, 1);

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_E_12_01"); //(zu sich selbst) So ein Halsabschneider.

	AI_TurnToNpc	(self, hero);

	B_GivePlayerXP	(250);

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_C()
{
	Info_Mod_Alberto_Crawlerzangen_Gekauft();

	B_GiveInvItems	(hero, self, ItAt_CrawlerMandibles, 5);

	Info_Mod_Alberto_Crawlerzangen_Gekauft2();

	B_ShowGivenThings	("200 Gold, 10 Erz und 3 Steintafeln erhalten");

	CreateInvItems	(hero, ItMi_Gold, 200);
	CreateInvItems	(hero, ItMi_Nugget, 10);
	CreateInvItems	(hero, ItWr_StrStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItWr_HitPointStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItWr_ManaStonePlate1_Addon, 1);

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Alberto_Crawlerzangen_C_12_00"); //(leise zu sich selbst) Zum Glück konnte ich ihm die alten Dinger unterjubeln.

	AI_TurnToNpc	(self, hero);

	B_GivePlayerXP	(250);

	Info_ClearChoices	(Info_Mod_Alberto_Crawlerzangen);
};

FUNC VOID Info_Mod_Alberto_Crawlerzangen_A()
{
	Info_Mod_Alberto_Crawlerzangen_Gekauft();

	B_GiveInvItems	(hero, self, ItAt_CrawlerMandibles, 5);

	Info_Mod_Alberto_Crawlerzangen_Gekauft2();

	B_ShowGivenThings	("200 Gold und 10 Erz erhalten");

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