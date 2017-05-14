instance Mod_7014_HS_Wache_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wache";
	guild 		= GIL_OUT;
	id 			= 7014;
	voice		= 0;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	aivar[AIV_ToughGuy]		= TRUE;
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1H_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_Normal_Kirgo, BodyTex_B, ITAR_Hofstaatler);	
	Mdl_SetModelFatness	(self, 1.2);
	Mdl_ApplyOverlayMds	(self, "Humans_MILITIA.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 85); //Grenzen für Talent-Level liegen bei 30 und 60
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7014;
};

FUNC VOID Rtn_Start_7014 ()
{	
	TA_Stand_Guarding		(08,00,21,00,"REL_253");
   	TA_Stand_Guarding		(21,00,08,00,"REL_253");
};