instance Mod_7723_OUT_Hedwig_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hedwig";	
	guild 		= GIL_OUT;
	id 			= 7723;
	voice 		= 26;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe.", FaceBabe_B_RedLocks, BodyTex_B, ITAR_VlkBabe_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7723;
};

FUNC VOID Rtn_Start_7723 ()
{	
	TA_Sit_Chair		(04,55,20,05,"ALTEFESTUNG_09");
	TA_Sit_Chair		(20,05,04,55,"ALTEFESTUNG_09");
};

FUNC VOID Rtn_Follow_7723 ()
{	
	TA_Follow_Player	(04,55,20,05,"ALTEFESTUNG_09");
	TA_Follow_Player	(20,05,04,55,"ALTEFESTUNG_09");
};

FUNC VOID Rtn_Zimmer_7723 ()
{	
	TA_Sit_Chair		(08,00,23,00,"REL_CITY_031");
	TA_Sit_Chair		(23,00,08,00,"REL_CITY_031");
};