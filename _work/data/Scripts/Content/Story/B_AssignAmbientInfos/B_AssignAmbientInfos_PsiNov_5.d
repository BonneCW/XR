// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_PsiNov_5_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_PsiNov_5 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_PsiNov_5_EXIT_Condition;
	information	= Info_PsiNov_5_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_PsiNov_5_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_PsiNov_5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_PsiNov_5_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_PsiNov_5_EinerVonEuchWerden_Condition;
	information	= Info_PsiNov_5_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Wie werde ich in diesem Lager aufgenommen?";
};                       

FUNC INT Info_PsiNov_5_EinerVonEuchWerden_Condition()
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

FUNC VOID Info_PsiNov_5_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_PsiNov_5_EinerVonEuchWerden_15_00"); //Wie werde ich in diesem Lager aufgenommen?
	AI_Output(self,hero,"Info_PsiNov_5_EinerVonEuchWerden_05_01"); //Nichts leichter als das. Rede einfach mit einigen der niederen Gurus. Sie werden dir weiterhelfen.
	AI_Output(self,hero,"Info_PsiNov_5_EinerVonEuchWerden_05_02"); //Es wird dir hier gefallen - wirst schon sehen.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_PsiNov_5_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_PsiNov_5_WichtigePersonen_Condition;
	information	= Info_PsiNov_5_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT Info_PsiNov_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_PsiNov_5_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_PsiNov_5_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,hero,"Info_PsiNov_5_WichtigePersonen_05_01"); //Die Gurus haben alles unter Kontrolle. Aber wenn man nicht auffällt, lassen sie einen in Ruhe.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_PsiNov_5_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_PsiNov_5_DasLager_Condition;
	information	= Info_PsiNov_5_DasLager_Info;
	permanent	= 1;
	description = "Was kannst du mit über dieses Lager erzählen?";
};                       

FUNC INT Info_PsiNov_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_PsiNov_5_DasLager_Info()
{
	AI_Output(hero,self,"Info_PsiNov_5_DasLager_15_00"); //Was kannst du mir über dieses Lager erzählen?
	AI_Output(self,hero,"Info_PsiNov_5_DasLager_05_01"); //Es ist der beste Ort, an dem du in diesem Tal sein kannst.
	AI_Output(self,hero,"Info_PsiNov_5_DasLager_05_02"); //Selbst wenn du nicht an unsere Lehren glaubst, bekommst du deine tägliche Ration Essen und Sumpfkraut. Du brauchst nur zu Fortuno zu gehen.
	AI_Output(hero,self,"Info_PsiNov_5_DasLager_15_03"); //Und wo finde ich den?
	AI_Output(hero,self,"Info_PsiNov_5_DasLager_05_04"); //Unten an Cor Kaloms altem Labor. In der Nähe des großen Tempelplatzes.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_PsiNov_5_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_PsiNov_5_DieLage_Condition;
	information	= Info_PsiNov_5_DieLage_Info;
	permanent	= 1;
	description = "Wie sieht's aus?";
};                       

FUNC INT Info_PsiNov_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_PsiNov_5_DieLage_Info()
{
	AI_Output(hero,self,"Info_PsiNov_5_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self,hero,"Info_PsiNov_5_DieLage_05_01"); //Kann mich nicht beklagen. Bist du neu hier?
	AI_Output(hero,self,"Info_PsiNov_5_DieLage_15_02"); //Ich bin vor kurzem angekommen.
};

INSTANCE Info_Mod_PsiNov_5_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_PsiNov_5_Pickpocket_Condition;
	information	= Info_Mod_PsiNov_5_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_PsiNov_5_Pickpocket_Condition()
{
	C_Beklauen	(30 + r_max(30), ItMi_Gold, 15 + r_max(5));
};

FUNC VOID Info_Mod_PsiNov_5_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_PsiNov_5_Pickpocket);

	Info_AddChoice	(Info_Mod_PsiNov_5_Pickpocket, DIALOG_BACK, Info_Mod_PsiNov_5_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_PsiNov_5_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_PsiNov_5_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_PsiNov_5_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_PsiNov_5_Pickpocket);
};

FUNC VOID Info_Mod_PsiNov_5_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_PsiNov_5_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_PsiNov_5_Pickpocket);

		Info_AddChoice	(Info_Mod_PsiNov_5_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_PsiNov_5_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_PsiNov_5_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_PsiNov_5_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_PsiNov_5_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_PsiNov_5_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_PsiNov_5_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_PsiNov_5_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_PsiNov_5_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_PsiNov_5_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_PsiNov_5_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_PsiNov_5_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_PsiNov_5_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PsiNov_5(var c_NPC slf)
{
	Info_PsiNov_5_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_PsiNov_5_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_PsiNov_5_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_PsiNov_5_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_PsiNov_5_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_PsiNov_5_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
