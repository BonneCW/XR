INSTANCE Info_Mod_Cipher_Hi (C_INFO)
{
	npc		= Mod_781_SLD_Cipher_MT;
	nr		= 1;
	condition	= Info_Mod_Cipher_Hi_Condition;
	information	= Info_Mod_Cipher_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo.";
};

FUNC INT Info_Mod_Cipher_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cipher_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Cipher_Hi_15_00"); //Hallo.
	AI_Output(self, hero, "Info_Mod_Cipher_Hi_07_01"); //Hallo.
	AI_Output(hero, self, "Info_Mod_Cipher_Hi_15_02"); //Handelst du immer noch mit Sumpfkraut?
	AI_Output(self, hero, "Info_Mod_Cipher_Hi_07_03"); //(leise) Psst, nicht so laut. Es sind keine leichten Zeiten für den Handel mit Sumpfkraut.
	AI_Output(self, hero, "Info_Mod_Cipher_Hi_07_04"); //Ähhm, du hast nicht zufällig wieder mal einige Sumpfkrautpflanzen oder einige Sumpfkrautstängel bei dir?
	AI_Output(self, hero, "Info_Mod_Cipher_Hi_07_05"); //Je 10 würden mir echt weiterhelfen und ich würde dir einen guten Preis dafür geben.
	
	Log_CreateTopic	(TOPIC_MOD_HÄNDLER_SOELDNER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HÄNDLER_SOELDNER, "Cipher wird mit mir handeln.");

	if (Npc_HasItems(hero, ItMi_Joint) >= 10)
	|| (Npc_HasItems(hero, ItPl_SwampHerb) >= 10)
	{
		Info_ClearChoices	(Info_Mod_Cipher_Hi);

		if (Npc_HasItems(hero, ItPl_SwampHerb) >= 10)
		&& (Npc_HasItems(hero, ItMi_Joint) >= 10)
		{
			Info_AddChoice	(Info_Mod_Cipher_Hi, "Hier hast du 10 Sumpfkrautpflanzen und 10 Stängel.", Info_Mod_Cipher_Hi_D);
		};
		if (Npc_HasItems(hero, ItMi_Joint) >= 10)
		{
			Info_AddChoice	(Info_Mod_Cipher_Hi, "Hier hast du 10 Sumpfkrautstängel.", Info_Mod_Cipher_Hi_B);
		};
		if (Npc_HasItems(hero, ItPl_SwampHerb) >= 10)
		{
			Info_AddChoice	(Info_Mod_Cipher_Hi, "Hier hast du 10 Sumpfkrautpflanzen.", Info_Mod_Cipher_Hi_A);
		};
	};
};

FUNC VOID Info_Mod_Cipher_Hi_C()
{
	AI_Output(self, hero, "Info_Mod_Cipher_Hi_C_07_00"); //Hey, vielen Dank. Hier hast du 200 Gold und 5 Erz.

	B_GivePlayerXP	(100);

	B_ShowGivenThings	("200 Gold und 5 Erz erhalten");

	CreateInvItems	(hero, ItMi_Gold, 200);
	CreateInvItems	(hero, ItMi_Nugget, 5);
	
	Info_ClearChoices	(Info_Mod_Cipher_Hi);
};

FUNC VOID Info_Mod_Cipher_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Cipher_Hi_D_15_00"); //Hier hast du 10 Sumpfkrautpflanzen und 10 Stängel.

	Npc_RemoveInvItems	(hero, ItMi_Joint, 10);
	Npc_RemoveInvItems	(hero, ItPl_SwampHerb, 10);

	B_ShowGivenThings	("10 Sumpfkraut und 10 Stängel Sumpfkraut gegeben");

	AI_Output(self, hero, "Info_Mod_Cipher_Hi_D_07_01"); //Hey, vielen Dank. Hier hast du 400 Gold und 10 Erz.

	B_GivePlayerXP	(200);

	B_ShowGivenThings	("400 Gold und 10 Erz erhalten");

	CreateInvItems	(hero, ItMi_Gold, 400);
	CreateInvItems	(hero, ItMi_Nugget, 10);
	
	Info_ClearChoices	(Info_Mod_Cipher_Hi);
};

FUNC VOID Info_Mod_Cipher_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Cipher_Hi_B_15_00"); //Hier hast du 10 Sumpfkrautstängel.

	B_GiveInvItems	(hero, self, ItMi_Joint, 10);
	
	Info_Mod_Cipher_Hi_C();
};

FUNC VOID Info_Mod_Cipher_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Cipher_Hi_A_15_00"); //Hier hast du 10 Sumpfkrautpflanzen.

	B_GiveInvItems	(hero, self, ItPl_SwampHerb, 10);
	
	Info_Mod_Cipher_Hi_C();
};

INSTANCE Info_Mod_Cipher_Skinner (C_INFO)
{
	npc		= Mod_781_SLD_Cipher_MT;
	nr		= 1;
	condition	= Info_Mod_Cipher_Skinner_Condition;
	information	= Info_Mod_Cipher_Skinner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Willst du grüne Novizen?";
};

FUNC INT Info_Mod_Cipher_Skinner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Edgor_Skinner))
	&& (Npc_HasItems(hero, ItMi_Addon_Joint_01) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cipher_Skinner_Info()
{
	AI_Output(hero, self, "Info_Mod_Cipher_Skinner_15_00"); //Willst du grüne Novizen?
	AI_Output(self, hero, "Info_Mod_Cipher_Skinner_07_01"); //Das kann meinem Geschäft nur gut tun, also immer her mit dem Zeug.
	AI_Output(hero, self, "Info_Mod_Cipher_Skinner_15_02"); //Hier, nimm.

	B_GiveInvItems	(hero, self, ItMi_Addon_Joint_01, Npc_HasItems(hero, ItMi_Addon_Joint_01));

	AI_Output(self, hero, "Info_Mod_Cipher_Skinner_07_03"); //Hier dein Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, Npc_HasItems(self, ItMi_Addon_Joint_01)*30);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "So, damit bin ich bei Cipher die ganzen grünen Novizen losgeworden.");
};

INSTANCE Info_Mod_Cipher_Trade (C_INFO)
{
	npc		= Mod_781_SLD_Cipher_MT;
	nr		= 1;
	condition	= Info_Mod_Cipher_Trade_Condition;
	information	= Info_Mod_Cipher_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Cipher_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cipher_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cipher_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Cipher_Pickpocket (C_INFO)
{
	npc		= Mod_781_SLD_Cipher_MT;
	nr		= 1;
	condition	= Info_Mod_Cipher_Pickpocket_Condition;
	information	= Info_Mod_Cipher_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Cipher_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 480);
};

FUNC VOID Info_Mod_Cipher_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Cipher_Pickpocket);

	Info_AddChoice	(Info_Mod_Cipher_Pickpocket, DIALOG_BACK, Info_Mod_Cipher_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Cipher_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Cipher_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Cipher_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Cipher_Pickpocket);
};

FUNC VOID Info_Mod_Cipher_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Cipher_Pickpocket);
};

INSTANCE Info_Mod_Cipher_EXIT (C_INFO)
{
	npc		= Mod_781_SLD_Cipher_MT;
	nr		= 1;
	condition	= Info_Mod_Cipher_EXIT_Condition;
	information	= Info_Mod_Cipher_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Cipher_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cipher_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};