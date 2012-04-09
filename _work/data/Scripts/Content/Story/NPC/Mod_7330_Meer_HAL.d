instance Mod_7330_Meer_HAL (NPC_DEFAULT)
{
	// ------ SC ------
	name 		= "Meer";
	guild		= GIL_NONE;
	id			= 7330;
	level		= 0;
	voice	= 18;
	Npctype		= NPCTYPE_MAIN;
	flags = 2|NPC_FLAG_GHOST;
	
	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************
	
	// ------ XP Setup ------
	exp				= 0;
	exp_next		= 500;
	lp				= 0;
	
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 10;
	attribute[ATR_DEXTERITY] 		= 10;
	attribute[ATR_MANA_MAX] 		= 10;
	attribute[ATR_MANA] 			= 10;
	attribute[ATR_HITPOINTS_MAX]	= 40;
	attribute[ATR_HITPOINTS] 		= 40;
	attribute[ATR_REGENERATEHP]	=	20;
	attribute[ATR_REGENERATEMANA]	=	20;
	Npc_SetTalentSkill (hero, NPC_TALENT_ERZHACKEN,1);
	
	// ------ visuals ------
	//B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Player, BodyTex_N, NO_ARMOR);
	
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton_fly.mds");

	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Fly_Body",	1,			DEFAULT,	"",			1,  		DEFAULT,	-1);
	
	// ------ Kampf-Talente ------
	B_SetFightSkills 	(self, 10);

	daily_routine = Rtn_Start_7330; 
};

FUNC VOID Rtn_Start_7330 ()
{	
	TA_Stand_WP (08,00,23,00,"HALU_03");
    TA_Stand_WP (23,00,08,00,"HALU_03");
};