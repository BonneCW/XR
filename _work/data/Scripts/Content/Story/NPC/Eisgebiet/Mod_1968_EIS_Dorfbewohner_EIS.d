instance Mod_1968_EIS_Dorfbewohner_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dorfbewohner";	
	guild 		= GIL_out;
	id 			= 1968;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_EIS_BEWOHNER;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------		
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Torlof, BodyTex_N, ITAR_Eisgebiet_02);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1968;
};

FUNC VOID Rtn_Start_1968()
{		        	                  
	TA_Sit_Chair	(08,00,11,00,"EIS_109");   	        	                  
	TA_Smalltalk	(11,00,15,00,"EIS_105");   
	TA_Stand_ArmsCrossed		(15,00,17,00,"EIS_100"); 	        	                  
	TA_Sit_Bench	(17,00,22,00,"EIS_102");    	        	                  
	TA_Sleep	(22,00,08,00,"EIS_113");   	                                   
};  

FUNC VOID Rtn_AtThys_1968()
{		        	                  
	TA_Smalltalk	(08,00,22,00,"EIS_76");  	        	                  
	TA_Sleep	(22,00,08,00,"EIS_113");   	                                   
};  