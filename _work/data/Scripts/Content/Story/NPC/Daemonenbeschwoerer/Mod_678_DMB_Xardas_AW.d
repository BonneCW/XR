INSTANCE Mod_678_DMB_Xardas_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Xardas";
	guild 		= GIL_NONE;
	id 			= 678;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																				
	EquipItem	(self, ItMW_BeliarStab);
	
	// ------ Inventory ------
	//B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic",Face_N_Xardas , BodyTex_N, ITAR_DMB_S);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 100); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_678;
};

FUNC VOID Rtn_PreStart_678()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_ENTRANCE");
	TA_Stand_ArmsCrossed	(20,00,08,00,"ADW_ENTRANCE");
};

FUNC VOID Rtn_Tot_678()
{
	TA_Stand_WP		(08,00,20,00,"TOT");
	TA_Stand_WP		(20,00,08,00,"TOT");
};