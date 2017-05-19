instance Mod_980_MIL_Olav_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Olav"; 
	guild 		= GIL_PAL;
	id 			= 980;
	voice		= 0;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	

	// ------ Attribute ------
	B_SetAttributesToChapter	(self, 5);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	aivar[AIV_ToughGuy]		= TRUE;	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ItSe_Olav,1);
	
	EquipItem(self, ItMw_ShortSword1);
		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart22, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_980;
};

FUNC VOID Rtn_Start_980 ()
{	
	TA_Stand_Guarding 		(08,00,23,00,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Stand_Guarding		(23,00,08,00,"NW_CITY_MERCHANT_PATH_36_B");
};

FUNC VOID Rtn_Hakon_980 ()
{	
	TA_RunToWP 		(08,00,23,00,"MARKT");
	TA_RunToWP		(23,00,08,00,"MARKT");
};

FUNC VOID Rtn_Harad_980 ()
{	
	TA_RunToWP 		(08,00,23,00,"NW_CITY_SMITH_ANVIL");
	TA_RunToWP		(23,00,08,00,"NW_CITY_SMITH_ANVIL");
};

FUNC VOID Rtn_Harad2_980 ()
{	
	TA_Stand_Guarding	(08,00,23,00,"NW_CITY_SMITH_ANVIL");
	TA_Stand_Guarding	(23,00,08,00,"NW_CITY_SMITH_ANVIL");
};