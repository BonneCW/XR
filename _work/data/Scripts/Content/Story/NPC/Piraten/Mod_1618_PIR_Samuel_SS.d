INSTANCE Mod_1618_PIR_Samuel_SS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Samuel";
	guild 		= GIL_out;
	id 			= 1618;
	voice 		= 14;
	flags       = 2;											
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1H_Mace_L_03);
	
	
	// ------ Inventory ------
	// Händler
	aivar[AIV_Partymember] = TRUE;
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBAld", Face_B_Saturas, BodyTex_B, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1618;
};

FUNC VOID Rtn_Start_1618 ()
{	
	TA_Follow_Player	(06,00,08,00,"WP_SS_SAMUEL");
	TA_Follow_Player	(08,00,06,00,"WP_SS_SAMUEL");
};