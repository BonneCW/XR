instance Mod_946_BDT_Edgor_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Edgor";
	guild 		= GIL_OUT;
	id 			= 946;
	voice 		= 31;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Banditenschwert);
	EquipItem (self, ItRw_Sld_Bow);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart20, BodyTex_N, ITAR_BDT_M_01);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_946;
};
FUNC VOID Rtn_Start_946 () //RUINE
{
     TA_Sit_Campfire 		(09,00,12,00,"NW_BIGMILL_FARM3_RANGERBANDITS_02"); 
     TA_Sit_Campfire	    (12,00,09,00,"NW_BIGMILL_FARM3_RANGERBANDITS_02");			
};
FUNC VOID Rtn_Malak_946 () //RUINE
{
     TA_Guide_Player 		(09,00,12,00,"NW_FARM3_MALAK"); 
     TA_Guide_Player	    (12,00,09,00,"NW_FARM3_MALAK");			
};
FUNC VOID Rtn_Pass_946 () //RUINE
{
     TA_Guide_Player 		(09,00,12,00,"NW_FARM3_MOUNTAINLAKE_05"); 
     TA_Guide_Player	    (12,00,09,00,"NW_FARM3_MOUNTAINLAKE_05");			
};

FUNC VOID Rtn_Senyan_946 ()
{
	TA_Sit_Campfire    (10,00,12,00,"NW_FARM4_WOOD_RANGERBANDITS_03");
	TA_Sit_Campfire    (12,00,10,00,"NW_FARM4_WOOD_RANGERBANDITS_03");
};