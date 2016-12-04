INSTANCE Mod_10056_Orc_Warrior_MT(Mst_Default_OrcWarrior)			
{
	//----- Monster -----
	name							=	"Ork Krieger";
	guild							=	GIL_ORC;
	id			= 	10056;
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

	daily_routine	=	Rtn_Start_10056;
};

FUNC VOID Rtn_Start_10056()
{
	TA_Drum_Orc		(04,00,22,00,"OW_ORC_SHAMAN_ROOM2_2");
	TA_Sleep_Orc	(22,00,04,00,"OW_ORC_SHAMAN_ROOM2_2");
};