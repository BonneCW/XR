instance Mod_7376_OUT_Anna_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Anna";	
	guild 		= GIL_OUT;
	id 			= 7376;
	voice		= 12;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 10;
	attribute[ATR_DEXTERITY] 		= 10;
	attribute[ATR_MANA_MAX] 		= 0;
	attribute[ATR_MANA] 			= 0;
	attribute[ATR_HITPOINTS_MAX]	= 5;
	attribute[ATR_HITPOINTS] 		= 5;	
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------
																		
		
	// ------ Inventory ------
	//KEIN AmbientInv!!!
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_YoungBlonde, BodyTex_N, ITAR_VlkBabe_M_6);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7376;
};

FUNC VOID Rtn_PreStart_7376 ()
{	
	TA_Stand_ArmsCrossed		(22,00,08,00,"REL_CITY_341");
	TA_Stand_ArmsCrossed		(08,00,22,00,"REL_CITY_341");
};

FUNC VOID Rtn_Start_7376 ()
{	
	TA_Sit_Throne		(22,00,08,00,"REL_CITY_178");
	TA_Potion_Alchemy	(08,00,22,00,"REL_CITY_178");
};

FUNC VOID Rtn_Tot_7376 ()
{	
	TA_Stand_ArmsCrossed		(22,00,08,00,"TOT");
	TA_Stand_ArmsCrossed		(08,00,22,00,"TOT");
};