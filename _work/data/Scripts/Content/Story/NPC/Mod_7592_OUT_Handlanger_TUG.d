INSTANCE Mod_7592_OUT_Handlanger_TUG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Handlanger"; 
	guild 		= GIL_OUT;
	id 			= 7592;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	
	// ------ Inventory ------
	// Händler

	CreateInvItems	(self, ItWr_PetuniaZettel, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_CoolPock, BodyTex_N, ITAR_Leather_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7592;
};

FUNC VOID Rtn_Start_7592()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"TUG_87");
	TA_Stand_ArmsCrossed	(22,00,08,00,"TUG_87");
};