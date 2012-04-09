INSTANCE Mod_7483_OUT_Endres_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Endres"; 
	guild 		= GIL_OUT;
	id 			= 7483;
	voice 		= 13;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);															
	attribute[ATR_HITPOINTS] = 1;
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Mordrag, BodyTex_N,ITAR_Vlk_L );	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7483;
};

FUNC VOID Rtn_Start_7483 ()
{	
	TA_Totstellen	(05,30,20,30,"REL_CITY_364");
	TA_Totstellen	(20,30,05,30,"REL_CITY_364");
};

FUNC VOID Rtn_Arzt_7483 ()
{	
	TA_Sleep_Deep	(05,30,20,30,"REL_CITY_244");
	TA_Sleep_Deep	(20,30,05,30,"REL_CITY_244");
};

FUNC VOID Rtn_Tot_7483 ()
{	
	TA_Sleep_Deep	(05,30,20,30,"TOT");
	TA_Sleep_Deep	(20,30,05,30,"TOT");
};