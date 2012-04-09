INSTANCE Mod_7448_KDS_Myxir_IR (Npc_Default)
{
	// ------ NSC ------
	name 		= "Myxir";
	guild 		= GIL_OUT; 
	id 			= 7448;
	voice 		= 12;
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;
	aivar[AIV_Partymember] 		= TRUE;
	
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
	daily_routine 		= Rtn_Start_7448;
};

FUNC VOID Rtn_Start_7448()
{
	TA_Circle	(08,00,20,00,"SHIP_DECK_09");
	TA_Circle	(20,00,08,00,"SHIP_DECK_09");
};

FUNC VOID Rtn_Follow_7448 ()
{	
	TA_Follow_Player	(08,00,20,00,"SHIP_DECK_09");
	TA_Follow_Player	(20,00,08,00,"SHIP_DECK_09");
};

FUNC VOID Rtn_Waiting_7448 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_DRACONIANAREA_17");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_DRACONIANAREA_17");
};