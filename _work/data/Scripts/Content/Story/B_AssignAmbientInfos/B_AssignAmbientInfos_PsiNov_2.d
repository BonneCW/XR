// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_PsiNov_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_PsiNov_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_PsiNov_2_EXIT_Condition;
	information	= Info_PsiNov_2_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_PsiNov_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_PsiNov_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_PsiNov_2_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_PsiNov_2_EinerVonEuchWerden_Condition;
	information	= Info_PsiNov_2_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Ich will bei euch mitmachen.";
};                       

FUNC INT Info_PsiNov_2_EinerVonEuchWerden_Condition()
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

FUNC VOID Info_PsiNov_2_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_PsiNov_2_EinerVonEuchWerden_15_00"); //Ich will bei euch mitmachen.
	AI_Output(self,hero,"Info_PsiNov_2_EinerVonEuchWerden_02_01"); //Du hast dich entschieden dich uns anzuschließen? Vor dir liegt ein Weg voller Freude und Glück.
	AI_Output(self,hero,"Info_PsiNov_2_EinerVonEuchWerden_02_02"); //Gehe zu Cor Cadar, er entscheidet, für welche Aufgabe du am besten geeignet bist.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_PsiNov_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_PsiNov_2_WichtigePersonen_Condition;
	information	= Info_PsiNov_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer sind eure Anführer?";
};                       

FUNC INT Info_PsiNov_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_PsiNov_2_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_PsiNov_2_WichtigePersonen_15_00"); //Wer sind eure Anführer?
	AI_Output(self,hero,"Info_PsiNov_2_WichtigePersonen_02_01"); //Cor Cadar und Cor Angar sind unsere geistigen Väter.
	AI_Output(self,hero,"Info_PsiNov_2_WichtigePersonen_02_02"); //Sie sorgen dafür, dass wir in Sicherheit sind und die Krautproduktion ohne Schwierigkeiten verläuft.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_PsiNov_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_PsiNov_2_DasLager_Condition;
	information	= Info_PsiNov_2_DasLager_Info;
	permanent	= 1;
	description = "Was gibt es wichtiges über diesen Ort zu wissen?";
};                       

FUNC INT Info_PsiNov_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_PsiNov_2_DasLager_Info()
{
	AI_Output(hero,self,"Info_PsiNov_2_DasLager_15_00"); //Was gibt es wichtiges über diesen Ort zu wissen?
	AI_Output(self,hero,"Info_PsiNov_2_DasLager_02_01"); //Es ist ein Ort des Glaubens, Bruder. Wir haben nicht viel, aber was wir haben, teilen wir gerne mit denen, die sich unsere Lehren anhören wollen.
	AI_Output(self,hero,"Info_PsiNov_2_DasLager_02_02"); //Suche einen der Gurus auf, und lass deine Seele bereichern.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_PsiNov_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_PsiNov_2_DieLage_Condition;
	information	= Info_PsiNov_2_DieLage_Info;
	permanent	= 1;
	description = "Wie sieht's aus?";
};                       

FUNC INT Info_PsiNov_2_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_PsiNov_2_DieLage_Info()
{
	AI_Output(hero,self,"Info_PsiNov_2_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self,hero,"Info_PsiNov_2_DieLage_02_01"); //Ich habe wenig Zeit - muss mich um meine Aufgaben kümmern.
};

INSTANCE Info_Mod_PsiNov_2_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_PsiNov_2_Pickpocket_Condition;
	information	= Info_Mod_PsiNov_2_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_PsiNov_2_Pickpocket_Condition()
{
	C_Beklauen	(50, ItMi_Gold, 110);
};

FUNC VOID Info_Mod_PsiNov_2_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_PsiNov_2_Pickpocket);

	Info_AddChoice	(Info_Mod_PsiNov_2_Pickpocket, DIALOG_BACK, Info_Mod_PsiNov_2_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_PsiNov_2_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_PsiNov_2_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_PsiNov_2_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_PsiNov_2_Pickpocket);
};

FUNC VOID Info_Mod_PsiNov_2_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_PsiNov_2_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_PsiNov_2_Pickpocket);

		Info_AddChoice	(Info_Mod_PsiNov_2_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_PsiNov_2_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_PsiNov_2_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_PsiNov_2_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_PsiNov_2_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_PsiNov_2_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_PsiNov_2_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_PsiNov_2_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_PsiNov_2_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_PsiNov_2_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_PsiNov_2_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_PsiNov_2_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_PsiNov_2_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PsiNov_2(var c_NPC slf)
{
	Info_PsiNov_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_PsiNov_2_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_PsiNov_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_PsiNov_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_PsiNov_2_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_PsiNov_2_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
