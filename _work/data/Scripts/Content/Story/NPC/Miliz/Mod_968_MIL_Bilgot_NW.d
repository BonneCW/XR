instance Mod_968_MIL_Bilgot_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bilgot";
	guild 		= GIL_PAL;
	id 			= 968;
	voice 		= 5;
	flags       = 0;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	aivar[AIV_ToughGuy]		= TRUE;	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Milizschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItPo_Health_02, 4);									
	CreateInvItems (self, ItMi_OldCoin, 1);	//Joly: damit man seine Leiche findet, wenn er im Kampf stirbt!									

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Weak_Ulf_Wohlers, BodyTex_P, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_968;
};

FUNC VOID Rtn_Start_968 ()
{	
	TA_Stand_Guarding	 (08,00,23,00,"NW_CITY_PALCAMP_03");
	TA_Stand_Guarding	 (23,00,08,00,"NW_CITY_HABOUR_HUT_01");
};

FUNC VOID Rtn_Nase_968()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_CITY_CONNECT_FOREST");
   	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_CITY_CONNECT_FOREST");
};

FUNC VOID Rtn_Assis_968()
{	
	TA_Follow_Player	(08,00,20,00,"NW_CITY_CONNECT_FOREST");
   	TA_Follow_Player	(20,00,08,00,"NW_CITY_CONNECT_FOREST");
};

FUNC VOID Rtn_Assis2_968()
{	
	TA_Pick_FP		(08,00,20,00,"WP_ASSASSINE_08");
   	TA_Pick_FP		(20,00,08,00,"WP_ASSASSINE_08");
};

FUNC VOID Rtn_Hotel_968 ()
{
	TA_Stand_ArmsCrossed	(08,00,22,00,"NW_CITY_HANNA");
	TA_Stand_ArmsCrossed	(22,00,08,00,"NW_CITY_HANNA");
};