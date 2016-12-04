INSTANCE Mod_10051_ORC_Elite_MT (Mst_Default_OrcElite)			
{
	//----- Monster -----
	name							=	"Ork Elite";
	guild							=	GIL_ORC;
	id			= 	10051;
	voice							=	18;
	Npctype 	=		NPCTYPE_MAIN;

	fight_tactic	=	FAI_ORC;
	
	Mdl_SetVisual		(self,	"Orc.mds");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody	(self,	"Orc_BodyElite",	DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
	
	EquipItem	(self, ItMw_2H_OrcSword_02);

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	daily_routine	=	Rtn_Start_10051;
};

FUNC VOID Rtn_Start_10051()
{
	TA_Stand_WP_Orc		(16,00,18,00,"OW_ORC_PATH_06");
	TA_Stand_WP_Orc		(18,00,20,00,"OW_ORC_PATH_06_4");
	TA_Stand_WP_Orc		(20,00,22,00,"OW_ORC_ROUND_ARENA");
	TA_Stand_WP_Orc		(22,00,24,00,"OW_ORC_SHAMAN_PATH1");
	TA_Stand_WP_Orc		(00,00,02,00,"OW_ORC_ROUND_ARENA5");
	TA_Stand_WP_Orc		(02,00,04,00,"OW_PATH_06_13");
	TA_Stand_WP_Orc		(04,00,06,00,"OW_PATH_06_14_HEILIGTUM4");
	TA_Stand_WP_Orc		(06,00,08,00,"OW_PATH_06_13");
	TA_Stand_WP_Orc		(08,00,10,00,"OW_ORC_ROUND_ARENA5");
	TA_Stand_WP_Orc		(10,00,12,00,"OW_ORC_SHAMAN_PATH1");
	TA_Stand_WP_Orc		(12,00,14,00,"OW_ORC_ROUND_ARENA");
	TA_Stand_WP_Orc		(14,00,16,00,"OW_ORC_PATH_06_4");
};