INSTANCE Mod_515_KDS_Myxir_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Myxir";
	guild 		= GIL_KDF; 
	id 			= 515;
	voice 		= 12;
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
	daily_routine 		= Rtn_Start_515;
};

FUNC VOID Rtn_Start_515()
{
	TA_Potion_Alchemy	(07,00,15,00,"PALTOBURGRECHTS_9_2");
	TA_Sit_Throne		(15,00,19,00,"PALTOBURGRECHTS_1_3");
	TA_Potion_Alchemy	(19,00,22,00,"PALTOBURGRECHTS_9_1");
	TA_Sleep		(22,00,07,00,"PALTOBURGRECHTSOBEN_16");
};

FUNC VOID Rtn_Tot_515()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"TOT");
	TA_Stand_ArmsCrossed	(20,00,08,00,"TOT");
};