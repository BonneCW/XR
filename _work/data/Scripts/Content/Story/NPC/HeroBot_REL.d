instance HeroBot_REL (NPC_DEFAULT)
{
	// ------ SC ------
	name 		= "Helden-Bot";
	guild		= GIL_DMT;
	id			= 7239;
	voice		= 15;
	Npctype		= NPCTYPE_MAIN;
	flags		= 2;
	level		= 1000;
	
	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************
	
	// ------ XP Setup ------
	
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 200;
	attribute[ATR_DEXTERITY] 		= 200;
	attribute[ATR_HITPOINTS_MAX]	= 2000;
	attribute[ATR_HITPOINTS] 		= 2000;
	attribute[ATR_REGENERATEHP]	=	1;
	attribute[ATR_REGENERATEMANA]	=	1;
	
	// ------ visuals ------
	//B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Player, BodyTex_N, ITAR_MIL_M);
	
	Mdl_SetVisual (self,"HUMANS.MDS");
	// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
	Mdl_SetVisualBody (self, "hum_body_Naked0", 23,				0,			"Hum_Head_Pony", 	215,	0, 			ItAr_MIL_M);
	
	// ------ Kampf-Talente ------
	Npc_SetTalentSkill	(self, NPC_TALENT_MAGE, 			6);
	Npc_SetTalentSkill	(self, NPC_TALENT_PICKLOCK, 		1); //hängt ab von DEX (auf Programmebene)
	Npc_SetTalentSkill	(self, NPC_TALENT_SNEAK, 			1);
	Npc_SetTalentSkill	(self, NPC_TALENT_ACROBAT, 			0);

	fight_tactic = FAI_HUMAN_MASTER;

	B_SetFightSkills 	(self, 100);

	daily_routine = Rtn_Start_7239;
};

FUNC VOID Rtn_Start_7239()
{
	TA_Follow_Player	(08,00,20,00,"HEROBOT_START");
	TA_Follow_Player	(20,00,08,00,"HEROBOT_START");
};

FUNC VOID Rtn_Tot_7239()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"TOT");
	TA_Stand_ArmsCrossed	(20,00,08,00,"TOT");
};

FUNC VOID Rtn_Wait_7239()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"REL_CITY_002");
	TA_Stand_ArmsCrossed	(20,00,08,00,"REL_CITY_002");
};

FUNC VOID Rtn_Ofen_7239()
{
	TA_RunToWP	(08,00,20,00,"REL_CITY_338");
	TA_RunToWP	(20,00,08,00,"REL_CITY_338");
};