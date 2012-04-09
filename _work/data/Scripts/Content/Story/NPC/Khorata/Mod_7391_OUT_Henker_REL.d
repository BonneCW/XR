instance Mod_7391_OUT_Henker_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Henker"; 
	guild 		= GIL_OUT;
	id 			= 7391;
	voice 		= 5;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_NormalBart01, BodyTex_L, ITAR_SMITH);	
	Mdl_SetModelFatness	(self,0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7391;
};

FUNC VOID Rtn_Start_7391()
{	
	TA_Stand_ArmsCrossed		(06,00,22,00,"REL_CITY_334");
	TA_Sleep			(22,00,06,00,"REL_CITY_009");
};

FUNC VOID Rtn_FollowToMine_7391()
{	
	TA_Follow_Player	(08,00,20,00,"REL_002");
	TA_Follow_Player	(20,00,08,00,"REL_002");
};