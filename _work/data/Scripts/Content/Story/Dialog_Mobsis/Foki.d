FUNC VOID Fokus1_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	&& (FokusBlockade == FALSE)
	{	
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Fokus1;
		Ai_ProcessInfos (her);
	}
	else if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	&& (FokusBlockade == TRUE)
	{	
		B_Say_Overlay	(hero, NULL, "$FOKUSNICHTEINSETZEN");
	};
}; 

FUNC VOID B_ActivateFokus ()
{
	Wld_SpawnNpcRange	(self,	Rat,	1,	1000);

	FokiEingesetzt += 1;

	if (FokiEingesetzt	==	5)
	{
		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );

		Wld_InsertNpc	(Mod_678_DMB_Xardas_AW,		"ADW_ENTRANCE");

		B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Ich habe alle fünf Foki eingesetzt. Beim Einsetzen des letzten Foki gab es ein Erdbeben. Ich sollte mal zu den Wassermagiern gehen.");

		B_GivePlayerXP	(300);

		B_SetTopicStatus	(TOPIC_MOD_FOKUSSUCHE, LOG_SUCCESS);

		Mod_HQ_FokusZuXardas = 1;

		B_StartOtherRoutine	(PC_Friend_AW, "TOT");
	};

	B_ENDPRODUCTIONDIALOG();

	PLAYER_MOBSI_PRODUCTION = 0;

	AI_StopProcessInfos	(hero);

	B_SetAivar (hero, AIV_INVINCIBLE, FALSE);

	if (hero.guild == GIL_NOV)
	{
		if (FokiEingesetzt == 2)
		{
			/*AI_Teleport	(hero, "AW_CAVE_MENSCHENFRESSER_01");*/

			FokusBlockade = TRUE;

			B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Verdammt, wie bin ich hier gelandet? Irgendwas muss mit den Teleporterplattformen schiefgelaufen sein.");

			Wld_InsertNpc	(Menschenfresser, "AW_CAVE_MENSCHENFRESSER_03");
		};

		if (FokiEingesetzt == 4)
		{
			FokusBlockade = TRUE;

			B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Nicht schon wieder. Und diesmal eine recht peinliche Situation.");

			B_SetLevelchange ("NewWorld\NewWorld.zen", "NW_CITY_LARIUS_BED");
		};
	};
};

INSTANCE PC_Fokus1_Einsetzen (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Fokus1_Einsetzen_Condition;
	information	= PC_Fokus1_Einsetzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Fokus einsetzen";
};

FUNC INT PC_Fokus1_Einsetzen_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Fokus1)
	&& (FokusBlockade == FALSE)
	&& (LEAVE_PORTALTEMPEL_FIRSTTIME_ONETIME == TRUE)
	{
		return 1;
	};
};

FUNC VOID PC_Fokus1_Einsetzen_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_Focus_Troll, 1);

	Wld_SendTrigger	("ADW_PORTALTEMPEL_FOCUSTRIGGERLIST");
	
	B_ActivateFokus();

	B_ENDPRODUCTIONDIALOG();
};

FUNC VOID Fokus2_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	&& (FokusBlockade == FALSE)
	{	
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Fokus2;
		Ai_ProcessInfos (her);
	}
	else if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	&& (FokusBlockade == TRUE)
	{	
		B_Say_Overlay	(hero, NULL, "$FOKUSNICHTEINSETZEN");
	};
}; 

INSTANCE PC_Fokus2_Einsetzen (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Fokus2_Einsetzen_Condition;
	information	= PC_Fokus2_Einsetzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Fokus einsetzen";
};

FUNC INT PC_Fokus2_Einsetzen_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Fokus2)
	&& (FokusBlockade == FALSE)
	&& (LEAVE_PORTALTEMPEL_FIRSTTIME_ONETIME == TRUE)
	{
		return 1;
	};
};

FUNC VOID PC_Fokus2_Einsetzen_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_Focus_Meer, 1);

	Wld_SendTrigger	("ADW_BANDITS_FOCUSTRIGGERLIST");
	Wld_SendTrigger	("EVT_PFXSOUTHEASTTELEPORT");
	
	B_ActivateFokus();

	B_ENDPRODUCTIONDIALOG();
};

FUNC VOID Fokus3_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	&& (FokusBlockade == FALSE)
	{	
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Fokus3;
		Ai_ProcessInfos (her);
	}
	else if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	&& (FokusBlockade == TRUE)
	{	
		B_Say_Overlay	(hero, NULL, "$FOKUSNICHTEINSETZEN");
	};
}; 

INSTANCE PC_Fokus3_Einsetzen (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Fokus3_Einsetzen_Condition;
	information	= PC_Fokus3_Einsetzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Fokus einsetzen";
};

FUNC INT PC_Fokus3_Einsetzen_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Fokus3)
	&& (FokusBlockade == FALSE)
	&& (LEAVE_PORTALTEMPEL_FIRSTTIME_ONETIME == TRUE)
	{
		return 1;
	};
};

FUNC VOID PC_Fokus3_Einsetzen_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_Focus_Stonehenge, 1);

	Wld_SendTrigger	("ADW_PIRATES_FOCUSTRIGGERLIST");
	
	B_ActivateFokus();

	B_ENDPRODUCTIONDIALOG();
};

FUNC VOID Fokus4_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	&& (FokusBlockade == FALSE)
	{	
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Fokus4;
		Ai_ProcessInfos (her);
	}
	else if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	&& (FokusBlockade == TRUE)
	{	
		B_Say_Overlay	(hero, NULL, "$FOKUSNICHTEINSETZEN");
	};
}; 

INSTANCE PC_Fokus4_Einsetzen (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Fokus4_Einsetzen_Condition;
	information	= PC_Fokus4_Einsetzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Fokus einsetzen";
};

FUNC INT PC_Fokus4_Einsetzen_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Fokus4)
	&& (FokusBlockade == FALSE)
	&& (LEAVE_PORTALTEMPEL_FIRSTTIME_ONETIME == TRUE)
	{
		return 1;
	};
};

FUNC VOID PC_Fokus4_Einsetzen_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_Focus_Kloster, 1);
	
	if (Mod_Echsis > 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Albi_VertrauenGewonnen)) {
		Mod_Echsis = 1;
	};

	Wld_SendTrigger	("ADW_ADANOSTEMPEL_FOCUSTRIGGERLIST");
	
	B_ActivateFokus();

	B_ENDPRODUCTIONDIALOG();
};

FUNC VOID Fokus5_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	&& (FokusBlockade == FALSE)
	{	
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Fokus5;
		Ai_ProcessInfos (her);
	}
	else if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	&& (FokusBlockade == TRUE)
	{	
		B_Say_Overlay	(hero, NULL, "$FOKUSNICHTEINSETZEN");
	};
}; 

INSTANCE PC_Fokus5_Einsetzen (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Fokus5_Einsetzen_Condition;
	information	= PC_Fokus5_Einsetzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Fokus einsetzen";
};

FUNC INT PC_Fokus5_Einsetzen_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Fokus5)
	&& (FokusBlockade == FALSE)
	&& (LEAVE_PORTALTEMPEL_FIRSTTIME_ONETIME == TRUE)
	{
		return 1;
	};
};

FUNC VOID PC_Fokus5_Einsetzen_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_Focus_Bergfestung, 1);

	Wld_SendTrigger	("ADW_SOUTHWEST_FOCUSTRIGGERLIST");
	
	B_ActivateFokus();

	B_ENDPRODUCTIONDIALOG();
};