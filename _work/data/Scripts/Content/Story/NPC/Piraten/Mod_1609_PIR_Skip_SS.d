INSTANCE Mod_1609_PIR_Skip_SS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Skip";
	guild 		= GIL_out;
	id 			= 1609;
	voice		= 8;
	flags       = 2;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_ShortSword2);
	EquipItem (self, ItRw_sld_bow); 
	
	// ------ Inventory ------
	CreateInvItems (self, itpo_Health_03, 2);
	aivar[AIV_Partymember] = TRUE;
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Pirat01, BodyTex_N, ITAR_PIR_L_Addon);
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1609;
};

FUNC VOID Rtn_PreStart_1609 ()
{	
	TA_Follow_Player				(07,30,11,30,"WP_SS_SKIP");
	TA_Follow_Player			(11,30,07,30,"WP_SS_SKIP");
};