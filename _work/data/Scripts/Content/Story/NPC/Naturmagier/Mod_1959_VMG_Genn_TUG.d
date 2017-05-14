INSTANCE Mod_1959_VMG_Genn_TUG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Genn"; 
	guild 		= GIL_OUT;
	id 			= 1959;
	voice		= 0;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN; //plündert nicht!!! (und ein Freischlag)
	
	// ------ AIVARs ------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem(self, ItMw_1h_Bau_Mace);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self); //NICHT, Alrik soll nicht mehr Gold haben!
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", 243, BodyTex_N,ITAR_Druidewaldmagier);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,60);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1959;
};

FUNC VOID Rtn_Start_1959() //NICHT ÄNDERN --> DIALOG!
{	
	TA_Stand_Eating		(07,00,07,30,"TUG_03");
	TA_Stand_Drinking	(07,30,08,00,"TUG_03");
	TA_Sit_Bench		(08,00,10,00,"TUG_02");
	TA_Potion_Alchemy	(10,00,12,00,"TUG_04");
	TA_Stand_Eating		(12,00,12,30,"TUG_03");
	TA_Stand_Drinking	(12,30,13,00,"TUG_03");
	TA_Sit_Bench		(13,00,14,00,"TUG_02");
	TA_Potion_Alchemy	(14,00,18,00,"TUG_04");
	TA_Stand_Eating		(18,00,18,30,"TUG_03");
	TA_Stand_Drinking	(18,30,19,00,"TUG_03");
	TA_Sit_Bench		(19,00,22,00,"TUG_02");
	TA_Sleep		(22,00,07,00,"TUG_04");
};

FUNC VOID Rtn_Talk_1959()
{
	TA_Smalltalk	(08,00,20,00, "TUG_03");
	TA_Smalltalk	(20,00,08,00, "TUG_03");
};