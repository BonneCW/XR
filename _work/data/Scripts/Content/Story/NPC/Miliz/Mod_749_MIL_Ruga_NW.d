instance Mod_749_MIL_Ruga_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ruga";	
	guild 		= GIL_PAL;
	id 			= 749;
	voice 		= 11;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
	aivar[AIV_ToughGuy]		= TRUE;	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	EquipItem 			(self, ItRw_Mil_Crossbow);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ItKe_City_Tower_03,1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_NormalBart03, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_749;
};

FUNC VOID Rtn_Start_749 ()
{	
	TA_Sit_Campfire		(07,00,20,00,"NW_TAVERNE_TROLLAREA_MONSTER_02_01");
	TA_Sit_Campfire			(20,00,07,00,"NW_TAVERNE_TROLLAREA_MONSTER_02_01");
};

FUNC VOID Rtn_AtNandor_749 ()
{	
	TA_Sit_Campfire		(07,00,20,00,"WP_NANDOR_TENT_01");
	TA_Sit_Campfire			(20,00,07,00,"WP_NANDOR_TENT_01");
};

FUNC VOID Rtn_KO_749 ()
{	
	TA_Sleep		(07,00,20,00,"WP_NANDOR_TENT_02");
	TA_Sleep			(20,00,07,00,"WP_NANDOR_TENT_02");
};