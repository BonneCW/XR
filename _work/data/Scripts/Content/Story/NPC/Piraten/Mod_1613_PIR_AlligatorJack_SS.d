INSTANCE Mod_1613_PIR_AlligatorJack_SS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Alligator Jack";
	guild 		= GIL_out;
	id 			= 1613;
	voice		= 3;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_Partymember] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Piratensaebel);
		
	// ------ Inventory ------
	CreateInvItems (self, itpo_Health_02, 4);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_CorAngar, BodyTex_B, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1.5);		
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1613;
};

FUNC VOID Rtn_Start_1613 ()
{	
	TA_Follow_Player			 (23,00,06,00,"WP_SS_AJ");
	TA_Follow_Player			 (06,00,08,30,"WP_SS_AJ");
};