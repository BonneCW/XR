instance Mod_7259_SLD_Orkjaeger_OGY (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_ORKJAEGER; 
	guild 		= GIL_OUT;
	id 			= 7259;
	voice 		= 11;
	flags       = 0;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MT_ORKJAEGER;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------	
	EquipItem	(self, ItMw_Orkschlaechter);



	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------	
	Mdl_SetVisual		(self,"HUMANS.MDS");								
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony",5 , 1, ITAR_SLD_H);			
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7259;
};

FUNC VOID Rtn_Start_7259 ()
{
	TA_Stand_Guarding 	(07,45,23,45,"GRYD_034");
	TA_Stand_Guarding	(23,45,07,45,"GRYD_034");		
};