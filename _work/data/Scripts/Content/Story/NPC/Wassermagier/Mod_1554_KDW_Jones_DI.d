instance Mod_1554_KDW_Jones_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jones";
	guild 		= GIL_nov;
	id 			= 1554;
	voice		= 0;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_ToughGuy] = TRUE;	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																		
	EquipItem	(self, ItMW_Addon_Stab03);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", 194, BodyTex_B, ITAR_KDW_L_Addon);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 65); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1554;
};

FUNC VOID Rtn_Start_1554 ()
{	
	TA_Stand_ArmsCrossed			(08,00,21,00,"WP_DI_HEROKOMMTANLAND");
    TA_Stand_ArmsCrossed				(21,00,08,00,"WP_DI_HEROKOMMTANLAND");
};

FUNC VOID Rtn_Skelett_1554 ()
{	
	TA_Follow_Player (06,00,14,00,"WP_DI_HOEHLE_RITUAL");
	TA_Follow_Player (14,00,06,00,"WP_DI_HOEHLE_RITUAL");
};

FUNC VOID Rtn_Circle_1554 ()
{	
	TA_Circle_Ghost (06,00,14,00,"WP_DI_HOEHLE_RITUAL_JONES");
	TA_Circle_Ghost (14,00,06,00,"WP_DI_HOEHLE_RITUAL_JONES");
};