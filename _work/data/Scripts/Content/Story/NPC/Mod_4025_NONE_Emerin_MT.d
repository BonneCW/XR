instance Mod_4025_NONE_Emerin_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Emerin";
	guild 		= GIL_OUT;
	id 			= 4025;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------			
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", 204, BodyTex_P, ITAR_XARDAS);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4025;
};
	
FUNC VOID Rtn_Start_4025 ()
{
	TA_Study_WP	(07,00,09,00,"WP_MT_STOLLEN_IN_BIB_22");
	TA_Potion_Alchemy	(09,00,12,00,"WP_MT_STOLLEN_IN_BIB_28");
	TA_Read_Bookstand	(12,00,16,00,"WP_MT_STOLLEN_IN_BIB_23");
    TA_Sit_Throne		(16,00,23,00,"WP_MT_STOLLEN_IN_BIB_27");
    TA_Sleep		(23,00,07,00,"WP_MT_STOLLEN_IN_BIB_26");	
};
