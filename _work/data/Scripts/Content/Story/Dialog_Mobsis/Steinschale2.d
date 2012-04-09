FUNC VOID Steinschale2_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Steinschale2;
		Ai_ProcessInfos (her);
	};
};

FUNC VOID Steinschale2_S0 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Steinschale2;
		Ai_ProcessInfos (her);
	};
};

INSTANCE PC_Steinschale2_Rein (C_Info)
{
	npc			= PC_Hero;
	nr			= 2;
	condition		= PC_Steinschale2_Rein_Condition;
	information		= PC_Steinschale2_Rein_Info;
	permanent		= 0;
	description		= "Grünen Erzbrocken hineinlegen"; 
};

FUNC INT PC_Steinschale2_Rein_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Steinschale2)
	&& (Npc_HasItems(hero, ItMi_GreenNugget) >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Steinschale2_Rein_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_GreenNugget, 1);	

	Mod_Steinschale2 += 1;

	if (Mod_Steinschale2 == 1)
	{
		Wld_SendTrigger	("EVT_BLUTKELCH_BARRIERERIGHT");
	}
	else if (Mod_Steinschale2 == 5)
	{
		Wld_SendTrigger	("EVT_BLUTKELCH_BARRIEREMIDRIGHT");

		if (Mod_Steinschale1 == 5)
		{
			Wld_SendTrigger	("EVT_BLUTKELCH_BARRIEREMID");
		};
	};
};

INSTANCE PC_Steinschale2_Raus (C_Info)
{
	npc			= PC_Hero;
	nr			= 2;
	condition		= PC_Steinschale2_Raus_Condition;
	information		= PC_Steinschale2_Raus_Info;
	permanent		= 0;
	description		= "Grünen Erzbrocken herausnehmen"; 
};

FUNC INT PC_Steinschale2_Raus_Condition ()
{
	if (Mod_Steinschale1 == 5)
	&& (Mod_Steinschale2 == 5)
	{
		return FALSE;
	};

	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Steinschale2)
	&& (Mod_Steinschale2 >= 1)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Steinschale2_Raus_Info()
{
	CreateInvItems	(hero, ItMi_GreenNugget, 1);	

	Mod_Steinschale2 -= 1;

	if (Mod_Steinschale2 == 0)
	{
		Wld_SendTrigger	("EVT_BLUTKELCH_BARRIERERIGHT");
	}
	else if (Mod_Steinschale2 == 4)
	{
		Wld_SendTrigger	("EVT_BLUTKELCH_BARRIEREMIDRIGHT");
	};
};

INSTANCE PC_Steinschale2_End (C_Info)
{
	npc			= PC_Hero;
	nr			= 999;
	condition		= PC_Steinschale2_End_Condition;
	information		= PC_Steinschale2_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_Steinschale2_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Steinschale2)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Steinschale2_End_Info()
{
	B_ENDPRODUCTIONDIALOG ();
};