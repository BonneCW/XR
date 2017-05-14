INSTANCE Lich_11008_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lich";	
	guild 		= GIL_DMT;
	id 			= 11008;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	level = 50;
	
	// ------ Attribute ------
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_STRENGTH] = 500;	

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, itmw_1h_bau_mace);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic.", Face_N_OldBald_Jeremiah, BodyTex_N, ITAR_DEMENTOR);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	protection[PROT_EDGE] = 1000;
	protection[PROT_BLUNT] = 1000;
	protection[PROT_POINT] = 1000;
	protection[PROT_MAGIC] = 1000;
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 

	aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11008;
};

FUNC VOID Rtn_Start_11008 ()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"NW_TROLLAREA_TROLLROCKCAVE_03");
	TA_Stand_ArmsCrossed	(22,00,08,00,"NW_TROLLAREA_TROLLROCKCAVE_03");
};