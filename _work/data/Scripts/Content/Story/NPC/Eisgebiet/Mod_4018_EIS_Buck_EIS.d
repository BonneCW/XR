INSTANCE Mod_4018_EIS_Buck_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Buck"; 
	guild 		= GIL_OUT;
	id 			= 4018;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN; //plündert nicht!!! (und ein Freischlag)
	
	// ------ AIVARs ------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem(self, ItMw_1h_Bau_Mace);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self); //NICHT, Alrik soll nicht mehr Gold haben!
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", 205, BodyTex_N,ITAR_Eisgebiet_01);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,10);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4018;
};

FUNC VOID Rtn_Start_4018() //NICHT ÄNDERN --> DIALOG!
{	
	TA_Stand_Guarding	(10,55,19,15,"EIS_133");
	TA_Stand_Drinking	(19,15,03,30,"EIS_133");
	TA_Sit_Bench		(03,30,10,55,"EIS_133");
};