INSTANCE Mod_1771_KDF_Aaron_PAT (Npc_Default)
{
	// ------ NSC ------
	if (Mod_FM_Foki < 11)
	{
		name 		= "Aaron";
	}
	else
	{
		name		= "Garan";
	};

	flags = 2;
	guild 		= GIL_VLK;
	id 			= 1771;
	voice		= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																			
	EquipItem	(self, ItMW_Addon_Stab01);
	
	// ------ Inventory ------
	// Händler

		
	// ------ visuals ------	
	if (Mod_FM_Foki < 11)
	{																		
		B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald.", Face_L_Tough_Santino, BodyTex_L,ITAR_KDF_L_Feuer );	
	}
	else
	{
		B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald.", Face_L_Tough_Santino, BodyTex_L,ITAR_KDF_H);
	};
	
	Mdl_SetModelFatness	(self, 0.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 55); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1771;
};

FUNC VOID Rtn_Start_1771 ()
{	
	TA_Stand_WP		(05,00,00,00,"WP_PAT_WEG_60");
	TA_Stand_WP 		(00,00,05,00,"WP_PAT_WEG_60");
};

FUNC VOID Rtn_Flucht_1771 ()
{	
	TA_FleeToWP		(05,00,00,00,"WP_PAT_WEG_173");
	TA_FleeToWP 		(00,00,05,00,"WP_PAT_WEG_173");
};

FUNC VOID Rtn_Tot_1771 ()
{	
	TA_FleeToWP		(05,00,00,00,"TOT");
	TA_FleeToWP 		(00,00,05,00,"TOT");
};

FUNC VOID Rtn_Arbeit_1771 ()
{	
	TA_Pray_Innos_FP	(22,00,07,00,"WP_PAT_WEG_183");
	TA_Practice_Magic 	(07,00,10,00,"WP_PAT_WEG_149");
	TA_Potion_Alchemy 	(10,00,15,00,"WP_PAT_WEG_92");
	TA_Practice_Magic 	(15,00,22,00,"WP_PAT_WEG_149");
};

FUNC VOID Rtn_Falle_1771 ()
{	
	TA_Stand_WP		(22,00,07,00,"WP_PAT_WEG_203");
	TA_Practice_Magic 	(07,00,10,00,"WP_PAT_WEG_149");
	TA_Potion_Alchemy 	(10,00,15,00,"WP_PAT_WEG_92");
	TA_Practice_Magic 	(15,00,22,00,"WP_PAT_WEG_149");
};

FUNC VOID Rtn_Boss_1771 ()
{	
	TA_Pray_Innos_FP		(05,00,00,00,"WP_PAT_WEG_183");
	TA_Pray_Innos_FP 		(00,00,05,00,"WP_PAT_WEG_183");
};

FUNC VOID Rtn_Door_1771 ()
{	
	TA_Guide_Player		(05,00,00,00,"WP_PAT_TURM_03");
	TA_Guide_Player 	(00,00,05,00,"WP_PAT_TURM_03");
};

FUNC VOID Rtn_Treppe_1771 ()
{	
	TA_RunToWP		(05,00,00,00,"WP_PAT_TURMWEG_02");
	TA_RunToWP		(00,00,05,00,"WP_PAT_TURMWEG_02");
};

FUNC VOID Rtn_Kill_1771 ()
{	
	TA_RunToWP		(05,00,00,00,"WP_PAT_TURM_20");
	TA_RunToWP		(00,00,05,00,"WP_PAT_TURM_20");
};