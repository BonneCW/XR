INSTANCE Mod_10016_MIN_Brad_MT (Mst_Default_OrcElite)			
{
	//----- Monster -----
	name							=	"Brad";
	guild							=	GIL_FRIENDLY_ORC;
	id			= 	10016;
	voice							=	18;
	Npctype 	=		NPCTYPE_MAIN;

	fight_tactic	=	FAI_ORC;
	
	Mdl_SetVisual		(self,	"Minotaurus.mds");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"MIN_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	
	EquipItem	(self, ItMw_2H_OrcSword_02);

	CreateInvItems	(self, ItMi_NicksKopf, 1);

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	daily_routine	=	Rtn_Start_10016;
};

FUNC VOID Rtn_Start_10016()
{
	TA_Stand_WP_Orc		(04,00,22,00,"PLATEAU_ROUND02_CAVE_MOVE");
	TA_Stand_WP_Orc		(22,00,04,00,"PLATEAU_ROUND02_CAVE_MOVE");
};