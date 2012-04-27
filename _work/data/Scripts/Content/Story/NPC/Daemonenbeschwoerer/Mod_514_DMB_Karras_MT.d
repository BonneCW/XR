INSTANCE Mod_514_DMB_Karras_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Karras";
	guild 		= GIL_KDF;
	id 			= 514;
	voice 		= 12;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;																//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																						
	EquipItem	(self, ItMW_BeliarStab);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony",Face_L_NormalBart02 , BodyTex_L, ITAR_XARDAS);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 65); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_514;
};

FUNC VOID Rtn_Start_514()
{
	TA_Circle	(08,00,20,00,"PALTOBURGRECHTSOBEN_26");
	TA_Sleep	(20,00,08,00,"PALTOBURGRECHTSOBEN_9");
};

FUNC VOID Rtn_AtPsicamp_514()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"PSI_START");
	TA_Stand_ArmsCrossed	(20,00,08,00,"PSI_START");
};

FUNC VOID Rtn_Tempel_514()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"PSI_TEMPLE_NOVIZE_PR");
	TA_Stand_ArmsCrossed	(20,00,08,00,"PSI_TEMPLE_NOVIZE_PR");
};

FUNC VOID Rtn_Tot_514()
{
	TA_Stand_WP	(08,00,20,00,"TOT");
	TA_Stand_WP	(20,00,08,00,"TOT");
};