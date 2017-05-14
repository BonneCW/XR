INSTANCE Mod_920_KDF_Isgaroth_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Isgaroth";
	guild 		= GIL_VLK;
	id 			= 920;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;																
	EquipItem	(self, ItMW_Addon_Stab01);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_N_Tough_Okyl, BodyTex_N, ITAR_KDF_L);			
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_920;
};

FUNC VOID Rtn_Start_920 ()
{	
	TA_Pray_Innos_FP		(06,00,21,00,"NW_MONASTERY_SHRINE_04");
    TA_Sit_Bench 		 	(21,00,06,00,"NW_MONASTERY_SHRINE_05");
};

FUNC VOID Rtn_Drachen_920()
{
	TA_Stand_ArmsCrossed		(08,00,20,00,"NW_MONASTERY_BRIDGE_06");
	TA_Stand_ArmsCrossed		(20,00,08,00,"NW_MONASTERY_BRIDGE_06");
};