var int Erzwaffen;
var int Normalwaffen;
var int Starkwaffen;
var int PfeileMachen;
var int BolzenMachen;
var int Verbessern;
var int Set;


// *****************
// Amboß-Dialoge
// -------------
// hängen am Spieler
// *****************

//*******************************************************
INSTANCE PC_ItMw_Prunkschwert (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_Prunkschwert_Condition;
	information		= PC_ItMw_Prunkschwert_Info;
	permanent		= 0;
	description	= "Prunkschwert schmieden";
};

FUNC INT PC_ItMw_Prunkschwert_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest6))
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 4)
	&& (Npc_HasItems (hero, ItMi_Addon_WhitePearl) >= 3)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_Prunkschwert_Info ()
{
	Npc_RemoveInvItems (hero, ItMiSwordRawHot, 4);
	Npc_RemoveInvItems (hero, ItMi_Addon_WhitePearl, 3);

	CreateInvItems 	    (hero, ItMw_Prunkschwert,  1); 
	Print (PRINT_SmithSuccess);
	
	B_ENDPRODUCTIONDIALOG ();
	Normalwaffen = FALSE;
};

// Gewöhnliche Waffen herstellen

//*******************************************************
INSTANCE PC_Common (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Common_Condition;
	information		= PC_Common_Info;
	permanent		= TRUE;
	description		= "Gewöhnliche Waffen schmieden";
};

FUNC INT PC_Common_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Starkwaffen == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Common_Info ()
{
	Normalwaffen = TRUE;
};

//*******************************************************
INSTANCE PC_Stark (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Stark_Condition;
	information		= PC_Stark_Info;
	permanent		= TRUE;
	description		= "Gewöhnliche Waffen besser schmieden";
};

FUNC INT PC_Stark_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Starkwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Stark_Info ()
{
	Starkwaffen = TRUE;
};

//*******************************************************
INSTANCE PC_ItMw_1H_Common (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_1H_Common_Condition;
	information		= PC_ItMw_1H_Common_Info;
	permanent		= TRUE;
};

FUNC INT PC_ItMw_1H_Common_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE))
	&& (Normalwaffen == TRUE)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_1H_Common_Info ()
{
	Npc_RemoveInvItems (hero, ItMiSwordRawHot, 1);

	if (Npc_KnowsInfo(hero, Info_Mod_Andre_HaradLehrling4))
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_1H_Common_01_BonusMeisterschmied,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_1H_Common_01_Meisterschmied,  1); 
		};
	}
	else
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_1H_Common_01_Bonus,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_1H_Common_01,  1); 
		};
	};

	Print (PRINT_SmithSuccess);
	
	B_ENDPRODUCTIONDIALOG ();
	Normalwaffen = FALSE;
};

//*******************************************************
INSTANCE PC_WEAPON_1H_Harad_01 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_WEAPON_1H_Harad_01_Condition;
	information		= PC_WEAPON_1H_Harad_01_Info;
	permanent		= TRUE;
};

FUNC INT PC_WEAPON_1H_Harad_01_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE))
	&& (Normalwaffen == TRUE)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_WEAPON_1H_Harad_01_Info ()
{
	Npc_RemoveInvItems (hero, ItMiSwordRawHot, 1);

	if (Npc_KnowsInfo(hero, Info_Mod_Andre_HaradLehrling4))
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_Schwert1_BonusMeisterschmied,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_Schwert1_Meisterschmied,  1); 
		};
	}
	else
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_Schwert1_Bonus,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_Schwert1,  1); 
		};
	};

	Print (PRINT_SmithSuccess);
	
	B_ENDPRODUCTIONDIALOG ();
	Normalwaffen = FALSE;
};
//*******************************************************
INSTANCE PC_WEAPON_1H_Harad_02 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_WEAPON_1H_Harad_02_Condition;
	information		= PC_WEAPON_1H_Harad_02_Info;
	permanent		= TRUE;
};

FUNC INT PC_WEAPON_1H_Harad_02_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE))
	&& (Normalwaffen == TRUE)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_WEAPON_1H_Harad_02_Info ()
{
	Npc_RemoveInvItems (hero, ItMiSwordRawHot, 1);

	if (Npc_KnowsInfo(hero, Info_Mod_Andre_HaradLehrling4))
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_Schwert4_BonusMeisterschmied,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_Schwert4_Meisterschmied,  1); 
		};
	}
	else
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_Schwert4_Bonus,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_Schwert4,  1); 
		};
	};

	Print (PRINT_SmithSuccess);
	
	B_ENDPRODUCTIONDIALOG ();
	Normalwaffen = FALSE;
};
//*******************************************************
INSTANCE PC_WEAPON_1H_Harad_03 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_WEAPON_1H_Harad_03_Condition;
	information		= PC_WEAPON_1H_Harad_03_Info;
	permanent		= TRUE;
};

FUNC INT PC_WEAPON_1H_Harad_03_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE))
	&& (Normalwaffen == TRUE)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_WEAPON_1H_Harad_03_Info ()
{
	Npc_RemoveInvItems (hero, ItMiSwordRawHot, 1);

	if (Npc_KnowsInfo(hero, Info_Mod_Andre_HaradLehrling4))
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_Rubinklinge_BonusMeisterschmied,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_Rubinklinge_Meisterschmied,  1); 
		};
	}
	else
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_Rubinklinge_Bonus,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_Rubinklinge,  1); 
		};
	};

	Print (PRINT_SmithSuccess);
	
	B_ENDPRODUCTIONDIALOG ();
	Normalwaffen = FALSE;
};
//*******************************************************
INSTANCE PC_WEAPON_1H_Harad_04 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_WEAPON_1H_Harad_04_Condition;
	information		= PC_WEAPON_1H_Harad_04_Info;
	permanent		= TRUE;
};

FUNC INT PC_WEAPON_1H_Harad_04_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == TRUE))
	&& (Normalwaffen == TRUE)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_WEAPON_1H_Harad_04_Info ()
{
	Npc_RemoveInvItems (hero, ItMiSwordRawHot, 1);

	if (Npc_KnowsInfo(hero, Info_Mod_Andre_HaradLehrling4))
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_ElBastardo_BonusMeisterschmied,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_ElBastardo_Meisterschmied,  1); 
		};
	}
	else
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_ElBastardo_Bonus,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_ElBastardo,  1); 
		};
	};

	Print (PRINT_SmithSuccess);
	
	B_ENDPRODUCTIONDIALOG ();
	Normalwaffen = FALSE;
};

//*******************************************************
INSTANCE PC_Stark_ItMw_1H_Common (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Stark_ItMw_1H_Common_Condition;
	information		= PC_Stark_ItMw_1H_Common_Info;
	permanent		= TRUE;
};

FUNC INT PC_Stark_ItMw_1H_Common_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE))
	&& (Starkwaffen == TRUE)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 4)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Stark_ItMw_1H_Common_Info ()
{
	Npc_RemoveInvItems (hero, ItMiSwordRawHot, 4);

	if (Npc_KnowsInfo(hero, Info_Mod_Andre_HaradLehrling4))
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_1H_Common_01_StarkBonusMeisterschmied,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_1H_Common_01_StarkMeisterschmied,  1); 
		};
	}
	else
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_1H_Common_01_StarkBonus,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_1H_Common_01_Stark,  1); 
		};
	};

	Print (PRINT_SmithSuccess);
	
	B_ENDPRODUCTIONDIALOG ();
	Starkwaffen = FALSE;
};

//*******************************************************
INSTANCE PC_Stark_WEAPON_1H_Harad_01 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Stark_WEAPON_1H_Harad_01_Condition;
	information		= PC_Stark_WEAPON_1H_Harad_01_Info;
	permanent		= TRUE;
};

FUNC INT PC_Stark_WEAPON_1H_Harad_01_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE))
	&& (Starkwaffen == TRUE)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 4)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Stark_WEAPON_1H_Harad_01_Info ()
{
	Npc_RemoveInvItems (hero, ItMiSwordRawHot, 4);

	if (Npc_KnowsInfo(hero, Info_Mod_Andre_HaradLehrling4))
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_Schwert1_StarkBonusMeisterschmied,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_Schwert1_StarkMeisterschmied,  1); 
		};
	}
	else
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_Schwert1_StarkBonus,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_Schwert1_Stark,  1); 
		};
	};

	Print (PRINT_SmithSuccess);
	
	B_ENDPRODUCTIONDIALOG ();
	Starkwaffen = FALSE;
};
//*******************************************************
INSTANCE PC_Stark_WEAPON_1H_Harad_02 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Stark_WEAPON_1H_Harad_02_Condition;
	information		= PC_Stark_WEAPON_1H_Harad_02_Info;
	permanent		= TRUE;
};

FUNC INT PC_Stark_WEAPON_1H_Harad_02_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE))
	&& (Starkwaffen == TRUE)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 4)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Stark_WEAPON_1H_Harad_02_Info ()
{
	Npc_RemoveInvItems (hero, ItMiSwordRawHot, 4);

	if (Npc_KnowsInfo(hero, Info_Mod_Andre_HaradLehrling4))
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_Schwert4_StarkBonusMeisterschmied,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_Schwert4_StarkMeisterschmied,  1); 
		};
	}
	else
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_Schwert4_StarkBonus,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_Schwert4_Stark,  1); 
		};
	};

	Print (PRINT_SmithSuccess);
	
	B_ENDPRODUCTIONDIALOG ();
	Starkwaffen = FALSE;
};
//*******************************************************
INSTANCE PC_Stark_WEAPON_1H_Harad_03 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Stark_WEAPON_1H_Harad_03_Condition;
	information		= PC_Stark_WEAPON_1H_Harad_03_Info;
	permanent		= TRUE;
};

FUNC INT PC_Stark_WEAPON_1H_Harad_03_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE))
	&& (Starkwaffen == TRUE)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 4)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Stark_WEAPON_1H_Harad_03_Info ()
{
	Npc_RemoveInvItems (hero, ItMiSwordRawHot, 4);

	if (Npc_KnowsInfo(hero, Info_Mod_Andre_HaradLehrling4))
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_Rubinklinge_StarkBonusMeisterschmied,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_Rubinklinge_StarkMeisterschmied,  1); 
		};
	}
	else
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_Rubinklinge_StarkBonus,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_Rubinklinge_Stark,  1); 
		};
	};

	Print (PRINT_SmithSuccess);
	
	B_ENDPRODUCTIONDIALOG ();
	Starkwaffen = FALSE;
};
//*******************************************************
INSTANCE PC_Stark_WEAPON_1H_Harad_04 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Stark_WEAPON_1H_Harad_04_Condition;
	information		= PC_Stark_WEAPON_1H_Harad_04_Info;
	permanent		= TRUE;
};

FUNC INT PC_Stark_WEAPON_1H_Harad_04_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == TRUE))
	&& (Starkwaffen == TRUE)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 4)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Stark_WEAPON_1H_Harad_04_Info ()
{
	Npc_RemoveInvItems (hero, ItMiSwordRawHot, 4);

	if (Npc_KnowsInfo(hero, Info_Mod_Andre_HaradLehrling4))
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_ElBastardo_StarkBonusMeisterschmied,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_ElBastardo_StarkMeisterschmied,  1); 
		};
	}
	else
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest))
		{
			CreateInvItems 	    (hero, ItMw_ElBastardo_StarkBonus,  1); 
		}
		else
		{
			CreateInvItems 	    (hero, ItMw_ElBastardo_Stark,  1); 
		};
	};

	Print (PRINT_SmithSuccess);
	
	B_ENDPRODUCTIONDIALOG ();
	Starkwaffen = FALSE;
};

//*******************************************************
INSTANCE PC_CommonBACK (C_INFO)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_CommonBACK_Condition;
	information		= PC_CommonBACK_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK;
};
FUNC INT PC_CommonBACK_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == TRUE)
	&& (BolzenMachen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Starkwaffen == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_CommonBACK_Info ()
{
	Normalwaffen = FALSE;
};

//*******************************************************
INSTANCE PC_StarkBACK (C_INFO)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_StarkBACK_Condition;
	information		= PC_StarkBACK_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK;
};
FUNC INT PC_StarkBACK_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Starkwaffen == TRUE)
	&& (BolzenMachen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_StarkBACK_Info ()
{
	Starkwaffen = FALSE;
};

// Erzwaffen schmieden
//*******************************************************
INSTANCE PC_Ore (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Ore_Condition;
	information		= PC_Ore_Info;
	permanent		= TRUE;
	description		= "Erzwaffen schmieden";
};

FUNC INT PC_Ore_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Starkwaffen == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Ore_Info ()
{
	Erzwaffen = TRUE;
};

//*******************************************************
INSTANCE PC_ItMw_1H_Special_01 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_1H_Special_01_Condition;
	information		= PC_ItMw_1H_Special_01_Info;
	permanent		= TRUE;
};

FUNC INT PC_ItMw_1H_Special_01_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == TRUE))
	&& (Erzwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_1H_Special_01_Info ()
{
	if (Npc_HasItems (hero, ItMi_Nugget) >= 1)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 1)
	{
		Npc_RemoveInvItems (hero, ItMiSwordRawHot, 1);

		Npc_RemoveInvItems (hero, ItMi_Nugget, 1);
		
		CreateInvItems 	   (hero, ItMw_1H_Special_01,1); 
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};	
	B_ENDPRODUCTIONDIALOG ();
	Erzwaffen = FALSE;
};
//*******************************************************

