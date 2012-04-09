instance Mod_7181_BDT_Logan_OC (Npc_Default)
{
	// ------ NSC ------
	name 		= "Logan";
	guild 		= GIL_OUT;
	id 			= 7181;
	voice 		= 10;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	//aivars
	aivar[AIV_NewsOverride] = TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_Banditenschwert); 															
		
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Cipher_neu, BodyTex_N, ITAR_BDT_M_01);	
	Mdl_SetModelFatness	(self, - 0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_7181;
};
FUNC VOID Rtn_Start_7181 ()
{
	TA_Follow_Player	(12,30,18,00,"WP_OCC_258"); 
	TA_Follow_Player	(18,00,12,30,"WP_OCC_258");			
};

FUNC VOID Rtn_Tot_7181()
{
	TA_Stand_Guarding	(08,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,08,00,"TOT");
};