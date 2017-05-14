instance Mod_7368_JG_Jaeger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_JAEGER; 
	guild 		= GIL_STRF;
	id 			= 7368;
	voice		= 0;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;														
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																		
	EquipItem (self, ItMw_1H_quantarie_Schwert_01); 

	CreateInvItems	(self, ItFo_MuttonRaw, 20);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N, ITAR_Leather_L);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 20); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7368;
};

FUNC VOID Rtn_Start_7368()
{	
	TA_RunToWP	(06,05,20,15,"NW_FOREST_PATH_80_1_MOVEMENT8_M3");
	TA_RunToWP	(20,15,06,05,"NW_FOREST_PATH_80_1_MOVEMENT8_M3"); 
};

FUNC VOID Rtn_Flucht_7368()
{	
	TA_FleeToWP	(06,05,20,15,"NW_FOREST_PATH_35_09");
	TA_FleeToWP	(20,15,06,05,"NW_FOREST_PATH_35_09"); 
};

FUNC VOID Rtn_Lager_7368()
{	
	TA_Sit_Campfire	(06,05,20,15,"NW_FOREST_PATH_35_09");
	TA_Sit_Campfire	(20,15,06,05,"NW_FOREST_PATH_35_09"); 
};