INSTANCE Mod_10022_ORC_Elite_MT (Mst_Default_OrcElite)			
{
	//----- Monster -----
	name							=	"Ork Elite";
	guild							=	GIL_FRIENDLY_ORC;
	id			= 	10022;
	voice							=	18;
	Npctype 	=		NPCTYPE_MAIN;

	fight_tactic	=	FAI_ORC;
	
	Mdl_SetVisual		(self,	"Orc.mds");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody	(self,	"Orc_BodyElite",	DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
	
	EquipItem	(self, ItMw_2H_OrcSword_02);

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	daily_routine	=	Rtn_Start_10022;
};

FUNC VOID Rtn_Start_10022()
{
	TA_Stand_WP_Orc		(04,00,22,00,"WP_MT_ORKS_OSCHUST_03");
	TA_Stand_WP_Orc		(22,00,04,00,"WP_MT_ORKS_OSCHUST_03");
};

FUNC VOID Rtn_Gefangen_10022()
{
	TA_RunToWP		(04,00,22,00,"OC1");
	TA_RunToWP		(22,00,04,00,"OC1");
};

FUNC VOID Rtn_Tot_10022()
{
	TA_Stand_WP_Orc		(04,00,22,00,"TOT");
	TA_Stand_WP_Orc		(22,00,04,00,"TOT");
};