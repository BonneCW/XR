instance Mod_7370_OUT_Ulrich_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ulrich"; 
	guild 		= GIL_OUT;
	id 			= 7370;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;																
		
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Bau_Mace);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Corristo, BodyTex_N, ITAR_VLK_M);	
	Mdl_SetModelFatness	(self, 3);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7370;
};

//Joly: NIE AUF EINE BANK ODER THRON SETZEN

FUNC VOID Rtn_Start_7370 ()
{	
	TA_Sleep			(22,00,08,00,"REL_CITY_190");
	TA_Sit_Throne			(08,00,22,00,"REL_CITY_191");
};

FUNC VOID Rtn_GuideToRichter_7370 ()
{	
	TA_Guide_Player			(22,00,08,00,"REL_CITY_339");
	TA_Guide_Player			(08,00,22,00,"REL_CITY_339");
};

FUNC VOID Rtn_AtProzess_7370 ()
{	
	TA_Stand_ArmsCrossed		(22,00,08,00,"REL_CITY_341");
	TA_Stand_ArmsCrossed		(08,00,22,00,"REL_CITY_341");
};

FUNC VOID Rtn_Tot_7370 ()
{	
	TA_Stand_ArmsCrossed		(22,00,08,00,"TOT");
	TA_Stand_ArmsCrossed		(08,00,22,00,"TOT");
};