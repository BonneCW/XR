instance Mod_7726_OUT_Salmey_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Salmey";	
	guild 		= GIL_OUT;
	id 			= 7726;
	voice 		= 16;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 10;
	attribute[ATR_DEXTERITY] 		= 10;
	attribute[ATR_MANA_MAX] 		= 0;
	attribute[ATR_MANA] 			= 0;
	attribute[ATR_HITPOINTS_MAX]	= 5;
	attribute[ATR_HITPOINTS] 		= 5;																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------
																		
		
	// ------ Inventory ------
	CreateInvItems (self,ItMi_Gold, 100);		//für die Matteo Mission


	CreateInvItems	(self, ItFo_Beer, 15);
	//KEIN AmbientInv!!!
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_YoungBlonde, BodyTex_N, ITAR_VlkBabe_M_6);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7726;
};

FUNC VOID Rtn_Start_7726 ()
{	
	TA_Stand_Sweeping	(04,55,20,05,"ALTEFESTUNG_011");
	TA_Stand_Sweeping	(20,05,04,55,"ALTEFESTUNG_011");
};