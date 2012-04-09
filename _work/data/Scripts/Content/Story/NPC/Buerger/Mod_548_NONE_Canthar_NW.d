instance Mod_548_NONE_Canthar_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Canthar"; 
	guild 		= GIL_DMT;
	id 			= 548;
	voice 		= 9;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_2H_Eminem_Goldschwert_01); 
	
	// ------ Inventory ------
	CreateInvItems (self, ItMi_Gold, 50);
	CreateInvItems (self, ItKe_Canthar, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Orry, BodyTex_N, ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,1.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_548;
};

FUNC VOID Rtn_Start_548()
{	
	TA_Sit_Bench		(07,45,19,45,"NW_CITY_MERCHANT_PATH_30");
   	TA_Sleep		(19,45,07,45,"NW_CITY_HOTEL_BED_01");
};

FUNC VOID Rtn_WaitForPlayer_548()
{	
	TA_Smoke_Joint		(07,45,19,45,"NW_CITY_MERCHANT_PATH_30");
   	TA_Sleep		(19,45,07,45,"NW_CITY_HOTEL_BED_01");
};

FUNC VOID Rtn_Fleeing_548()
{	
	TA_FleeToWP	(07,00,23,00,"BIGFARM");
	TA_FleeToWP	(23,00,07,00,"BIGFARM");
};

FUNC VOID Rtn_Tot_548()
{	
	TA_Stand_ArmsCrossed	(07,00,23,00,"NW_CANTHARINSEL_27");
	TA_Stand_ArmsCrossed	(23,00,07,00,"NW_CANTHARINSEL_27");
};