FUNC VOID Krautstampfer_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Krautstampfer;
		Ai_ProcessInfos (her);
	};
}; 

INSTANCE PC_Krautstampfer_Tabak (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Krautstampfer_Tabak_Condition;
	information	= PC_Krautstampfer_Tabak_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tabak mischen ...";
};

FUNC INT PC_Krautstampfer_Tabak_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Krautstampfer)
	&& (Npc_HasItems(hero, ItMi_Apfeltabak) >= 1)
	{
		return 1;
	};
};

FUNC VOID PC_Krautstampfer_Tabak_Info()
{
	Info_ClearChoices	(PC_Krautstampfer_Tabak);
	
	Info_AddChoice 	(PC_Krautstampfer_Tabak, DIALOG_BACK, PC_Krautstampfer_Tabak_BACK);	
	
	if (Npc_HasItems (hero, ItFo_Honey) >=1)
	{
		Info_AddChoice 	(PC_Krautstampfer_Tabak, "...mit Honig", PC_Krautstampfer_Tabak_Honey);
	};
	if (Npc_HasItems (hero, ItPl_SwampHerb) >=1)
	{
		Info_AddChoice 	(PC_Krautstampfer_Tabak, "...mit Sumpfkraut", PC_Krautstampfer_Tabak_Swampherb);
	};
	if (Npc_HasItems (hero, ItPl_Mushroom_01) >=1)
	{
		Info_AddChoice 	(PC_Krautstampfer_Tabak, "...mit Dunkelpilz", PC_Krautstampfer_Tabak_Mushroom_01);
	};
	
};
FUNC VOID PC_Krautstampfer_Tabak_BACK()
{
	Info_ClearChoices (PC_Krautstampfer_Tabak);
};
FUNC VOID PC_Krautstampfer_Tabak_Honey()
{
	CreateInvItems (hero, ItMi_Honigtabak, 1);
	Npc_RemoveInvItems	(hero, ItMi_Apfeltabak, 1);
	Npc_RemoveInvItems	(hero, ItFo_Honey, 1);

	Print (PRINT_TabakSuccess);
	
	B_ENDPRODUCTIONDIALOG ();		
};
FUNC VOID PC_Krautstampfer_Tabak_Swampherb()
{
	CreateInvItems (hero, ItMi_SumpfTabak, 1);
	Npc_RemoveInvItems	(hero, ItMi_Apfeltabak, 1);
	Npc_RemoveInvItems	(hero, ItPl_SwampHerb, 1);

	Print (PRINT_TabakSuccess);
	
	B_ENDPRODUCTIONDIALOG ();		
};
FUNC VOID PC_Krautstampfer_Tabak_Mushroom_01()
{
	CreateInvItems (hero, ItMi_PilzTabak, 1);
	Npc_RemoveInvItems	(hero, ItMi_Apfeltabak, 1);
	Npc_RemoveInvItems	(hero, ItPl_Mushroom_01, 1);

	Print (PRINT_TabakSuccess);
	
	B_ENDPRODUCTIONDIALOG ();		
};

INSTANCE PC_Krautstampfer_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 1;
	condition	= PC_Krautstampfer_EXIT_Condition;
	information	= PC_Krautstampfer_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT PC_Krautstampfer_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_Krautstampfer)
	&& (Stampfen	==	FALSE)
	{
		return 1;
	};
};

FUNC VOID PC_Krautstampfer_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};