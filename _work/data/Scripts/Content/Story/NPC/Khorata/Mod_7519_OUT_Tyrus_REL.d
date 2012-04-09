instance Mod_7519_OUT_Tyrus_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Tyrus"; 
	guild 		= GIL_OUT;
	id 			= 7519;
	voice 		= 8;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
 	EquipItem (self, ItMw_1H_quantarie_Schwert_01);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal20, BodyTex_N,ITAR_BuergerNew_01);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 45); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7519;
};

FUNC VOID Rtn_Start_7519()
{	
	TA_Practice_Sword	(08,00,22,00,"REL_CITY_367");
	TA_Sleep		(22,00,08,00,"REL_CITY_074");
};

FUNC VOID Rtn_Rattenjagd_7519()
{	
	TA_RunToWP	(08,00,22,00,"REL_CITY_381");
	TA_RunToWP	(22,00,08,00,"REL_CITY_381");
};

FUNC VOID Rtn_AtMine_7519()
{	
	TA_RunToWP	(08,00,22,00,"REL_SURFACE_210");
	TA_RunToWP	(22,00,08,00,"REL_SURFACE_210");
};