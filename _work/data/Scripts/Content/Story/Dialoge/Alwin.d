INSTANCE Info_Mod_Alwin_Hi (C_INFO)
{
	npc		= Mod_560_NONE_Alwin_NW;
	nr		= 1;
	condition	= Info_Mod_Alwin_Hi_Condition;
	information	= Info_Mod_Alwin_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Alwin_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alwin_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Alwin_Hi_12_01"); //Ich bin Alwin, Schafshirte und Metzger. Was kann ich für dich tun?
};

INSTANCE Info_Mod_Alwin_Flugblaetter (C_INFO)
{
	npc		= Mod_560_NONE_Alwin_NW;
	nr		= 1;
	condition	= Info_Mod_Alwin_Flugblaetter_Condition;
	information	= Info_Mod_Alwin_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Alwin_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Alwin_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alwin_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Alwin_Flugblaetter_12_01"); //Oh danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Alwin_Flugblaetter_12_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblaetter +=  1;
};

INSTANCE Info_Mod_Alwin_LobartScene (C_INFO)
{
	npc		= Mod_560_NONE_Alwin_NW;
	nr		= 1;
	condition	= Info_Mod_Alwin_LobartScene_Condition;
	information	= Info_Mod_Alwin_LobartScene_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alwin_LobartScene_Condition()
{
	if (Mod_LobartAlwin == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alwin_LobartScene_Info()
{
	AI_Output(self, hero, "Info_Mod_Alwin_LobartScene_12_00"); //Was glotzt ihr so?

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Alwin_LobartScene2 (C_INFO)
{
	npc		= Mod_560_NONE_Alwin_NW;
	nr		= 1;
	condition	= Info_Mod_Alwin_LobartScene2_Condition;
	information	= Info_Mod_Alwin_LobartScene2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alwin_LobartScene2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Meldor_LobartAlwinScene))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alwin_LobartScene2_Info()
{
	AI_Output(self, hero, "Info_Mod_Alwin_LobartScene2_12_00"); //Besser saufen als kiffen, du Arsch. (stöhnt) Ah, meine Birne!
	AI_Output(self, hero, "Info_Mod_Alwin_LobartScene2_12_01"); //Kann mich gar nicht erinnern, dass ich heute schon voll war.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_560_NONE_Alwin_NW, "START");
	B_StartOtherRoutine	(Mod_597_NONE_Meldor_NW, "START");
	B_StartOtherRoutine	(Mod_1041_VLK_Buergerin_NW, "START");
	B_StartOtherRoutine	(Mod_1039_VLK_Buergerin_NW, "START");
	B_StartOtherRoutine	(Mod_593_NONE_Lucy_NW, "START");
};

INSTANCE Info_Mod_Alwin_Pickpocket (C_INFO)
{
	npc		= Mod_560_NONE_Alwin_NW;
	nr		= 1;
	condition	= Info_Mod_Alwin_Pickpocket_Condition;
	information	= Info_Mod_Alwin_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_Alwin_Pickpocket_Condition()
{
	C_Beklauen	(15, ItMi_Gold, 13);
};

FUNC VOID Info_Mod_Alwin_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Alwin_Pickpocket);

	Info_AddChoice	(Info_Mod_Alwin_Pickpocket, DIALOG_BACK, Info_Mod_Alwin_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Alwin_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Alwin_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Alwin_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Alwin_Pickpocket);
};

FUNC VOID Info_Mod_Alwin_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Alwin_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Alwin_Pickpocket);

		Info_AddChoice	(Info_Mod_Alwin_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Alwin_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Alwin_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Alwin_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Alwin_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Alwin_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Alwin_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Alwin_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Alwin_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Alwin_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Alwin_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Alwin_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Alwin_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Alwin_EXIT (C_INFO)
{
	npc		= Mod_560_NONE_Alwin_NW;
	nr		= 1;
	condition	= Info_Mod_Alwin_EXIT_Condition;
	information	= Info_Mod_Alwin_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alwin_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alwin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};