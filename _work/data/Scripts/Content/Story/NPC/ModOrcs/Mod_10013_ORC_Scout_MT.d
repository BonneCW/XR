INSTANCE Mod_10013_ORC_Scout_MT (Mst_Default_OrcWarrior)			
{
	//----- Monster -----
	name							=	"Ork Späher";
	guild							=	GIL_ORC;
	id			= 	10013;
	voice							=	18;
	level							=	20;
	Npctype 	=		NPCTYPE_MAIN;

	fight_tactic	=	FAI_ORC;
	
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyScout",	DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
	
	attribute[ATR_STRENGTH] = 150;	

	EquipItem	(self, ItMw_2H_OrcAxe_01);

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	daily_routine	=	Rtn_Start_10013;
};

FUNC VOID Rtn_Start_10013()
{
	TA_BodenSearch_Orc		(04,00,22,00,"WP_ORKBEIAMULETT");
	TA_BodenSearch_Orc		(22,00,04,00,"WP_ORKBEIAMULETT");
};

FUNC VOID Rtn_Mud_10013()
{
	TA_Follow_Mud_Orc		(04,00,22,00,"OCR_HUT_13");
	TA_Follow_Mud_Orc		(22,00,04,00,"OCR_HUT_13");
};