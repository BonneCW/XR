INSTANCE Info_Mod_Norman_Hi (C_INFO)
{
	npc		= Mod_7477_OUT_Norman_REL;
	nr		= 1;
	condition	= Info_Mod_Norman_Hi_Condition;
	information	= Info_Mod_Norman_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Norman_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Norman_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Norman_Hi_01_00"); //Ein armer Sklave, der dem ungnädigen Willen eines undurchsichtigen Plans unterworfen ist.
};

INSTANCE Info_Mod_Norman_Unzufrieden (C_INFO)
{
	npc		= Mod_7477_OUT_Norman_REL;
	nr		= 1;
	condition	= Info_Mod_Norman_Unzufrieden_Condition;
	information	= Info_Mod_Norman_Unzufrieden_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum bist du unzufrieden?";
};

FUNC INT Info_Mod_Norman_Unzufrieden_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Norman_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Norman_Unzufrieden_Info()
{
	AI_Output(hero, self, "Info_Mod_Norman_Unzufrieden_15_00"); //Warum bist du unzufrieden?
	AI_Output(self, hero, "Info_Mod_Norman_Unzufrieden_01_01"); //Warum Knechtschaft nicht befriedigt? Ich weiß es nicht, Bruder.
};

INSTANCE Info_Mod_Norman_Endres (C_INFO)
{
	npc		= Mod_7477_OUT_Norman_REL;
	nr		= 1;
	condition	= Info_Mod_Norman_Endres_Condition;
	information	= Info_Mod_Norman_Endres_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du von Endres' Tod gehört?";
};

FUNC INT Info_Mod_Norman_Endres_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Norman_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Heiler_Endres))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Norman_Endres_Info()
{
	AI_Output(hero, self, "Info_Mod_Norman_Endres_15_00"); //Hast du von Endres' Tod gehört?
	AI_Output(self, hero, "Info_Mod_Norman_Endres_01_01"); //(murmelt stumpfsinnig) Endres ist tot, aber sein Werk lebt fort.
	AI_Output(self, hero, "Info_Mod_Norman_Endres_01_02"); //Warum musste er sterben? Wer profitiert von dem Mord?
	AI_Output(self, hero, "Info_Mod_Norman_Endres_01_03"); //Adanos, verrate mir: Habe ich ihn mit meinen Wünschen getötet? Haben sie eine solche Kraft?

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Norman wünschte sich im Stillen Endres' Ableben. Aber wenn wirklich die Bergleute es waren, die Endres getötet haben - was haben sie dadurch für einen Vorteil bekommen? Oder war es lediglich ein Racheakt?");
};

INSTANCE Info_Mod_Norman_Pickpocket (C_INFO)
{
	npc		= Mod_7477_OUT_Norman_REL;
	nr		= 1;
	condition	= Info_Mod_Norman_Pickpocket_Condition;
	information	= Info_Mod_Norman_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Norman_Pickpocket_Condition()
{
	C_Beklauen	(51, ItMi_Gold, 250);
};

FUNC VOID Info_Mod_Norman_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Norman_Pickpocket);

	Info_AddChoice	(Info_Mod_Norman_Pickpocket, DIALOG_BACK, Info_Mod_Norman_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Norman_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Norman_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Norman_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Norman_Pickpocket);
};

FUNC VOID Info_Mod_Norman_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Norman_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Norman_Pickpocket);

		Info_AddChoice	(Info_Mod_Norman_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Norman_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Norman_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Norman_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Norman_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Norman_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Norman_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Norman_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Norman_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Norman_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Norman_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Norman_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Norman_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Norman_EXIT (C_INFO)
{
	npc		= Mod_7477_OUT_Norman_REL;
	nr		= 1;
	condition	= Info_Mod_Norman_EXIT_Condition;
	information	= Info_Mod_Norman_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Norman_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Norman_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};