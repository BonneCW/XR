instance Mod_7703_OUT_Froppi_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Froppi"; 
	guild 		= GIL_OUT;
	id 			= 7703;
	voice 		= 9;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItKe_Lehmar, 1);
	CreateInvItems (self, ItMi_LostInnosStatue_Daron, 1);

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Whistler, BodyTex_N, ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7703;
};

FUNC VOID Rtn_Start_7703()
{	
	TA_Sit_Campfire		(06,30,00,30,"REL_SURFACE_242");
	TA_Sit_Campfire		(00,30,06,30,"REL_SURFACE_242");
};