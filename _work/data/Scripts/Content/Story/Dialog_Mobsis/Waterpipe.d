FUNC VOID Waterpipe_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Waterpipe;
		Ai_ProcessInfos (her);
	};
}; 

INSTANCE PC_Waterpipe_Tabak (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Waterpipe_Tabak_Condition;
	information	= PC_Waterpipe_Tabak_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tabak wählen";
};

FUNC INT PC_Waterpipe_Tabak_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Waterpipe)
	{
		return 1;
	};
};

FUNC VOID PC_Waterpipe_Tabak_Info()
{
	Info_ClearChoices	(PC_Waterpipe_Tabak);
	
	Info_AddChoice 	(PC_Waterpipe_Tabak, DIALOG_BACK, PC_Waterpipe_Tabak_BACK);	
	
	if (Npc_HasItems (hero, ItMi_HonigTabak) >= 1)
	{
		Info_AddChoice 	(PC_Waterpipe_Tabak, "Honigtabak", PC_Waterpipe_Tabak_Honey);
	};
	if (Npc_HasItems (hero, ItMi_SumpfTabak) >= 1)
	{
		Info_AddChoice 	(PC_Waterpipe_Tabak, "Krauttabak", PC_Waterpipe_Tabak_Swampherb);
	};
	if (Npc_HasItems (hero, ItMi_PilzTabak) >= 1)
	{
		Info_AddChoice 	(PC_Waterpipe_Tabak, "Pilztabak", PC_Waterpipe_Tabak_Mushroom_01);
	};
	if (Npc_HasItems (hero, ItMi_Apfeltabak) >= 1)
	{
		Info_AddChoice 	(PC_Waterpipe_Tabak, "Apfeltabak", PC_Waterpipe_Tabak_Apple);
	};	
};

FUNC VOID PC_Waterpipe_Tabak_BACK()
{
	Info_ClearChoices (PC_Waterpipe_Tabak);
};

FUNC VOID PC_Waterpipe_Tabak_Honey()
{
	Npc_RemoveInvItems	(hero, ItMi_HonigTabak, 1);

	Honey_Bonus += 10;

	if (Honey_Bonus >= 25)  
	{
		Print (PRINT_Eat23);
		B_RaiseAttribute_Rest (self, ATR_DEXTERITY, 1);
		Snd_Play	("LevelUp");
		Honey_Bonus -= 25;
	}
	else if (Honey_Bonus >= 15)  
	{
		Print (PRINT_Eat22);
	}
	else if (Honey_Bonus >= 7)  
	{
		Print	(PRINT_Eat21);
	};		
};

FUNC VOID PC_Waterpipe_Tabak_Swampherb()
{
	Npc_RemoveInvItems	(hero, ItMi_SumpfTabak, 1);

	Krauttabak_Bonus = 1;

	Krauttabak_Bonustime += 600;		
};

FUNC VOID PC_Waterpipe_Tabak_Mushroom_01()
{
	Npc_RemoveInvItems	(hero, ItMi_PilzTabak, 1);

	Dunkelpilz_Bonus += 20;

	if (Honey_Bonus >= 100)  
	{
		B_RaiseAttribute_Rest	(hero, ATR_MANA_MAX, 5);
		Npc_ChangeAttribute	(hero, ATR_MANA, 5);
		Snd_Play	("LevelUp");
		Dunkelpilz_Bonus -= 100;
	};
};

FUNC VOID PC_Waterpipe_Tabak_Apple()
{
	Npc_RemoveInvItems	(hero, ItMi_ApfelTabak, 1);

	Apple_Bonus += 10;

	if (Apple_Bonus >= 25)  
	{
		Print (PRINT_Eat3);
		B_RaiseAttribute_Rest (hero, ATR_STRENGTH, 1);
		Snd_Play	("LevelUp");
		Apple_Bonus -= 25;
	}
	else if (Apple_Bonus >= 15)  
	{
		Print (PRINT_Eat2);
	}
	else if (Apple_Bonus >= 7)  
	{
		Print	(PRINT_Eat1);
	};
};

INSTANCE PC_Waterpipe_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Waterpipe_EXIT_Condition;
	information	= PC_Waterpipe_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT PC_Waterpipe_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Waterpipe)
	&& (Stampfen == FALSE)
	{
		return 1;
	};
};

FUNC VOID PC_Waterpipe_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};