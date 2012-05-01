// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_FM_SLD_5_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_FM_SLD_5_EXIT_Condition;
	information	= DIA_FM_SLD_5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_FM_SLD_5_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_FM_SLD_5_EXIT_Info()
{	
	AI_Output(self, hero, "DIA_FM_SLD_5_EXIT_05_00"); //Stirb uns nicht weg!

	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_FM_SLD_5_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_FM_SLD_5_JOIN_Condition;
	information	= DIA_FM_SLD_5_JOIN_Info;
	permanent	= TRUE;
	description = "Ich will mich euch anschließen!";
};                       

FUNC INT DIA_FM_SLD_5_JOIN_Condition()
{
	if (Mod_Gilde == 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_FM_SLD_5_JOIN_Info()
{	
	AI_Output (other, self, "DIA_FM_SLD_5_JOIN_15_00"); //Ich will mich euch anschließen!
	AI_Output(self, hero, "DIA_FM_SLD_5_JOIN_06_01"); //Was sprichst du dann mit mir? Rede mit Lares oder gleich mit den drei Gruppenführern und beweise dich.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_FM_SLD_5_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_FM_SLD_5_PEOPLE_Condition;
	information	= DIA_FM_SLD_5_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT DIA_FM_SLD_5_PEOPLE_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_FM_SLD_5_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_FM_SLD_5_PEOPLE_15_00"); //Wer hat hier das Sagen?
	AI_Output (self, other, "DIA_FM_SLD_5_PEOPLE_06_01"); //Hier in der Mine eigentlich niemand, aber das Lager ist unter der Kontrolle von Lee.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_FM_SLD_5_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_FM_SLD_5_LOCATION_Condition;
	information	= DIA_FM_SLD_5_LOCATION_Info;
	permanent	= TRUE;
	description = "Überwacht ihr die Schürfer?";
};                       

FUNC INT DIA_FM_SLD_5_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_FM_SLD_5_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_FM_SLD_5_LOCATION_15_00"); //Überwacht ihr die Schürfer?
	AI_Output (self, other, "DIA_FM_SLD_5_LOCATION_06_01"); //Wir sind nicht hier um jemanden zu überwachen. Wir passen nur auf, dass niemand mit dem ganzen Erz durchbrennt. Außerdem mussten wir nach dem Vorfall letztens die Sicherheitsvorkehrungen erhöhen.
};

INSTANCE Info_Mod_FM_SLD_5_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_FM_SLD_5_Pickpocket_Condition;
	information	= Info_Mod_FM_SLD_5_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_FM_SLD_5_Pickpocket_Condition()
{
	C_Beklauen	(75, ItMi_Gold, 400);
};

FUNC VOID Info_Mod_FM_SLD_5_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_FM_SLD_5_Pickpocket);

	Info_AddChoice	(Info_Mod_FM_SLD_5_Pickpocket, DIALOG_BACK, Info_Mod_FM_SLD_5_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_FM_SLD_5_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_FM_SLD_5_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_FM_SLD_5_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_FM_SLD_5_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_FM_SLD_5 (var c_NPC slf)
{
	DIA_FM_SLD_5_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_FM_SLD_5_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_FM_SLD_5_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_FM_SLD_5_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_FM_SLD_5_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
