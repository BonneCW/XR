instance Mod_568_NONE_Cassia_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cassia"; 
	guild 		= GIL_OUT;
	id 			= 568;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//----------AIVARS--------------
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Meisterdegen); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ITKE_Thiefguildkey_Hotel_MIS,1);
	CreateInvItems (self,ItKe_ThiefTreasure	,1);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_BlackHair, BodyTexBabe_N, ITAR_VlkBabe_H);		
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_568;
};

FUNC VOID Rtn_Start_568()
{	
	TA_Read_Bookstand 	(07,00,23,00,"NW_CITY_KANAL_ROOM_05_02");
	TA_Sleep			(23,00,07,00,"NW_CITY_KANAL_ROOM_05_BED_01");
};

FUNC VOID Rtn_Schiff_568()
{	
	TA_Smalltalk	(08,00,20,00,"SHIP_CREW_03");
	TA_Smalltalk 	(20,00,08,00,"SHIP_CREW_03");
};

FUNC VOID Rtn_Dieb_568()
{	
	TA_Stand_Guarding 	(07,00,23,00,"NW_CITY_KANAL_ROOM_05_03");
	TA_Stand_Guarding	(23,00,07,00,"NW_CITY_KANAL_ROOM_05_03");
};

FUNC VOID Rtn_Tot_568()
{	
	TA_Stand_Guarding 	(07,00,23,00,"TOT");
	TA_Stand_Guarding	(23,00,07,00,"TOT");
};