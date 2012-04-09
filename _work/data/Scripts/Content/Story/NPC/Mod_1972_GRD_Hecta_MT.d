INSTANCE Mod_1972_GRD_Hecta_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hecta";
	guild 		= GIL_out;
	id 			= 1972;
	voice 		= 03;
	flags       = 0;																	
	npctype		= NPCTYPE_main;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_strong;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_Sturmbringer); 																
	
	CreateInvItems	(self, ItWr_MagicPaper, 1);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 187, BodyTex_N, grd_armor_m);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 45); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1972;
};

FUNC VOID Rtn_Start_1972 ()
{	
	TA_Sit_Campfire		(08,00,20,00,"WP_MT_HECTA_UND_ACHIL");
    TA_Sit_Campfire			(20,00,08,00,"WP_MT_HECTA_UND_ACHIL");
};
