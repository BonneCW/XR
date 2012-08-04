FUNC VOID Kessel_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Kessel;
		Ai_ProcessInfos (her);
	};
}; 

INSTANCE PC_Kessel_Blutkult (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Kessel_Blutkult_Condition;
	information	= PC_Kessel_Blutkult_Info;
	permanent	= 1;
	important	= 0;
	description	= "Dämoneneintopf: 1x Dämonenherz + 2x Feuerzunge + 2x Zombiefleisch + 3x Fliegenpilz + 4x Blut";
};

FUNC INT PC_Kessel_Blutkult_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Kessel)
	&& (Npc_HasItems(hero, ItFoMuttonZombie) >= 2)
	&& (Npc_HasItems(hero, ItAt_DemonHeart) >= 1)
	&& (Npc_HasItems(hero, ItAt_WaranFireTongue) >= 2)
	&& (Npc_HasItems(hero, ItPl_Mushroom_03) >= 3)
	&& (Npc_HasItems(hero, ItPo_Blood) >= 4)
	&& (Rezept_Blutkult == TRUE)
	{
		return 1;
	};
};

FUNC VOID PC_Kessel_Blutkult_Info()
{
	Npc_RemoveInvItems	(hero, ItFoMuttonZombie, 2);
	Npc_RemoveInvItems	(hero, ItAt_DemonHeart, 1);
	Npc_RemoveInvItems	(hero, ItAt_WaranFireTongue, 2);
	Npc_RemoveInvItems	(hero, ItPl_Mushroom_03, 3);
	Npc_RemoveInvItems	(hero, ItPo_Blood, 4);
	
	CreateInvItems	(hero, ItFo_Blutkult, 1);

	Print (PRINT_KesselSuccess);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Kessel_Fangheuschreckensuppe (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Kessel_Fangheuschreckensuppe_Condition;
	information	= PC_Kessel_Fangheuschreckensuppe_Info;
	permanent	= 1;
	important	= 0;
	description	= "Fangheuschreckensuppe: 1x Fangheuschreckenkopf, 2x Wasser, 1x Fisch";
};

FUNC INT PC_Kessel_Fangheuschreckensuppe_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Kessel)
	&& (Npc_HasItems(hero, ItFo_Fish)	>=	1)
	&& (Npc_HasItems(hero, ItFo_Water)	>=	2)
	&& (Npc_HasItems(hero, ItAt_Addon_BCKopf) >= 1)
	&& (Rezept_Fangheuschreckensuppe == TRUE)
	&& (Mod_Edda_Lernen == 2)
	{
		return 1;
	};
};

FUNC VOID PC_Kessel_Fangheuschreckensuppe_Info()
{
	Npc_RemoveInvItems	(hero, ItFo_Fish, 1);
	Npc_RemoveInvItems	(hero, ItFo_Water, 2);
	Npc_RemoveInvItems	(hero, ItAt_Addon_BCKopf, 1);
	
	CreateInvItems	(hero, ItFo_Fangheuschreckensuppe, 1);

	Print (PRINT_KesselSuccess);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Kessel_Fangheuschreckensuppe_Max (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Kessel_Fangheuschreckensuppe_Max_Condition;
	information	= PC_Kessel_Fangheuschreckensuppe_Max_Info;
	permanent	= 1;
	important	= 0;
	description	= "Max. Fangheuschreckensuppen";
};

FUNC INT PC_Kessel_Fangheuschreckensuppe_Max_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Kessel)
	&& (Npc_HasItems(hero, ItFo_Fish)	>=	1)
	&& (Npc_HasItems(hero, ItFo_Water)	>=	2)
	&& (Npc_HasItems(hero, ItAt_Addon_BCKopf) >= 1)
	&& (Rezept_Fangheuschreckensuppe == TRUE)
	&& (Mod_Edda_Lernen == 2)
	{
		return 1;
	};
};

