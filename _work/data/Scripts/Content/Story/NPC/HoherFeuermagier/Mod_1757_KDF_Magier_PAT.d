instance Mod_1757_KDF_Magier_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_ordenspriester;
	guild 		= GIL_vlk;
	id 			= 1757;
	voice		= 0;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_pat_ordenspriester_mauer;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;																//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 65); //Grenzen für Talent-Level liegen bei 30 und 60
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																			
	EquipItem	(self, ItMW_Addon_Stab01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																				//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Normal05, BodyTex_N, ITAR_kdf_h);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1757;
};

FUNC VOID Rtn_Start_1757 ()
{	
	TA_Stand_Guarding_WP		(08,05,22,05,"WP_PAT_WEG_139");
	TA_Stand_Guarding_WP		(22,05,08,05,"WP_PAT_WEG_139");
};

FUNC VOID Rtn_Kirche_1757 ()
{	
	TA_Pray_Innos_FP		(08,05,22,05,"WP_PAT_WEG_183");
	TA_Pray_Innos_FP		(22,05,08,05,"WP_PAT_WEG_183");
};