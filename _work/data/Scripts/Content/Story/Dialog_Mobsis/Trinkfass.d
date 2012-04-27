FUNC VOID Trinkfass_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_TRINKFASS;
		Ai_ProcessInfos (her);
	};
};

INSTANCE PC_Trinkfass_Trinken (C_Info)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Trinkfass_Trinken_Condition;
	information	= PC_Trinkfass_Trinken_Info;
	permanent	= TRUE;
	description	= "Einen Schluck Wasser trinken"; 
};

FUNC INT PC_Trinkfass_Trinken_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_TRINKFASS)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Trinkfass_Trinken_Info()
{
	if (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] += 2;
	}
	else if (hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	};

	hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS];

	AI_PlayAni 	(hero, "T_TRINKFASS_SEP"); 
};

INSTANCE PC_Trinkfass_EXIT (C_Info)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Trinkfass_EXIT_Condition;
	information	= PC_Trinkfass_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE; 
};

FUNC INT PC_Trinkfass_EXIT_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_TRINKFASS)
	{	
		return 1;
	};
};

FUNC VOID PC_Trinkfass_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG ();
};