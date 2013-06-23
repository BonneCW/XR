instance Mod_106_TPL_Angar_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cor Angar";
	guild 		= GIL_OUT;
	id 			= 106;
	voice 		= 34;
	flags       = 0;					//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, Roter_Wind);
	CreateInvItems (self, ItPo_Health_03, 6);									
	CreateInvItems (self, ItMi_OldCoin, 1);	//Joly: damit man seine Leiche findet, wenn er im Kampf stirbt!									
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_CorAngar, BodyTex_B, ITAR_CorAngar);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 80); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_106;
};

FUNC VOID Rtn_Start_106 ()
{
	TA_Sleep		(01,00,05,00,"PSI_17_HUT_IN");
	TA_Stand_Guarding	(05,00,01,00,"PSI_TRAINING_TEACHER");
};

FUNC VOID Rtn_Posten_106 ()
{
	TA_Stand_WP	(01,00,05,00,"PATH_TAKE_HERB_2_1");
	TA_Stand_WP	(05,00,01,00,"PATH_TAKE_HERB_2_1");
};

FUNC VOID Rtn_Leichengase_106 ()
{
	TA_Sleep	(01,00,05,00,"PSI_17_HUT_IN");
	TA_Sleep	(05,00,01,00,"PSI_17_HUT_IN");
};

FUNC VOID Rtn_InPsicamp_106 ()
{
	TA_Stand_WP			(02,10,07,40,"PSI_TEMPLE_IN_05");
	TA_Stand_WP		(07,40,21,05,"PSI_TEMPLE_IN_05");
	TA_Stand_WP		(21,05,02,10,"PSI_TEMPLE_IN_05");
};

FUNC VOID Rtn_Tot_106 ()
{
	TA_Stand_WP	(01,00,05,00,"TOT");
	TA_Stand_WP	(05,00,01,00,"TOT");
};