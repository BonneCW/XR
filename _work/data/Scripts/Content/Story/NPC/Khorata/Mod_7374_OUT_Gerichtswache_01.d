INSTANCE Mod_7374_OUT_Gerichtswache_01 (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gerichtswache"; 
	guild 		= GIL_OUT;
	id 			= 7374;
	voice		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_ShortSword3); 
	
	
	// ------ Inventory ------

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_Ian, BodyTex_L, KhorataWache_01);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 10); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7374;
};

FUNC VOID Rtn_Start_7374()
{	
	TA_Stand_Guarding		(08,00,22,00,"REL_CITY_345");
	TA_Stand_Guarding		(22,00,08,00,"REL_CITY_345");
};

FUNC VOID Rtn_StadtTor_7374()
{	
	TA_RunToWP		(08,00,22,00,"REL_CITY_002");
	TA_RunToWP		(22,00,08,00,"REL_CITY_002");
};