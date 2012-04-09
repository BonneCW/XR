INSTANCE Mod_544_NONE_Wilfried_NW (Npc_Default)
{

	name 		= "Wilfried";
	guild 		= GIL_PAL;
	id 		= 544;
	voice 		= 8;
	flags           = 0;
	npctype		= NPCTYPE_MAIN;


	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride]         = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	        = TRUE;


	B_SetAttributesToChapter (self, 3);
	fight_tactic		= FAI_HUMAN_STRONG;
	EquipItem	(self, ItMw_Bastardschwert);

        CreateInvItems (self, ItMi_Gold, 50);
        CreateInvItems (self, ItKe_WilfriedsHoehle, 1);


	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", 181, BodyTex_P, ITAR_Vlk_M);
	Mdl_SetModelFatness	(self,1.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds");

	B_GiveNpcTalents (self);

	B_SetFightSkills (self, 25);

	daily_routine 		= Rtn_PreStart_544;
};

FUNC VOID Rtn_PreStart_544()
{
        TA_Sleep	(22,00,07,00,"NW_CITY_HABOUR_POOR_AREA_HUT_07_BED_01");
	TA_Sit_Chair	(07,00,22,00,"NW_CITY_HABOUR_POOR_AREA_HUT_07_BED_02");
};

FUNC VOID Rtn_Hoehle_544()
{
        TA_Sit_Campfire	(22,00,07,00,"NW_CITY_SMFOREST_BANDIT_04");
	TA_Sit_Campfire	(07,00,22,00,"NW_CITY_SMFOREST_BANDIT_04");
};