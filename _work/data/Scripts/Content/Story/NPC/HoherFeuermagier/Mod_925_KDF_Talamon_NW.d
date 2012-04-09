INSTANCE Mod_925_KDF_Talamon_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Talamon";
	guild 		= GIL_VLK;
	id 			= 925;
	voice 		= 4;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);																
	EquipItem	(self, ItMW_Addon_Stab01);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_B_Saturas, BodyTex_B, ITAR_KDF_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_925;
};

FUNC VOID Rtn_Start_925 ()
{	
	TA_Guard_Passage	(08,00,23,00,"NW_MONASTERY_CELLAR_15");
    TA_Guard_Passage	(23,00,08,00,"NW_MONASTERY_CELLAR_15");
};

FUNC VOID Rtn_Rat_925 ()
{
	TA_Sit_Throne	(08,00,23,00,"NW_MONASTERY_THRONE_01");
    	TA_Sit_Throne	(23,00,08,00,"NW_MONASTERY_THRONE_01");
};