INSTANCE PC_ItMw_2H_Special_01 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_2H_Special_01_Condition;
	information		= PC_ItMw_2H_Special_01_Info;
	permanent		= TRUE;
};

FUNC INT PC_ItMw_2H_Special_01_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == TRUE))
	&& (Erzwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_2H_Special_01_Info ()
{
	if (Npc_HasItems (hero, ItMi_Nugget) >= 2)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 1)
	{
		Npc_RemoveInvItems (hero, ItMiSwordRawHot, 1);

		Npc_RemoveInvItems  (hero,ItMi_Nugget,2);
		
		CreateInvItems 	    (hero,ItMw_2H_Special_01,1); 
		Print (PRINT_SmithSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	B_ENDPRODUCTIONDIALOG ();
	Erzwaffen = FALSE;
};
//*******************************************************

INSTANCE PC_ItMw_1H_Special_02 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_1H_Special_02_Condition;
	information		= PC_ItMw_1H_Special_02_Info;
	permanent		= TRUE;
};

FUNC INT PC_ItMw_1H_Special_02_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == TRUE))
	&& (Erzwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_1H_Special_02_Info ()
{
	if (Npc_HasItems (hero, ItMi_Nugget) >= 2)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 1)
	{
		Npc_RemoveInvItems (hero, ItMiSwordRawHot, 1);

		Npc_RemoveInvItems  (hero,ItMi_Nugget,2);
		
		CreateInvItems 	   (hero,ItMw_1H_Special_02,1); 
		Print (PRINT_SmithSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	B_ENDPRODUCTIONDIALOG ();
	Erzwaffen = FALSE;
};
//*******************************************************

INSTANCE PC_ItMw_2H_Special_02 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_2H_Special_02_Condition;
	information		= PC_ItMw_2H_Special_02_Info;
	permanent		= TRUE;
};

FUNC INT PC_ItMw_2H_Special_02_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == TRUE))
	&& (Erzwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_2H_Special_02_Info ()
{
	if (Npc_HasItems (hero, ItMi_Nugget) >= 3)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 1)
	{
		Npc_RemoveInvItems (hero, ItMiSwordRawHot, 1);

		Npc_RemoveInvItems  (hero,ItMi_Nugget,3);
		
		CreateInvItems 	    (hero,ItMw_2H_Special_02,1); 
		Print (PRINT_SmithSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	B_ENDPRODUCTIONDIALOG ();
	Erzwaffen = FALSE;
};

INSTANCE PC_ItMw_1H_Special_03 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_1H_Special_03_Condition;
	information		= PC_ItMw_1H_Special_03_Info;
	permanent		= TRUE;
	description	= "Erz-Schlachtklinge schmieden (Einhand - Stärke)";
};

FUNC INT PC_ItMw_1H_Special_03_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == TRUE))
	&& (Erzwaffen == TRUE)
	&& (Waffe_ErzEisen >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_1H_Special_03_Info ()
{
	if (Npc_HasItems (hero, ItMi_Nugget) >= 20)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 1)
	{
		Npc_RemoveInvItems (hero, ItMiSwordRawHot, 1);

		Npc_RemoveInvItems  (hero, ItMi_Nugget, 20);
		
		CreateInvItems 	   (hero, ItMw_1H_Special_03, 1); 

		Print (PRINT_SmithSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	

	B_ENDPRODUCTIONDIALOG ();

	Erzwaffen = FALSE;
};

INSTANCE PC_ItMw_1H_Special_03_Dex (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_1H_Special_03_Dex_Condition;
	information		= PC_ItMw_1H_Special_03_Dex_Info;
	permanent		= TRUE;
	description	= "Erz-Schlachtstecher schmieden (Einhand - Geschick)";
};

FUNC INT PC_ItMw_1H_Special_03_Dex_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03_Dex] == TRUE))
	&& (Erzwaffen == TRUE)
	&& (Waffe_ErzEisen >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_1H_Special_03_Dex_Info ()
{
	if (Npc_HasItems (hero, ItMi_Nugget) >= 20)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 1)
	{
		Npc_RemoveInvItems (hero, ItMiSwordRawHot, 1);

		Npc_RemoveInvItems  (hero, ItMi_Nugget, 20);
		
		CreateInvItems 	   (hero, ItMw_1H_Special_03_Dex, 1); 

		Print (PRINT_SmithSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	

	B_ENDPRODUCTIONDIALOG ();

	Erzwaffen = FALSE;
};
//*******************************************************

INSTANCE PC_ItMw_2H_Special_03 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_2H_Special_03_Condition;
	information		= PC_ItMw_2H_Special_03_Info;
	permanent		= TRUE;
	description	= "Schwere Erz-Schlachtklinge schmieden (Zweihand)";
};

FUNC INT PC_ItMw_2H_Special_03_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == TRUE))
	&& (Erzwaffen == TRUE)
	&& (Waffe_ErzEisen >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_2H_Special_03_Info ()
{
	if (Npc_HasItems (hero, ItMi_Nugget) >= 30)
	&& (Npc_HasItems (hero, ItMiSwordRawHot) >= 1)
	{
		Npc_RemoveInvItems (hero, ItMiSwordRawHot, 1);

		Npc_RemoveInvItems  (hero, ItMi_Nugget, 30);
		
		CreateInvItems 	    (hero, ItMw_2H_Special_03, 1); 

		Print (PRINT_SmithSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	

	B_ENDPRODUCTIONDIALOG (); 
	Erzwaffen = FALSE;
};
//*******************************************************
INSTANCE PC_ItMw_1H_Special_04 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_1H_Special_04_Condition;
	information		= PC_ItMw_1H_Special_04_Info;
	permanent		= TRUE;
	description	= "Erz-Drachentöter schmieden (Einhand - Stärke)";
};

FUNC INT PC_ItMw_1H_Special_04_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == TRUE))
	&& (Erzwaffen == TRUE)
	&& (Waffe_ErzEisen >= 2)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_1H_Special_04_Info ()
{
	if (Npc_HasItems (hero, ItMi_ReinerErzrohling_Small) >= 1)
	&& (Npc_HasItems (hero, ItAt_DragonBlood) >= 5)
	&& (Npc_HasItems (hero, ItAt_DragonElixier) >= 1)
	{
		Npc_RemoveInvItems  (hero, ItMi_ReinerErzrohling_Small, 1);
		Npc_RemoveInvItems  (hero, ItAt_DragonBlood, 5);
		Npc_RemoveInvItems  (hero, ItAt_DragonElixier, 1);
		
		CreateInvItems 	   (hero, ItMw_1H_Special_04, 1); 

		Print (PRINT_SmithSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);

		CreateInvItems (self, ItMiSwordRaw, 1);
	};	

	B_ENDPRODUCTIONDIALOG ();

	Erzwaffen = FALSE;
};
//*******************************************************
INSTANCE PC_ItMw_1H_Special_04_Dex (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_1H_Special_04_Dex_Condition;
	information		= PC_ItMw_1H_Special_04_Dex_Info;
	permanent		= TRUE;
	description	= "Erz-Drachenstecher schmieden (Einhand - Geschick)";
};

FUNC INT PC_ItMw_1H_Special_04_Dex_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04_Dex] == TRUE))
	&& (Erzwaffen == TRUE)
	&& (Waffe_ErzEisen >= 2)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_1H_Special_04_Dex_Info ()
{
	if (Npc_HasItems (hero, ItMi_ReinerErzrohling_Small) >= 1)
	&& (Npc_HasItems (hero, ItAt_DragonBlood) >= 5)
	&& (Npc_HasItems (hero, ItAt_DragonElixier) >= 1)
	{
		Npc_RemoveInvItems  (hero, ItMi_ReinerErzrohling_Small, 1);
		Npc_RemoveInvItems  (hero, ItAt_DragonBlood, 5);
		Npc_RemoveInvItems  (hero, ItAt_DragonElixier, 1);
		
		CreateInvItems 	   (hero, ItMw_1H_Special_04_Dex, 1); 

		Print (PRINT_SmithSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	

	B_ENDPRODUCTIONDIALOG ();

	Erzwaffen = FALSE;
};
//*******************************************************

INSTANCE PC_ItMw_2H_Special_04 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_2H_Special_04_Condition;
	information		= PC_ItMw_2H_Special_04_Info;
	permanent		= TRUE;
	description	= "Schwere Erz-Schlachtklinge schmieden (Zweihand)";
};

FUNC INT PC_ItMw_2H_Special_04_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == TRUE))
	&& (Erzwaffen == TRUE)
	&& (Waffe_ErzEisen >= 2)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_2H_Special_04_Info ()
{
	if (Npc_HasItems (hero, ItMi_ReinerErzrohling_Big) >= 1)
	&& (Npc_HasItems (hero, ItAt_DragonBlood) >= 7)
	&& (Npc_HasItems (hero, ItAt_DragonElixier) >= 1)
	{
		Npc_RemoveInvItems  (hero, ItMi_ReinerErzrohling_Big, 1);
		Npc_RemoveInvItems  (hero, ItAt_DragonBlood, 7);
		Npc_RemoveInvItems  (hero, ItAt_DragonElixier, 1);
		
		CreateInvItems 	    (hero, ItMw_2H_Special_04, 1); 

		Print (PRINT_SmithSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);

		CreateInvItems (self, ItMiSwordRaw, 1);
	};	

	B_ENDPRODUCTIONDIALOG (); 
	Erzwaffen = FALSE;
};

