instance Mod_7285_HS_Koenig_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "König"; 
	guild 		= GIL_OUT;
	id 			= 7285;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//--------Aivars-----------
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 0);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NORMAL19, BodyTex_N,ITAR_Hofstaatler);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7285;
};

FUNC VOID Rtn_Start_7285()
{	
	TA_Sit_Throne		(20,00,08,00,"REL_285");
	TA_Sit_Throne		(08,00,20,00,"REL_285");
};

FUNC VOID Rtn_Freifluss_7285()
{	
	TA_Sit_Campfire		(20,00,08,00,"REL_HS_006");
	TA_Sit_Campfire		(08,00,20,00,"REL_HS_006");
};

FUNC VOID Rtn_Loch_7285()
{	
	TA_Follow_Player		(20,00,08,00,"REL_236");
	TA_Follow_Player		(08,00,20,00,"REL_236");
};

FUNC VOID Rtn_Fluffy_7285 ()
{	
	TA_Stand_ArmsCrossed				(08,00,22,00,"REL_242");
    TA_Stand_ArmsCrossed				(22,00,08,00,"REL_242");
};

FUNC VOID Rtn_Ende_7285()
{	
	TA_Sit_Campfire		(20,00,08,00,"REL_254");
	TA_Sit_Campfire		(08,00,20,00,"REL_254");
};