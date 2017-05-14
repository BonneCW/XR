INSTANCE Mod_6007_DMB_Andokai_GDG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Andokai";
	guild 		= GIL_OUT;
	id 			= 6007;
	voice		= 0;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																						
	EquipItem	(self, ItMW_BeliarStab);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

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
	daily_routine 		= Rtn_Start_6007;
};

FUNC VOID Rtn_Start_6007()
{
	TA_Study_WP	(08,00,20,00,"WP_GDG_ANDOKAI_STUDY");
	TA_Study_WP	(20,00,08,00,"WP_GDG_ANDOKAI_STUDY");
};