//*******************************************************
INSTANCE PC_OreBACK (C_INFO)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_OreBACK_Condition;
	information		= PC_OreBACK_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK;
};
FUNC INT PC_OreBACK_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (Erzwaffen == TRUE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Starkwaffen == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_OreBACK_Info ()
{
	Erzwaffen = FALSE;
};

// Waffen verbessern

INSTANCE PC_Erzwaffen_Verbessern (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Erzwaffen_Verbessern_Condition;
	information		= PC_Erzwaffen_Verbessern_Info;
	permanent		= TRUE;
	description	= "Verbesserte Waffe herstellen";
};

FUNC INT PC_Erzwaffen_Verbessern_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& ((Smith_Erzschwert_Wasser == TRUE)
	|| (Smith_Erzschwert_Feuer == TRUE))
	&& (Normalwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Starkwaffen == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Erzwaffen_Verbessern_Info ()
{
	Info_ClearChoices	(PC_Erzwaffen_Verbessern);

	Info_AddChoice	(PC_Erzwaffen_Verbessern, DIALOG_BACK, PC_Erzwaffen_Verbessern_BACK);

	if (Smith_Erzschwert_Wasser == TRUE)
	&& (Npc_HasItems(hero, ItRu_Waterfist) >= 1)
	{
		if (Npc_HasItems(hero, ItMi_Nugget) >= 15)
		{
			if (Npc_HasItems(hero, ItMw_2H_Special_04_Geschaerft) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Großer Erz-Drachentöter des Wasserhiebes", PC_Erzwaffen_Verbessern_ItMw_2H_Special_04_Wasser_G);
			};
			if (Npc_HasItems(hero, ItMw_2H_Special_04) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Großer Erz-Drachentöter des Wasserhiebes", PC_Erzwaffen_Verbessern_ItMw_2H_Special_04_Wasser);
			};
			if (Npc_HasItems(hero, ItMw_2H_Special_03_Geschaerft) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Schwere Erz-Schlachtklinge des Wasserhiebes", PC_Erzwaffen_Verbessern_ItMw_2H_Special_03_Wasser_G);
			};
			if (Npc_HasItems(hero, ItMw_2H_Special_03) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Schwere Erz-Schlachtklinge des Wasserhiebes", PC_Erzwaffen_Verbessern_ItMw_2H_Special_03_Wasser);
			};
		};
		if (Npc_HasItems(hero, ItMi_Nugget) >= 10)
		{
			if (Npc_HasItems(hero, ItMw_1H_Special_04_Geschaerft) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Erz-Drachentöter des Wasserhiebes", PC_Erzwaffen_Verbessern_ItMw_1H_Special_04_Wasser_G);
			};
			if (Npc_HasItems(hero, ItMw_1H_Special_04) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Erz-Drachentöter des Wasserhiebes", PC_Erzwaffen_Verbessern_ItMw_1H_Special_04_Wasser);
			};
			if (Npc_HasItems(hero, ItMw_1H_Special_04_Dex_Geschaerft) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Erz-Drachenstecher des Wasserhiebes", PC_Erzwaffen_Verbessern_ItMw_1H_Special_04_Dex_Wasser_G);
			};
			if (Npc_HasItems(hero, ItMw_1H_Special_04_Dex) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Erz-Drachenstecher des Wasserhiebes", PC_Erzwaffen_Verbessern_ItMw_1H_Special_04_Dex_Wasser);
			};
			if (Npc_HasItems(hero, ItMw_1H_Special_03_Geschaerft) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Erz-Schlachtklinge des Wasserhiebes", PC_Erzwaffen_Verbessern_ItMw_1H_Special_03_Wasser_G);
			};
			if (Npc_HasItems(hero, ItMw_1H_Special_03) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Erz-Schlachtklinge des Wasserhiebes", PC_Erzwaffen_Verbessern_ItMw_1H_Special_03_Wasser);
			};
			if (Npc_HasItems(hero, ItMw_1H_Special_03_Dex_Geschaerft) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Erz-Schlachtstecher des Wasserhiebes", PC_Erzwaffen_Verbessern_ItMw_1H_Special_03_Dex_Wasser_G);
			};
			if (Npc_HasItems(hero, ItMw_1H_Special_03_Dex) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Erz-Schlachtstecher des Wasserhiebes", PC_Erzwaffen_Verbessern_ItMw_1H_Special_03_Dex_Wasser);
			};
			if (Npc_HasItems(hero, ItMw_Orkschlaechter_Geschaerft) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Orkschlächter des Wasserhiebes", PC_Erzwaffen_Verbessern_ItMw_Orkschlaechter_Wasser_G);
			};
			if (Npc_HasItems(hero, ItMw_Orkschlaechter) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Orkschlächter des Wasserhiebes", PC_Erzwaffen_Verbessern_ItMw_Orkschlaechter_Wasser);
			};
			if (Npc_HasItems(hero, ItMw_Orkpickser_Geschaerft) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Orkpickser des Wasserhiebes", PC_Erzwaffen_Verbessern_ItMw_Orkpickser_Wasser_G);
			};
			if (Npc_HasItems(hero, ItMw_Orkpickser) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Orkpickser des Wasserhiebes", PC_Erzwaffen_Verbessern_ItMw_Orkpickser_Wasser);
			};
		};
	};
	if (Smith_Erzschwert_Feuer == TRUE)
	&& (Npc_HasItems(hero, ItRu_InstantFireball) >= 1)
	{
		if (Npc_HasItems(hero, ItMi_Nugget) >= 15)
		{
			if (Npc_HasItems(hero, ItMw_2H_Special_04_Geschaerft) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Großer Erz-Drachentöter des Versengens", PC_Erzwaffen_Verbessern_ItMw_2H_Special_04_Feuer_G);
			};
			if (Npc_HasItems(hero, ItMw_2H_Special_04) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Großer Erz-Drachentöter des Versengens", PC_Erzwaffen_Verbessern_ItMw_2H_Special_04_Feuer);
			};
			if (Npc_HasItems(hero, ItMw_2H_Special_03_Geschaerft) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Schwere Erz-Schlachtklinge des Versengens", PC_Erzwaffen_Verbessern_ItMw_2H_Special_03_Feuer_G);
			};
			if (Npc_HasItems(hero, ItMw_2H_Special_03) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Schwere Erz-Schlachtklinge des Versengens", PC_Erzwaffen_Verbessern_ItMw_2H_Special_03_Feuer);
			};
		};
		if (Npc_HasItems(hero, ItMi_Nugget) >= 10)
		{
			if (Npc_HasItems(hero, ItMw_1H_Special_04_Geschaerft) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Erz-Drachentöter des Versengens", PC_Erzwaffen_Verbessern_ItMw_1H_Special_04_Feuer_G);
			};
			if (Npc_HasItems(hero, ItMw_1H_Special_04) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Erz-Drachentöter des Versengens", PC_Erzwaffen_Verbessern_ItMw_1H_Special_04_Feuer);
			};
			if (Npc_HasItems(hero, ItMw_1H_Special_04_Dex_Geschaerft) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Erz-Drachenstecher des Versengens", PC_Erzwaffen_Verbessern_ItMw_1H_Special_04_Dex_Feuer_G);
			};
			if (Npc_HasItems(hero, ItMw_1H_Special_04_Dex) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Erz-Drachenstecher des Versengens", PC_Erzwaffen_Verbessern_ItMw_1H_Special_04_Dex_Feuer);
			};
			if (Npc_HasItems(hero, ItMw_1H_Special_03_Geschaerft) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Erz-Schlachtklinge des Versengens", PC_Erzwaffen_Verbessern_ItMw_1H_Special_03_Feuer_G);
			};
			if (Npc_HasItems(hero, ItMw_1H_Special_03) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Erz-Schlachtklinge des Versengens", PC_Erzwaffen_Verbessern_ItMw_1H_Special_03_Feuer);
			};
			if (Npc_HasItems(hero, ItMw_1H_Special_03_Dex_Geschaerft) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Erz-Schlachtstecher des Versengens", PC_Erzwaffen_Verbessern_ItMw_1H_Special_03_Dex_Feuer_G);
			};
			if (Npc_HasItems(hero, ItMw_1H_Special_03_Dex) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Erz-Schlachtstecher des Versengens", PC_Erzwaffen_Verbessern_ItMw_1H_Special_03_Dex_Feuer);
			};
			if (Npc_HasItems(hero, ItMw_Orkschlaechter_Geschaerft) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Orkschlächter des Versengens", PC_Erzwaffen_Verbessern_ItMw_Orkschlaechter_Feuer_G);
			};
			if (Npc_HasItems(hero, ItMw_Orkschlaechter) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Orkschlächter des Versengens", PC_Erzwaffen_Verbessern_ItMw_Orkschlaechter_Feuer);
			};
			if (Npc_HasItems(hero, ItMw_Orkpickser_Geschaerft) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Orkpickser des Versengens", PC_Erzwaffen_Verbessern_ItMw_Orkpickser_Feuer_G);
			};
			if (Npc_HasItems(hero, ItMw_Orkpickser) >= 1)
			{
				Info_AddChoice	(PC_Erzwaffen_Verbessern, "Orkpickser des Versengens", PC_Erzwaffen_Verbessern_ItMw_Orkpickser_Feuer);
			};
		};
	};
};

FUNC VOID PC_Erzwaffen_Verbessern_BACK()
{
	Info_ClearChoices	(PC_Erzwaffen_Verbessern);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_2H_Special_04_Wasser_G()
{
	Npc_RemoveInvItems	(hero, ItRu_Waterfist, 1);
	Npc_RemoveInvItems	(hero, ItMw_2H_Special_04_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 15);

	CreateInvItems	(hero, ItMw_2H_Special_04_Wasser, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_2H_Special_04_Wasser()
{
	Npc_RemoveInvItems	(hero, ItRu_Waterfist, 1);
	Npc_RemoveInvItems	(hero, ItMw_2H_Special_04, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 15);

	CreateInvItems	(hero, ItMw_2H_Special_04_Wasser, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_2H_Special_03_Wasser_G()
{
	Npc_RemoveInvItems	(hero, ItRu_Waterfist, 1);
	Npc_RemoveInvItems	(hero, ItMw_2H_Special_03_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 15);

	CreateInvItems	(hero, ItMw_2H_Special_03_Wasser, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_2H_Special_03_Wasser()
{
	Npc_RemoveInvItems	(hero, ItRu_Waterfist, 1);
	Npc_RemoveInvItems	(hero, ItMw_2H_Special_03, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 15);

	CreateInvItems	(hero, ItMw_2H_Special_03_Wasser, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_1H_Special_04_Wasser_G()
{
	Npc_RemoveInvItems	(hero, ItRu_Waterfist, 1);
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_04_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_1H_Special_04_Wasser, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_1H_Special_04_Wasser()
{
	Npc_RemoveInvItems	(hero, ItRu_Waterfist, 1);
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_04, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_1H_Special_04_Wasser, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_1H_Special_03_Wasser_G()
{
	Npc_RemoveInvItems	(hero, ItRu_Waterfist, 1);
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_03_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_1H_Special_03_Wasser, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_1H_Special_03_Wasser()
{
	Npc_RemoveInvItems	(hero, ItRu_Waterfist, 1);
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_03, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_1H_Special_03_Wasser, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_Orkschlaechter_Wasser_G()
{
	Npc_RemoveInvItems	(hero, ItRu_Waterfist, 1);
	Npc_RemoveInvItems	(hero, ItMw_Orkschlaechter_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_Orkschlaechter_Wasser, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_Orkschlaechter_Wasser()
{
	Npc_RemoveInvItems	(hero, ItRu_Waterfist, 1);
	Npc_RemoveInvItems	(hero, ItMw_Orkschlaechter, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_Orkschlaechter_Wasser, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_1H_Special_04_Dex_Wasser_G()
{
	Npc_RemoveInvItems	(hero, ItRu_Waterfist, 1);
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_04_Dex_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_1H_Special_04_Dex_Wasser, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_1H_Special_04_Dex_Wasser()
{
	Npc_RemoveInvItems	(hero, ItRu_Waterfist, 1);
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_04_Dex, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_1H_Special_04_Dex_Wasser, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_1H_Special_03_Dex_Wasser_G()
{
	Npc_RemoveInvItems	(hero, ItRu_Waterfist, 1);
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_03_Dex_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_1H_Special_03_Dex_Wasser, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_1H_Special_03_Dex_Wasser()
{
	Npc_RemoveInvItems	(hero, ItRu_Waterfist, 1);
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_03_Dex, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_1H_Special_03_Dex_Wasser, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_Orkpickser_Wasser_G()
{
	Npc_RemoveInvItems	(hero, ItRu_Waterfist, 1);
	Npc_RemoveInvItems	(hero, ItMw_Orkpickser_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_Orkpickser_Wasser, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_Orkpickser_Wasser()
{
	Npc_RemoveInvItems	(hero, ItRu_Waterfist, 1);
	Npc_RemoveInvItems	(hero, ItMw_Orkpickser, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_Orkpickser_Wasser, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_2H_Special_04_Feuer_G()
{
	Npc_RemoveInvItems	(hero, ItRu_InstantFireball, 1);
	Npc_RemoveInvItems	(hero, ItMw_2H_Special_04_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 15);

	CreateInvItems	(hero, ItMw_2H_Special_04_Feuer, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_2H_Special_04_Feuer()
{
	Npc_RemoveInvItems	(hero, ItRu_InstantFireball, 1);
	Npc_RemoveInvItems	(hero, ItMw_2H_Special_04, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 15);

	CreateInvItems	(hero, ItMw_2H_Special_04_Feuer, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_2H_Special_03_Feuer_G()
{
	Npc_RemoveInvItems	(hero, ItRu_InstantFireball, 1);
	Npc_RemoveInvItems	(hero, ItMw_2H_Special_03_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 15);

	CreateInvItems	(hero, ItMw_2H_Special_03_Feuer, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_2H_Special_03_Feuer()
{
	Npc_RemoveInvItems	(hero, ItRu_InstantFireball, 1);
	Npc_RemoveInvItems	(hero, ItMw_2H_Special_03, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 15);

	CreateInvItems	(hero, ItMw_2H_Special_03_Feuer, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_1H_Special_04_Feuer_G()
{
	Npc_RemoveInvItems	(hero, ItRu_InstantFireball, 1);
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_04_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_1H_Special_04_Feuer, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_1H_Special_04_Feuer()
{
	Npc_RemoveInvItems	(hero, ItRu_InstantFireball, 1);
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_04, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_1H_Special_04_Feuer, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_1H_Special_03_Feuer_G()
{
	Npc_RemoveInvItems	(hero, ItRu_InstantFireball, 1);
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_03_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_1H_Special_03_Feuer, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_1H_Special_03_Feuer()
{
	Npc_RemoveInvItems	(hero, ItRu_InstantFireball, 1);
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_03, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_1H_Special_03_Feuer, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_Orkschlaechter_Feuer_G()
{
	Npc_RemoveInvItems	(hero, ItRu_InstantFireball, 1);
	Npc_RemoveInvItems	(hero, ItMw_Orkschlaechter_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_Orkschlaechter_Feuer, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_Orkschlaechter_Feuer()
{
	Npc_RemoveInvItems	(hero, ItRu_InstantFireball, 1);
	Npc_RemoveInvItems	(hero, ItMw_Orkschlaechter, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_Orkschlaechter_Feuer, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_1H_Special_04_Dex_Feuer_G()
{
	Npc_RemoveInvItems	(hero, ItRu_InstantFireball, 1);
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_04_Dex_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_1H_Special_04_Dex_Feuer, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_1H_Special_04_Dex_Feuer()
{
	Npc_RemoveInvItems	(hero, ItRu_InstantFireball, 1);
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_04_Dex, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_1H_Special_04_Dex_Feuer, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_1H_Special_03_Dex_Feuer_G()
{
	Npc_RemoveInvItems	(hero, ItRu_InstantFireball, 1);
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_03_Dex_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_1H_Special_03_Dex_Feuer, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_1H_Special_03_Dex_Feuer()
{
	Npc_RemoveInvItems	(hero, ItRu_InstantFireball, 1);
	Npc_RemoveInvItems	(hero, ItMw_1H_Special_03_Dex, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_1H_Special_03_Dex_Feuer, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_Orkpickser_Feuer_G()
{
	Npc_RemoveInvItems	(hero, ItRu_InstantFireball, 1);
	Npc_RemoveInvItems	(hero, ItMw_Orkpickser_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_Orkpickser_Feuer, 1);
};

FUNC VOID PC_Erzwaffen_Verbessern_ItMw_Orkpickser_Feuer()
{
	Npc_RemoveInvItems	(hero, ItRu_InstantFireball, 1);
	Npc_RemoveInvItems	(hero, ItMw_Orkpickser, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 10);

	CreateInvItems	(hero, ItMw_Orkpickser_Feuer, 1);
};

// Bolzen herstellen

INSTANCE PC_BolzenMachen (C_INFO)
{
	npc		= PC_Hero;
	condition	= PC_BolzenMachen_Condition;
	information	= PC_BolzenMachen_Info;
	permanent	= 1;
	description	= "Bolzen herstellen";
};

FUNC INT PC_BolzenMachen_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (Normalwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Starkwaffen == FALSE)
	{
		return 1;
	};
};

FUNC VOID PC_BolzenMachen_Info()
{
	BolzenMachen	=	TRUE;
};

INSTANCE PC_BolzenMachen_Spitze (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_BolzenMachen_Spitze_Condition;
	information		= PC_BolzenMachen_Spitze_Info;
	permanent		= TRUE;
	description		= "Bolzenspitze schmieden (1 Rohstahl)";
};
FUNC INT PC_BolzenMachen_Spitze_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (BolzenMachen == TRUE)
	&& (Mod_PfeileSpitzen == 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_Spitze_Info ()
{
	var int SpitzenAnzahl;

	if (Npc_HasItems(hero, ItMiSwordRawHot) > 0)
	{
		Npc_RemoveInvItems	(hero, ItMiSwordRawHot, 1);
		CreateInvItems	(hero, BolzenSpitze, 10);

		Print	("Bolzenspitze hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_SchmetterSpitze (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_BolzenMachen_SchmetterSpitze_Condition;
	information		= PC_BolzenMachen_SchmetterSpitze_Info;
	permanent		= TRUE;
	description		= "Schmetterbolzenspitze schmieden (1 Rohstahl)";
};
FUNC INT PC_BolzenMachen_SchmetterSpitze_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (BolzenMachen == TRUE)
	&& (Mod_PfeileSpitzen == 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_SchmetterSpitze_Info ()
{
	var int SpitzenAnzahl;

	if (Npc_HasItems(hero, ItMiSwordRawHot) > 0)
	{
		Npc_RemoveInvItems	(hero, ItMiSwordRawHot, 1);
		CreateInvItems	(hero, SchmetterBolzenSpitze, 10);

		Print	("Schmetterbolzenspitze hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_GoldErz_Spitze (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_BolzenMachen_GoldErz_Spitze_Condition;
	information		= PC_BolzenMachen_GoldErz_Spitze_Info;
	permanent		= TRUE;
	description		= "Bolzenspitzen mit Gold-Erz-Legierung schmieden (1 Goldbrocken und 3 Erzbrocken)";
};
FUNC INT PC_BolzenMachen_GoldErz_Spitze_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (BolzenMachen == TRUE)
	&& (Pfeil_GoldErz == 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_GoldErz_Spitze_Info ()
{
	if (Npc_HasItems(hero, ItMi_Nugget) >= 3)
	&& (Npc_HasItems(hero, ItMi_GoldNugget_Addon) >= 1)
	{
		Npc_RemoveInvItems	(hero, ItMi_GoldNugget_Addon, 1);
		Npc_RemoveInvItems	(hero, ItMi_Nugget, 3);

		CreateInvItems	(hero, BolzenSpitze_GoldErz, 100);

		Print	("100 Bolzenspitzen aus Gold-Erz-Legierung hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_GoldErzBlut_Spitze (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_BolzenMachen_GoldErzBlut_Spitze_Condition;
	information		= PC_BolzenMachen_GoldErzBlut_Spitze_Info;
	permanent		= TRUE;
	description		= "Bolzenspitzen mit Gold-Erz-Blut-Legierung schmieden (1 Goldbrocken, 3 Erzbrocken und 1 Drachenblut)";
};
FUNC INT PC_BolzenMachen_GoldErzBlut_Spitze_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (BolzenMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Pfeil_GoldErz == 2)
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_GoldErzBlut_Spitze_Info ()
{
	if (Npc_HasItems(hero, ItMi_Nugget) >= 3)
	&& (Npc_HasItems(hero, ItMi_GoldNugget_Addon) >= 1)
	{
		Npc_RemoveInvItems	(hero, ItMi_GoldNugget_Addon, 1);
		Npc_RemoveInvItems	(hero, ItMi_Nugget, 3);

		CreateInvItems	(hero, BolzenSpitze_GoldErzBlut, 100);

		Print	("100 Bolzenspitzen aus Gold-Erz-Blut-Legierung hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_Komplett (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_BolzenMachen_Komplett_Condition;
	information		= PC_BolzenMachen_Komplett_Info;
	permanent		= TRUE;
	description		= "Bolzen herstellen (1x)";
};
FUNC INT PC_BolzenMachen_Komplett_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (BolzenMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_Komplett_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, BolzenSpitze) > 0)
	{
		Npc_RemoveInvItems	(hero, PfeilStab, 1);
		Npc_RemoveInvItems	(hero, BolzenSpitze, 1);
		CreateInvItems	(hero, ItRw_Bolt, 1);

		Print	("Bolzen hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_Komplett_Alle (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_BolzenMachen_Komplett_Alle_Condition;
	information		= PC_BolzenMachen_Komplett_Alle_Info;
	permanent		= TRUE;
	description		= "Bolzen herstellen (Alle)";
};
FUNC INT PC_BolzenMachen_Komplett_Alle_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (BolzenMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_Komplett_Alle_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, BolzenSpitze) > 0)
	{
		if (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, BolzenSpitze))
		{
			Mod_PfeilCounter = Npc_HasItems(hero, BolzenSpitze);

			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, BolzenSpitze));
			CreateInvItems	(hero, ItRw_Bolt, Npc_HasItems(hero, BolzenSpitze));
			Npc_RemoveInvItems	(hero, BolzenSpitze, Npc_HasItems(hero, BolzenSpitze));
		}
		else
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilStab);

			Npc_RemoveInvItems	(hero, BolzenSpitze, Npc_HasItems(hero, PfeilStab));
			CreateInvItems	(hero, ItRw_Bolt, Npc_HasItems(hero, PfeilStab));
			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilStab));
		};

		Print	(ConcatStrings(IntToString(Mod_PfeilCounter), " Bolzen hergestellt!"));
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_Widerhaken_Komplett (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_BolzenMachen_Widerhaken_Komplett_Condition;
	information		= PC_BolzenMachen_Widerhaken_Komplett_Info;
	permanent		= TRUE;
	description		= "Bolzen mit Widerhaken herstellen (1x)";
};
FUNC INT PC_BolzenMachen_Widerhaken_Komplett_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (BolzenMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest))
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_Widerhaken_Komplett_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, BolzenSpitze) > 0)
	{
		Npc_RemoveInvItems	(hero, PfeilStab, 1);
		Npc_RemoveInvItems	(hero, BolzenSpitze, 1);
		CreateInvItems	(hero, ItRw_WiderhakenBolt, 1);

		Print	("Bolzen mit Widerhaken hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_Widerhaken_Komplett_Alle (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_BolzenMachen_Widerhaken_Komplett_Alle_Condition;
	information		= PC_BolzenMachen_Widerhaken_Komplett_Alle_Info;
	permanent		= TRUE;
	description		= "Bolzen mit Widerhaken herstellen (Alle)";
};
FUNC INT PC_BolzenMachen_Widerhaken_Komplett_Alle_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (BolzenMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest))
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_Widerhaken_Komplett_Alle_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, BolzenSpitze) > 0)
	{
		if (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, BolzenSpitze))
		{
			Mod_PfeilCounter = Npc_HasItems(hero, BolzenSpitze);

			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, BolzenSpitze));
			CreateInvItems	(hero, ItRw_WiderhakenBolt, Npc_HasItems(hero, BolzenSpitze));
			Npc_RemoveInvItems	(hero, BolzenSpitze, Npc_HasItems(hero, BolzenSpitze));
		}
		else
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilStab);

			Npc_RemoveInvItems	(hero, BolzenSpitze, Npc_HasItems(hero, PfeilStab));
			CreateInvItems	(hero, ItRw_WiderhakenBolt, Npc_HasItems(hero, PfeilStab));
			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilStab));
		};

		Print	(ConcatStrings(IntToString(Mod_PfeilCounter), " Bolzen mit Widerhaken hergestellt!"));
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_Sprengstoff_Komplett (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_BolzenMachen_Sprengstoff_Komplett_Condition;
	information		= PC_BolzenMachen_Sprengstoff_Komplett_Info;
	permanent		= TRUE;
	description		= "Explosionsbolzen herstellen (1x)";
};
FUNC INT PC_BolzenMachen_Sprengstoff_Komplett_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (BolzenMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest5))
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_Sprengstoff_Komplett_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, BolzenSpitze) > 0)
	&& (Npc_HasItems(hero, ItMi_Sprengstoff) > 0)
	{
		Npc_RemoveInvItems	(hero, PfeilStab, 1);
		Npc_RemoveInvItems	(hero, BolzenSpitze, 1);
		Npc_RemoveInvItems	(hero, ItMi_Sprengstoff, 1);

		CreateInvItems	(hero, ItRw_SprengstoffBolt, 1);

		Print	("Explosionsbolzen hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_Sprengstoff_Komplett_Alle (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_BolzenMachen_Sprengstoff_Komplett_Alle_Condition;
	information		= PC_BolzenMachen_Sprengstoff_Komplett_Alle_Info;
	permanent		= TRUE;
	description		= "Explosionsbolzen herstellen (Alle)";
};
FUNC INT PC_BolzenMachen_Sprengstoff_Komplett_Alle_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == TRUE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest5))
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_Sprengstoff_Komplett_Alle_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, BolzenSpitze) > 0)
	&& (Npc_HasItems(hero, ItMi_Salpeter) > 0)
	{
		if (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, BolzenSpitze))
		&& (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, ItMi_Sprengstoff))
		{
			if (Npc_HasItems(hero, BolzenSpitze) > Npc_HasItems(hero, ItMi_Sprengstoff))
			{
				Mod_PfeilCounter = Npc_HasItems(hero, ItMi_Sprengstoff);

				Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, ItMi_Sprengstoff));
				Npc_RemoveInvItems	(hero, BolzenSpitze, Npc_HasItems(hero, ItMi_Sprengstoff));
				CreateInvItems	(hero, ItRw_SprengstoffBolt, Npc_HasItems(hero, ItMi_Sprengstoff));
				Npc_RemoveInvItems	(hero, ItMi_Sprengstoff, Npc_HasItems(hero, ItMi_Sprengstoff));
			}
			else
			{
				Mod_PfeilCounter = Npc_HasItems(hero, BolzenSpitze);

				Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, BolzenSpitze));
				Npc_RemoveInvItems	(hero, ItMi_Salpeter, Npc_HasItems(hero, BolzenSpitze));
				CreateInvItems	(hero, ItRw_SprengstoffBolt, Npc_HasItems(hero, BolzenSpitze));
				Npc_RemoveInvItems	(hero, BolzenSpitze, Npc_HasItems(hero, BolzenSpitze));
			};
		}
		else if (Npc_HasItems(hero, BolzenSpitze) > Npc_HasItems(hero, PfeilStab))
		&& (Npc_HasItems(hero, BolzenSpitze) > Npc_HasItems(hero, ItMi_Sprengstoff))
		{
			if (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, ItMi_Sprengstoff))
			{
				Mod_PfeilCounter = Npc_HasItems(hero, ItMi_Sprengstoff);

				Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, ItMi_Sprengstoff));
				Npc_RemoveInvItems	(hero, BolzenSpitze, Npc_HasItems(hero, ItMi_Sprengstoff));
				CreateInvItems	(hero, ItRw_SprengstoffBolt, Npc_HasItems(hero, ItMi_Sprengstoff));
				Npc_RemoveInvItems	(hero, ItMi_Sprengstoff, Npc_HasItems(hero, ItMi_Sprengstoff));
			}
			else
			{
				Mod_PfeilCounter = Npc_HasItems(hero, PfeilStab);

				Npc_RemoveInvItems	(hero, BolzenSpitze, Npc_HasItems(hero, PfeilStab));
				Npc_RemoveInvItems	(hero, ItMi_Salpeter, Npc_HasItems(hero, PfeilStab));
				CreateInvItems	(hero, ItRw_SprengstoffBolt, Npc_HasItems(hero, PfeilStab));
				Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilStab));
			};
		}
		else
		{
			if (Npc_HasItems(hero, BolzenSpitze) > Npc_HasItems(hero, PfeilStab))
			{
				Mod_PfeilCounter = Npc_HasItems(hero, PfeilStab);

				Npc_RemoveInvItems	(hero, ItMi_Sprengstoff, Npc_HasItems(hero, PfeilStab));
				Npc_RemoveInvItems	(hero, BolzenSpitze, Npc_HasItems(hero, PfeilStab));
				CreateInvItems	(hero, ItRw_SprengstoffBolt, Npc_HasItems(hero, PfeilStab));
				Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilStab));
			}
			else
			{
				Mod_PfeilCounter = Npc_HasItems(hero, BolzenSpitze);

				Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, BolzenSpitze));
				Npc_RemoveInvItems	(hero, ItMi_Salpeter, Npc_HasItems(hero, BolzenSpitze));
				CreateInvItems	(hero, ItRw_SprengstoffBolt, Npc_HasItems(hero, BolzenSpitze));
				Npc_RemoveInvItems	(hero, BolzenSpitze, Npc_HasItems(hero, BolzenSpitze));
			};
		};

		Print	(ConcatStrings(IntToString(Mod_PfeilCounter), " Explosionsbolzen hergestellt!"));
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_Praezision_Komplett (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_BolzenMachen_Praezision_Komplett_Condition;
	information		= PC_BolzenMachen_Praezision_Komplett_Info;
	permanent		= TRUE;
	description		= "Präzisionsbolzen herstellen (1x)";
};
FUNC INT PC_BolzenMachen_Praezision_Komplett_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (BolzenMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest3))
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_Praezision_Komplett_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, BolzenSpitze) > 0)
	{
		Npc_RemoveInvItems	(hero, PfeilStab, 1);
		Npc_RemoveInvItems	(hero, BolzenSpitze, 1);
		CreateInvItems	(hero, ItRw_PraezisionsBolt, 1);

		Print	("Präzisionsbolzen hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_Praezision_Komplett_Alle (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_BolzenMachen_Praezision_Komplett_Alle_Condition;
	information		= PC_BolzenMachen_Praezision_Komplett_Alle_Info;
	permanent		= TRUE;
	description		= "Präzisionsbolzen herstellen (Alle)";
};
FUNC INT PC_BolzenMachen_Praezision_Komplett_Alle_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (BolzenMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest3))
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_Praezision_Komplett_Alle_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, BolzenSpitze) > 0)
	{
		if (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, BolzenSpitze))
		{
			Mod_PfeilCounter = Npc_HasItems(hero, BolzenSpitze);

			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, BolzenSpitze));
			CreateInvItems	(hero, ItRw_PraezisionsBolt, Npc_HasItems(hero, BolzenSpitze));
			Npc_RemoveInvItems	(hero, BolzenSpitze, Npc_HasItems(hero, BolzenSpitze));
		}
		else
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilStab);

			Npc_RemoveInvItems	(hero, BolzenSpitze, Npc_HasItems(hero, PfeilStab));
			CreateInvItems	(hero, ItRw_PraezisionsBolt, Npc_HasItems(hero, PfeilStab));
			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilStab));
		};

		Print	(ConcatStrings(IntToString(Mod_PfeilCounter), " Präzisionsbolzen hergestellt!"));
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_Schmetter_Komplett (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_BolzenMachen_Schmetter_Komplett_Condition;
	information		= PC_BolzenMachen_Schmetter_Komplett_Info;
	permanent		= TRUE;
	description		= "Schmetterbolzen herstellen (1x)";
};
FUNC INT PC_BolzenMachen_Schmetter_Komplett_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (BolzenMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_Schmetter_Komplett_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, SchmetterBolzenSpitze) > 0)
	{
		Npc_RemoveInvItems	(hero, PfeilStab, 1);
		Npc_RemoveInvItems	(hero, SchmetterBolzenSpitze, 1);
		CreateInvItems	(hero, ItRw_SchmetterBolt, 1);

		Print	("Schmetterbolzen hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_Schmetter_Komplett_Alle (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_BolzenMachen_Schmetter_Komplett_Alle_Condition;
	information		= PC_BolzenMachen_Schmetter_Komplett_Alle_Info;
	permanent		= TRUE;
	description		= "Schmetterbolzen herstellen (Alle)";
};
FUNC INT PC_BolzenMachen_Schmetter_Komplett_Alle_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (BolzenMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_Schmetter_Komplett_Alle_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, SchmetterBolzenSpitze) > 0)
	{
		if (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, SchmetterBolzenSpitze))
		{
			Mod_PfeilCounter = Npc_HasItems(hero, SchmetterBolzenSpitze);

			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, SchmetterBolzenSpitze));
			CreateInvItems	(hero, ItRw_SchmetterBolt, Npc_HasItems(hero, SchmetterBolzenSpitze));
			Npc_RemoveInvItems	(hero, SchmetterBolzenSpitze, Npc_HasItems(hero, SchmetterBolzenSpitze));
		}
		else
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilStab);

			Npc_RemoveInvItems	(hero, SchmetterBolzenSpitze, Npc_HasItems(hero, PfeilStab));
			CreateInvItems	(hero, ItRw_SchmetterBolt, Npc_HasItems(hero, PfeilStab));
			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilStab));
		};

		Print	(ConcatStrings(IntToString(Mod_PfeilCounter), " Bolzen hergestellt!"));
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_GoldErz_Komplett (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_BolzenMachen_GoldErz_Komplett_Condition;
	information		= PC_BolzenMachen_GoldErz_Komplett_Info;
	permanent		= TRUE;
	description		= "Bolzen mit Gold-Erz-Spitze herstellen (1x)";
};
FUNC INT PC_BolzenMachen_GoldErz_Komplett_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (BolzenMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Pfeil_GoldErz == 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_GoldErz_Komplett_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, BolzenSpitze_GoldErz) > 0)
	{
		Npc_RemoveInvItems	(hero, PfeilStab, 1);
		Npc_RemoveInvItems	(hero, BolzenSpitze_GoldErz, 1);
		CreateInvItems	(hero, ItRw_GoldErzBolt, 1);

		Print	("Bolzen aus Gold-Erz-Legierung hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_GoldErz_Komplett_Alle (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_BolzenMachen_GoldErz_Komplett_Alle_Condition;
	information		= PC_BolzenMachen_GoldErz_Komplett_Alle_Info;
	permanent		= TRUE;
	description		= "Bolzen mit Gold-Erz-Spitze herstellen (Alle)";
};
FUNC INT PC_BolzenMachen_GoldErz_Komplett_Alle_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (BolzenMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Pfeil_GoldErz == 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_GoldErz_Komplett_Alle_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, BolzenSpitze_GoldErz) > 0)
	{
		if (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, BolzenSpitze_GoldErz))
		{
			Mod_PfeilCounter = Npc_HasItems(hero, BolzenSpitze_GoldErz);

			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, BolzenSpitze_GoldErz));
			CreateInvItems	(hero, ItRw_GoldErzBolt, Npc_HasItems(hero, BolzenSpitze_GoldErz));
			Npc_RemoveInvItems	(hero, BolzenSpitze_GoldErz, Npc_HasItems(hero, BolzenSpitze_GoldErz));
		}
		else
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilStab);

			Npc_RemoveInvItems	(hero, BolzenSpitze_GoldErz, Npc_HasItems(hero, PfeilStab));
			CreateInvItems	(hero, ItRw_GoldErzBolt, Npc_HasItems(hero, PfeilStab));
			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilStab));
		};

		Print	(ConcatStrings(IntToString(Mod_PfeilCounter), " Bolzen aus Erz-Gold-Legierung hergestellt!"));
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_GoldErzBlut_Komplett (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_BolzenMachen_GoldErzBlut_Komplett_Condition;
	information		= PC_BolzenMachen_GoldErzBlut_Komplett_Info;
	permanent		= TRUE;
	description		= "Bolzen mit Gold-Erz-Blut-Spitze herstellen (1x)";
};
FUNC INT PC_BolzenMachen_GoldErzBlut_Komplett_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (BolzenMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Pfeil_GoldErz == 2)
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_GoldErzBlut_Komplett_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, BolzenSpitze_GoldErzBlut) > 0)
	{
		Npc_RemoveInvItems	(hero, PfeilStab, 1);
		Npc_RemoveInvItems	(hero, BolzenSpitze_GoldErzBlut, 1);
		CreateInvItems	(hero, ItRw_GoldErzBlutBolt, 1);

		Print	("Bolzen aus Gold-Erz-Blut-Legierung hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachen_GoldErzBlut_Komplett_Alle (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_BolzenMachen_GoldErzBlut_Komplett_Alle_Condition;
	information		= PC_BolzenMachen_GoldErzBlut_Komplett_Alle_Info;
	permanent		= TRUE;
	description		= "Bolzen mit Gold-Erz-Blut-Spitze herstellen (Alle)";
};
FUNC INT PC_BolzenMachen_GoldErzBlut_Komplett_Alle_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (BolzenMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Pfeil_GoldErz == 2)
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachen_GoldErzBlut_Komplett_Alle_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, BolzenSpitze_GoldErzBlut) > 0)
	{
		if (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, BolzenSpitze_GoldErzBlut))
		{
			Mod_PfeilCounter = Npc_HasItems(hero, BolzenSpitze_GoldErzBlut);

			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, BolzenSpitze_GoldErzBlut));
			CreateInvItems	(hero, ItRw_GoldErzBlutBolt, Npc_HasItems(hero, BolzenSpitze_GoldErzBlut));
			Npc_RemoveInvItems	(hero, BolzenSpitze_GoldErzBlut, Npc_HasItems(hero, BolzenSpitze_GoldErzBlut));
		}
		else
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilStab);

			Npc_RemoveInvItems	(hero, BolzenSpitze_GoldErzBlut, Npc_HasItems(hero, PfeilStab));
			CreateInvItems	(hero, ItRw_GoldErzBlutBolt, Npc_HasItems(hero, PfeilStab));
			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilStab));
		};

		Print	(ConcatStrings(IntToString(Mod_PfeilCounter), " Bolzen aus Gold-Erz-Blut-Legierung hergestellt!"));
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_BolzenMachenBACK (C_INFO)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_BolzenMachenBACK_Condition;
	information		= PC_BolzenMachenBACK_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK;
};
FUNC INT PC_BolzenMachenBACK_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (BolzenMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_BolzenMachenBACK_Info ()
{
	BolzenMachen = FALSE;
};

// Pfeile herstellen

INSTANCE PC_PfeileMachen (C_INFO)
{
	npc		= PC_Hero;
	condition	= PC_PfeileMachen_Condition;
	information	= PC_PfeileMachen_Info;
	permanent	= 1;
	description	= "Pfeile herstellen";
};

FUNC INT PC_PfeileMachen_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (Normalwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Starkwaffen == FALSE)
	{
		return 1;
	};
};

