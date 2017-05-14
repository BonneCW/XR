INSTANCE Mod_7240_PAL_Andre_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lord Andre";	
	guild 		= GIL_DMT;
	id 			= 7240;
	voice		= 0;
	flags       = NPC_FLAG_IMMORTAL;	//Joly: NPC_FLAG_IMMORTAL																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);

	attribute[ATR_STRENGTH] = 10000;																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Paladinschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak12, BodyTex_N, ITAR_PAL_H);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 100); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7240;
};

FUNC VOID Rtn_Start_7240 ()
{
	TA_Stand_Guarding 	(05,00,23,00,"REL_CITY_085"); 
	TA_Stand_Guarding 	(23,00,05,00,"REL_CITY_085");
};

FUNC VOID Rtn_Ofen_7240()
{
	TA_RunToWP		(08,00,20,00,"REL_CITY_338");
	TA_RunToWP		(20,00,08,00,"REL_CITY_338");
};

FUNC VOID Rtn_Tot_7240()
{
	TA_Stand_WP		(08,00,20,00,"TOT");
	TA_Stand_WP		(20,00,08,00,"TOT");
};