FUNC VOID PC_Kessel_Fangheuschreckensuppe_Max_Info()
{
	var int max;

	if (Npc_HasItems(hero, ItFo_Fish)*2 <= Npc_HasItems(hero, ItFo_Water))
	&& (Npc_HasItems(hero, ItFo_Fish) <= Npc_HasItems(hero, ItAt_Addon_BCKopf))
	{
		max = Npc_HasItems(hero, ItFo_Fish);
	}
	else if (Npc_HasItems(hero, ItAt_Addon_BCKopf)*2 <= Npc_HasItems(hero, ItFo_Water))
	&& (Npc_HasItems(hero, ItAt_Addon_BCKopf) <= Npc_HasItems(hero, ItFo_Fish))
	{
		max = Npc_HasItems(hero, ItAt_Addon_BCKopf);
	}
	else
	{
		max = Npc_HasItems(hero, ItFo_Water)/2;
	};

	Npc_RemoveInvItems	(hero, ItFo_Fish, max);
	Npc_RemoveInvItems	(hero, ItFo_Water, 2*max);
	Npc_RemoveInvItems	(hero, ItAt_Addon_BCKopf, max);
	
	CreateInvItems	(hero, ItFo_Fangheuschreckensuppe, max);

	Print (PRINT_KesselSuccess);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Kessel_Fischragout (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Kessel_Fischragout_Condition;
	information	= PC_Kessel_Fischragout_Info;
	permanent	= 1;
	important	= 0;
	description	= "Fischragout: 2x Fisch, 1x Waldbeere";
};

FUNC INT PC_Kessel_Fischragout_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Kessel)
	&& (Npc_HasItems(hero, ItFo_Fish)	>=	2)
	&& (Npc_HasItems(hero, ItPl_Forestberry)	>=	1)
	&& (Rezept_Fischragout == TRUE)
	&& (Mod_Edda_Lernen == 2)
	{
		return 1;
	};
};

FUNC VOID PC_Kessel_Fischragout_Info()
{
	Npc_RemoveInvItems	(hero, ItFo_Fish, 2);
	Npc_RemoveInvItems	(hero, ItPl_Forestberry, 1);
	
	CreateInvItems	(hero, ItFo_FishRagout, 1);

	Print (PRINT_KesselSuccess);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Kessel_Fischragout_Max (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Kessel_Fischragout_Max_Condition;
	information	= PC_Kessel_Fischragout_Max_Info;
	permanent	= 1;
	important	= 0;
	description	= "Max. Fischragout";
};

FUNC INT PC_Kessel_Fischragout_Max_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Kessel)
	&& (Npc_HasItems(hero, ItFo_Fish)	>=	2)
	&& (Npc_HasItems(hero, ItPl_Forestberry)	>=	1)
	&& (Rezept_Fischragout == TRUE)
	&& (Mod_Edda_Lernen == 2)
	{
		return 1;
	};
};

FUNC VOID PC_Kessel_Fischragout_Max_Info()
{
	var int max;

	if (Npc_HasItems(hero, ItPl_Forestberry)*2 <= Npc_HasItems(hero, ItFo_Fish))
	{
		max = Npc_HasItems(hero, ItPl_Forestberry);
	}
	else
	{
		max = Npc_HasItems(hero, ItFo_Fish)/2;
	};

	Npc_RemoveInvItems	(hero, ItFo_Fish, 2*max);
	Npc_RemoveInvItems	(hero, ItPl_Forestberry, max);
	
	CreateInvItems	(hero, ItFo_FishRagout, max);

	Print (PRINT_KesselSuccess);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Kessel_Fischsuppe (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Kessel_Fischsuppe_Condition;
	information	= PC_Kessel_Fischsuppe_Info;
	permanent	= 1;
	important	= 0;
	description	= "Fischsuppe: 1x Fisch";
};

FUNC INT PC_Kessel_Fischsuppe_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Kessel)
	&& (Npc_HasItems(hero, ItFo_Fish)	>=	1)
	&& (Rezept_Fischsuppe == TRUE)
	&& (Mod_Edda_Lernen == 2)
	{
		return 1;
	};
};

FUNC VOID PC_Kessel_Fischsuppe_Info()
{
	Npc_RemoveInvItems	(hero, ItFo_Fish, 1);
	
	CreateInvItems	(hero, ItFo_FishSoup, 1);

	Print (PRINT_KesselSuccess);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Kessel_Fischsuppe_Max (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Kessel_Fischsuppe_Max_Condition;
	information	= PC_Kessel_Fischsuppe_Max_Info;
	permanent	= 1;
	important	= 0;
	description	= "Max. Fischsuppen";
};

FUNC INT PC_Kessel_Fischsuppe_Max_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Kessel)
	&& (Npc_HasItems(hero, ItFo_Fish)	>=	1)
	&& (Rezept_Fischsuppe == TRUE)
	&& (Mod_Edda_Lernen == 2)
	{
		return 1;
	};
};

