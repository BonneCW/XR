instance Mod_1738_KDF_Velario_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Velario";	
	guild 		= GIL_vlk;
	id 			= 1738;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_main;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																				
	EquipItem	(self, ItMW_Addon_Stab01);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart16, BodyTex_N, ITAR_KDF_H);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1738;
};

FUNC VOID Rtn_Start_1738()
{	
	TA_Read_Bookstand	(06,00,10,05,"WP_PAT_WEG_68");
	TA_Study_WP		(10,05,23,05,"WP_PAT_WEG_70");
	TA_Sit_Throne		(23,05,06,00,"WP_PAT_WEG_67");
};