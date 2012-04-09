INSTANCE Mod_10039_ORC_UndeadShamane_OT (Mst_Default_UndeadOrcWarrior)			
{
	//----- Monster -----
	name							=	"Untoter Orkshamane";
	guild							=	GIL_FRIENDLY_ORC;
	id			= 	10039;
	voice							=	18;
	Npctype 	=		NPCTYPE_MAIN;

	fight_tactic	=	FAI_ORC;
	
	Mdl_SetVisual			(self,	"Orc.mds");
	Mdl_SetVisualBody		(self,	"UOS_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Mdl_SetModelFatness		(self,0);
	
	EquipItem (self, ItMw_2H_OrcAxe_02);

	CreateInvItems	(self, ItMi_UrizielKaputt, 1);

	daily_routine	=	Rtn_Start_10039;
};

FUNC VOID Rtn_Start_10039()
{
	TA_Stand_WP_Orc		(04,00,22,00,"TPL_007");
	TA_Stand_WP_Orc		(22,00,04,00,"TPL_007");
};