FUNC VOID PC_Kessel_Fischsuppe_Max_Info()
{
	var int max;
	max = Npc_HasItems(hero, ItFo_Fish);

	Npc_RemoveInvItems	(hero, ItFo_Fish, max);
	
	CreateInvItems	(hero, ItFo_FishSoup, max);

	Print (PRINT_KesselSuccess);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Kessel_Fleischeintopf (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Kessel_Fleischeintopf_Condition;
	information	= PC_Kessel_Fleischeintopf_Info;
	permanent	= 1;
	important	= 0;
	description	= "Fleischeintopf: 2x rohes Fleisch, 1x Waldbeere, 1x Feldrübe";
};

FUNC INT PC_Kessel_Fleischeintopf_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Kessel)
	&& (Npc_HasItems(hero, ItFo_MuttonRaw)	>=	2)
	&& (Npc_HasItems(hero, ItPl_Forestberry)	>=	1)
	&& (Npc_HasItems(hero, ItPl_Beet)	>=	1)
	&& (Rezept_Fleischeintopf == TRUE)
	&& (Mod_Edda_Lernen == 2)
	{
		return 1;
	};
};

FUNC VOID PC_Kessel_Fleischeintopf_Info()
{
	Npc_RemoveInvItems	(hero, ItPl_Beet, 1);
	Npc_RemoveInvItems	(hero, ItPl_Forestberry, 1);
	Npc_RemoveInvItems	(hero, ItFo_MuttonRaw, 2);
	
	CreateInvItems	(hero, ItFo_Fleischeintopf, 1);

	Print (PRINT_KesselSuccess);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Kessel_Fleischeintopf_Max (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Kessel_Fleischeintopf_Max_Condition;
	information	= PC_Kessel_Fleischeintopf_Max_Info;
	permanent	= 1;
	important	= 0;
	description	= "Max. Fleischeintöpfe";
};

FUNC INT PC_Kessel_Fleischeintopf_Max_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Kessel)
	&& (Npc_HasItems(hero, ItFo_MuttonRaw)	>=	2)
	&& (Npc_HasItems(hero, ItPl_Forestberry)	>=	1)
	&& (Npc_HasItems(hero, ItPl_Beet)	>=	1)
	&& (Rezept_Fleischeintopf == TRUE)
	&& (Mod_Edda_Lernen == 2)
	{
		return 1;
	};
};

FUNC VOID PC_Kessel_Fleischeintopf_Max_Info()
{
	var int max;

	if (Npc_HasItems(hero, ItPl_Beet)*2 <= Npc_HasItems(hero, ItFo_MuttonRaw))
	&& (Npc_HasItems(hero, ItPl_Beet) <= Npc_HasItems(hero, ItPl_Forestberry))
	{
		max = Npc_HasItems(hero, ItPl_Beet);
	}
	else if (Npc_HasItems(hero, ItPl_Forestberry)*2 <= Npc_HasItems(hero, ItFo_MuttonRaw))
	&& (Npc_HasItems(hero, ItPl_Forestberry) <= Npc_HasItems(hero, ItPl_Beet))
	{
		max = Npc_HasItems(hero, ItPl_Forestberry);
	}
	else
	{
		max = Npc_HasItems(hero, ItFo_MuttonRaw)/2;
	};

	Npc_RemoveInvItems	(hero, ItPl_Beet, max);
	Npc_RemoveInvItems	(hero, ItPl_Forestberry, max);
	Npc_RemoveInvItems	(hero, ItFo_MuttonRaw, 2*max);
	
	CreateInvItems	(hero, ItFo_Fleischeintopf, max);

	Print (PRINT_KesselSuccess);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Kessel_Fleischwanzenragout (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Kessel_Fleischwanzenragout_Condition;
	information	= PC_Kessel_Fleischwanzenragout_Info;
	permanent	= 1;
	important	= 0;
	description	= "Fleischwanzenragout: 2x Dunkelpilz, 1x Wanzenfleisch";
};

FUNC INT PC_Kessel_Fleischwanzenragout_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Kessel)
	&& (Npc_HasItems(hero, ItPl_Mushroom_01) >= 2)
	&& (Npc_HasItems(hero, ItAt_Meatbugflesh) >= 1)
	&& (Rezept_Fleischwanzenragout == TRUE)
	&& (Mod_Edda_Lernen == 2)
	{
		return 1;
	};
};

