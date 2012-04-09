FUNC VOID Waterpipe_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
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
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Waterpipe)
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
		Info_AddChoice 	(PC_Waterpipe_Tabak, "Honig Tabak", PC_Waterpipe_Tabak_Honey);
	};
	if (Npc_HasItems (hero, ItMi_SumpfTabak) >= 1)
	{
		Info_AddChoice 	(PC_Waterpipe_Tabak, "Krauttabak", PC_Waterpipe_Tabak_Swampherb);
	};
	if (Npc_HasItems (hero, ItMi_PilzTabak) >= 1)
	{
		Info_AddChoice 	(PC_Waterpipe_Tabak, "Pilz Tabak", PC_Waterpipe_Tabak_Mushroom_01);
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
};
FUNC VOID PC_Waterpipe_Tabak_Swampherb()
{
	Npc_RemoveInvItems	(hero, ItMi_SumpfTabak, 1);		
};
FUNC VOID PC_Waterpipe_Tabak_Mushroom_01()
{
	Npc_RemoveInvItems	(hero, ItMi_PilzTabak, 1);		
};
FUNC VOID PC_Waterpipe_Tabak_Apple()
{
	Npc_RemoveInvItems	(hero, ItMi_ApfelTabak, 1);		
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
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Waterpipe)
	&& (Stampfen	==	FALSE)
	{
		return 1;
	};
};

FUNC VOID PC_Waterpipe_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};