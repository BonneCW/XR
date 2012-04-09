INSTANCE Mod_10014_ORC_Elite_MT (Mst_Default_OrcElite)			
{
	//----- Monster -----
	name							=	"Ork Elite";
	guild							=	GIL_ORC;
	id			= 	10014;
	voice							=	18;
	Npctype 	=		NPCTYPE_MAIN;

	fight_tactic	=	FAI_ORC;
	
	Mdl_SetVisual		(self,	"Orc.mds");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody	(self,	"Orc_BodyElite",	DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
	
	EquipItem	(self, ItMw_2H_OrcSword_02);

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	daily_routine	=	Rtn_Start_10014;
};

FUNC VOID Rtn_Start_10014()
{
	TA_Stand_WP_Orc		(04,00,22,00,"WP_ORKBEIAMULETT");
	TA_Stand_WP_Orc		(22,00,04,00,"WP_ORKBEIAMULETT");
};

FUNC VOID Rtn_Mud_10014()
{
	TA_Follow_Mud_Orc		(04,00,22,00,"OCR_HUT_13");
	TA_Follow_Mud_Orc		(22,00,04,00,"OCR_HUT_13");
};