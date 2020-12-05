// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_16_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_16_EXIT_Condition;
	information	= DIA_BAU_16_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_16_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_16_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_16_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_16_JOIN_Condition;
	information	= DIA_BAU_16_JOIN_Info;
	permanent	= TRUE;
	description = "Chce wiedziec wiecej o najemnikach!";
};                       

FUNC INT DIA_BAU_16_JOIN_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_16_JOIN_Info()
{	
	AI_Output (hero, self, "DIA_BAU_43_JOIN_15_00"); //69841
	AI_Output (self, hero, "DIA_BAU_43_JOIN_43_01"); //Wisza na podwórku przez caly dzien, co jakis czas walcza i sa zabawni.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_16_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_16_PEOPLE_Condition;
	information	= DIA_BAU_16_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kto jest tu odpowiedzialny?";
};                       

FUNC INT DIA_BAU_16_PEOPLE_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_16_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_BAU_43_PEOPLE_15_00"); //Kto jest tu odpowiedzialny?
	AI_Output (self, hero, "DIA_BAU_43_PEOPLE_43_01"); //Onar jest szefem wszystkich gospodarstw, ale kazde z malych gospodarstw ma innego najemce, który dba o to, aby wszystko w jego gospodarstwie dzialalo.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_16_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_16_LOCATION_Condition;
	information	= DIA_BAU_16_LOCATION_Info;
	permanent	= TRUE;
	description = "Co mozesz mi powiedziec o tej okolicy?";
};                       

FUNC INT DIA_BAU_16_LOCATION_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_16_LOCATION_Info()
{	
	AI_Output (hero, self, "DIA_BAU_43_LOCATION_15_00"); //Co mozesz mi powiedziec o tej okolicy?
	AI_Output (self, hero, "DIA_BAU_43_LOCATION_43_01"); //75581
	AI_Output (self, hero, "DIA_BAU_43_LOCATION_43_02"); //Na poludniowym zachodzie znajduje sie klatka schodowa do plaskowyzu. Znajduje sie tu gospodarstwo Bengara.
};

INSTANCE Info_Mod_BAU_16_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_BAU_16_Pickpocket_Condition;
	information	= Info_Mod_BAU_16_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30_Female;
};

FUNC INT Info_Mod_BAU_16_Pickpocket_Condition()
{
	C_Beklauen	(8 + r_max(12), ItMi_Gold, 10 + r_max(5));
};

FUNC VOID Info_Mod_BAU_16_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_BAU_16_Pickpocket);

	Info_AddChoice	(Info_Mod_BAU_16_Pickpocket, DIALOG_BACK, Info_Mod_BAU_16_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_BAU_16_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_BAU_16_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_BAU_16_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_BAU_16_Pickpocket);
};

FUNC VOID Info_Mod_BAU_16_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_BAU_16_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_BAU_16_Pickpocket);

		Info_AddChoice	(Info_Mod_BAU_16_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_BAU_16_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_BAU_16_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_BAU_16_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_BAU_16_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_BAU_16_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_BAU_16_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_BAU_16_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_BAU_16_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_BAU_16_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_BAU_16_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_BAU_16_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_BAU_16_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_16 (var c_NPC slf)
{
	DIA_BAU_16_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_16_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_16_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_16_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_BAU_16_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
