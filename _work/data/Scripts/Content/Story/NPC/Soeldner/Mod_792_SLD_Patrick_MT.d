instance Mod_792_SLD_Patrick_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Patrick"; 
	guild 		= GIL_MIL;
	id 			= 792;
	voice		= 0;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	//aivars 
	aivar[AIV_IgnoresArmor]  = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_GrobesKurzschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_NormalBart02, BodyTex_L, ITAR_SLD_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_792;
};

FUNC VOID Rtn_Start_792 ()
{	
	TA_Practice_Sword (06,00,20,00,"NC_WATERFALL_TOP02");
	TA_Sleep (20,00,06,00,"NC_HUT03_IN");
};