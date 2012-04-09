INSTANCE Mod_7289_HS_Jaeger_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Königlicher Jäger";
	guild 		= GIL_OUT;
	id 			= 7289;
	voice 		= 9;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1H_BAU_Mace); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_B_Thorus, BodyTex_B, ITAR_Hofstaatler);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7289;
};

FUNC VOID Rtn_Start_7289 ()
{	
	TA_Sit_Campfire			(08,00,23,00,"REL_296");
    TA_Sit_Campfire			(23,00,08,00,"REL_296");		
};

FUNC VOID Rtn_Drogenminister_7289 ()
{	
	TA_Guide_Player			(08,00,23,00,"REL_301");
    TA_Guide_Player			(23,00,08,00,"REL_301");		
};

FUNC VOID Rtn_Gleichgewichtsminister_7289 ()
{	
	TA_Guide_Player			(08,00,23,00,"REL_307");
    TA_Guide_Player			(23,00,08,00,"REL_307");		
};