FUNC VOID PC_PfeileMachen_Info()
{
	PfeileMachen	=	TRUE;
};

INSTANCE PC_PfeileMachen_Spitze (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_PfeileMachen_Spitze_Condition;
	information		= PC_PfeileMachen_Spitze_Info;
	permanent		= TRUE;
	description		= "Pfeilspitzen schmieden (1 Rohstahl)";
};
FUNC INT PC_PfeileMachen_Spitze_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Mod_PfeileSpitzen == 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_Spitze_Info ()
{
	if (Npc_HasItems(hero, ItMiSwordRawHot) > 0)
	{
		Npc_RemoveInvItems	(hero, ItMiSwordRawHot, 1);
		CreateInvItems	(hero, PfeilSpitze, 10);

		Print	("10 Pfeilspitzen hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_SchmetterSpitze (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_PfeileMachen_SchmetterSpitze_Condition;
	information		= PC_PfeileMachen_SchmetterSpitze_Info;
	permanent		= TRUE;
	description		= "Schmetterpfeilspitzen schmieden (1 Rohstahl)";
};
FUNC INT PC_PfeileMachen_SchmetterSpitze_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Mod_PfeileSpitzen == 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_SchmetterSpitze_Info ()
{
	if (Npc_HasItems(hero, ItMiSwordRawHot) > 0)
	{
		Npc_RemoveInvItems	(hero, ItMiSwordRawHot, 1);
		CreateInvItems	(hero, SchmetterpfeilSpitze, 10);

		Print	("10 Schmetterpfeilspitzen hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_GoldErz_Spitze (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_PfeileMachen_GoldErz_Spitze_Condition;
	information		= PC_PfeileMachen_GoldErz_Spitze_Info;
	permanent		= TRUE;
	description		= "Pfeilspitzen mit Gold-Erz-Legierung schmieden (1 Goldbrocken und 3 Erzbrocken)";
};
FUNC INT PC_PfeileMachen_GoldErz_Spitze_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Pfeil_GoldErz >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_GoldErz_Spitze_Info ()
{
	if (Npc_HasItems(hero, ItMi_Nugget) >= 3)
	&& (Npc_HasItems(hero, ItMi_GoldNugget_Addon) >= 1)
	{
		Npc_RemoveInvItems	(hero, ItMi_GoldNugget_Addon, 1);
		Npc_RemoveInvItems	(hero, ItMi_Nugget, 3);

		CreateInvItems	(hero, PfeilSpitze_GoldErz, 100);

		Print	("100 Pfeilspitzen aus Gold-Erz-Legierung hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_GoldErzBlut_Spitze (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_PfeileMachen_GoldErzBlut_Spitze_Condition;
	information		= PC_PfeileMachen_GoldErzBlut_Spitze_Info;
	permanent		= TRUE;
	description		= "Pfeilspitzen mit Gold-Erz-Blut-Legierung schmieden (1 Goldbrocken, 3 Erzbrocken und 1 Drachenblut)";
};
FUNC INT PC_PfeileMachen_GoldErzBlut_Spitze_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Pfeil_GoldErz == 2)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_GoldErzBlut_Spitze_Info ()
{
	if (Npc_HasItems(hero, ItMi_Nugget) >= 3)
	&& (Npc_HasItems(hero, ItMi_GoldNugget_Addon) >= 1)
	&& (Npc_HasItems(hero, ItAt_DragonBlood) >= 1)
	{
		Npc_RemoveInvItems	(hero, ItMi_GoldNugget_Addon, 1);
		Npc_RemoveInvItems	(hero, ItMi_Nugget, 3);
		Npc_RemoveInvItems	(hero, ItAt_DragonBlood, 1);

		CreateInvItems	(hero, PfeilSpitze_GoldErzBlut, 100);

		Print	("100 Pfeilspitzen aus Gold-Erz-Blut-Legierung hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_Komplett (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PfeileMachen_Komplett_Condition;
	information		= PC_PfeileMachen_Komplett_Info;
	permanent		= TRUE;
	description		= "Pfeil herstellen (1x)";
};
FUNC INT PC_PfeileMachen_Komplett_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_Komplett_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, PfeilSpitze) > 0)
	{
		Npc_RemoveInvItems	(hero, PfeilStab, 1);
		Npc_RemoveInvItems	(hero, PfeilSpitze, 1);
		CreateInvItems	(hero, ItRw_Arrow, 1);

		Print	("Pfeil hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_Komplett_Alle (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PfeileMachen_Komplett_Alle_Condition;
	information		= PC_PfeileMachen_Komplett_Alle_Info;
	permanent		= TRUE;
	description		= "Pfeil herstellen (Alle)";
};
FUNC INT PC_PfeileMachen_Komplett_Alle_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_Komplett_Alle_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, PfeilSpitze) > 0)
	{
		if (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, PfeilSpitze))
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilSpitze);

			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilSpitze));
			CreateInvItems	(hero, ItRw_Arrow, Npc_HasItems(hero, PfeilSpitze));
			Npc_RemoveInvItems	(hero, PfeilSpitze, Npc_HasItems(hero, PfeilSpitze));
		}
		else
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilStab);

			Npc_RemoveInvItems	(hero, PfeilSpitze, Npc_HasItems(hero, PfeilStab));
			CreateInvItems	(hero, ItRw_Arrow, Npc_HasItems(hero, PfeilStab));
			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilStab));
		};

		Print	(ConcatStrings(IntToString(Mod_PfeilCounter), " Pfeile hergestellt!"));
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_Widerhaken_Komplett (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PfeileMachen_Widerhaken_Komplett_Condition;
	information		= PC_PfeileMachen_Widerhaken_Komplett_Info;
	permanent		= TRUE;
	description		= "Pfeil mit Widerhaken herstellen (1x)";
};
FUNC INT PC_PfeileMachen_Widerhaken_Komplett_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest))
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_Widerhaken_Komplett_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, PfeilSpitze) > 0)
	{
		Npc_RemoveInvItems	(hero, PfeilStab, 1);
		Npc_RemoveInvItems	(hero, PfeilSpitze, 1);
		CreateInvItems	(hero, ItRw_WiderhakenArrow, 1);

		Print	("Pfeil mit Widerhaken hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_Widerhaken_Komplett_Alle (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PfeileMachen_Widerhaken_Komplett_Alle_Condition;
	information		= PC_PfeileMachen_Widerhaken_Komplett_Alle_Info;
	permanent		= TRUE;
	description		= "Pfeil mit Widerhaken herstellen (Alle)";
};
FUNC INT PC_PfeileMachen_Widerhaken_Komplett_Alle_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest))
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_Widerhaken_Komplett_Alle_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, PfeilSpitze) > 0)
	{
		if (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, PfeilSpitze))
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilSpitze);

			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilSpitze));
			CreateInvItems	(hero, ItRw_WiderhakenArrow, Npc_HasItems(hero, PfeilSpitze));
			Npc_RemoveInvItems	(hero, PfeilSpitze, Npc_HasItems(hero, PfeilSpitze));
		}
		else
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilStab);

			Npc_RemoveInvItems	(hero, PfeilSpitze, Npc_HasItems(hero, PfeilStab));
			CreateInvItems	(hero, ItRw_WiderhakenArrow, Npc_HasItems(hero, PfeilStab));
			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilStab));
		};

		Print	(ConcatStrings(IntToString(Mod_PfeilCounter), " Pfeile mit Widerhaken hergestellt!"));
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_Praezision_Komplett (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PfeileMachen_Praezision_Komplett_Condition;
	information		= PC_PfeileMachen_Praezision_Komplett_Info;
	permanent		= TRUE;
	description		= "Präzisionspfeil herstellen (1x)";
};
FUNC INT PC_PfeileMachen_Praezision_Komplett_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest3))
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_Praezision_Komplett_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, PfeilSpitze) > 0)
	{
		Npc_RemoveInvItems	(hero, PfeilStab, 1);
		Npc_RemoveInvItems	(hero, PfeilSpitze, 1);
		CreateInvItems	(hero, ItRw_PraezisionsArrow, 1);

		Print	("Präzisionspfeil hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_Praezision_Komplett_Alle (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PfeileMachen_Praezision_Komplett_Alle_Condition;
	information		= PC_PfeileMachen_Praezision_Komplett_Alle_Info;
	permanent		= TRUE;
	description		= "Präzisionspfeil herstellen (Alle)";
};
FUNC INT PC_PfeileMachen_Praezision_Komplett_Alle_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest3))
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_Praezision_Komplett_Alle_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, PfeilSpitze) > 0)
	{
		if (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, PfeilSpitze))
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilSpitze);

			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilSpitze));
			CreateInvItems	(hero, ItRw_PraezisionsArrow, Npc_HasItems(hero, PfeilSpitze));
			Npc_RemoveInvItems	(hero, PfeilSpitze, Npc_HasItems(hero, PfeilSpitze));
		}
		else
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilStab);

			Npc_RemoveInvItems	(hero, PfeilSpitze, Npc_HasItems(hero, PfeilStab));
			CreateInvItems	(hero, ItRw_PraezisionsArrow, Npc_HasItems(hero, PfeilStab));
			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilStab));
		};

		Print	(ConcatStrings(IntToString(Mod_PfeilCounter), " Präzisionspfeile hergestellt!"));
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_Schmetterpfeile_Komplett (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PfeileMachen_Schmetterpfeile_Komplett_Condition;
	information		= PC_PfeileMachen_Schmetterpfeile_Komplett_Info;
	permanent		= TRUE;
	description		= "Schmetterpfeil herstellen (1x)";
};
FUNC INT PC_PfeileMachen_Schmetterpfeile_Komplett_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_Schmetterpfeile_Komplett_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, SchmetterPfeilSpitze) > 0)
	{
		Npc_RemoveInvItems	(hero, PfeilStab, 1);
		Npc_RemoveInvItems	(hero, SchmetterPfeilSpitze, 1);
		CreateInvItems	(hero, ItRw_SchmetterArrow, 1);

		Print	("Schmetterpfeil hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_Schmetterpfeile_Komplett_Alle (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PfeileMachen_Schmetterpfeile_Komplett_Alle_Condition;
	information		= PC_PfeileMachen_Schmetterpfeile_Komplett_Alle_Info;
	permanent		= TRUE;
	description		= "Schmetterpfeil herstellen (Alle)";
};
FUNC INT PC_PfeileMachen_Schmetterpfeile_Komplett_Alle_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_Schmetterpfeile_Komplett_Alle_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, SchmetterPfeilSpitze) > 0)
	{
		if (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, SchmetterPfeilSpitze))
		{
			Mod_PfeilCounter = Npc_HasItems(hero, SchmetterPfeilSpitze);

			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, SchmetterPfeilSpitze));
			CreateInvItems	(hero, ItRw_SchmetterArrow, Npc_HasItems(hero, SchmetterPfeilSpitze));
			Npc_RemoveInvItems	(hero, SchmetterPfeilSpitze, Npc_HasItems(hero, SchmetterPfeilSpitze));
		}
		else
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilStab);

			Npc_RemoveInvItems	(hero, SchmetterPfeilSpitze, Npc_HasItems(hero, PfeilStab));
			CreateInvItems	(hero, ItRw_SchmetterArrow, Npc_HasItems(hero, PfeilStab));
			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilStab));
		};

		Print	(ConcatStrings(IntToString(Mod_PfeilCounter), " Schmetterpfeile hergestellt!"));
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_GoldErz_Komplett (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PfeileMachen_GoldErz_Komplett_Condition;
	information		= PC_PfeileMachen_GoldErz_Komplett_Info;
	permanent		= TRUE;
	description		= "Pfeil mit Gold-Erz-Spitze herstellen (1x)";
};
FUNC INT PC_PfeileMachen_GoldErz_Komplett_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Pfeil_GoldErz >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_GoldErz_Komplett_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, PfeilSpitze_GoldErz) > 0)
	{
		Npc_RemoveInvItems	(hero, PfeilStab, 1);
		Npc_RemoveInvItems	(hero, PfeilSpitze_GoldErz, 1);
		CreateInvItems	(hero, ItRw_GoldErzArrow, 1);

		Print	("Pfeil aus Gold-Erz-Legierung hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_GoldErz_Komplett_Alle (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PfeileMachen_GoldErz_Komplett_Alle_Condition;
	information		= PC_PfeileMachen_GoldErz_Komplett_Alle_Info;
	permanent		= TRUE;
	description		= "Pfeile mit Gold-Erz-Spitze herstellen (Alle)";
};
FUNC INT PC_PfeileMachen_GoldErz_Komplett_Alle_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Pfeil_GoldErz >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_GoldErz_Komplett_Alle_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, PfeilSpitze_GoldErz) > 0)
	{
		if (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, PfeilSpitze_GoldErz))
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilSpitze_GoldErz);

			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilSpitze_GoldErz));
			CreateInvItems	(hero, ItRw_GoldErzArrow, Npc_HasItems(hero, PfeilSpitze_GoldErz));
			Npc_RemoveInvItems	(hero, PfeilSpitze_GoldErz, Npc_HasItems(hero, PfeilSpitze_GoldErz));
		}
		else
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilStab);

			Npc_RemoveInvItems	(hero, PfeilSpitze_GoldErz, Npc_HasItems(hero, PfeilStab));
			CreateInvItems	(hero, ItRw_GoldErzArrow, Npc_HasItems(hero, PfeilStab));
			Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilStab));
		};

		Print	(ConcatStrings(IntToString(Mod_PfeilCounter), " Pfeile aus Gold-Erz-Legierung hergestellt!"));
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_GoldErzBlut_Komplett (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PfeileMachen_GoldErzBlut_Komplett_Condition;
	information		= PC_PfeileMachen_GoldErzBlut_Komplett_Info;
	permanent		= TRUE;
	description		= "Pfeil mit Gold-Erz-Blut-Spitze herstellen (1x)";
};
FUNC INT PC_PfeileMachen_GoldErzBlut_Komplett_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Pfeil_GoldErz == 2)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_GoldErzBlut_Komplett_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, PfeilSpitze_GoldErzBlut) > 0)
	{
		Npc_RemoveInvItems	(hero, PfeilStab, 1);
		Npc_RemoveInvItems	(hero, PfeilSpitze_GoldErzBlut, 1);
		CreateInvItems	(hero, ItRw_GoldErzBlutArrow, 1);

		Print	("Pfeil aus Gold-Erz-Blut-Legierung hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_GoldErzBlut_Komplett_Alle (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PfeileMachen_GoldErzBlut_Komplett_Alle_Condition;
	information		= PC_PfeileMachen_GoldErzBlut_Komplett_Alle_Info;
	permanent		= TRUE;
	description		= "Pfeile mit Gold-Erz-Blut-Spitze herstellen (Alle)";
};
FUNC INT PC_PfeileMachen_GoldErzBlut_Komplett_Alle_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Pfeil_GoldErz == 2)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_GoldErzBlut_Komplett_Alle_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, PfeilSpitze_GoldErzBlut) > 0)
	{
		if (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, PfeilSpitze_GoldErzBlut))
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilSpitze_GoldErzBlut);

			Npc_RemoveInvItems	(hero, PfeilStab, Mod_PfeilCounter);
			CreateInvItems	(hero, ItRw_GoldErzBlutArrow, Mod_PfeilCounter);
			Npc_RemoveInvItems	(hero, PfeilSpitze_GoldErzBlut, Mod_PfeilCounter);
		}
		else
		{
			Mod_PfeilCounter = Npc_HasItems(hero, PfeilStab);

			Npc_RemoveInvItems	(hero, PfeilSpitze_GoldErzBlut, Mod_PfeilCounter);
			CreateInvItems	(hero, ItRw_GoldErzBlutArrow, Mod_PfeilCounter);
			Npc_RemoveInvItems	(hero, PfeilStab, Mod_PfeilCounter);
		};

		Print	(ConcatStrings(IntToString(Mod_PfeilCounter), " Pfeile aus Gold-Erz-Blut-Legierung hergestellt!"));
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_Sprengstoff_Komplett (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PfeileMachen_Sprengstoff_Komplett_Condition;
	information		= PC_PfeileMachen_Sprengstoff_Komplett_Info;
	permanent		= TRUE;
	description		= "Explosionspfeil herstellen (1x)";
};
FUNC INT PC_PfeileMachen_Sprengstoff_Komplett_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest5))
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_Sprengstoff_Komplett_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, PfeilSpitze) > 0)
	&& (Npc_HasItems(hero, ItMi_Sprengstoff) > 0)
	{
		Npc_RemoveInvItems	(hero, PfeilStab, 1);
		Npc_RemoveInvItems	(hero, PfeilSpitze, 1);
		Npc_RemoveInvItems	(hero, ItMi_Sprengstoff, 1);

		CreateInvItems	(hero, ItRw_SprengstoffArrow, 1);

		Print	("Explosionspfeil hergestellt!");
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachen_Sprengstoff_Komplett_Alle (C_INFO)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PfeileMachen_Sprengstoff_Komplett_Alle_Condition;
	information		= PC_PfeileMachen_Sprengstoff_Komplett_Alle_Info;
	permanent		= TRUE;
	description		= "Explosionspfeile herstellen (Alle)";
};
FUNC INT PC_PfeileMachen_Sprengstoff_Komplett_Alle_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest5))
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachen_Sprengstoff_Komplett_Alle_Info ()
{
	if (Npc_HasItems(hero, PfeilStab) > 0)
	&& (Npc_HasItems(hero, PfeilSpitze) > 0)
	&& (Npc_HasItems(hero, ItMi_Salpeter) > 0)
	{
		if (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, PfeilSpitze))
		&& (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, ItMi_Sprengstoff))
		{
			if (Npc_HasItems(hero, Pfeilspitze) > Npc_HasItems(hero, ItMi_Sprengstoff))
			{
				Mod_PfeilCounter = Npc_HasItems(hero, ItMi_Sprengstoff);

				Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, ItMi_Sprengstoff));
				Npc_RemoveInvItems	(hero, PfeilSpitze, Npc_HasItems(hero, ItMi_Sprengstoff));
				CreateInvItems	(hero, ItRw_SprengstoffArrow, Npc_HasItems(hero, ItMi_Sprengstoff));
				Npc_RemoveInvItems	(hero, ItMi_Sprengstoff, Npc_HasItems(hero, ItMi_Sprengstoff));
			}
			else
			{
				Mod_PfeilCounter = Npc_HasItems(hero, PfeilSpitze);

				Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilSpitze));
				Npc_RemoveInvItems	(hero, ItMi_Salpeter, Npc_HasItems(hero, PfeilSpitze));
				CreateInvItems	(hero, ItRw_SprengstoffArrow, Npc_HasItems(hero, PfeilSpitze));
				Npc_RemoveInvItems	(hero, PfeilSpitze, Npc_HasItems(hero, PfeilSpitze));
			};
		}
		else if (Npc_HasItems(hero, PfeilSpitze) > Npc_HasItems(hero, PfeilStab))
		&& (Npc_HasItems(hero, PfeilSpitze) > Npc_HasItems(hero, ItMi_Sprengstoff))
		{
			if (Npc_HasItems(hero, PfeilStab) > Npc_HasItems(hero, ItMi_Sprengstoff))
			{
				Mod_PfeilCounter = Npc_HasItems(hero, ItMi_Sprengstoff);

				Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, ItMi_Sprengstoff));
				Npc_RemoveInvItems	(hero, PfeilSpitze, Npc_HasItems(hero, ItMi_Sprengstoff));
				CreateInvItems	(hero, ItRw_SprengstoffArrow, Npc_HasItems(hero, ItMi_Sprengstoff));
				Npc_RemoveInvItems	(hero, ItMi_Sprengstoff, Npc_HasItems(hero, ItMi_Sprengstoff));
			}
			else
			{
				Mod_PfeilCounter = Npc_HasItems(hero, PfeilStab);

				Npc_RemoveInvItems	(hero, PfeilSpitze, Npc_HasItems(hero, PfeilStab));
				Npc_RemoveInvItems	(hero, ItMi_Salpeter, Npc_HasItems(hero, PfeilStab));
				CreateInvItems	(hero, ItRw_SprengstoffArrow, Npc_HasItems(hero, PfeilStab));
				Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilStab));
			};
		}
		else
		{
			if (Npc_HasItems(hero, Pfeilspitze) > Npc_HasItems(hero, PfeilStab))
			{
				Mod_PfeilCounter = Npc_HasItems(hero, PfeilStab);

				Npc_RemoveInvItems	(hero, ItMi_Sprengstoff, Npc_HasItems(hero, PfeilStab));
				Npc_RemoveInvItems	(hero, PfeilSpitze, Npc_HasItems(hero, PfeilStab));
				CreateInvItems	(hero, ItRw_SprengstoffArrow, Npc_HasItems(hero, PfeilStab));
				Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilStab));
			}
			else
			{
				Mod_PfeilCounter = Npc_HasItems(hero, PfeilSpitze);

				Npc_RemoveInvItems	(hero, PfeilStab, Npc_HasItems(hero, PfeilSpitze));
				Npc_RemoveInvItems	(hero, ItMi_Salpeter, Npc_HasItems(hero, PfeilSpitze));
				CreateInvItems	(hero, ItRw_SprengstoffArrow, Npc_HasItems(hero, PfeilSpitze));
				Npc_RemoveInvItems	(hero, PfeilSpitze, Npc_HasItems(hero, PfeilSpitze));
			};
		};

		Print	(ConcatStrings(IntToString(Mod_PfeilCounter), " Explosionspfeile hergestellt!"));
	}
	else
	{
		Print	(PRINT_ProdItemsMissing);
	};
};

