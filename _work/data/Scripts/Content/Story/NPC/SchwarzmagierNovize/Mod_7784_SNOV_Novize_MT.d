instance Mod_7784_SNOV_Novize_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Novize;	
	guild 		= GIL_kdf;
	id 			= 7784;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_nw_schwarzernovize;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Beliarschwert);																
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Mordrag, BodyTex_N, ITAR_NOV_DMB_01);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7784;
};

FUNC VOID Rtn_Start_7784()
{	
	TA_Stand_Sweeping	(07,00,21,01,"PALTOBURGLINKSOBEN_1");
   	TA_Stand_Sweeping	(21,01,00,00,"PALTOBURGLINKSOBEN_1");
};