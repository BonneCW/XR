INSTANCE Mod_1545_PIR_Brandon_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brandon";
	guild 		= GIL_out;
	id 			= 1545;
	voice		= 0;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_FollowDist] = 400;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR1hAxe);
	
	// ------ Inventory ------
	CreateInvItems (self, itpo_Health_03, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Tough_Okyl, BodyTex_N, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1.1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1545;
};

FUNC VOID Rtn_Start_1545 ()
{	
	TA_Smith_Sharp 		(07,03,21,03,"WP_DI_BRANDON_SMITH");
	TA_Sleep		(21,03,22,03,"WP_DI_BRANDON_SLEEP");
};