instance Mod_7513_OUT_Buergerin_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Buergerin;	//Frau von Dalton
	guild 		= GIL_OUT;
	id 			= 7513;
	voice 		= 17;
	flags       = 0;																
	npctype		= NPCTYPE_REL_BUERGER;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Lilo, BodyTex_N, ITAR_VlkBabe_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7513;
};

FUNC VOID Rtn_Start_7513 ()
{	
	TA_Cook_Stove		(07,00,16,00,"REL_CITY_100");
	TA_Sweep_FP 		(16,00,18,00,"REL_CITY_100");
	TA_Sit_Throne		(18,00,22,00,"REL_CITY_100");
	TA_Sleep 		(22,00,07,00,"REL_CITY_101");
};