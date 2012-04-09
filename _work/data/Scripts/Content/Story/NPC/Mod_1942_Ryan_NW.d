INSTANCE Mod_1942_Ryan_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ryan";
	guild 		= GIL_DMT;
	id 			= 1942;
	voice 		= 4;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	level = 80;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);	

	level = 5;															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------	
		
	// ------ Inventory ------

		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", 185, BodyTex_N, ItAr_FireArmor_Addon);

	Mdl_SetModelFatness	(self, 1);
	//Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	CreateInvItems	(self, ITKE_MAGICCHEST, 1);
	B_CreateAmbientInv 	(self);

	CreateInvItems	(self, ItMi_Gold, 1000);

	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 10); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1942;
};

FUNC VOID Rtn_Start_1942 ()
{	
	TA_Circle  	(08,00,20,00,"NW_MAGECAVE_RUNE");
	TA_Circle 	(20,00,08,00,"NW_MAGECAVE_RUNE");
};

