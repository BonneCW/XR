instance Mod_7343_OUT_Buergerin_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Buergerin;
	guild 		= GIL_OUT;
	id 			= 7343;
	voice 		= 16;
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_BlackHair, BodyTexBabe_N, ITAR_VlkBabe_L);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7343;
};

FUNC VOID Rtn_Start_7343 ()
{	
	TA_Stand_ArmsCrossed		(08,00,20,15,"REL_CITY_090");
	TA_Sleep		(20,15,08,00,"REL_CITY_078");
};

FUNC VOID Rtn_Fremdgang_7343 ()
{	
	TA_Stand_ArmsCrossed		(08,00,20,15,"REL_CITY_090");
	TA_Sleep		(20,15,22,00,"REL_CITY_078");
	TA_Smalltalk_Fremdgang		(22,00,06,00,"REL_SURFACE_153");
	TA_Sleep		(06,00,08,00,"REL_CITY_078");
};
