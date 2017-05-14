INSTANCE Mod_6000_DMR_Gomez_GDG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gomez";
	guild 		= GIL_OUT;
	id 			= 6000;
	voice		= 0;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_FRIEND;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Streitaxt2);

	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Gomez, BodyTex_N, ITAR_RAVEN_ADDON);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_MILITIA.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 100); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_6000;
};

FUNC VOID Rtn_Start_6000()
{
	TA_Circle		(08,30,12,00,"LGR_SCHWERTT_03");
	TA_Stand_Eating		(12,00,12,30,"LGR_VERSAMMLUNGSHALLE_06");
	TA_Practice_Sword	(12,30,18,00,"LGR_SCHWERTT_03");
	TA_Stand_Eating		(18,00,18,30,"LGR_VERSAMMLUNGSHALLE_06");
	TA_Circle		(18,30,20,00,"LGR_SCHWERTT_03");
	TA_Practice_Sword		(20,00,08,00,"LGR_SCHWERTT_03");
	TA_Stand_Eating		(08,00,08,30,"LGR_VERSAMMLUNGSHALLE_06");
};