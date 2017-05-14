instance Mod_7341_OUT_Buergerin_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Buergerin;
	guild 		= GIL_OUT;
	id 			= 7341;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_REL_BUERGER;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);
		
	// ------ visuals ------						FaceBabe_N_HairAndCloth																
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_GreyCloth, BodyTex_N, ITAR_BuergerinNew_01);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7341;
};

FUNC VOID Rtn_Start_7341 ()
{	
	TA_Smalltalk		(08,00,20,35,"REL_CITY_109");
	TA_Sleep		(20,35,08,00,"REL_CITY_321");
};
