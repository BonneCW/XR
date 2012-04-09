INSTANCE Mod_7611_OUT_Lagerhauswache_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lagerhauswache"; 
	guild 		= GIL_OUT;
	id 			= 7611;
	voice 		= 11;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_ShortSword3); 
	
	
	// ------ Inventory ------

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_Ian, BodyTex_L, KhorataWache_01);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 10); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7611;
};

FUNC VOID Rtn_Start_7611()
{	
	TA_Guard_Passage		(08,00,22,00,"REL_CITY_394");
	TA_Guard_Passage		(22,00,08,00,"REL_CITY_394");
};