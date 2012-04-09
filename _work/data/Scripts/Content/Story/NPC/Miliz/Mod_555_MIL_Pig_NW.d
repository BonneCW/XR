instance Mod_555_MIL_Pig_NW (Npc_Default)
{
	name 		= "Pig";
	guild 		= GIL_PAL;
	id 		= 555;
	voice 	        = 12;
	flags           = 0;
	npctype		= NPCTYPE_MAIN;

	B_SetAttributesToChapter (self, 2);																	

	fight_tactic = FAI_HUMAN_STRONG;	
	aivar[AIV_ToughGuy]		= TRUE;
	EquipItem (self, ItMw_Milizschwert);

	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ItKe_City_Tower_02,1);

	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Orik, BodyTex_B, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	B_GiveNpcTalents (self);

	B_SetFightSkills (self, 40); 

	daily_routine 		= Rtn_Start_555;
};

FUNC VOID Rtn_Start_555()
{	
	TA_Stand_ArmsCrossed	        (08,00,12,30,"NW_CITY_KASERN_PLACE_01");
        TA_Stand_Eating                 (12,30,12,45,"NW_CITY_KASERN_PLACE_01");
        TA_Stand_Drinking               (12,45,13,00,"NW_CITY_KASERN_PLACE_01");
        TA_PEE                          (13,00,14,00,"NW_CITY_KASERN_PLACE_01");
        TA_Stand_Guarding               (14,00,22,00,"NW_CITY_KASERN_PLACE_01");
        TA_Sleep			(22,00,08,00,"NW_CITY_BARRACK02_BED_PECK");
};

FUNC VOID Rtn_Cord_555()
{	
	TA_Stand_Guarding	        (08,00,22,00,"NW_FARM3_PATH_07");
        TA_Stand_Guarding               (22,00,08,00,"NW_FARM3_PATH_07");
};