INSTANCE PC_PfeileMachenBACK (C_INFO)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_PfeileMachenBACK_Condition;
	information		= PC_PfeileMachenBACK_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK;
};
FUNC INT PC_PfeileMachenBACK_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == TRUE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PfeileMachenBACK_Info ()
{
	PfeileMachen = FALSE;
};

// Ringe und Amulette schmieden

INSTANCE PC_Set (C_INFO)
{
	npc		= PC_Hero;
	condition	= PC_Set_Condition;
	information	= PC_Set_Info;
	permanent	= 1;
	description	= "Ringe und Amulette schmieden";
};

FUNC INT PC_Set_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (Normalwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Starkwaffen == FALSE)
	{
		return 1;
	};
};

FUNC VOID PC_Set_Info()
{
	Set	=	TRUE;
};

INSTANCE PC_Set_AdanosAmulett (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Set_AdanosAmulett_Condition;
	information		= PC_Set_AdanosAmulett_Info;
	permanent		= TRUE;
	description		= "Adanos' Amulett des Nebels schmieden (1x Metallblock, 1x Erzbrocken, 1x Goldbrocken, 2x Aquamarin, 1x Spruchrolle 'Eiswelle')";
};
FUNC INT PC_Set_AdanosAmulett_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == TRUE)
	&& (AdanosAmulett == 1)
	&& (Npc_HasItems(hero, ItMi_Metallblock) >= 1)
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 1)
	&& (Npc_HasItems(hero, ItMi_GoldNugget_Addon) >= 1)
	&& (Npc_HasItems(hero, ItMi_Aquamarine) >= 2)
	&& (Npc_HasItems(hero, ItSc_IceWave) >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Set_AdanosAmulett_Info ()
{
	Npc_RemoveInvItems	(hero, ItMi_Metallblock, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 1);
	Npc_RemoveInvItems	(hero, ItMi_GoldNugget_Addon, 1);
	Npc_RemoveInvItems	(hero, ItMi_Aquamarine, 2);
	Npc_RemoveInvItems	(hero, ItSc_IceWave, 1);

	CreateInvItems	(hero, ItAm_AdanosAmulett, 1);
};

INSTANCE PC_Set_AdanosBelt (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Set_AdanosBelt_Condition;
	information		= PC_Set_AdanosBelt_Info;
	permanent		= TRUE;
	description		= "Adanos' Gürtel des Frostes schmieden (1x Metallblock, 1x Erzbrocken, 1x Bergkristall, 2x Reptilienhaut, 1x Spruchrolle 'Eisblock')";
};
FUNC INT PC_Set_AdanosBelt_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == TRUE)
	&& (AdanosBelt == 1)
	&& (Npc_HasItems(hero, ItMi_Metallblock) >= 1)
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 1)
	&& (Npc_HasItems(hero, ItMi_Rockcrystal) >= 1)
	&& (Npc_HasItems(hero, ItAt_LurkerSkin) >= 2)
	&& (Npc_HasItems(hero, ItSc_IceCube) >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Set_AdanosBelt_Info ()
{
	Npc_RemoveInvItems	(hero, ItMi_Metallblock, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 1);
	Npc_RemoveInvItems	(hero, ItMi_Rockcrystal, 1);
	Npc_RemoveInvItems	(hero, ItAt_LurkerSkin, 2);
	Npc_RemoveInvItems	(hero, ItSc_IceCube, 1);

	CreateInvItems	(hero, ItBe_AdanosBelt, 1);
};

INSTANCE PC_Set_AdanosRing (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Set_AdanosRing_Condition;
	information		= PC_Set_AdanosRing_Info;
	permanent		= TRUE;
	description		= "Adanos' Ring des Wassers schmieden (1x Metallblock, 1x Erzbrocken, 2x Aquamarin, 1x Herz eines Eisgolems)";
};
FUNC INT PC_Set_AdanosRing_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == TRUE)
	&& (AdanosRing == 1)
	&& (Npc_HasItems(hero, ItMi_Metallblock) >= 1)
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 1)
	&& (Npc_HasItems(hero, ItMi_Aquamarine) >= 2)
	&& (Npc_HasItems(hero, ItAt_IceGolemHeart) >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Set_AdanosRing_Info ()
{
	Npc_RemoveInvItems	(hero, ItMi_Metallblock, 1);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 1);
	Npc_RemoveInvItems	(hero, ItMi_Aquamarine, 2);
	Npc_RemoveInvItems	(hero, ItAt_IceGolemHeart, 1);

	CreateInvItems	(hero, ItRi_AdanosRing, 1);
};

