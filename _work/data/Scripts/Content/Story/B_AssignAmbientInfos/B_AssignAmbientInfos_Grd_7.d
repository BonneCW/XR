// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_grd_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_grd_7_EXIT_Condition;
	information	= Info_grd_7_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_grd_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_grd_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_grd_7_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_7_EinerVonEuchWerden_Condition;
	information	= Info_grd_7_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Was muß ich tun, um bei Thorus' Gardisten aufgenommen zu werden?";
};                       

FUNC INT Info_grd_7_EinerVonEuchWerden_Condition()
{
	if	(Schatten_Dabei == FALSE)
	&&	(Gardist_Dabei == FALSE)
	&&  (Erzbaron_Dabei == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID Info_grd_7_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_grd_7_EinerVonEuchWerden_15_00"); //Was muss ich tun, um bei Thorus' Gardisten aufgenommen zu werden?
	AI_Output(self,hero,"Info_grd_7_EinerVonEuchWerden_07_01"); //Du?! Du machst mir Spaß. Kommst hier rein und willst direkt ganz nach oben, was?
	AI_Output(self,hero,"Info_grd_7_EinerVonEuchWerden_07_02"); //Thorus macht nur die Besten seiner Leute zu Gardisten.
	AI_Output(self,hero,"Info_grd_7_EinerVonEuchWerden_07_03"); //Du wirst wie alle anderen anfangen müssen, und deine Loyalität als Schatten unter Beweis stellen.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_grd_7_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_7_WichtigePersonen_Condition;
	information	= Info_grd_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT Info_grd_7_WichtigePersonen_Condition()
{	
	if (Schatten_Dabei == FALSE)
	&& (Gardist_Dabei == FALSE)
	&& (Erzbaron_Dabei == FALSE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_grd_7_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,hero,"Info_grd_7_WichtigePersonen_07_01"); //Thorus kontrolliert alles, was im Lager läuft.
	AI_Output(self,hero,"Info_grd_7_WichtigePersonen_07_02"); //Wenn du hier aufgenommen werden willst, ist er der Mann, mit dem du reden musst.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_grd_7_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_7_DasLager_Condition;
	information	= Info_grd_7_DasLager_Info;
	permanent	= 1;
	description = "Arbeiten alle Leute hier für die Erzbarone?";
};                       

FUNC INT Info_grd_7_DasLager_Condition()
{	
	if (Schatten_Dabei == FALSE)
	&& (Gardist_Dabei == FALSE)
	&& (Erzbaron_Dabei == FALSE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_DasLager_Info()
{
	AI_Output(hero,self,"Info_grd_7_DasLager_15_00"); //Arbeiten alle Leute hier für Thorus?
	AI_Output(self,hero,"Info_grd_7_DasLager_07_01"); //Nein. Die meisten hier sind einfache Buddler.
	AI_Output(self,hero,"Info_grd_7_DasLager_07_02"); //Nur wir Gardisten und die Schatten sind Thorus' Leute.
	Info_ClearChoices(Info_grd_7_DasLager);
	Info_AddChoice(Info_grd_7_DasLager, "ZURÜCK", Info_grd_7_DasLager_Zurueck);
	Info_AddChoice(Info_grd_7_DasLager, "Was tun die Gardisten?", Info_grd_7_DasLager_Gardisten);
	Info_AddChoice(Info_grd_7_DasLager, "Was ist die Aufgabe der Schatten?", Info_grd_7_DasLager_Schatten);
	Info_AddChoice(Info_grd_7_DasLager, "Wofür sind die Buddler da?", Info_grd_7_DasLager_Buddler);
};

FUNC VOID Info_grd_7_DasLager_ZURUECK()
{
	Info_ClearChoices(Info_grd_7_DasLager);
};

FUNC VOID Info_grd_7_DasLager_Gardisten()
{
	AI_Output(hero,self,"Info_grd_7_DasLager_WasIstAerger_15_00"); //Was tun die Gardisten?
	AI_Output(self,hero,"Info_grd_7_DasLager_WasIstAerger_07_01"); //Wir bewachen das Lager und beschützen die Buddler.
	AI_Output(self,hero,"Info_grd_7_DasLager_WasIstAerger_07_02"); //Mit Sold, den Thorus uns zahlt und dem Schutzgeld, das wir von den Buddlern bekommen, kann man seine Zeit ganz gut rumkriegen.
};

FUNC VOID Info_grd_7_DasLager_Schatten()
{
	AI_Output(hero,self,"Info_grd_7_DasLager_Schatten_15_00"); //Was ist die Aufgabe der Schatten?
	AI_Output(self,hero,"Info_grd_7_DasLager_Schatten_07_01"); //Die Schatten sorgen dafür, dass Thorus' Befehle ausgeführt werden.
	AI_Output(self,hero,"Info_grd_7_DasLager_Schatten_07_02"); //Die meisten von ihnen sind Speichellecker, die sich hocharbeiten wollen, aber wenn du hier was werden willst, ist das der einzige Weg.
	AI_Output(self,hero,"Info_grd_7_DasLager_Schatten_07_03"); //Wenn du lange genug deine Aufgaben erledigt hast, ohne zu versagen, kannst du einer von uns werden.
	AI_Output(self,hero,"Info_grd_7_DasLager_Schatten_07_04"); //Wenn du erst zu Thorus' Leuten gehörst, kann dir niemand in der ganzen Kolonie mehr was anhaben, Kleiner!
};

FUNC VOID Info_grd_7_DasLager_Buddler()
{
	AI_Output(hero,self,"Info_grd_7_DasLager_Buddler_15_00"); //Wofür sind die Buddler da?
	AI_Output(self,hero,"Info_grd_7_DasLager_Buddler_07_01"); //Gute Frage! Die Dreckfresser sollten eigentlich in der alten Mine sein.
	AI_Output(self,hero,"Info_grd_7_DasLager_Buddler_07_02"); //Früher sind sie gekommen, wenn sie 'ne Zeit lang in der Mine waren, um ihren Anteil auszugeben.
	AI_Output(self,hero,"Info_grd_7_DasLager_Buddler_07_03"); //Wenn alles verprasst war, ging's wieder ab in die Mine. Die meisten hier lebten so.
	AI_Output(self,hero,"Info_grd_7_DasLager_Buddler_07_04"); //Doch da die Mine eingestürzt ist, bleiben die Buddler jetzt die ganze Zeit hier. Du solltest mit Thorus reden, wenn du's nicht schon getan hast.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_grd_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_7_DieLage_Condition;
	information	= Info_grd_7_DieLage_Info;
	permanent	= 1;
	description = "Wie steht's?";
};                       

FUNC INT Info_grd_7_DieLage_Condition()
{	
	if (Schatten_Dabei == FALSE)
	&& (Gardist_Dabei == FALSE)
	&& (Erzbaron_Dabei == FALSE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_DieLage_Info()
{
	AI_Output(hero,self,"Info_grd_7_DieLage_15_00"); //Wie steht's?
	AI_Output(self,hero,"Info_grd_7_DieLage_07_01"); //Für dich? Solange du nicht unserem Lager angehörst, nimmt dich hier keiner ernst, Kleiner!
};

INSTANCE Info_Mod_GRD_7_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_GRD_7_Pickpocket_Condition;
	information	= Info_Mod_GRD_7_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_GRD_7_Pickpocket_Condition()
{
	C_Beklauen	(75, ItMi_Gold, 400);
};

FUNC VOID Info_Mod_GRD_7_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_GRD_7_Pickpocket);

	Info_AddChoice	(Info_Mod_GRD_7_Pickpocket, DIALOG_BACK, Info_Mod_GRD_7_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_GRD_7_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_GRD_7_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_GRD_7_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_GRD_7_Pickpocket);
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

FUNC VOID B_AssignAmbientInfos_grd_7(var c_NPC slf)
{
	Info_grd_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_grd_7_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_grd_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_grd_7_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_grd_7_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_GRD_7_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
