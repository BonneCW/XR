instance Mod_7642_OUT_Brunhild_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brunhild";	
	guild 		= GIL_OUT;
	id 			= 7642;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Lilo, BodyTex_N, ITAR_VlkBabe_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7642;
};

FUNC VOID Rtn_Start_7642 ()
{	
	TA_Sleep	(05,05,20,05,"WP_DI_BRUNHILD_02");
	TA_Sleep	(20,05,05,05,"WP_DI_BRUNHILD_02");
};

FUNC VOID Rtn_Follow_7642 ()
{	
	TA_Follow_Player	(05,05,20,05,"WP_DI_SKIPKOMMTANLAND");
	TA_Follow_Player	(20,05,05,05,"WP_DI_SKIPKOMMTANLAND");
};

FUNC VOID Rtn_Kueche_7642 ()
{	
	TA_Cook_Stove	(05,05,20,05,"WP_DI_BRANDON_SLEEP");
	TA_Cook_Stove	(20,05,05,05,"WP_DI_BRANDON_SLEEP");
};
