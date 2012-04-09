INSTANCE Mod_6003_KDW_Saturas_GDG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Saturas";
	guild 		= GIL_KDW; 
	id 			= 6003;
	voice 		= 14;
	flags       = 2;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																
	EquipItem	(self, ItMW_Addon_Stab03);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Saturas, BodyTex_B, ITAR_KDW_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	 
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 100); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_6003;
};

FUNC VOID Rtn_Start_6003 ()
{
	TA_Sit_Throne		(08,00,20,00,"LGR_RATSHAUS_14");
	TA_Sit_Throne		(20,00,08,00,"LGR_RATSHAUS_14");
};

FUNC VOID Rtn_WaitForRitual_6003 ()
{
	TA_Stand_WP		(08,00,20,00,"WP_GDG_RITUAL_SATURAS");
	TA_Stand_WP		(20,00,08,00,"WP_GDG_RITUAL_SATURAS");
};

FUNC VOID Rtn_Ritual_6003 ()
{
	TA_Ritual_Saturas		(08,00,20,00,"WP_GDG_RITUAL_XARDAS");
	TA_Ritual_Saturas		(20,00,08,00,"WP_GDG_RITUAL_XARDAS");
};