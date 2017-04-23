INSTANCE Info_Mod_Ghorim_Hi (C_INFO)
{
	npc		= Mod_2008_PSINOV_Ghorim_MT;
	nr		= 1;
	condition	= Info_Mod_Ghorim_Hi_Condition;
	information	= Info_Mod_Ghorim_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ghorim_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ghorim_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Ghorim_Hi_02_00"); //Du lebst noch? Danke nochmal, dass du mir damals geholfen hast.
};

INSTANCE Info_Mod_Ghorim_Sumpfmensch (C_INFO)
{
	npc		= Mod_2008_PSINOV_Ghorim_MT;
	nr		= 1;
	condition	= Info_Mod_Ghorim_Sumpfmensch_Condition;
	information	= Info_Mod_Ghorim_Sumpfmensch_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Ghorim_Sumpfmensch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Balor_Sumpfmensch))
	&& (Mod_Fortuno_Sumpfmensch_Scene == 0)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Wld_IsTime(22,00,06,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ghorim_Sumpfmensch_Info()
{
	AI_Output(self, hero, "Info_Mod_Ghorim_Sumpfmensch_02_00"); //Pssst. Es geht gleich los! Willst du dich auch setzen?

	Info_ClearChoices	(Info_Mod_Ghorim_Sumpfmensch);

	Info_AddChoice	(Info_Mod_Ghorim_Sumpfmensch, "Nein.", Info_Mod_Ghorim_Sumpfmensch_B);
	Info_AddChoice	(Info_Mod_Ghorim_Sumpfmensch, "Ja.", Info_Mod_Ghorim_Sumpfmensch_A);
};

FUNC VOID Info_Mod_Ghorim_Sumpfmensch_B()
{
	AI_Output(hero, self, "Info_Mod_Ghorim_Sumpfmensch_B_15_00"); //Nein.

	Info_ClearChoices	(Info_Mod_Ghorim_Sumpfmensch);

	Npc_SetRefuseTalk	(self, 30);
};

FUNC VOID Info_Mod_Ghorim_Sumpfmensch_A()
{
	AI_Output(hero, self, "Info_Mod_Ghorim_Sumpfmensch_A_15_00"); //Ja.

	Info_ClearChoices	(Info_Mod_Ghorim_Sumpfmensch);

	Mod_Fortuno_Sumpfmensch_Scene = 1;
};

INSTANCE Info_Mod_Ghorim_Woher (C_INFO)
{
	npc		= Mod_2008_PSINOV_Ghorim_MT;
	nr		= 1;
	condition	= Info_Mod_Ghorim_Woher_Condition;
	information	= Info_Mod_Ghorim_Woher_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie kommst du eigentlich in dieses Lager?";
};

FUNC INT Info_Mod_Ghorim_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ghorim_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ghorim_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Ghorim_Woher_15_00"); //Wie kommst du eigentlich in dieses Lager?
	AI_Output(self, hero, "Info_Mod_Ghorim_Woher_02_01"); //Nachdem ich in Khorinis erfolglos mein Wirtshaus geführt habe, musste ich wegen Goldmangel den Wein mit Wasser verdünnen.
	AI_Output(self, hero, "Info_Mod_Ghorim_Woher_02_02"); //Als das rauskam haben sie mich in die Kolonie geworfen.
	AI_Output(self, hero, "Info_Mod_Ghorim_Woher_02_03"); //Ich war erst Buddler, hab mich dann aber doch der Bruderschaft angeschlossen, da das Leben hier wesentlich angenehmer ist.
};

INSTANCE Info_Mod_Ghorim_Pickpocket (C_INFO)
{
	npc		= Mod_2008_PSINOV_Ghorim_MT;
	nr		= 1;
	condition	= Info_Mod_Ghorim_Pickpocket_Condition;
	information	= Info_Mod_Ghorim_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Ghorim_Pickpocket_Condition()
{
	C_Beklauen	(45, ItPl_SwampHerb, 7);
};

FUNC VOID Info_Mod_Ghorim_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ghorim_Pickpocket);

	Info_AddChoice	(Info_Mod_Ghorim_Pickpocket, DIALOG_BACK, Info_Mod_Ghorim_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ghorim_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ghorim_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ghorim_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ghorim_Pickpocket);
};

FUNC VOID Info_Mod_Ghorim_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Ghorim_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Ghorim_Pickpocket);

		Info_AddChoice	(Info_Mod_Ghorim_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Ghorim_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Ghorim_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Ghorim_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Ghorim_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Ghorim_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Ghorim_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Ghorim_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Ghorim_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Ghorim_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Ghorim_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Ghorim_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Ghorim_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Ghorim_EXIT (C_INFO)
{
	npc		= Mod_2008_PSINOV_Ghorim_MT;
	nr		= 1;
	condition	= Info_Mod_Ghorim_EXIT_Condition;
	information	= Info_Mod_Ghorim_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ghorim_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ghorim_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};