INSTANCE PC_Set_Wolfsamulett (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Set_Wolfsamulett_Condition;
	information		= PC_Set_Wolfsamulett_Info;
	permanent		= TRUE;
	description		= "Amulett des Wolfes schmieden (1x Metallblock, 3x Wolfsfell, 3x Zähne, 1x Spruchrolle 'Wolf beschwören')";
};
FUNC INT PC_Set_Wolfsamulett_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == TRUE)
	&& (Wolfsamulett == 1)
	&& (Npc_HasItems(hero, ItMi_Metallblock) >= 1)
	&& (Npc_HasItems(hero, ItAt_WolfFur) >= 3)
	&& (Npc_HasItems(hero, itat_teeth) >= 3)
	&& (Npc_HasItems(hero, ItSc_SumWolf) >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Set_Wolfsamulett_Info ()
{
	Npc_RemoveInvItems	(hero, ItMi_Metallblock, 1);
	Npc_RemoveInvItems	(hero, ItAt_WolfFur, 3);
	Npc_RemoveInvItems	(hero, itat_teeth, 3);
	Npc_RemoveInvItems	(hero, ItSc_SumWolf, 1);
	CreateInvItems	(hero, ItAm_Wolfsamulett, 1);
};

INSTANCE PC_Set_RingAusdauer (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Set_RingAusdauer_Condition;
	information		= PC_Set_RingAusdauer_Info;
	permanent		= TRUE;
	description		= "Linken Ring der Ausdauer schmieden (1x Metallblock, 1x Trank der Geschwindigkeit, 2x Flügel)";
};

FUNC INT PC_Set_RingAusdauer_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == TRUE)
	&& (RingAusdauer == 1)
	&& (Npc_HasItems(hero, ItMi_Metallblock) >= 1)
	&& (Npc_HasItems(hero, ItPo_Speed) >= 1)
	&& (Npc_HasItems(hero, ItAt_Wing) >= 2)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Set_RingAusdauer_Info ()
{
	Npc_RemoveInvItems	(hero, ItMi_Metallblock, 1);
	Npc_RemoveInvItems	(hero, ItPo_Speed, 1);
	Npc_RemoveInvItems	(hero, ItAt_Wing, 2);

	CreateInvItems	(hero, ItRi_RingAusdauer, 1);
};

