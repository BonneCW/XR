var int	OrcCity_GateOpen;
var int TrollWinde_GateOpen;
var int OGYWinde_GateOpen;
FUNC int MC_OrcCity_Gate ()
{	
	PrintDebugNpc		(PD_ITEM_MOBSI,	"MC_OrcCity_Gate");

	if ((OrcCity_GateOpen == FALSE)) 
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...closed");
		AI_UseMob		(hero,"VWHEEL",1);
		AI_UseMob		(hero,"VWHEEL",-1);

		OrcCity_GateOpen = TRUE;	
		
		return 			TRUE;
	}
	else
	{
		PrintDebugNpc	(PD_ITEM_MOBSI,	"...open");

		if	!OrcCity_GateOpen
		{
			AI_PrintScreen	("Winde kann nicht benutzt werden", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
		};

		return 			FALSE;
	};
};

FUNC int MC_OGY_GATE ()
{	
	PrintDebugNpc		(PD_ITEM_MOBSI,	"MC_OGY_GATE");

	if (OGYWinde_GateOpen == FALSE)
	{
		AI_UseMob		(hero,"VWHEEL",1);
		AI_UseMob		(hero,"VWHEEL",-1);
	
		OGYWinde_GateOpen = TRUE;
	};
};

FUNC int ZELLENTUER_KNAST_01 ()
{	
	if (Mod_Zellentuer_Knast_01 == 0)
	{
		Mod_Zellentuer_Knast_01 = 1;
	}
	else
	{
		Mod_Zellentuer_Knast_01 = 0;
	};

	return TRUE;
};

var int Mod_CantharDoor;

FUNC int CANTHARSINSELDOOR ()
{	
	if (Npc_HasItems(hero, ItKe_Canthar) == 0)
	{
		if (Mod_CantharDoor == 0)
		{
			Mod_CantharDoor = 1;

			B_LogEntry	(TOPIC_MOD_MOE_DEAD, "Die Tür in die Freiheit ist verschlossen. Aber irgendwer wird schon den Schüssel haben.");
		};

		return FALSE;
	}
	else
	{
		return TRUE;
	};

	return TRUE;
};

FUNC int MC_OC_GATE_01 ()
{	
	if (Kapitel < 4)
	&& (Npc_KnowsInfo(hero, Info_Mod_Jackal_AtOC))
	&& (Mod_ALTor_01 == 1)
	{	
		if (Mod_ALTor_01 == 0)
		{
			Mod_ALTor_01 = 1;

			AI_UseMob		(hero,"VWHEEL",1);
		}
		else
		{
			Mod_ALTor_01 = 0;

			AI_UseMob		(hero,"VWHEEL",0);
		};

		AI_UseMob		(hero,"VWHEEL",-1);

		return TRUE;
	};

	return FALSE;
};

FUNC int EVT_TROLLSCHLUCHT_GATE_TRIGGER ()
{	
	PrintDebugNpc	(PD_ITEM_MOBSI,	"EVT_TROLLSCHLUCHT_GATE_TRIGGER");

	if (TrollWinde_GateOpen == FALSE)
	{
		AI_UseMob		(hero,"VWHEEL",1);
		AI_UseMob		(hero,"VWHEEL",-1);
	
		TrollWinde_GateOpen = TRUE;
	};

	return TRUE;
};

var int BELTruheOpen;

FUNC int BEL_TRUHE_BAUANLEITUNG ()
{	
	if ((BELTruheOpen == FALSE)) 
	&& (Npc_HasItems(hero, ItKe_Lockpick_Mage) == 1)
	{
		BELTruheOpen = TRUE;	
		
		Npc_RemoveInvItems	(hero, ItKe_Lockpick_Mage, 1);

		return 			TRUE;
	}
	else
	{
		if	!BELTruheOpen
		{
			AI_PrintScreen	("Truhe ist magisch verschlossen", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			if (Npc_KnowsInfo(hero, Info_Mod_Scar_Belagerung))
			&& (BEL_TruheMage == 0)
			{
				BEL_TruheMage = 1;

				B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Die Truhe ist magisch verschlossen. Ich sollte Scar um Rat fragen.");
			};
		};

		return 			FALSE;
	};
};

FUNC int CHECKONARSVERSTECK ()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Maria_BelohnungWasili))
	{
		return 			TRUE;
	}
	else
	{
		return 			FALSE;
	};
};

FUNC int ELENASHEXENTRUHE ()
{	
	if (Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13)
	{
		return 			TRUE;
	}
	else
	{
		AI_PrintScreen	("Lässt sich noch nicht öffnen!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

		return 			FALSE;
	};
};

FUNC int FOKUSTRUHE_KLOSTER ()
{	
	if (Mod_Prisma_KlosterFokus == TRUE)
	{
		return 			TRUE;
	}
	else
	{
		AI_PlayAni	(hero, "T_EXPLOSION");

		return 			FALSE;
	};
};

var int Mod_Ritualinsel_Stein;

FUNC int RITUALINSEL_STEIN ()
{	
	if (!Npc_KnowsInfo(hero, Info_Mod_Trimedron_Teleporter))
	{
		AI_PrintScreen	("Warum sollte ich?", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

		return FALSE;
	}
	else
	{
		Mod_Ritualinsel_Stein = TRUE;

		return TRUE;
	};

	return TRUE;
};

FUNC int RITUALINSEL_SOCKEL ()
{	
	if (Mod_Ritualinsel_Stein == 0)
	{
		AI_PrintScreen	("Das geht nicht, solange noch Steine davor liegen!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

		CreateInvItems	(hero, ItMi_Focus, 1);

		return FALSE;
	}
	else
	{
		return TRUE;
	};

	return TRUE;
};

FUNC INT EVT_CANOPENXARDASTOWERCHEST()
{
	if (Mod_XardasOWTower_Truhe == 0)
	{
		AI_PrintScreen	("So ist die Truhe nicht zu öffnen ...", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

		return FALSE;
	}
	else
	{
		return TRUE;
	};
};

FUNC VOID EVT_BIBENTDECKT_FUNC()
{
	if (Mod_BibEntdeckt == 0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Andokai_Hammer))
	{
		Mod_BibEntdeckt = 1;

		B_LogEntry	(TOPIC_MOD_DAEMONENBESCHWOERER, "Na, das sieht doch aus, als wäre ich erfolgreich gewesen. Wirklich beeindruckend. Da hat jemand lange gesammelt. Andokai wird es freuen, davon zu erfahren.");
	};
};