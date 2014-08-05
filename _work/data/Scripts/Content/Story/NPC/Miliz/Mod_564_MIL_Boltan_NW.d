INSTANCE Mod_564_MIL_Boltan_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Boltan";	
	guild 		= GIL_PAL;
	id 			= 564;
	voice 		= 30;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
	aivar[AIV_ToughGuy]		= TRUE;		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_B_Normal01, BodyTex_B, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_564;
};

FUNC VOID Rtn_Start_564 ()
{	
	TA_Sit_Chair			(06,55,21,00,"NW_CITY_HABOUR_KASERN_PRISON_SIT");
  	TA_Stand_Guarding		(21,00,06,55,"NW_CITY_HABOUR_KASERN_PRISON_02");
};

FUNC VOID Rtn_Pause_564 ()
{	
	TA_Sit_Chair			(06,55,21,00,"NW_CITY_KASERN_BARRACK02_03");
  	TA_Sit_Chair		(21,00,06,55,"NW_CITY_KASERN_BARRACK02_03");
};

FUNC VOID Rtn_Dieb_564 ()
{	
	TA_Stand_ArmsCrossed		(09,00,21,00,"NW_CITY_KANAL_25");
   	TA_Stand_ArmsCrossed		(21,00,09,00,"NW_CITY_KANAL_25");
};

FUNC VOID Rtn_Dieb2_564 ()
{	
	TA_RunToWP		(09,00,21,00,"NW_CITY_KANAL_ROOM_05_01");
   	TA_RunToWP		(21,00,09,00,"NW_CITY_KANAL_ROOM_05_01");
};