INSTANCE PC_Set_RingHiebe (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Set_RingHiebe_Condition;
	information		= PC_Set_RingHiebe_Info;
	permanent		= TRUE;
	description		= "Linken Ring der Hiebe schmieden (1x Metallblock, 1x Trank der Geschwindigkeit, 2x Lurkerklaue)";
};

FUNC INT PC_Set_RingHiebe_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == TRUE)
	&& (RingHiebe == 1)
	&& (Npc_HasItems(hero, ItMi_Metallblock) >= 1)
	&& (Npc_HasItems(hero, ItPo_Speed) >= 1)
	&& (Npc_HasItems(hero, ItAt_LurkerClaw) >= 2)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Set_RingHiebe_Info ()
{
	Npc_RemoveInvItems	(hero, ItMi_Metallblock, 1);
	Npc_RemoveInvItems	(hero, ItPo_Speed, 1);
	Npc_RemoveInvItems	(hero, ItAt_LurkerClaw, 2);

	CreateInvItems	(hero, ItRi_RingHiebe, 1);
};

INSTANCE PC_Set_RingGewandtheit (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Set_RingGewandtheit_Condition;
	information		= PC_Set_RingGewandtheit_Info;
	permanent		= TRUE;
	description		= "Rechten Ring des Gewandtheit schmieden (1x Metallblock, 1x Horn eines Drachensnappers, 2x Knochen eines Goblins)";
};

