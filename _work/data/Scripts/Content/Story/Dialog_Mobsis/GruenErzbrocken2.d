FUNC VOID GruenErzbrocken2_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		if (Npc_HasItems(hero, ItMw_2H_Axe_L_01) == 0)
		{
			Print	("Ohne Spitzhacke geht das nicht!");

			AI_UseMob (hero, "ORE", -1);
			return;
		};

		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_GruenErzbrocken2;
		Ai_ProcessInfos (her);
	};
};

INSTANCE PC_GruenErzbrocken2_Addon_Hour (C_Info)
{
	npc			= PC_Hero;
	nr			= 2;
	condition		= PC_GruenErzbrocken2_Addon_Hour_Condition;
	information		= PC_GruenErzbrocken2_Addon_Hour_Info;
	permanent		= 0;
	description		= "Einfach mal hacken. "; 
};

FUNC INT PC_GruenErzbrocken2_Addon_Hour_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_GruenErzbrocken2)
	{	
		return TRUE;
	};
};

FUNC VOID PC_GruenErzbrocken2_Addon_Hour_Info()
{
	CreateInvItems (hero, ItMi_GreenNugget, 2);	

	PrintScreen ("2 grüne Erzbrocken gehackt!", -1, -1, FONT_ScreenSmall, 2);
};

INSTANCE PC_GruenErzbrocken2_End (C_Info)
{
	npc			= PC_Hero;
	nr			= 999;
	condition		= PC_GruenErzbrocken2_End_Condition;
	information		= PC_GruenErzbrocken2_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_GruenErzbrocken2_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_GruenErzbrocken2)
	{	
		return TRUE;
	};
};

FUNC VOID PC_GruenErzbrocken2_End_Info()
{
	B_ENDPRODUCTIONDIALOG ();
};