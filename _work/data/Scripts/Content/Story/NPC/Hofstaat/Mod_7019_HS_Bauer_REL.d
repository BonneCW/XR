instance Mod_7019_HS_Bauer_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bauer"; 
	guild 		= GIL_OUT;
	id 			= 7019;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	
	//----------AIVARS--------------
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Vlk_Sword); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Normal07, BodyTex_N,ITAR_Hofstaatler);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7019;
};

FUNC VOID Rtn_Start_7019()
{	
	TA_Smoke_Joint			(07,00,23,00,"REL_270");
	TA_Smoke_Joint			(23,00,07,00,"REL_270");
};