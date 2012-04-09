INSTANCE Monster_11028_Wesen_HALU (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wesen";
	guild 		= GIL_MOLERAT;
	id 			= 11028;
	voice 		= 18;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);														
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------	

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] 	= FALSE;

	Npc_SetToFistMode(self);															
	
	// ------ Inventory ------
	// Händler	

	// ------ visuals ------																			
	Mdl_SetVisual			(self,	"Molerat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mol_Body",		3,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	
					
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11028;
};

FUNC VOID Rtn_Start_11028 ()
{	
	TA_Roam		(05,00,00,00,"PSI_SWAMP_6");
	TA_Roam		(00,00,05,00,"PSI_SWAMP_6");
};