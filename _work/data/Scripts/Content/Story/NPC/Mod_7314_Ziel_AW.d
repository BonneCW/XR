instance Mod_7314_Ziel_AW (NPC_DEFAULT)
{
	// ------ SC ------
	name 		= "Plattform";
	guild		= GIL_NONE;
	id			= 7314;
	voice = 1;
	level		= 0;
	Npctype		= NPCTYPE_MAIN;
	flags = 2;
	
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
	
	Mdl_SetVisual (self,"ZIEL.MDS");
	// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
	Mdl_SetVisualBody (self, "ziel_body", 0,				0,			"", 	0,	0, 			NO_ARMOR);

	
	// ------ Kampf-Talente ------
	B_SetFightSkills 	(self, 10);

	daily_routine = Rtn_Start_7314; 
};

FUNC VOID Rtn_Start_7314 ()
{	
	TA_Stand_WP (08,00,23,00,"BL_RAVEN_01");
    TA_Stand_WP (23,00,08,00,"BL_RAVEN_01");
};

FUNC VOID Rtn_Tot_7314 ()
{	
	TA_Stand_WP (08,00,23,00,"TOT");
    TA_Stand_WP (23,00,08,00,"TOT");
};