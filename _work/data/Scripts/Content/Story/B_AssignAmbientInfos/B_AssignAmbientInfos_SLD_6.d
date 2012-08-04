// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_SLD_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_SLD_6_EXIT_Condition;
	information	= DIA_SLD_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_6_EXIT_Info()
{	
	AI_Output(self, hero, "DIA_SLD_6_EXIT_06_00"); //Stirb uns nicht weg!

	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_SLD_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_SLD_6_JOIN_Condition;
	information	= DIA_SLD_6_JOIN_Info;
	permanent	= TRUE;
	description = "Ich will mich euch anschließen!";
};                       

FUNC INT DIA_SLD_6_JOIN_Condition()
{
	if (Mod_Gilde == 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_JOIN_15_00"); //Ich will mich euch anschließen!
	AI_Output(self, hero, "DIA_SLD_6_JOIN_06_01"); //Was sprichst du dann mit mir? Rede mit Lares und beweise dich.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_SLD_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_SLD_6_PEOPLE_Condition;
	information	= DIA_SLD_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT DIA_SLD_6_PEOPLE_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_PEOPLE_15_00"); //Wer hat hier das Sagen?
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_01"); //Der Hof gehört Onar, wenn du das meinst. Aber unser Anführer ist Lee.
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_02"); //Er war mal General in der Armee des Königs. Aber jetzt ist er nicht mehr ganz so gut auf den König zu sprechen (lacht).
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_03"); //Merk dir seinen Namen. Wenn du Mist baust, ist er vermutlich der einzige, der die Sache für dich regeln kann. Alle anderen ziehen dir einfach das Fell über die Ohren.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_SLD_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_SLD_6_LOCATION_Condition;
	information	= DIA_SLD_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Bewacht ihr die Bauern?";
};                       

FUNC INT DIA_SLD_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_LOCATION_15_00"); //Bewacht ihr die Bauern?
	AI_Output (self, other, "DIA_SLD_6_LOCATION_06_01"); //Wir sind nicht hier um jemanden zu bewachen, sondern um neue Mitglieder anzuwerben.
};

INSTANCE Info_Mod_SLD_6_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_SLD_6_Pickpocket_Condition;
	information	= Info_Mod_SLD_6_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_SLD_6_Pickpocket_Condition()
{
	C_Beklauen	(90+r_max(30), ItMi_Gold, 400+r_max(150));
};

FUNC VOID Info_Mod_SLD_6_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_SLD_6_Pickpocket);

	Info_AddChoice	(Info_Mod_SLD_6_Pickpocket, DIALOG_BACK, Info_Mod_SLD_6_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_SLD_6_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_SLD_6_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_SLD_6_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_SLD_6_Pickpocket);
};

FUNC VOID Info_Mod_SLD_6_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_SLD_6_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_SLD_6_Pickpocket);

		Info_AddChoice	(Info_Mod_SLD_6_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_SLD_6_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_SLD_6_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_SLD_6_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_SLD_6_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_SLD_6_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_SLD_6_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_SLD_6_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_SLD_6_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_SLD_6_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_SLD_6_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_SLD_6_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_SLD_6_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SLD_6 (var c_NPC slf)
{
	DIA_SLD_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_SLD_6_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
