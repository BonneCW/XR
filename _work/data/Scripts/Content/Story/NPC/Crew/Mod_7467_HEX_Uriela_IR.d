instance Mod_7467_HEX_Uriela_IR (Npc_Default)
{
	// ------ NSC ------
	name 		= "Uriela";	
	guild 		= GIL_OUT;
	id 			= 7467;
	voice		= 43;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
		
	// ------ Inventory ------
	CreateInvItems	(self, ItSc_SuckEnergy, 3);
	CreateInvItems	(self, ItSc_BeliarsRage, 2);
	CreateInvItems	(self, ItSc_Shrink, 2);
	CreateInvItems	(self, ItSc_HarmUndead, 6);
	CreateInvItems	(self, ItPo_Mana_03, 5);
	aivar[AIV_Partymember] 		= TRUE;

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_Anne, BodyTex_N, ITAR_hexe);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7467;
};

FUNC VOID Rtn_Start_7467 ()
{	
    TA_Cook_Stove 	(08,00,10,00,"SHIP_IN_30");
    TA_Cook_Stove 	(10,00,08,00,"SHIP_IN_30");
    
};

FUNC VOID Rtn_Follow_7467 ()
{	
	TA_Follow_Player	(08,00,20,00,"SHIP_IN_30");
	TA_Follow_Player	(20,00,08,00,"SHIP_IN_30");
};


FUNC VOID Rtn_Waiting_7467 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_DRACONIANAREA_17");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_DRACONIANAREA_17");
};