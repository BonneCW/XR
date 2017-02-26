FUNC VOID BIERFASSORLAN_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	&& (FokusBlockade == FALSE)
	{	
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_BierfassOrlan;
		Ai_ProcessInfos (her);
	};
}; 

INSTANCE PC_BierfassOrlan_Daemonisch (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_BierfassOrlan_Daemonisch_Condition;
	information	= PC_BierfassOrlan_Daemonisch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Klosterwein ins Bier mischen";
};

FUNC INT PC_BierfassOrlan_Daemonisch_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_BierfassOrlan)
	&& (Npc_HasItems(hero, ItFo_KWine) >= 1)
	&& (Mod_HQ_Daemonisch_Orlan == 0)
	{
		return 1;
	};
};

FUNC VOID PC_BierfassOrlan_Daemonisch_Info()
{
	Npc_RemoveInvItems	(hero, ItFo_KWine, 1);

	B_ENDPRODUCTIONDIALOG();

	B_GivePlayerXP	(250);

	Mod_HQ_Daemonisch_Orlan = 1;

	B_StartOtherRoutine	(Mod_776_NONE_Orlan_NW, "DAEMONISCH");
};

INSTANCE PC_BierfassOrlan_Daemonisch2 (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_BierfassOrlan_Daemonisch2_Condition;
	information	= PC_BierfassOrlan_Daemonisch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Trank gegen Besessenheit ins Bier mischen";
};

FUNC INT PC_BierfassOrlan_Daemonisch2_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_BierfassOrlan)
	&& (Npc_HasItems(hero, ItPo_HealBesessenheit) >= 1)
	&& (Mod_HQ_Daemonisch_Orlan == 0)
	{
		return 1;
	};
};

FUNC VOID PC_BierfassOrlan_Daemonisch2_Info()
{
	Npc_RemoveInvItems	(hero, ItPo_HealBesessenheit, 1);

	B_ENDPRODUCTIONDIALOG();

	B_GivePlayerXP	(250);

	Mod_HQ_Daemonisch_Orlan = 1;

	B_StartOtherRoutine	(Mod_776_NONE_Orlan_NW, "DAEMONISCH");
};

INSTANCE PC_BierfassOrlan_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_BierfassOrlan_EXIT_Condition;
	information	= PC_BierfassOrlan_EXIT_Info;
	permanent	= 0;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT PC_BierfassOrlan_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_BierfassOrlan)
	{
		return 1;
	};
};

FUNC VOID PC_BierfassOrlan_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};