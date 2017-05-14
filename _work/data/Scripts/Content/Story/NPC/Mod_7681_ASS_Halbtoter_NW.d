INSTANCE Mod_7681_ASS_Halbtoter_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Halbtoter"; 
	guild 		= GIL_OUT;
	id 			= 7681;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Assassinenschwert);														
	EquipItem	(self, ItRw_Assassinenbogen);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Sharky, BodyTex_B,ITAR_Assassine_01);	
	Mdl_SetModelFatness	(self,0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7681;
};

FUNC VOID Rtn_Start_7681()
{	
	TA_Sit_Campfire 	(07,20,01,20,"WP_ASSASSINE_08");
	TA_Sit_Campfire		(01,20,07,20,"WP_ASSASSINE_08");
};