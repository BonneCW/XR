INSTANCE Mod_519_SNOV_Bartok_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bartok"; 
	guild 		= GIL_OUT;
	id 			= 519;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItRw_Bow_L_02); 
	EquipItem	(self, ItMw_Beliarschwert);
	
	// ------ Inventory ------
	//B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItRw_Arrow,40);	
	//CreateInvItems (self, ItPo_Health_03, 5);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Important_Arto, BodyTex_N,ITAR_VLK_H);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 25); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_519;
};

FUNC VOID Rtn_Start_519()
{
	TA_Smalltalk	(08,00,23,00,"NW_CITY_HABOUR_PUFF_PECK");
  	TA_Smalltalk	(23,00,08,00,"NW_CITY_HABOUR_PUFF_PECK");
};

FUNC VOID Rtn_Erwischt_519()
{
	TA_Stand_Drinking	(08,00,20,00,"NW_CITY_BEER_04");
   	TA_Stand_Drinking	(20,00,08,00,"NW_CITY_BEER_04");
};