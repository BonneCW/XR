INSTANCE Mod_10033_ORC_UndeadShamane_OGY (Mst_Default_UndeadOrcWarrior)			
{
	//----- Monster -----
	name							=	"Untoter Orkshamane";
	guild							=	GIL_ORC;
	id			= 	10033;
	voice							=	18;
	Npctype 	=		NPCTYPE_MAIN;
	level = 200;
	flags = 2;

	fight_tactic	=	FAI_ORC;
	
	Mdl_SetVisual			(self,	"Orc.mds");
	Mdl_SetVisualBody		(self,	"UOS_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Mdl_SetModelFatness		(self,0);

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	
	EquipItem (self, ItMw_2H_OrcAxe_02);

	CreateInvItems	(self, ItWr_Chromanin3, 1);
	CreateInvItems	(self, ItWr_Siegelbuch, 1);

	daily_routine	=	Rtn_Start_10033;
};

FUNC VOID Rtn_Start_10033()
{
	TA_Stand_WP_Orc		(04,00,22,00,"GRYD_020");
	TA_Stand_WP_Orc		(22,00,04,00,"GRYD_020");
};

FUNC VOID Rtn_Second_10033()
{
	TA_Stand_WP_Orc		(04,00,22,00,"GRYD_048");
	TA_Stand_WP_Orc		(22,00,04,00,"GRYD_048");
};

FUNC VOID Rtn_Last_10033()
{
	TA_Stand_WP_Orc		(04,00,22,00,"GRYD_087");
	TA_Stand_WP_Orc		(22,00,04,00,"GRYD_087");
};