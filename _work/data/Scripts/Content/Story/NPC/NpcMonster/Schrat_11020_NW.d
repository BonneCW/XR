INSTANCE Schrat_11020_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dämonenschrat";	
	guild 		= GIL_DMT;
	id 			= 11020;
	voice 		= 10;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	level = 40;
	
	// ------ Attribute ------
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_STRENGTH] = 250;	

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, itmw_1h_bau_mace);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic.", 219, 26, NO_ARMOR);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11020;
};

FUNC VOID Rtn_Start_11020 ()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"NW_FOREST_TO_DRAGON_05");
	TA_Stand_ArmsCrossed	(22,00,08,00,"NW_FOREST_TO_DRAGON_05");
};