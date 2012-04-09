INSTANCE Mod_10032_ORC_UndeadShamane_MT (Mst_Default_UndeadOrcWarrior)			
{
	//----- Monster -----
	name							=	"Untoter Orkshamane";
	guild							=	GIL_FRIENDLY_ORC;
	id			= 	10032;
	voice							=	18;
	Npctype 	=		NPCTYPE_MAIN;

	fight_tactic	=	FAI_ORC;
	
	Mdl_SetVisual			(self,	"Orc.mds");
	Mdl_SetVisualBody		(self,	"UOS_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Mdl_SetModelFatness		(self,0);
	
	EquipItem (self, ItMw_2H_OrcAxe_02);

	daily_routine	=	Rtn_Start_10032;
};

FUNC VOID Rtn_Start_10032()
{
	TA_Stand_WP_Orc		(04,00,22,00,"WP_UNDEADSHAMANE_WAITFORPLAYER");
	TA_Stand_WP_Orc		(22,00,04,00,"WP_UNDEADSHAMANE_WAITFORPLAYER");
};

FUNC VOID Rtn_Tot_10032()
{
	TA_Stand_WP_Orc		(04,00,22,00,"TOT");
	TA_Stand_WP_Orc		(22,00,04,00,"TOT");
};