instance Mod_100000_OUT_Brunhild_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brunhild";	
	guild 		= GIL_OUT;
	id 			= 100000;
	voice		= 21;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Lilo, BodyTex_N, ITAR_VlkBabe_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_100000;
};

FUNC VOID Rtn_Start_100000 ()
{	
	TA_Sit_Campfire	(05,05,20,05,"WP_PIR_03");
	TA_Sleep		(20,05,05,05,"WP_PIR_11");
};
