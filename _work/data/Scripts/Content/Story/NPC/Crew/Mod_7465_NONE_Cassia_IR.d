instance Mod_7465_NONE_Cassia_IR (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cassia"; 
	guild 		= GIL_OUT;
	id 			= 7465;
	voice		= 17;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//----------AIVARS--------------
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_Partymember] 		= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Meisterdegen); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ITKE_Thiefguildkey_Hotel_MIS,1);
	CreateInvItems (self,ItKe_ThiefTreasure	,1);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_BlackHair, BodyTexBabe_N, ITAR_VlkBabe_H);		
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7465;
};

FUNC VOID Rtn_Start_7465()
{	
	TA_Smalltalk	(08,00,20,00,"SHIP_CREW_03");
	TA_Smalltalk 	(20,00,08,00,"SHIP_CREW_03");
};

FUNC VOID Rtn_Follow_7465 ()
{	
	TA_Follow_Player	(08,00,20,00,"SHIP_CREW_03");
	TA_Follow_Player	(20,00,08,00,"SHIP_CREW_03");
};

FUNC VOID Rtn_Waiting_7465 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_DRACONIANAREA_17");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_DRACONIANAREA_17");
};