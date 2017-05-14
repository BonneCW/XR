instance PC_Seele (NPC_DEFAULT)
{
	// ------ SC ------
	name 		= "Seele";
	guild		= GIL_NONE;
	id			= 4023;
	voice		= 0;
	level		= 1;
	flags       = NPC_FLAG_GHOST;	
	Npctype		= NPCTYPE_MAIN;
	effect ="SPELLFX_MAGESTAFF2";
	
	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************
	
	// ------ XP Setup ------
	exp				= 0;
	exp_next		= 500;
	lp				= 0;
	fight_tactic		= FAI_HUMAN_STRONG;	
	// ------ Attribute ------
	attribute[ATR_REGENERATEHP] 		= 30;
	attribute[ATR_REGENERATEMANA] 		= 30;
	attribute[ATR_STRENGTH] 		= 1;
	attribute[ATR_DEXTERITY] 		= 1;
	attribute[ATR_MANA_MAX] 		= 300;
	attribute[ATR_MANA] 			= 300;
	attribute[ATR_HITPOINTS_MAX]	= 1000;
	attribute[ATR_HITPOINTS] 		= 1000;
	
	CreateInvItems (self, ItRu_Concussionbolt, 1);
		
	// ------ visuals ------
	//B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Player, BodyTex_N, NO_ARMOR);
	
	Mdl_SetVisual (self,"HUMANS.MDS");
	// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
	Mdl_SetVisualBody (self, "hum_body_Naked0", 9,				0,			"Hum_Head_Pony", 	FACE_N_Player,	0, 			ITAR_KDW_H);
	
	// ------ Kampf-Talente ------
	B_SetFightSkills 	(self, 5); 

	//daily_routine 		= Rtn_Start_37335;

	start_aistate				=	ZS_soul;
};

FUNC VOID Rtn_Start_37335 ()
{
	TA_soul			(08,00,20,00,"");
	TA_soul			(20,00,08,00,"");		
};