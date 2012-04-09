INSTANCE Mod_7654_OUT_Alkor_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Alkor";
	guild 		= GIL_OUT;
	id 			= 7654;
	voice 		= 8;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------					
	
	// ------ Inventory ------
	CreateInvItems	(self, ItMw_Ritualdolch_Frost, 1);
	CreateInvItems	(self, ItPo_Gegengift, 1);
	CreateInvItems	(self, ItFo_Beer, 3);
	CreateInvItems	(self, ItFo_Booze, 4);
	CreateInvItems	(self, ItMi_Joint, 2);
	CreateInvItems	(self, ItMi_GoldCup, 2);
	CreateInvItems	(self, ItMi_GoldChest, 1);
	CreateInvItems	(self, ItMi_Gold, 358);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal20, BodyTex_N, ItAr_Hum_Dht2S_Armor);		
	Mdl_SetModelFatness	(self, 0.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7654;
};

FUNC VOID Rtn_Start_7654 ()
{	
	TA_Sit_Throne		(05,00,00,00,"REL_MOOR_143");
	TA_Sit_Throne 		(00,00,05,00,"REL_MOOR_143");
};

FUNC VOID Rtn_Wasserleichen_7654 ()
{	
	TA_Follow_Player	(05,00,00,00,"REL_MOOR_177");
	TA_Follow_Player	(00,00,05,00,"REL_MOOR_177");
};