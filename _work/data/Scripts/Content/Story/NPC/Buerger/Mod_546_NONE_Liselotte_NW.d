INSTANCE Mod_546_NONE_Liselotte_NW (Npc_Default)
{
	name 		= "Liselotte";
	guild 		= GIL_PAL;
	id 		= 546;
	voice 		= 16;
	flags           = 0;
	npctype		= NPCTYPE_MAIN;

	B_SetAttributesToChapter (self, 1);
	fight_tactic		= FAI_HUMAN_STRONG;

	EquipItem (self, ItMw_1H_quantarie_Schwert_01);

	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_Blondie, BodyTexBabe_N, ITAR_Buergerinkleid8);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds");

	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 40);

	daily_routine 		= Rtn_Start_546;
};

FUNC VOID Rtn_Start_546 ()
{
	TA_Stand_ArmsCrossed	(05,15,12,15,"NW_CITY_SARAH");
	TA_Stand_Eating         (12,15,12,25,"NW_CITY_SARAH");
	TA_Stand_Drinking       (12,25,12,30,"NW_CITY_SARAH");
	TA_PEE                  (12,30,13,05,"NW_CITY_MERCHANT_PATH_43");
	TA_Stand_ArmsCrossed     (13,05,20,15,"NW_CITY_SARAH");
        TA_Sleep		(20,15,05,15,"NW_CITY_HOTEL_BED_08");
};