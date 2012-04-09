INSTANCE Mod_1772_KDF_Gizar_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gizar";
	guild 		= GIL_VLK;
	id 			= 1772;
	voice 		= 10;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_FollowDist] = 500;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMW_Addon_Stab01);
	
	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal14, BodyTex_N, ITAR_KDF_H);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,65); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1772;
};

FUNC VOID Rtn_Start_1772 ()
{	
	TA_Stand_WP 		(07,05,16,05,"WP_PAT_WEG_161");
	TA_Stand_WP 	(16,05,07,05,"WP_PAT_WEG_161");
};