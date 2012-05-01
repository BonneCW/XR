INSTANCE Info_Mod_Maria_Unheil (C_INFO)
{
	npc		= Mod_789_BAU_Maria_NW;
	nr		= 1;
	condition	= Info_Mod_Maria_Unheil_Condition;
	information	= Info_Mod_Maria_Unheil_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich hörte, dass es dir nicht so gut geht.";
};

FUNC INT Info_Mod_Maria_Unheil_Condition()
{
	if ((Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13))
	&& ((Npc_KnowsInfo(hero, Info_Mod_Bobo_Unheil))
	|| (Npc_KnowsInfo(hero, Info_Mod_Gunnar_Unheil)))
	&& (Mod_WM_MariaGeheilt == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Maria_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Maria_Unheil_15_00"); //Ich hörte, dass es dir nicht so gut geht.
	AI_Output(self, hero, "Info_Mod_Maria_Unheil_17_01"); //Ach, es ist wirklich schlimm. Dieses beklemmende Gefühl, die Schwäche und diese dunklen Visionen. Und nichts scheint zu helfen.
	AI_Output(self, hero, "Info_Mod_Maria_Unheil_17_02"); //Wenn sich nicht meine neue Magd so aufopferungsvoll um mich kümmern würde, wüsste ich nicht, was ich täte.

	Info_ClearChoices	(Info_Mod_Maria_Unheil);

	if (Npc_HasItems(hero, ItPo_Health_01) > 0)
	|| (Npc_HasItems(hero, ItPo_HealBesessenheit) > 0)
	{
		Info_AddChoice	(Info_Mod_Maria_Unheil, "Vielleicht kann dir dieser Trank helfen.", Info_Mod_Maria_Unheil_B);
	};
	Info_AddChoice	(Info_Mod_Maria_Unheil, "Das tut mir Leid. Ich wünsche dir gute Besserung.", Info_Mod_Maria_Unheil_A);
};

FUNC VOID Info_Mod_Maria_Unheil_B()
{
	AI_Output(hero, self, "Info_Mod_Maria_Unheil_B_15_00"); //Vielleicht kann dir dieser Trank helfen.
	
	Info_ClearChoices	(Info_Mod_Maria_Unheil);

	if (Npc_HasItems(hero, ItPo_HealBesessenheit) > 0)
	{
		Info_AddChoice	(Info_Mod_Maria_Unheil, "Heilung von Besessenheit", Info_Mod_Maria_Unheil_D);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) > 0)
	{
		Info_AddChoice	(Info_Mod_Maria_Unheil, "Essenz der Heilung", Info_Mod_Maria_Unheil_C);
	};
};

FUNC VOID Info_Mod_Maria_Unheil_A()
{
	AI_Output(hero, self, "Info_Mod_Maria_Unheil_A_15_00"); //Das tut mir Leid. Ich wünsche dir gute Besserung.
	
	Info_ClearChoices	(Info_Mod_Maria_Unheil);
};

FUNC VOID Info_Mod_Maria_Unheil_D()
{
	B_GiveInvItems	(hero, self, ItPo_HealBesessenheit, 1);

	B_UseItem	(self, ItPo_HealBesessenheit);

	AI_Output(self, hero, "Info_Mod_Maria_Unheil_D_17_00"); //Was ist geschehen? Ich spüre wie meine Kräfte zurückkehren, mein Geist klar wird.
	AI_Output(self, hero, "Info_Mod_Maria_Unheil_D_17_01"); //Wie soll ich dir nur danken ... Geh zu Onar. Er soll dich mit 400 Goldmünzen entlohnen.

	Mod_WM_MariaGeheilt = 1;
	
	Info_ClearChoices	(Info_Mod_Maria_Unheil);
};

FUNC VOID Info_Mod_Maria_Unheil_C()
{
	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);

	AI_Output(self, hero, "Info_Mod_Maria_Unheil_C_17_00"); //Ach, ich danke dir, aber auch das scheint nicht zu helfen.
	
	Info_ClearChoices	(Info_Mod_Maria_Unheil);
};

INSTANCE Info_Mod_Maria_BelohnungOnar (C_INFO)
{
	npc		= Mod_789_BAU_Maria_NW;
	nr		= 1;
	condition	= Info_Mod_Maria_BelohnungOnar_Condition;
	information	= Info_Mod_Maria_BelohnungOnar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich war bei Onar. Er hat mir nur 200 Goldmünzen gegeben.";
};

FUNC INT Info_Mod_Maria_BelohnungOnar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Onar_BelohnungMaria))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Maria_BelohnungOnar_Info()
{
	AI_Output(hero, self, "Info_Mod_Maria_BelohnungOnar_15_00"); //Ich war bei Onar. Er hat mir nur 200 Goldmünzen gegeben.
	AI_Output(self, hero, "Info_Mod_Maria_BelohnungOnar_17_01"); //Ach, dieser alte Geizkragen. Hmm,… geh zu Wasili. Er soll dir die restlichen Goldmünzen geben.
};

INSTANCE Info_Mod_Maria_BelohnungWasili (C_INFO)
{
	npc		= Mod_789_BAU_Maria_NW;
	nr		= 1;
	condition	= Info_Mod_Maria_BelohnungWasili_Condition;
	information	= Info_Mod_Maria_BelohnungWasili_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wasili hat mir nur 100 Goldmünzen gegeben.";
};

FUNC INT Info_Mod_Maria_BelohnungWasili_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wasili_BelohnungMaria))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Maria_BelohnungWasili_Info()
{
	AI_Output(hero, self, "Info_Mod_Maria_BelohnungWasili_15_00"); //Wasili hat mir nur 100 Goldmünzen gegeben.
	AI_Output(self, hero, "Info_Mod_Maria_BelohnungWasili_17_01"); //Ohh, hmm ... dann bleibt mir nicht anderes übrig. Geschieht ihm auch ganz recht dem alten Schwein.
	AI_Output(self, hero, "Info_Mod_Maria_BelohnungWasili_17_02"); //Denkt wohl ich wüsste nichts von seinen Geschichten mit den Mägden und Bäuerinnen ...
	AI_Output(self, hero, "Info_Mod_Maria_BelohnungWasili_17_03"); //Wenn du unter Onars Matratze schaust, wirst du bestimmt mehr als genug finden. Aber dass es bloß unter uns bleibt ...

	MOBNAME_XR_ONARSVERSTECK = "Onar's Versteck";
};

INSTANCE Info_Mod_Maria_Pickpocket (C_INFO)
{
	npc		= Mod_789_BAU_Maria_NW;
	nr		= 1;
	condition	= Info_Mod_Maria_Pickpocket_Condition;
	information	= Info_Mod_Maria_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Maria_Pickpocket_Condition()
{
	C_Beklauen	(51, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_Maria_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Maria_Pickpocket);

	Info_AddChoice	(Info_Mod_Maria_Pickpocket, DIALOG_BACK, Info_Mod_Maria_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Maria_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Maria_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Maria_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Maria_Pickpocket);
};

FUNC VOID Info_Mod_Maria_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Maria_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Maria_Pickpocket);

		Info_AddChoice	(Info_Mod_Maria_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Maria_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Maria_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Maria_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Maria_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Maria_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Maria_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Maria_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Maria_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Maria_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Maria_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Maria_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Maria_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Maria_EXIT (C_INFO)
{
	npc		= Mod_789_BAU_Maria_NW;
	nr		= 1;
	condition	= Info_Mod_Maria_EXIT_Condition;
	information	= Info_Mod_Maria_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Maria_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Maria_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};