FUNC VOID Steinschale1_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Steinschale1;
		Ai_ProcessInfos (her);
	};
};

FUNC VOID Steinschale1_S0 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Steinschale1;
		Ai_ProcessInfos (her);
	};
};

INSTANCE PC_Steinschale1_Rein (C_Info)
{
	npc			= PC_Hero;
	nr			= 2;
	condition		= PC_Steinschale1_Rein_Condition;
	information		= PC_Steinschale1_Rein_Info;
	permanent		= 0;
	description		= "Grünen Erzbrocken hineinlegen"; 
};

FUNC INT PC_Steinschale1_Rein_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Steinschale1)
	&& (Npc_HasItems(hero, ItMi_GreenNugget) >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Steinschale1_Rein_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_GreenNugget, 1);	

	Mod_Steinschale1 += 1;

	if (Mod_Steinschale1 == 1)
	{
		Wld_SendTrigger	("EVT_BLUTKELCH_BARRIERELEFT");
	}
	else if (Mod_Steinschale1 == 5)
	{
		Wld_SendTrigger	("EVT_BLUTKELCH_BARRIEREMIDLEFT");

		if (Mod_Steinschale2 == 5)
		{
			Wld_SendTrigger	("EVT_BLUTKELCH_BARRIEREMID");
		};
	};
};

INSTANCE PC_Steinschale1_Raus (C_Info)
{
	npc			= PC_Hero;
	nr			= 2;
	condition		= PC_Steinschale1_Raus_Condition;
	information		= PC_Steinschale1_Raus_Info;
	permanent		= 0;
	description		= "Grünen Erzbrocken herausnehmen"; 
};

FUNC INT PC_Steinschale1_Raus_Condition ()
{
	if (Mod_Steinschale1 == 5)
	&& (Mod_Steinschale2 == 5)
	{
		return FALSE;
	};

	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Steinschale1)
	&& (Mod_Steinschale1 >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Steinschale1_Raus_Info()
{
	CreateInvItems	(hero, ItMi_GreenNugget, 1);	

	Mod_Steinschale1 -= 1;

	if (Mod_Steinschale1 == 0)
	{
		Wld_SendTrigger	("EVT_BLUTKELCH_BARRIERELEFT");
	}
	else if (Mod_Steinschale1 == 4)
	{
		Wld_SendTrigger	("EVT_BLUTKELCH_BARRIEREMIDLEFT");
	};
};

INSTANCE PC_Steinschale1_End (C_Info)
{
	npc			= PC_Hero;
	nr			= 999;
	condition		= PC_Steinschale1_End_Condition;
	information		= PC_Steinschale1_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_Steinschale1_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Steinschale1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Steinschale1_End_Info()
{
	B_ENDPRODUCTIONDIALOG ();
};