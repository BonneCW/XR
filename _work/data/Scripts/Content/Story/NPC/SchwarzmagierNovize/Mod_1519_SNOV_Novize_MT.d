instance Mod_1519_SNOV_Novize_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Novize;	
	guild 		= GIL_kdf;
	id 			= 1519;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_nw_schwarzernovize;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
	aivar[AIV_ToughGuy]		= TRUE;	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_Beliarschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart16, BodyTex_N, ITAR_NOV_DMB_01);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1519;
};

FUNC VOID Rtn_Start_1519 ()
{	
	TA_Smalltalk		(06,55,21,00,"PALTOBURG_7");
  	TA_Smalltalk		(21,00,06,55,"PALTOBURG_7");
};