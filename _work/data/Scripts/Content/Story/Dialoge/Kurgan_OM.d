INSTANCE Info_Mod_Kurgan_OM_Hi (C_INFO)
{
	npc		= Mod_1031_DMR_Kurgan_OM;
	nr		= 1;
	condition	= Info_Mod_Kurgan_OM_Hi_Condition;
	information	= Info_Mod_Kurgan_OM_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Kurgan_OM_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kurgan_OM_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Kurgan_OM_Hi_01_01"); //Ich bin Kurgan, der Wächter der Mine.
};

INSTANCE Info_Mod_Kurgan_OM_AlteMineQuest (C_INFO)
{
	npc		= Mod_1031_DMR_Kurgan_OM;
	nr		= 1;
	condition	= Info_Mod_Kurgan_OM_AlteMineQuest_Condition;
	information	= Info_Mod_Kurgan_OM_AlteMineQuest_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kurgan_OM_AlteMineQuest_Condition()
{
	if (Mod_AMQ_Evil)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kurgan_OM_AlteMineQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Kurgan_OM_AlteMineQuest_15_00"); //Gott sei Dank einer, der noch nicht den Verstand verloren hat.
	AI_Output(self, hero, "Info_Mod_Kurgan_OM_AlteMineQuest_01_01"); //(überrascht) Dir ist es gelungen, dich bis hierhin durchzuschlagen?
	AI_Output(hero, self, "Info_Mod_Kurgan_OM_AlteMineQuest_15_02"); //Ja, es war nicht ganz leicht, aber nun bin ich hier. Was ist geschehen?

	CreateInvItems	(self, Ritual_Krieger, 1);

	AI_UnequipArmor	(self);

	AI_EquipArmor (self, Ritual_Krieger);

	AI_Output(self, hero, "Info_Mod_Kurgan_OM_AlteMineQuest_01_03"); //Das wirst du nicht mehr erfahren, einfälltiger Narr.
	AI_Output(self, hero, "Info_Mod_Kurgan_OM_AlteMineQuest_01_04"); //Dein Leichnam wird uns aber noch von wertvollem Nutzen sein, falls es dir ein Trost ist. (lacht)

	AI_StopProcessInfos	(self);

	self.guild = GIL_STRF;
	Npc_SetTrueGuild (self, GIL_STRF);
};

INSTANCE Info_Mod_Kurgan_OM_Pickpocket (C_INFO)
{
	npc		= Mod_1031_DMR_Kurgan_OM;
	nr		= 1;
	condition	= Info_Mod_Kurgan_OM_Pickpocket_Condition;
	information	= Info_Mod_Kurgan_OM_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Kurgan_OM_Pickpocket_Condition()
{
	C_Beklauen	(130, ItMi_Nugget, 7);
};

FUNC VOID Info_Mod_Kurgan_OM_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Kurgan_OM_Pickpocket);

	Info_AddChoice	(Info_Mod_Kurgan_OM_Pickpocket, DIALOG_BACK, Info_Mod_Kurgan_OM_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Kurgan_OM_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Kurgan_OM_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Kurgan_OM_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Kurgan_OM_Pickpocket);
};

FUNC VOID Info_Mod_Kurgan_OM_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Kurgan_OM_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Kurgan_OM_Pickpocket);

		Info_AddChoice	(Info_Mod_Kurgan_OM_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Kurgan_OM_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Kurgan_OM_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Kurgan_OM_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Kurgan_OM_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Kurgan_OM_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Kurgan_OM_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Kurgan_OM_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Kurgan_OM_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Kurgan_OM_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Kurgan_OM_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Kurgan_OM_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Kurgan_OM_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Kurgan_OM_EXIT (C_INFO)
{
	npc		= Mod_1031_DMR_Kurgan_OM;
	nr		= 1;
	condition	= Info_Mod_Kurgan_OM_EXIT_Condition;
	information	= Info_Mod_Kurgan_OM_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Kurgan_OM_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kurgan_OM_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};