instance Mod_747_MIL_Rangar_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rangar";	
	guild 		= GIL_OUT;
	id 			= 747;
	voice 		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
	aivar[AIV_ToughGuy]		= TRUE;		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	CreateInvItems (self,ItKe_City_Tower_02,1);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Tough_Skip, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_747;
};

FUNC VOID Rtn_Start_747()
{	
	TA_Stand_Drinking	(08,00,20,00,"NW_CITY_BEER_06");
    TA_Stand_Drinking	(20,00,08,00,"NW_CITY_BEER_06");
};

FUNC VOID Rtn_Pass_747 ()
{	
	TA_Stand_ArmsCrossed 		 (08,00,22,00,"NW_PASS_GATE_01");	 
    	TA_Stand_ArmsCrossed		 (22,00,08,00,"NW_PASS_GATE_01");
};

FUNC VOID Rtn_AtNandor_747 ()
{	
	TA_Sit_Campfire 		(08,00,23,00,"WP_NANDOR_TENT_01"); 
    TA_Sit_Campfire			(23,00,08,00,"WP_NANDOR_TENT_01");
};

FUNC VOID Rtn_Freibier_747()
{	
	TA_Smalltalk_Plaudern	(08,00,20,00,"NW_CITY_BEER_04");
   	TA_Smalltalk_Plaudern	(20,00,08,00,"NW_CITY_BEER_04");
};