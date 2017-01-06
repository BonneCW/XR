INSTANCE Swampshark_Weiss (Npc_Default)
{
	// ------ NSC ------
	name 		= "Weiﬂer Sumpfhai";
	guild 		= GIL_SWAMPSHARK;
	id 			= 11024;
	voice 		= 18;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);														
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_SWAMPSHARK;	
	
	// ------ Equippte Waffen ------																
	
	// ------ Inventory ------
	// H‰ndler	

	// ------ visuals ------																			
	Mdl_SetVisual			(self,	"Swampshark.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Swa_Body",		6,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	
		

	Npc_SetToFistMode(self);

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	0;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] 	= FALSE;			
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11024;
};

FUNC VOID Rtn_Start_11024 ()
{	
	TA_Roam		(05,00,00,00,"ADW_SHARK_09");
	TA_Roam		(00,00,05,00,"ADW_SHARK_09");
};

FUNC VOID Rtn_Tot_11024 ()
{	
	TA_Roam		(05,00,00,00,"TOT");
	TA_Roam		(00,00,05,00,"TOT");
};