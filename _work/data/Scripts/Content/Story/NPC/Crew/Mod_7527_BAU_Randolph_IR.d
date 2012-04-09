instance Mod_7527_BAU_Randolph_IR (Npc_Default)
{
	// ------ NSC ------
	name 		= "Randolph";
	guild 		= GIL_DMT;
	id 			= 7527;
	voice 		= 6;
	flags       = 0;	//Joly:nur solange Alnveres da ist!																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);														
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------															
	EquipItem			(self, ItMw_Sense_01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	aivar[AIV_Partymember] 		= TRUE;

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Kharim, BodyTex_B, ITAR_Bau_L);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 20); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7527;
};

FUNC VOID Rtn_Start_7527 ()
{	
	TA_Sit_Bench	(08,00,20,00,"SHIP_DECK_25");
	TA_Sit_Bench	(20,00,08,00,"SHIP_DECK_25");
};

FUNC VOID Rtn_Follow_7527 ()
{	
	TA_Follow_Player	(08,00,20,00,"SHIP_DECK_25");
	TA_Follow_Player	(20,00,08,00,"SHIP_DECK_25");
};

FUNC VOID Rtn_Waiting_7527 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_DRACONIANAREA_17");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_DRACONIANAREA_17");
};