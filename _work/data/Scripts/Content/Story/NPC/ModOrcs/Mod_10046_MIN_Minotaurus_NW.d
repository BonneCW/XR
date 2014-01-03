INSTANCE Mod_10046_MIN_Minotaurus_NW (Mst_Default_OrcElite)			
{
	//----- Monster -----
	name							=	"Minotaurus";
	guild							=	GIL_ORC;
	id			= 	10046;
	voice							=	18;
	Npctype 	=		NPCTYPE_MAIN;

	fight_tactic	=	FAI_ORC;
	
	Mdl_SetVisual		(self,	"Minotaurus.mds");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"MIN_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	
	EquipItem	(self, ItMw_2H_OrcSword_02);

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	daily_routine	=	Rtn_Start_10046;
};

FUNC VOID Rtn_Start_10046()
{
	TA_Stand_WP		(04,00,22,00,"NW_TROLLAREA_RIVERSIDE_0010");
	TA_Stand_WP		(22,00,04,00,"NW_TROLLAREA_RIVERSIDE_0010");
};