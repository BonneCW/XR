instance Mod_7550_OUT_Wache_DT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wache"; 
	guild 		= GIL_STRF;
	id 			= 7550;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_main;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Morgenstern); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart22, BodyTex_N, GRD_ARMOR_M);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7550;
};

FUNC VOID Rtn_Start_7550()
{	
	TA_Sit_Campfire	(08,00,20,00,"DT_017");
	TA_Sit_Campfire	(20,00,08,00,"DT_017");
};

FUNC VOID Rtn_Kampf_7550()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DT_022");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"DT_022");
};