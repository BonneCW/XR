instance Mod_951_PSINOV_Fortuno_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fortuno";
	guild 		= GIL_OUT;
	id 			= 951;
	voice		= 0;
	flags      	= 0;
	npctype		= NPCTYPE_Main;
	
	//Aivars
	aivar[AIV_NewsOverride] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, Fortunos_Keule);
	
	// ------ Inventory ------
	
	
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Fortuno, BodyTex_T, ITAR_LESTER);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_PreStart_951;
};

FUNC VOID Rtn_PreStart_951 ()
{
	TA_Stand_ArmsCrossed (07,00,22,00,"PSI_HERB_SHOP");	
	TA_Sleep		 (22,00,07,00,"PSI_32_HUT_IN");
};

FUNC VOID Rtn_Sumpfmensch_951 ()
{
	TA_Stand_ArmsCrossed 	(07,00,22,00,"PSI_HERB_SHOP");	
	TA_Smalltalk_Plaudern	(22,00,07,00,"PSI_6_HUT_EX");
};