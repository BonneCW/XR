// ****************************
// EVT_TELEPORTSTATION_FUNC       
// ****************************
 
func void EVT_TELEPORTSTATION_FUNC ()
{	
  	if (!Hlp_StrCmp(Npc_GetNearestWP(hero), "MEERFOKUSDING"))
	|| (Npc_KnowsInfo(hero, PC_Fokus2_Einsetzen))
	{
		Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
		Snd_Play ("MFX_TELEPORT_CAST");
		Npc_ClearAIQueue (hero);	//Joly:wegen Seitwärts da durch rennen.
	};
	
	SCUsed_TELEPORTER = TRUE;			//SC hat schon mal einen Teleporter benutzt
	
	if (CurrentLevel == NEWWORLD_ZEN)
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Argibast))
	|| (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Gefangen)))
	&& (Npc_KnowsInfo(hero, Info_Mod_Urnol_Hi))
	{
		if (Npc_GetDistToWP(hero,"NW_TELEPORTSTATION_CITY")<3000)
		{
			AI_Teleport	(hero, "NW_TELEPORTSTATION_XARDAS"); 
		}
		else if (Npc_GetDistToWP(hero, "NW_TELEPORTSTATION_XARDAS")<3000)
		{
		 	AI_Teleport	(hero, "NW_TELEPORTSTATION_TAVERNE");
		}
		else if (Npc_GetDistToWP(hero, "NW_TELEPORTSTATION_TAVERNE")<3000)
		{
		 	AI_Teleport	(hero, "NW_TELEPORTSTATION_MAYA");
		}
		else if (Npc_GetDistToWP(hero, "NW_TELEPORTSTATION_MAYA")<3000)
		{
			AI_Teleport	(hero, "NW_TELEPORTSTATION_CITY"); 
		}
		else	//else fall wird nicht benutzt, nur zur sicherheit
		{
			AI_Teleport	(hero, "MARKT"); 
		};			
	}
	else if (CurrentLevel == ADDONWORLD_ZEN)
	{
		if (Hlp_StrCmp(Npc_GetNearestWP(hero), "ADW_ENTRANCE_TELEPORT_NORTH_WP"))
		{
			AI_Teleport	(hero, "ADW_PORTALTEMPEL_TELEPORTSTATION");
		}
		else if	(Hlp_StrCmp(Npc_GetNearestWP(hero), "ADW_ENTRANCE_TELEPORT_EAST_WP"))
		{
			AI_Teleport	(hero, "BL_DOWN_CENTER_08");
		}
		else if	(Hlp_StrCmp(Npc_GetNearestWP(hero), "ADW_ENTRANCE_TELEPORT_SOUTHEAST_WP"))
		{
			AI_Teleport	(hero, "ADW_SOUTHEAST_TELEPORTSTATION");
		}
		else if	(Hlp_StrCmp(Npc_GetNearestWP(hero), "ADW_ENTRANCE_TELEPORT_SOUTHWEST_WP"))
		{
			AI_Teleport	(hero, "ADW_SOUTHWEST_TELEPORTSTATION");
		}
		else if	(Hlp_StrCmp(Npc_GetNearestWP(hero), "ADW_ENTRANCE_TELEPORT_WEST_WP"))
		{
			AI_Teleport	(hero, "ADW_PIRATES_TELEPORTSTATION");
		}
		else if	(Hlp_StrCmp(Npc_GetNearestWP(hero), "ADW_ADANOSTEMPEL_RAVENTELEPORT_OUT"))
		{
			AI_Teleport	(hero, "ADW_ADANOSTEMPEL_TELEPORTSTATION");
		}
		else	//immer zurück zum ADW_ENTRANCE für alle anderen Teleportstations
		{
			if (Hlp_StrCmp(Npc_GetNearestWP(hero), "MEERFOKUSDING"))
			&& (Npc_KnowsInfo(hero, PC_Fokus2_Einsetzen))
			{
				AI_Teleport	(hero, "ADW_ENTRANCE"); 
			}
			else if (!Hlp_StrCmp(Npc_GetNearestWP(hero), "MEERFOKUSDING"))
			{
				AI_Teleport	(hero, "ADW_ENTRANCE");
			};
		};
	};	
};
var int TriggeredTeleporterADW;
var int ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime;
func void ADW_PORTALTEMPEL_FOCUS_FUNC ()//Joly: kommt, wenn ein Focusstein in ein Sockel eingesetzt wird.
{	
	Npc_RemoveInvItems	(hero ,ItMi_Focus, 1);
	TriggeredTeleporterADW = (TriggeredTeleporterADW + 1);
	Snd_Play ("MFX_TELEKINESIS_STARTINVEST");
	
	if (TriggeredTeleporterADW >= 5)
	{
		SC_ADW_ActivatedAllTelePortStones = TRUE;
	};
	

	if (ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime == FALSE)
	&& (Npc_GetDistToWP(hero,"ADW_PORTALTEMPEL_TELEPORTSTATION") < 3000)
	{
		ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime = TRUE;
	};
};  

FUNC VOID EVT_TELEPORTSTATION_VINO()
{
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue (hero);	//Joly:wegen Seitwärts da durch rennen.

	AI_Teleport	(hero, "NW_FOREST_VINOSKELLEREI_01");
};

FUNC VOID EVT_TELEPORTSTATION_VINO2()
{
	Wld_PlayEffect("spellFX_Teleport_RING",  self  , self	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue (self);	//Joly:wegen Seitwärts da durch rennen.

	AI_Teleport	(self, "WP_MARIOTOUR_04");

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_912_BAU_Vino_NW))
	{
		B_StartOtherRoutine	(self, "START");

		B_SetTopicStatus	(TOPIC_MOD_VINO_WO, LOG_SUCCESS);
	};
};