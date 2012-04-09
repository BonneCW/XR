FUNC VOID TELEPORTMONOLOGXD ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_TeleportMonologXD;
		Ai_ProcessInfos (her);
	};
}; 

INSTANCE PC_TeleportMonologXD_Teleport (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_TeleportMonologXD_Teleport_Condition;
	information	= PC_TeleportMonologXD_Teleport_Info;
	permanent	= 1;
	important	= 0;
	description	= "Teleport";
};

FUNC INT PC_TeleportMonologXD_Teleport_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	== MOBSI_TeleportMonologXD)
	{
		return 1;
	};
};

FUNC VOID PC_TeleportMonologXD_Teleport_Info()
{
	Info_ClearChoices	(PC_TeleportMonologXD_Teleport);

	Info_AddChoice	(PC_TeleportMonologXD_Teleport, DIALOG_BACK, PC_TeleportMonologXD_Teleport_BACK);
	Info_AddChoice	(PC_TeleportMonologXD_Teleport, "Khorinis", PC_TeleportMonologXD_Teleport_Khorinis);
};

FUNC VOID PC_TeleportMonologXD_Teleport_BACK()
{
	Info_ClearChoices	(PC_TeleportMonologXD_Teleport);
};

FUNC VOID PC_TeleportMonologXD_Teleport_Khorinis()
{
	Info_ClearChoices	(PC_TeleportMonologXD_Teleport);

	B_ENDPRODUCTIONDIALOG();

	AI_Teleport	(hero, "WAYTOKHORINIS");
};

INSTANCE PC_TeleportMonologXD_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_TeleportMonologXD_EXIT_Condition;
	information	= PC_TeleportMonologXD_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT PC_TeleportMonologXD_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_TeleportMonologXD)
	&& (Sägen	==	FALSE)
	{
		return 1;
	};
};

FUNC VOID PC_TeleportMonologXD_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};