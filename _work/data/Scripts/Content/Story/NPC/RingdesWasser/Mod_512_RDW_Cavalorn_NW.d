instance Mod_512_RDW_Cavalorn_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cavalorn";
	guild 		= GIL_NOV;
	id 			= 512;
	voice 		= 8;
	flags       = 2;	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ Attribute ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;

	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_AdanosKurzschwert);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_B_Cavalorn, BodyTex_B, ITAR_RANGER_ADDON);	 
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_512;
};

FUNC VOID Rtn_Start_512()
{
	TA_Sit_Campfire	(20,00,08,00,"NW_XARDAS_GOBBO_01");
	TA_Stand_Eating	(08,00,08,30,"NW_XARDAS_GOBBO_01");
	TA_Stand_WP	(08,30,12,00,"NW_XARDAS_GOBBO_01");
	TA_Stand_Eating	(12,00,12,30,"NW_XARDAS_GOBBO_01");
	TA_Stand_WP	(12,30,18,00,"NW_XARDAS_GOBBO_01");
	TA_Stand_Eating	(18,00,18,30,"NW_XARDAS_GOBBO_01");
	TA_Stand_WP	(18,30,20,00,"NW_XARDAS_GOBBO_01");
};

func void Rtn_MagierWeg_512 ()
{	
	TA_Smalltalk		(08,00,20,00,"NW_TROLLAREA_PORTAL_03"); 
	TA_Smalltalk		(20,00,08,00,"NW_TROLLAREA_PORTAL_03");
};

func void Rtn_AtVatras_512 ()
{
	TA_Sit_Bench 	(05,00,20,00,"NW_CITY_MERCHANT_PATH_15");
	TA_Sit_Bench	(20,00,05,00,"NW_CITY_MERCHANT_PATH_15");
};