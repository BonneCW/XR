instance Mod_7286_HS_Eremit_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Königlicher Eremit"; 
	guild 		= GIL_OUT;
	id 			= 7286;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal_Olli_Kahn, BodyTex_N,ITAR_Hofstaatler);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7286;
};

FUNC VOID Rtn_Start_7286()
{	
	TA_Stand_ArmsCrossed	(05,35,11,30,"REL_247");
	TA_Stand_ArmsCrossed 	(11,30,05,35,"REL_247");
};
