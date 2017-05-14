INSTANCE Mod_7442_RDW_Diego_IR (Npc_Default)
{
	// ------ NSC ------
	name 		= "Diego";
	guild 		= GIL_OUT;
	id 			= 7442;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ aivar ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_Partymember] 		= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------
	EquipItem	(self, ItMw_AdanosKurzschwert);																	
	EquipItem (self, ItRw_Bow_War_05_Schmetter);
	CreateInvItems	(self, ItRw_SchmetterArrow, 1000);  
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief",Face_L_Diego, BodyTex_L, ITAR_RANGER_ADDON);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7442;
};

FUNC VOID Rtn_Start_7442()
{
	TA_Sit_Bench	(08,00,20,00,"SHIP_DECK_25");
	TA_Sit_Bench	(20,00,08,00,"SHIP_DECK_25");
};

FUNC VOID Rtn_Follow_7442 ()
{	
	TA_Follow_Player	(08,00,20,00,"SHIP_DECK_25");
	TA_Follow_Player	(20,00,08,00,"SHIP_DECK_25");
};

FUNC VOID Rtn_Waiting_7442 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_DRACONIANAREA_17");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_DRACONIANAREA_17");
};