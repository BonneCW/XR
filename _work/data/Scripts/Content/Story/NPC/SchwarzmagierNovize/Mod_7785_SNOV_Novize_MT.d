INSTANCE Mod_7785_SNOV_Novize_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Novize;
	guild 		= GIL_kdf;
	id 			= 7785;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_nw_schwarzernovize;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_sNov_Mace); 																
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal04, BodyTex_N, ITAR_NOV_DMB_01);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7785;
};

FUNC VOID Rtn_Start_7785 ()
{	
	TA_Smalltalk_Plaudern 		(23,00,07,00,"LABYRINTH_69");
	TA_Smalltalk_Plaudern		(07,00,23,00,"LABYRINTH_69");
};