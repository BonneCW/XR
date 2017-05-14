instance Mod_7326_VLK_Haendler_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Händler"; 
	guild 		= GIL_ORC;
	id 			= 7326;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);

	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;

	level = 15;															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_Nagelknueppel);	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItMi_Nugget, Hlp_Random(4)+1);
	CreateInvItems (self, ItMi_BDTKiste_02, 1);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_OldMan_Gravo, BodyTex_P,ITAR_Vlk_H);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7326;
};

FUNC VOID Rtn_Start_7326()
{	
	TA_RunToWP	(05,15,20,15,"WP_INTRO_FALL3");
    	TA_RunToWP	(20,15,05,15,"WP_INTRO_FALL3");
};