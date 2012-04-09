instance Mod_7404_NONE_Elvrich_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Elvrich"; 
	guild 		= GIL_OUT;
	id 			= 7404;
	voice 		= 24;
	flags       = 0;
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_NoFightParker] = TRUE; //Joly: Gefangener der Banditen
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
	
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Bau_Mace); 
		
	// ------ Inventory ------
	// 

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_B_Normal01, BodyTex_B,ITAR_Bau_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7404;
};

FUNC VOID Rtn_Start_7404 ()
{	
	TA_Sit_Chair	(08,00,22,00,"PSI_GUARD_TREE_IN");
	TA_Sit_Chair	(22,00,08,00,"PSI_GUARD_TREE_IN");
};