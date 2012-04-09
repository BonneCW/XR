INSTANCE Mod_10024_Orc_Warrior_MT(Mst_Default_OrcWarrior)			
{
	//----- Monster -----
	name							=	"Ork Krieger";
	guild							=	GIL_FRIENDLY_ORC;
	id			= 	10024;
	voice							=	18;
	level							=	30;
	Npctype 	=		NPCTYPE_MAIN;

	fight_tactic	=	FAI_ORC;
	
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyWarrior",	DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
	
	attribute[ATR_STRENGTH] = 150;	

	EquipItem	(self, ItMw_2H_OrcAxe_03);

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	daily_routine	=	Rtn_Start_10024;
};

FUNC VOID Rtn_Start_10024()
{
	TA_Stand_WP_Orc		(04,00,22,00,"WP_MT_ORKS_OSCHUST_01");
	TA_Stand_WP_Orc		(22,00,04,00,"WP_MT_ORKS_OSCHUST_01");
};

FUNC VOID Rtn_Gefangen_10024()
{
	TA_RunToWP		(04,00,22,00,"OC1");
	TA_RunToWP		(22,00,04,00,"OC1");
};

FUNC VOID Rtn_Tot_10024()
{
	TA_Stand_WP_Orc		(04,00,22,00,"TOT");
	TA_Stand_WP_Orc		(22,00,04,00,"TOT");
};