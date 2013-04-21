instance Mod_7419_OUT_Leonhard_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Leonhard"; 
	guild 		= GIL_OUT;
	id 			= 7419;
	voice 		= 36;
	flags       = 0;																
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
	
	// ------ Inventory ------
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Orry, BodyTex_N, ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,1.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7419;
};

FUNC VOID Rtn_Start_7419()
{	
	TA_Sit_Campfire		(07,45,19,45,"REL_CITY_360");
	TA_Sit_Campfire		(19,45,07,45,"REL_CITY_360");
};

FUNC VOID Rtn_Endres_7419 ()
{	
	TA_Stand_Guarding		(08,05,22,05,"REL_CITY_002");
	TA_Stand_Guarding		(22,05,08,05,"REL_CITY_002");
};

FUNC VOID Rtn_Strafe_7419 ()
{	
	TA_Pick_FP		(08,05,16,05,"REL_SURFACE_107");
	TA_Stand_Guarding	(16,05,18,05,"BRAUERKESSEL");
	TA_Stand_Guarding	(18,05,08,05,"REL_CITY_002");
};