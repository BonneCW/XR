// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Tpl_29_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Tpl_8 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Tpl_29_EXIT_Condition;
	information	= Info_Tpl_29_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Tpl_29_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_29_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Tpl_29_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Tpl_29_EinerVonEuchWerden_Condition;
	information	= Info_Tpl_29_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "K�nnt ihr noch einen guten Mann brauchen?";
};                       

FUNC INT Info_Tpl_29_EinerVonEuchWerden_Condition()
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

FUNC VOID Info_Tpl_29_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_Tpl_29_EinerVonEuchWerden_15_00"); //K�nnt ihr noch einen guten Mann brauchen?
	AI_Output(self,hero,"Info_Tpl_29_EinerVonEuchWerden_29_01"); //Gute Leute suchen wir immer. Aber du wirst hart an dir arbeiten m�ssen. Erst ein fortgeschrittener Novize kann zum Templer bef�rdert werden.
	AI_Output(self,hero,"Info_Tpl_29_EinerVonEuchWerden_29_02"); //Es ist die h�chste Ehre f�r einen Anh�nger der Bruderschaft.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Tpl_29_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Tpl_29_WichtigePersonen_Condition;
	information	= Info_Tpl_29_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT Info_Tpl_29_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_29_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_Tpl_29_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,hero,"Info_Tpl_29_WichtigePersonen_29_01"); //Wir tun alles, was uns die Gurus sagen. Es ist unsere Pflicht, ihnen zu dienen.
	AI_Output(self,hero,"Info_Tpl_29_WichtigePersonen_15_02"); //Wer sind eure Gurus?
	AI_Output(self,hero,"Info_Tpl_29_WichtigePersonen_29_03"); //Cor Cadar ist der Oberste Guru. Unter ihm folgen Cor Angar und noch einige weitere.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Tpl_29_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Tpl_29_DasLager_Condition;
	information	= Info_Tpl_29_DasLager_Info;
	permanent	= 1;
	description = "Was kannst du mir �ber dieses Lager erz�hlen?";
};                       

FUNC INT Info_Tpl_29_DasLager_Condition()
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

FUNC VOID Info_Tpl_29_DasLager_Info()
{
	AI_Output(hero,self,"Info_Tpl_29_DasLager_15_00"); //Was kannst du mir �ber dieses Lager erz�hlen?
	AI_Output(self,hero,"Info_Tpl_29_DasLager_29_01"); //Als Neuling darfst du dich fast �berall aufhalten. Aber es ist Ungl�ubigen untersagt, den Tempel zu betreten.
	AI_Output(hero,self,"Info_Tpl_29_DasLager_29_02"); //Also halt dich nur da auf, wo es dir gestattet ist. Und st�re nicht unsere Meister bei der Meditation.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Tpl_29_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Tpl_29_DieLage_Condition;
	information	= Info_Tpl_29_DieLage_Info;
	permanent	= 1;
	description = "Wie sieht's aus?";
};                       

FUNC INT Info_Tpl_29_DieLage_Condition()
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

FUNC VOID Info_Tpl_29_DieLage_Info()
{
	AI_Output(hero,self,"Info_Tpl_29_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self,hero,"Info_Tpl_29_DieLage_29_01"); //Ich warne dich. Sei nicht respektlos. Du redest mit einem Auserw�hlten Besch�tzer der Propheten.
};

INSTANCE Info_Mod_TPL_29_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_TPL_29_Pickpocket_Condition;
	information	= Info_Mod_TPL_29_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_TPL_29_Pickpocket_Condition()
{
	C_Beklauen	(150 + r_max(30), ItMi_Gold, 90 + r_max(20));
};

FUNC VOID Info_Mod_TPL_29_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_TPL_29_Pickpocket);

	Info_AddChoice	(Info_Mod_TPL_29_Pickpocket, DIALOG_BACK, Info_Mod_TPL_29_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_TPL_29_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_TPL_29_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_TPL_29_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_TPL_29_Pickpocket);
};

FUNC VOID Info_Mod_TPL_29_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_TPL_29_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_TPL_29_Pickpocket);

		Info_AddChoice	(Info_Mod_TPL_29_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_TPL_29_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_TPL_29_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_TPL_29_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_TPL_29_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_TPL_29_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_TPL_29_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_TPL_29_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_TPL_29_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_TPL_29_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_TPL_29_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_TPL_29_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_TPL_29_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Tpl_29(var c_NPC slf)
{
	Info_Tpl_29_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Tpl_29_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Tpl_29_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Tpl_29_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Tpl_29_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_TPL_29_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
