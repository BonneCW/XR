INSTANCE Mod_7000_KDS_Myxir_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Myxir";
	guild 		= GIL_KDF; 
	id 			= 7000;
	voice 		= 28;
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	//B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_P_NormalBart_Cronos, BodyTex_P, SCHWARZMAGIERROBE);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);																		
	EquipItem	(self, ItMW_BeliarStab);
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7000;
};

FUNC VOID Rtn_Start_7000()
{
	TA_Stand_WP	(08,00,20,00,"ADW_PIRATECAMP_BEACH_14");
	TA_Stand_WP	(20,00,08,00,"ADW_PIRATECAMP_BEACH_14");
};