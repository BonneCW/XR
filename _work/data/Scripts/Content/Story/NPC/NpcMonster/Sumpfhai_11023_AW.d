INSTANCE Sumpfhai_11023_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sumpfhai";
	guild 		= GIL_SWAMPSHARK;
	id 			= 11023;
	voice 		= 18;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);	

	attribute[ATR_HITPOINTS_MAX] = 15;	
	attribute[ATR_HITPOINTS] = 15;	

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];														
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_SWAMPSHARK;	
	
	// ------ Equippte Waffen ------																
	
	// ------ Inventory ------
	// Händler	

	// ------ visuals ------																			
	Mdl_SetVisual			(self,	"Swampshark.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Swa_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	
					
	Npc_SetToFistMode(self);

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] 	= FALSE;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11023;
};

FUNC VOID Rtn_Start_11023 ()
{	
	TA_Roam		(05,00,00,00,"BL_DOWN_04");
	TA_Roam		(00,00,05,00,"BL_DOWN_04");
};