FUNC INT PC_Set_RingGewandtheit_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == TRUE)
	&& (RingGewandtheit == 1)
	&& (Npc_HasItems(hero, ItMi_Metallblock) >= 1)
	&& (Npc_HasItems(hero, ItAt_DrgSnapperHorn) >= 1)
	&& (Npc_HasItems(hero, ItAt_GoblinBone) >= 2)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Set_RingGewandtheit_Info ()
{
	Npc_RemoveInvItems	(hero, ItMi_Metallblock, 1);
	Npc_RemoveInvItems	(hero, ItAt_DrgSnapperHorn, 1);
	Npc_RemoveInvItems	(hero, ItAt_GoblinBone, 2);

	CreateInvItems	(hero, ItRi_RingGewandtheit, 1);
};

INSTANCE PC_Set_RingStaerke (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Set_RingStaerke_Condition;
	information		= PC_Set_RingStaerke_Info;
	permanent		= TRUE;
	description		= "Rechten Ring der Stärke schmieden (1x Metallblock, 1x Horn eines Drachensnappers, 2x Knochen eines Goblins)";
};

FUNC INT PC_Set_RingStaerke_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == TRUE)
	&& (RingStaerke == 1)
	&& (Npc_HasItems(hero, ItMi_Metallblock) >= 1)
	&& (Npc_HasItems(hero, ItAt_DrgSnapperHorn) >= 1)
	&& (Npc_HasItems(hero, ItAt_GoblinBone) >= 2)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Set_RingStaerke_Info ()
{
	Npc_RemoveInvItems	(hero, ItMi_Metallblock, 1);
	Npc_RemoveInvItems	(hero, ItAt_DrgSnapperHorn, 1);
	Npc_RemoveInvItems	(hero, ItAt_GoblinBone, 2);

	CreateInvItems	(hero, ItRi_RingStaerke, 1);
};

INSTANCE PC_Set_Snapperring (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Set_Snapperring_Condition;
	information		= PC_Set_Snapperring_Info;
	permanent		= TRUE;
	description		= "Snapperkraftring schmieden (1x Metallblock, 4x Krallen)";
};

FUNC INT PC_Set_Snapperring_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == TRUE)
	&& (Snapperring == 1)
	&& (Npc_HasItems(hero, ItMi_Metallblock) >= 1)
	&& (Npc_HasItems(hero, ItAt_Claw) >= 4)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Set_Snapperring_Info ()
{
	Npc_RemoveInvItems	(hero, ItMi_Metallblock, 1);
	Npc_RemoveInvItems	(hero, ItAt_Claw, 4);
	CreateInvItems	(hero, ItRi_Snapperring, 1);
};

INSTANCE PC_Set_Wolfsring_Ruestung (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Set_Wolfsring_Ruestung_Condition;
	information		= PC_Set_Wolfsring_Ruestung_Info;
	permanent		= TRUE;
	description		= "Wolfsring der Rüstung schmieden (1x Metallblock, 4x Wolfsfell)";
};
FUNC INT PC_Set_Wolfsring_Ruestung_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == TRUE)
	&& (Wolfsring_Ruestung == 1)
	&& (Npc_HasItems(hero, ItMi_Metallblock) >= 1)
	&& (Npc_HasItems(hero, ItAt_WolfFur) >= 4)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Set_Wolfsring_Ruestung_Info ()
{
	Npc_RemoveInvItems	(hero, ItMi_Metallblock, 1);
	Npc_RemoveInvItems	(hero, ItAt_WolfFur, 4);
	CreateInvItems	(hero, ItRi_Wolfsring_Ruestung, 1);
};

INSTANCE PC_Set_Wolfsring_Leben (C_INFO)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Set_Wolfsring_Leben_Condition;
	information		= PC_Set_Wolfsring_Leben_Info;
	permanent		= TRUE;
	description		= "Wolfsring des Lebens schmieden (1x Metallblock, 4x Zähne)";
};
FUNC INT PC_Set_Wolfsring_Leben_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == TRUE)
	&& (Wolfsring_Leben == 1)
	&& (Npc_HasItems(hero, ItMi_Metallblock) >= 1)
	&& (Npc_HasItems(hero, itat_teeth) >= 4)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Set_Wolfsring_Leben_Info ()
{
	Npc_RemoveInvItems	(hero, ItMi_Metallblock, 1);
	Npc_RemoveInvItems	(hero, itat_teeth, 4);

	CreateInvItems	(hero, ItRi_Wolfsring_Leben, 1);
};

INSTANCE PC_Set_BACK (C_INFO)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_Set_BACK_Condition;
	information		= PC_Set_BACK_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK;
};
FUNC INT PC_Set_BACK_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Set_BACK_Info ()
{
	Set = FALSE;
};

// Rüstungen verbessern


INSTANCE PC_Verbessern (C_INFO)
{
	npc		= PC_Hero;
	condition	= PC_Verbessern_Condition;
	information	= PC_Verbessern_Info;
	permanent	= 1;
	description	= "Rüstungen verbessern";
};

FUNC INT PC_Verbessern_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (Normalwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Starkwaffen == FALSE)
	{
		return 1;
	};
};

FUNC VOID PC_Verbessern_Info()
{
	Verbessern	=	TRUE;
};


INSTANCE PC_Verbessern_Pala (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Verbessern_Pala_Condition;
	information		= PC_Verbessern_Pala_Info;
	permanent		= TRUE;
	description	= "Paladinrüstung verbessern";
};

FUNC INT PC_Verbessern_Pala_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Mod_Almanach_Geheimnis_Gelesen == TRUE))
	&& (Verbessern == TRUE)
	&& (Mod_Gilde == 3)
	&& (Npc_HasItems(hero, ItAt_TigerFur) > 2)
	&& (Npc_HasItems(hero, ItAr_Pal_H) == 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Verbessern_Pala_Info ()
{
	AI_UnequipArmor	(hero);
	CreateInvItems 	    (hero, ItAr_Pal_Tiger,  1); 
	Npc_RemoveInvItems	(hero, ItAr_Pal_H, 1);
	Npc_RemoveInvItems	(hero, ItAt_TigerFur, 3);
	
	B_ENDPRODUCTIONDIALOG ();
	Verbessern = FALSE;
};

INSTANCE PC_Verbessern_LDJG (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Verbessern_LDJG_Condition;
	information		= PC_Verbessern_LDJG_Info;
	permanent		= TRUE;
	description	= "Leichte Drachenjägerrüstung verbessern";
};

FUNC INT PC_Verbessern_LDJG_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Verbessern == TRUE)
	&& (Mod_Gilde == 5)
	&& (Armor_Dragon >= 1)
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 20)
	&& (Npc_HasItems(hero, ItAt_DragonScale) >= 9)
	&& (Npc_HasItems(hero, ItAr_DJG_L) == 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Verbessern_LDJG_Info ()
{
	AI_UnequipArmor	(hero);

	CreateInvItems 	    (hero, ItAr_DJG_M,  1); 

	Npc_RemoveInvItems	(hero, ItAr_djg_L, 1);
	Npc_RemoveInvItems	(hero, ItAt_DragonScale, 9);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 20);

	AI_EquipBestArmor	(hero);
	
	B_ENDPRODUCTIONDIALOG ();
	Verbessern = FALSE;
};

INSTANCE PC_Verbessern_MDJG (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Verbessern_MDJG_Condition;
	information		= PC_Verbessern_MDJG_Info;
	permanent		= TRUE;
	description	= "Mittlere Drachenjägerrüstung verbessern";
};

FUNC INT PC_Verbessern_MDJG_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Verbessern == TRUE)
	&& (Mod_Gilde == 5)
	&& (Armor_Dragon == 2)
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 16)
	&& (Npc_HasItems(hero, ItAt_DragonScale) >= 7)
	&& (Npc_HasItems(hero, ItAt_DragonBlood) >= 4)
	&& (Npc_HasItems(hero, ItAr_DJG_M) == 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Verbessern_MDJG_Info ()
{
	AI_UnequipArmor	(hero);

	CreateInvItems 	    (hero, ItAr_DJG_H,  1); 

	Npc_RemoveInvItems	(hero, ItAr_djg_M, 1);
	Npc_RemoveInvItems	(hero, ItAt_DragonScale, 7);
	Npc_RemoveInvItems	(hero, ItAt_DragonBlood, 4);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 16);

	AI_EquipBestArmor	(hero);
	
	B_ENDPRODUCTIONDIALOG ();
	Verbessern = FALSE;
};

INSTANCE PC_Verbessern_DJG (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Verbessern_DJG_Condition;
	information		= PC_Verbessern_DJG_Info;
	permanent		= TRUE;
	description	= "Schwere Drachenjägerrüstung verbessern";
};

FUNC INT PC_Verbessern_DJG_Condition()
{	
	if ((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Mod_Almanach_Geheimnis_Gelesen == TRUE))
	&& (Verbessern == TRUE)
	&& (Mod_Gilde == 5)
	&& (Npc_HasItems(hero, ItAt_TrollSilberFur) > 2)
	&& (Npc_HasItems(hero, ItAr_DJG_H) == 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Verbessern_DJG_Info ()
{
	AI_UnequipArmor	(hero);
	CreateInvItems 	    (hero, ItAr_Drachentroll,  1); 
	Npc_RemoveInvItems	(hero, ItAr_djg_H, 1);
	Npc_RemoveInvItems	(hero, ItAt_TrollSilberFur, 3);

	AI_EquipBestArmor	(hero);
	
	B_ENDPRODUCTIONDIALOG ();
	Verbessern = FALSE;
};

INSTANCE PC_Verbessern_DMR (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Verbessern_DMR_Condition;
	information		= PC_Verbessern_DMR_Info;
	permanent		= TRUE;
	description	= "Dämonenritterrüstung verbessern";
};

FUNC INT PC_Verbessern_DMR_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Mod_Almanach_Geheimnis_Gelesen == TRUE))
	&& (Verbessern == TRUE)
	&& (Mod_Gilde == 16)
	&& (Npc_HasItems(hero, ItAt_LindwurmHaut) > 2)
	&& (Npc_HasItems(hero, ItAr_Raven_Addon) == 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Verbessern_DMR_Info ()
{
	AI_UnequipArmor	(hero);
	CreateInvItems 	    (hero, ItAr_DMR_M,  1); 
	Npc_RemoveInvItems	(hero, ItAr_Raven_Addon, 1);
	Npc_RemoveInvItems	(hero, ItAt_Lindwurmhaut, 3);

	AI_EquipBestArmor	(hero);
	
	B_ENDPRODUCTIONDIALOG ();
	Verbessern = FALSE;
};

INSTANCE PC_Verbessern_HTR (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Verbessern_HTR_Condition;
	information		= PC_Verbessern_HTR_Info;
	permanent		= TRUE;
	description	= "Hüterrüstung verbessern";
};

FUNC INT PC_Verbessern_HTR_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Mod_Almanach_Geheimnis_Gelesen == TRUE))
	&& (Verbessern == TRUE)
	&& (Mod_Gilde == 18)
	&& (Npc_HasItems(hero, ItAt_WaterorcFur) > 2)
	&& (Npc_HasItems(hero, ItAr_Hueter) == 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Verbessern_HTR_Info ()
{
	AI_UnequipArmor	(hero);
	CreateInvItems 	    (hero, ItAr_Hueter_s,  1); 
	Npc_RemoveInvItems	(hero, ItAr_Hueter, 1);
	Npc_RemoveInvItems	(hero, ItAt_WaterorcFur, 3);

	AI_EquipBestArmor	(hero);
	
	B_ENDPRODUCTIONDIALOG ();
	Verbessern = FALSE;
};

INSTANCE PC_VerbessernBACK (C_INFO)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_VerbessernBACK_Condition;
	information		= PC_VerbessernBACK_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK;
};
FUNC INT PC_VerbessernBACK_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == TRUE)
	&& (Set == FALSE)
	&& (Starkwaffen == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_VerbessernBACK_Info ()
{
	Verbessern = FALSE;
};


//*******************************************************
//	SmithWeapon Dialog abbrechen
//*******************************************************
INSTANCE PC_SmithWeapon_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_SmithWeapon_End_Condition;
	information		= PC_SmithWeapon_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_SmithWeapon_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	&& (BolzenMachen == FALSE)
	&& (PfeileMachen == FALSE)
	&& (Verbessern == FALSE)
	&& (Set == FALSE)
	&& (Starkwaffen == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_SmithWeapon_End_Info()
{
	B_ENDPRODUCTIONDIALOG ();
	Erzwaffen = FALSE;
	NormalWaffen = FALSE;
	StarkWaffen = FALSE;
	PfeileMachen = FALSE;
	Verbessern = FALSE;
	BolzenMachen = FALSE;
	Set = FALSE;
};

FUNC VOID SMITHWEAPON_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
		
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_SMITHWEAPON;
		Ai_ProcessInfos (her);
	};

	PC_ItMw_1H_Common.description			= NAME_ItMw_1H_Common_01;                                            
	
	PC_WEAPON_1H_Harad_01.description		= NAME_Addon_Harad_01;
	PC_WEAPON_1H_Harad_02.description		= NAME_Addon_Harad_02;
	PC_WEAPON_1H_Harad_03.description		= NAME_Addon_Harad_03;
	PC_WEAPON_1H_Harad_04.description		= NAME_Addon_Harad_04;
}; 