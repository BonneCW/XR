instance Mod_7724_OUT_Berta_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Berta"; 
	guild 		= GIL_OUT;
	id 			= 7724;
	voice 		= 16;
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
	daily_routine 		= Rtn_Start_7724;
};

FUNC VOID Rtn_Start_7724()
{	
	TA_Sit_Chair		(04,55,20,05,"ALTEFESTUNG_09");
	TA_Sit_Chair		(20,05,04,55,"ALTEFESTUNG_09");
};

FUNC VOID Rtn_Heim_7724()
{	
	TA_Sleep	 	(07,00,23,00,"REL_CITY_125");
	TA_Sleep		(23,00,07,00,"REL_CITY_125");
};