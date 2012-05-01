// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Tpl_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Tpl_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Tpl_13_EXIT_Condition;
	information	= Info_Tpl_13_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Tpl_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Tpl_13_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Tpl_13_EinerVonEuchWerden_Condition;
	information	= Info_Tpl_13_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Ich will ein Templer werden - so wie du.";
};                       

FUNC INT Info_Tpl_13_EinerVonEuchWerden_Condition()
{
	if (SumpfNovize_Dabei == FALSE)
	&& (Templer_Dabei == FALSE)
	&& (HoherTempler_Dabei == FALSE)
	&& (Guru_Dabei == FALSE)
	&& (HoherGuru_Dabei == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Tpl_13_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_Tpl_13_EinerVonEuchWerden_15_00"); //Ich will ein Templer werden - so wie du.
	AI_Output(self,hero,"Info_Tpl_13_EinerVonEuchWerden_13_01"); //Hast du eine Ahnung wie viele Entbehrungen ich auf mich nehmen musste, um den Gurus als Tempelwächter dienen zu dürfen?
	AI_Output(self,hero,"Info_Tpl_13_EinerVonEuchWerden_13_02"); //Glaub bloß nicht, du kannst hier einfach reinspazieren und bekommst so mir nichts dir nichts die höchsten Auszeichnungen.
	AI_Output(self,hero,"Info_Tpl_13_EinerVonEuchWerden_13_03"); //Bevor du überhaupt darüber nachdenkst, solltest du dich mit unserer Lehre vertraut machen.
	AI_Output(self,hero,"Info_Tpl_13_EinerVonEuchWerden_13_04"); //Das wird einige Zeit in Anspruch nehmen und es wird dir auch sicher die Flausen aus dem Kopf treiben.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Tpl_13_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Tpl_13_WichtigePersonen_Condition;
	information	= Info_Tpl_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT Info_Tpl_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_13_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_Tpl_13_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,hero,"Info_Tpl_13_WichtigePersonen_13_01"); //Unsere Gurus sind die Auserwählten! Die Gurus verkünden uns unser Schicksal.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Tpl_13_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Tpl_13_DasLager_Condition;
	information	= Info_Tpl_13_DasLager_Info;
	permanent	= 1;
	description = "Ich würde gerne mal in den Tempel gehen...";
};                       

FUNC INT Info_Tpl_13_DasLager_Condition()
{	
	if (Kapitel <= 1) 
	{
		return 1;
	};
};
FUNC VOID Info_Tpl_13_DasLager_Info()
{
	AI_Output(hero,self,"Info_Tpl_13_DasLager_15_00"); //Ich würde gerne mal in den Tempel gehen ...
	AI_Output(self,hero,"Info_Tpl_13_DasLager_13_01"); //Undenkbar! Ein Ungläubiger im Tempel! Bevor du dich nicht in den Dienst der Sekte gestellt hast, wird dir der Zutritt zum Tempel verwehrt bleiben!
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Tpl_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Tpl_13_DieLage_Condition;
	information	= Info_Tpl_13_DieLage_Info;
	permanent	= 1;
	description = "Wie läuft's?";
};                       

FUNC INT Info_Tpl_13_DieLage_Condition()
{
	if (SumpfNovize_Dabei == FALSE)
	&& (Templer_Dabei == FALSE)
	&& (HoherTempler_Dabei == FALSE)
	&& (Guru_Dabei == FALSE)
	&& (HoherGuru_Dabei == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Tpl_13_DieLage_Info()
{
	AI_Output(hero,self,"Info_Tpl_13_DieLage_15_00"); //Wie läuft's?
	AI_Output(self,hero,"Info_Tpl_13_DieLage_13_01"); //Seit ich ein auserwählter Beschützer des Glaubens bin, fühle ich mich besser als je zuvor in meinem Leben.
	AI_Output(hero,self,"Info_Tpl_13_DieLage_15_02"); //Hört sich wichtig an ...
	AI_Output(self,hero,"Info_Tpl_13_DieLage_13_03"); //Du bist ein Ungläubiger. Du verstehst davon nichts.
};

INSTANCE Info_Mod_TPL_13_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_TPL_13_Pickpocket_Condition;
	information	= Info_Mod_TPL_13_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_TPL_13_Pickpocket_Condition()
{
	C_Beklauen	(95, ItMi_Gold, 600);
};

FUNC VOID Info_Mod_TPL_13_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_TPL_13_Pickpocket);

	Info_AddChoice	(Info_Mod_TPL_13_Pickpocket, DIALOG_BACK, Info_Mod_TPL_13_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_TPL_13_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_TPL_13_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_TPL_13_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_TPL_13_Pickpocket);
};

FUNC VOID Info_Mod_TPL_13_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_TPL_13_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_TPL_13_Pickpocket);

		Info_AddChoice	(Info_Mod_TPL_13_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_TPL_13_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_TPL_13_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_TPL_13_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_TPL_13_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_TPL_13_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_TPL_13_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_TPL_13_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_TPL_13_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_TPL_13_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_TPL_13_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_TPL_13_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_TPL_13_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Tpl_13(var c_NPC slf)
{
	Info_Tpl_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Tpl_13_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Tpl_13_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Tpl_13_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Tpl_13_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_TPL_13_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
