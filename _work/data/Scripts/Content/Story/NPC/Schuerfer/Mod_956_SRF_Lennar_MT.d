instance Mod_956_SRF_Lennar_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lennar";
	guild 		= GIL_NONE;
	id 			= 956;
	voice 		= 1;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self,3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Nagelknueppel);

	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal20, BodyTex_N, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_956;
};
FUNC VOID Rtn_Start_956 ()
{
	TA_Stand_Drinking	   (01,50,19,30,"BL_DOWN_RING_03");	
    TA_Roast_Scavenger 	   (19,30,01,50,"BL_DOWN_RING_ROAST");	
};