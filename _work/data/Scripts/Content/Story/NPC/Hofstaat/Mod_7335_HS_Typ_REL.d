instance Mod_7335_HS_Typ_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Nächstes Königliches Hunderfutter";
	guild 		= GIL_OUT;
	id 			= 7335;
	voice		= 9;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------			
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems		(self,	ItMi_Gold,	35);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Kirgo, BodyTex_B, ITAR_Hofstaatler);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7335;
};

FUNC VOID Rtn_PreStart_7335 ()
{	
	TA_Stand_ArmsCrossed				(08,00,22,00,"REL_243");
    TA_Stand_ArmsCrossed				(22,00,08,00,"REL_243");
};

FUNC VOID Rtn_Tot_7335 ()
{	
	TA_Stand_ArmsCrossed				(08,00,22,00,"TOT");
    TA_Stand_ArmsCrossed				(22,00,08,00,"TOT");
};