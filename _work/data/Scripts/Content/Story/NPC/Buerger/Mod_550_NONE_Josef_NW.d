instance Mod_550_NONE_Josef_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Josef";
	guild 		= GIL_NONE;
	id 		= 550;
	voice		= 0;
	flags           = 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------	
	Mdl_SetVisual (self,"HUMANS.MDS");									
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 64 ,  1, TPL_ARMOR_M);	
	Mdl_SetModelFatness	(self,0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_550;
};

FUNC VOID Rtn_Start_550()
{		
	TA_Smoke_Waterpipe 		(07,20,01,20,"NW_CITY_RAUCH_03");
        TA_Smoke_Waterpipe			(01,20,07,20,"NW_CITY_RAUCH_03");
};
