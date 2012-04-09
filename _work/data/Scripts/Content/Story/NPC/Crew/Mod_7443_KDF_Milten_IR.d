INSTANCE Mod_7443_KDF_Milten_IR (Npc_Default)
{
	// ------ NSC ------
	name 		= "Milten";
	guild 		= GIL_OUT;
	id 			= 7443;
	voice 		= 3;
	flags       = 2;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ aivar ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_Partymember] 		= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;																
	EquipItem	(self, ItMW_Addon_Stab01);	
	
	// ------ Equippte Waffen ------																	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Inventory ------
	CreateInvItems	(self, ItSc_Firerain, 3);
	CreateInvItems	(self, ItSc_Pyrokinesis, 3);
	CreateInvItems	(self, ItSc_ChargeFireball, 5);
	CreateInvItems	(self, ItSc_Firestorm, 7);
	CreateInvItems	(self, ItPo_Mana_03, 5);
	CreateInvItems	(self, ItPo_Health_03, 5);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_N_Milten, BodyTex_N, ITAR_KDF_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7443;
};

FUNC VOID Rtn_Start_7443()
{
	TA_Smalltalk	(08,00,20,00,"SHIP_CREW_19");
	TA_Smalltalk	(20,00,08,00,"SHIP_CREW_19");
};

FUNC VOID Rtn_Follow_7443 ()
{	
	TA_Follow_Player	(08,00,20,00,"SHIP_CREW_19");
	TA_Follow_Player	(20,00,08,00,"SHIP_CREW_19");
};

FUNC VOID Rtn_Waiting_7443 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_DRACONIANAREA_17");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_DRACONIANAREA_17");
};