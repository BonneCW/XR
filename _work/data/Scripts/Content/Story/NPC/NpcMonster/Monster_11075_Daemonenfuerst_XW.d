INSTANCE Monster_11075_Daemonenfuerst_XW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dämonenfürst";	
	guild 		= GIL_DEMON;
	id 			= 11075;
	voice 		= 20;
	flags       = 2;																	
	npctype		= NPCTYPE_MAIN;
	level = 400;

	B_SetAivar(self, AIV_INVINCIBLE, TRUE);
	
	// ------ Attribute ------
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_STRENGTH] = 1000;		

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];															
		
	// ------ Kampf-Taktik ------	
	
	damagetype 		=	DAM_FIRE;

	// ------ Equippte Waffen ------																
	fight_tactic	=	FAI_DEMON;

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] 	= FALSE;

	Npc_SetToFistMode(self);
	
	// ------ Inventory ------
		
	// ------ visuals ------																			
	Mdl_SetVisual			(self,	"Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem2_Body",	1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------	

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11075;
};

FUNC VOID Rtn_Start_11075 ()
{	
	TA_Roam		(08,00,22,00,"ARENA_25");
	TA_Roam		(22,00,08,00,"ARENA_25");
};

FUNC VOID Rtn_Ansprache_11075 ()
{	
	TA_Smalltalk_Plaudern		(08,00,22,00,"ARENA_11");
	TA_Smalltalk_Plaudern		(22,00,08,00,"ARENA_11");
};