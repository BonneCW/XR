INSTANCE Mod_567_NONE_Bromor_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bromor"; 
	guild 		= GIL_NONE;
	id 			= 567;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Bastardschwert); 
	

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ItKE_Bromor,1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Fingers, BodyTex_N,ITAR_Vlk_H );	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_567;
};

//Joly: NIE AUF EINE BANK ODER THRON SETZEN
FUNC VOID Rtn_Start_567()
{	
	TA_Stand_ArmsCrossed	(07,00,05,00,"NW_CITY_PUFF_COUNTER");
	TA_Sleep	(05,00,07,00,"NW_CITY_BED_BROMOR");
};