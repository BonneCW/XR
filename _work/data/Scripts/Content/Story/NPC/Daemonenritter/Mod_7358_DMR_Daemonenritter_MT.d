instance Mod_7358_DMR_Daemonenritter_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Minenwache"; 
	guild 		= GIL_KDF;
	id 			= 7358;
	voice 		= 5;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_XRSchwert_04);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal06, BodyTex_N,ITAR_Raven_Addon);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7358;
};

FUNC VOID Rtn_Start_7358()
{	
	TA_Guard_Passage	(08,00,23,00,"PALTOBURGLINKS_2_3");
	TA_Guard_Passage 	(23,00,08,00,"PALTOBURGLINKS_2_3");
};

FUNC VOID Rtn_ShowTraining_7358()
{	
	TA_Practice_Sword	(08,00,23,00,"PALTOBURGLINKS_2_3");
	TA_Practice_Sword 	(23,00,08,00,"PALTOBURGLINKS_2_3");
};