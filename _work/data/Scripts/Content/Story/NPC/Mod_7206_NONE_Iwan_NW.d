INSTANCE Mod_7206_NONE_Iwan_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Iwan"; 
	guild 		= GIL_NONE;
	id 			= 7206;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Zweihaender); 
	
	
	// ------ Inventory ------

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_Ian, BodyTex_L, ITAR_MayaZombie_Addon);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7206;
};

FUNC VOID Rtn_Start_7206()
{	
	TA_Stand_ArmsCrossed		(08,00,22,00,"NW_CRYPT_IN_11");
    TA_Stand_ArmsCrossed		(22,00,08,00,"NW_CRYPT_IN_11");
};

FUNC VOID Rtn_Tot_7206()
{	
	TA_Stand_ArmsCrossed		(01,00,23,00,"TOT");
    TA_Stand_ArmsCrossed		(23,00,01,00,"TOT");
};