// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Tpl_8_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Tpl_8 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Tpl_8_EXIT_Condition;
	information	= Info_Tpl_8_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Tpl_8_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Tpl_8_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Tpl_8_EinerVonEuchWerden_Condition;
	information	= Info_Tpl_8_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Könnt ihr noch einen guten Mann brauchen?";
};                       

FUNC INT Info_Tpl_8_EinerVonEuchWerden_Condition()
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

FUNC VOID Info_Tpl_8_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_Tpl_8_EinerVonEuchWerden_15_00"); //Könnt ihr noch einen guten Mann brauchen?
	AI_Output(self,hero,"Info_Tpl_8_EinerVonEuchWerden_08_01"); //Gute Leute suchen wir immer. Aber du wirst hart an dir arbeiten müssen. Erst ein fortgeschrittener Novize kann zum Templer befördert werden.
	AI_Output(self,hero,"Info_Tpl_8_EinerVonEuchWerden_08_02"); //Es ist die höchste Ehre für einen Anhänger der Bruderschaft.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Tpl_8_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Tpl_8_WichtigePersonen_Condition;
	information	= Info_Tpl_8_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT Info_Tpl_8_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_8_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_Tpl_8_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,hero,"Info_Tpl_8_WichtigePersonen_08_01"); //Wir tun alles, was uns die Gurus sagen. Es ist unsere Pflicht, ihnen zu dienen.
	AI_Output(self,hero,"Info_Tpl_8_WichtigePersonen_15_02"); //Wer sind eure Gurus?
	AI_Output(self,hero,"Info_Tpl_8_WichtigePersonen_08_03"); //Cor Cadar ist der Oberste Guru. Unter ihm folgen Cor Angar und noch einige weitere.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Tpl_8_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Tpl_8_DasLager_Condition;
	information	= Info_Tpl_8_DasLager_Info;
	permanent	= 1;
	description = "Was kannst du mir über dieses Lager erzählen?";
};                       

FUNC INT Info_Tpl_8_DasLager_Condition()
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

FUNC VOID Info_Tpl_8_DasLager_Info()
{
	AI_Output(hero,self,"Info_Tpl_8_DasLager_15_00"); //Was kannst du mir über dieses Lager erzählen?
	AI_Output(self,hero,"Info_Tpl_8_DasLager_08_01"); //Als Neuling darfst du dich fast überall aufhalten. Aber es ist Ungläubigen untersagt, den Tempel zu betreten.
	AI_Output(hero,self,"Info_Tpl_8_DasLager_08_02"); //Also halt dich nur da auf, wo es dir gestattet ist. Und störe nicht unsere Meister bei der Meditation.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Tpl_8_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Tpl_8_DieLage_Condition;
	information	= Info_Tpl_8_DieLage_Info;
	permanent	= 1;
	description = "Wie sieht's aus?";
};                       

FUNC INT Info_Tpl_8_DieLage_Condition()
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

FUNC VOID Info_Tpl_8_DieLage_Info()
{
	AI_Output(hero,self,"Info_Tpl_8_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self,hero,"Info_Tpl_8_DieLage_08_01"); //Ich warne dich. Sei nicht respektlos. Du redest mit einem Auserwählten Beschützer der Propheten.
};

INSTANCE Info_Mod_TPL_8_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_TPL_8_Pickpocket_Condition;
	information	= Info_Mod_TPL_8_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_TPL_8_Pickpocket_Condition()
{
	C_Beklauen	(99, ItMi_Gold, 650);
};

FUNC VOID Info_Mod_TPL_8_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_TPL_8_Pickpocket);

	Info_AddChoice	(Info_Mod_TPL_8_Pickpocket, DIALOG_BACK, Info_Mod_TPL_8_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_TPL_8_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_TPL_8_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_TPL_8_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_TPL_8_Pickpocket);
};

FUNC VOID Info_Mod_TPL_8_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_TPL_8_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_TPL_8_Pickpocket);

		Info_AddChoice	(Info_Mod_TPL_8_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_TPL_8_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_TPL_8_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_TPL_8_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_TPL_8_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_TPL_8_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_TPL_8_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_TPL_8_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_TPL_8_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_TPL_8_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_TPL_8_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_TPL_8_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_TPL_8_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Tpl_8(var c_NPC slf)
{
	Info_Tpl_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Tpl_8_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Tpl_8_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Tpl_8_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Tpl_8_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_TPL_8_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
