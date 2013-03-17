// ***********************************************************************
// B_MemorizePlayerCrime
// ---------------------	
// Neue Tat überschreibt alte Tat, wenn sie schwerer oder gleichschwer ist
// Tag wird gemerkt
// CrimeAbsolutionLevel wird gemerkt
// ---------------------------------
// Ausserdem wird gepetzt, wenn NSC Mitglied einet Petz-Gruppe ist
// ***********************************************************************

func void B_MemorizePlayerCrime (var C_NPC slf, var C_NPC taeter, var int crime)
{	
	// EXIT IF...

	B_Vergiftet (slf);
	
	// ------ Sicherheitsabfrage ------
	if (!Npc_IsPlayer (taeter))
	{
		return;
	};
	
	// ------ Gilden, die nicht auf Crimes reagieren ------
	if (slf.guild == GIL_DMT)
	//|| (slf.guild == GIL_BDT) Addon Banditen reagieren auf Crimes, allerdings nur die im Lager 
	{
		return;
	};
	
	// FUNC

	var C_ITEM arm;
	
	arm = Npc_GetEquippedArmor(slf);

	// ------ PETZCRIME für HomeLocation überschreiben, wenn schwerer als vorherige ------
	if (crime > B_GetPlayerCrime(slf)) 
	{
		B_DeletePetzCrime(slf);

		if (crime == CRIME_MURDER)
		{
			if (Hlp_IsValidItem(arm))
			{
				if (Hlp_IsItem(arm, ItAr_Assassine_01) == TRUE)
				|| (Hlp_IsItem(arm, ItAr_Assassine_02) == TRUE)
				|| (Hlp_IsItem(arm, ItAr_BDT_M_01) == TRUE)
				|| (Hlp_IsItem(arm, ItAr_DMB_S) == TRUE)
				|| (Hlp_IsItem(arm, ItAr_BDT_H_01) == TRUE)
				|| (Hlp_IsItem(arm, ItAr_XARDAS) == TRUE)
				|| (Hlp_IsItem(arm, ItAr_RAVEN_ADDON) == TRUE)
				|| (Hlp_IsItem(arm, ItAr_SMK_L) == TRUE)
				|| (Hlp_IsItem(arm, Schwarzmagierrobe) == TRUE)
				|| (Hlp_IsItem(arm, ItAr_NOV_DMB_01) == TRUE)
				|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_568_NONE_Cassia_NW))
				|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_746_NONE_Ramirez_NW))
				|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_748_NONE_Rengaru_NW))
				|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_587_NONE_Jesper_NW))
				{
					B_Göttergefallen(1, 3);
				}
				else
				{
					B_Göttergefallen(3, 3);
				};
			}
			else
			{
				B_Göttergefallen(3, 3);
			};
		}
		else if (crime == CRIME_THEFT)
		{
			B_Göttergefallen(3, 2);
		}
		else if (crime == CRIME_ATTACK)
		{
			if (Hlp_IsValidItem(arm))
			{
				if (Hlp_IsItem(arm, ItAr_Assassine_01) == TRUE)
				|| (Hlp_IsItem(arm, ItAr_Assassine_02) == TRUE)
				|| (Hlp_IsItem(arm, ItAr_BDT_M_01) == TRUE)
				|| (Hlp_IsItem(arm, ItAr_DMB_S) == TRUE)
				|| (Hlp_IsItem(arm, ItAr_BDT_H_01) == TRUE)
				|| (Hlp_IsItem(arm, ItAr_XARDAS) == TRUE)
				|| (Hlp_IsItem(arm, ItAr_RAVEN_ADDON) == TRUE)
				|| (Hlp_IsItem(arm, ItAr_SMK_L) == TRUE)
				|| (Hlp_IsItem(arm, Schwarzmagierrobe) == TRUE)
				|| (Hlp_IsItem(arm, ItAr_NOV_DMB_01) == TRUE)
				|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_568_NONE_Cassia_NW))
				|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_746_NONE_Ramirez_NW))
				|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_748_NONE_Rengaru_NW))
				|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_587_NONE_Jesper_NW))
				{
					B_Göttergefallen(1, 1);
				}
				else
				{
					B_Göttergefallen(3, 1);
				};
			}
			else
			{
				B_Göttergefallen(3, 1);
			};
		}
		else if (crime == CRIME_SHEEPKILLER)
		{
			B_Göttergefallen(3, 2);
		};
		
		B_AddPetzCrime(slf, crime);
	};

	Mod_DidCrime = TRUE;

	// ------ neue Straftat überschreibt alte, wenn sie schwerer (oder gleichschwer) ist ------	
	if (crime >= B_GetPlayerCrime(slf))
	{
		B_SetAivar(slf, AIV_NpcSawPlayerCommit, crime);
		slf.aivar[AIV_NpcSawPlayerCommitDay] 	= Wld_GetDay();
		slf.aivar[AIV_CrimeAbsolutionLevel] 	= B_GetCurrentAbsolutionLevel(slf); //bleibt für NSCs, die NICHT zu City/Monastery/Farm gehören, immer 0 
	};
};