INSTANCE Mod_7495_NONE_Schlaeger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Schläger"; 
	guild 		= GIL_OUT;
	id 			= 7495;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Zweihaender); 
	
	
	// ------ Inventory ------

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_Ian, BodyTex_L, ITAR_Sld_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7495;
};

FUNC VOID Rtn_Start_7495 ()
{	
	TA_Sit_Bench	(08,00,20,00,"NW_CANTHARINSEL_02");
	TA_Sit_Bench	(20,00,08,00,"NW_CANTHARINSEL_02");
};