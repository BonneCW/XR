instance Mod_7557_STRF_Straefling_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sträfling"; 
	guild 		= GIL_STRF;
	id 			= 7557;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 0);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Nagelknueppel); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", 70, 3,ITAR_Prisoner);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 10); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7557;
};

FUNC VOID Rtn_Start_7557()
{	
	TA_Stand_Eating	(08,00,23,00,"NW_FARM1_PATH_SPAWN_05");
	TA_Stand_Eating	(23,00,08,00,"NW_FARM1_PATH_SPAWN_05");	
};
