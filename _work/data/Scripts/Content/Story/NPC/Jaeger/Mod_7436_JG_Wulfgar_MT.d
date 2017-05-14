instance Mod_7436_JG_Wulfgar_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wulfgar";	
	guild 		= GIL_OUT;
	id 			= 7436;
	voice		= 0;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
			
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart06, BodyTex_N, ITAR_Schaf);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7436;
};

FUNC VOID Rtn_Start_7436 ()
{	
	TA_Potion_Alchemy	(07,00,11,00,"JL_30");
	TA_Read_Bookstand	(11,00,14,00,"JL_13");
	TA_Potion_Alchemy	(14,00,18,00,"JL_26");
	TA_Read_Bookstand	(18,00,22,00,"JL_13");
	TA_Sleep		(22,00,07,00,"ZELT_01");     
};

FUNC VOID Rtn_Gerben_7436 ()
{	
	TA_RunToWP	(08,00,20,00,"JL_15");
	TA_RunToWP	(20,00,08,00,"JL_15");     
};

FUNC VOID Rtn_Kochen_7436 ()
{	
	TA_Cook_Cauldron	(08,00,20,00,"JL_15");
	TA_Cook_Cauldron	(20,00,08,00,"JL_15");     
};

FUNC VOID Rtn_Khorgor_7436 ()
{	
	TA_Smalltalk	(07,00,22,00,"JL_02");
    	TA_Smalltalk	(22,00,07,00,"JL_02");
};