FUNC VOID PC_Kessel_Fleischwanzenragout_Info()
{
	Npc_RemoveInvItems	(hero, ItPl_Mushroom_01, 2);
	Npc_RemoveInvItems	(hero, ItAt_Meatbugflesh, 1);

	CreateInvItems	(hero, ItFo_Fleischwanzenragout, 1);

	Print (PRINT_KesselSuccess);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Kessel_Fleischwanzenragout_Max (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Kessel_Fleischwanzenragout_Max_Condition;
	information	= PC_Kessel_Fleischwanzenragout_Max_Info;
	permanent	= 1;
	important	= 0;
	description	= "Max. Fleischwanzenragouts";
};

FUNC INT PC_Kessel_Fleischwanzenragout_Max_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Kessel)
	&& (Npc_HasItems(hero, ItPl_Mushroom_01) >= 2)
	&& (Npc_HasItems(hero, ItAt_Meatbugflesh) >= 1)
	&& (Rezept_Fleischwanzenragout == TRUE)
	&& (Mod_Edda_Lernen == 2)
	{
		return 1;
	};
};

FUNC VOID PC_Kessel_Fleischwanzenragout_Max_Info()
{
	var int max;

	if (Npc_HasItems(hero, ItAt_Meatbugflesh)*2 <= Npc_HasItems(hero, ItPl_Mushroom_01))
	{
		max = Npc_HasItems(hero, ItAt_Meatbugflesh);
	}
	else
	{
		max = Npc_HasItems(hero, ItPl_Mushroom_01)/2;
	};

	Npc_RemoveInvItems	(hero, ItPl_Mushroom_01, 2*max);
	Npc_RemoveInvItems	(hero, ItAt_Meatbugflesh, max);

	CreateInvItems	(hero, ItFo_Fleischwanzenragout, max);

	Print (PRINT_KesselSuccess);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Kessel_Pilzsuppe (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Kessel_Pilzsuppe_Condition;
	information	= PC_Kessel_Pilzsuppe_Info;
	permanent	= 1;
	important	= 0;
	description	= "Pilzsuppe: 2x Dunkelpilz, 1x Buddlerfleisch";
};

FUNC INT PC_Kessel_Pilzsuppe_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Kessel)
	&& (Npc_HasItems(hero, ItPl_Mushroom_01) >= 2)
	&& (Npc_HasItems(hero, ItPl_Mushroom_02) >= 1)
	&& (Rezept_Pilzsuppe == TRUE)
	&& (Mod_Edda_Lernen == 2)
	{
		return 1;
	};
};

FUNC VOID PC_Kessel_Pilzsuppe_Info()
{
	Npc_RemoveInvItems	(hero, ItPl_Mushroom_01, 2);
	Npc_RemoveInvItems	(hero, ItPl_Mushroom_02, 1);

	CreateInvItems	(hero, ItFo_Pilzsuppe, 1);

	Print (PRINT_KesselSuccess);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Kessel_Pilzsuppe_Max (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Kessel_Pilzsuppe_Max_Condition;
	information	= PC_Kessel_Pilzsuppe_Max_Info;
	permanent	= 1;
	important	= 0;
	description	= "Max. Pilzsuppen";
};

FUNC INT PC_Kessel_Pilzsuppe_Max_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Kessel)
	&& (Npc_HasItems(hero, ItPl_Mushroom_01) >= 2)
	&& (Npc_HasItems(hero, ItPl_Mushroom_02) >= 1)
	&& (Rezept_Pilzsuppe == TRUE)
	&& (Mod_Edda_Lernen == 2)
	{
		return 1;
	};
};

FUNC VOID PC_Kessel_Pilzsuppe_Max_Info()
{
	var int max;

	if (Npc_HasItems(hero, ItPl_Mushroom_02)*2 <= Npc_HasItems(hero, ItPl_Mushroom_01))
	{
		max = Npc_HasItems(hero, ItPl_Mushroom_02);
	}
	else
	{
		max = Npc_HasItems(hero, ItPl_Mushroom_01)/2;
	};

	Npc_RemoveInvItems	(hero, ItPl_Mushroom_01, 2*max);
	Npc_RemoveInvItems	(hero, ItPl_Mushroom_02, max);

	CreateInvItems	(hero, ItFo_Pilzsuppe, max);

	Print (PRINT_KesselSuccess);

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_Kessel_EXIT (C_INFO)
{
	npc		= PC_HERO;
	nr		= 1;
	condition	= PC_Kessel_EXIT_Condition;
	information	= PC_Kessel_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT PC_Kessel_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Kessel)
	{
		return 1;
	};
};

FUNC VOID PC_Kessel_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG ();
};