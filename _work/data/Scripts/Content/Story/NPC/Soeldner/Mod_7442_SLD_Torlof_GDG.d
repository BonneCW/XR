instance Mod_7442_SLD_Torlof_GDG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Torlof";
	guild 		= GIL_NONE;
	id 			= 7442;
	voice		= 0;
	flags = 2;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_NPCIsRanger] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;


	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, Torlofs_Axt);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Torlof, BodyTex_N, ITAR_SLD_H2);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 60); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7442;
};

FUNC VOID Rtn_PreStart_7442 ()
{
	TA_Stand_Guarding		(08,00,20,00,"LGR_RATSHAUS_17");
	TA_Stand_Guarding		(20,00,08,00,"LGR_RATSHAUS_17");
};