instance Mod_7572_OUT_Vigonza_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Vigonza"; 
	guild 		= GIL_OUT;
	id 			= 7572;
	voice		= 16;
	flags       = 2;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_NormalBart06, BodyTex_N, ITAR_Nrd_M);	
	Mdl_SetModelFatness	(self,0);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7572;
};

FUNC VOID Rtn_PreStart_7572()
{	
	TA_Stand_Guarding	(08,00,20,00,"EIS_383");
	TA_Stand_Guarding	(20,00,08,00,"EIS_383");
};

FUNC VOID Rtn_Dalma_7572()
{	
	TA_Guide_Player	(08,00,20,00,"EIS_400");
	TA_Guide_Player	(20,00,08,00,"EIS_400");
};

FUNC VOID Rtn_Tot_7572()
{	
	TA_Waermen	(08,00,20,00,"TALLEINAGNGWACHE_7");
	TA_Waermen	(20,00,08,00,"TALLEINAGNGWACHE_7");
};