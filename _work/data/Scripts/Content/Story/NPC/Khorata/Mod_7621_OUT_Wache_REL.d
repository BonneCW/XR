instance Mod_7621_OUT_Wache_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wache";	
	guild 		= GIL_OUT;
	id 			= 7621;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_Bau_Mace);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart10, BodyTex_N, KhorataWache_01);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7621;
};

FUNC VOID Rtn_Start_7621()
{	
	TA_Stand_Guarding		(07,00,21,00,"REL_CITY_359");
   	TA_Stand_Guarding		(21,00,07,00,"REL_CITY_359");
};

FUNC VOID Rtn_Theodorus_7621()
{	
	TA_Stand_ArmsCrossed	(07,00,21,00,"REL_CITY_002");
   	TA_Stand_ArmsCrossed	(21,00,07,00,"REL_CITY_002");
};