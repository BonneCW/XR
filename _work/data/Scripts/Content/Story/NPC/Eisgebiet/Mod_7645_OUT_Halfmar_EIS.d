INSTANCE Mod_7645_OUT_Halfmar_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Halfmar";
	guild 		= GIL_OUT;
	id 			= 7645;
	voice 		= 32;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	

	attribute[ATR_STRENGTH] = 90;																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------					
	CreateInvItems (self, ItPo_Health_01, 3);									
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Corristo , BodyTex_N, ITAR_Eisgebiet_02);
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7645;
};

FUNC VOID Rtn_PreStart_7645 ()
{	
	TA_Waermen	(08,00,22,00,"HALFMAR_HUETTE_03");
    	TA_Sleep	(22,00,08,00,"HALFMAR_HUETTE_02");
};