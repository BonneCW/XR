instance PC_Hero (NPC_DEFAULT)
{
	// ------ SC ------
	name 		= "Ich";
	guild		= GIL_NONE;
	id			= 0;
	voice		= 15;
	level		= 0;
	Npctype		= NPCTYPE_MAIN;

	
	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************
	
	// ------ XP Setup ------
	exp				= 0;
	exp_next		= 500;
	lp				= 0;

	//fight_tactic	=	FAI_HUMAN_MAGE;

	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 200;
	attribute[ATR_DEXTERITY] 		= 0;
	attribute[ATR_MANA_MAX] 		= 10;
	attribute[ATR_MANA] 			= 10;
	attribute[ATR_HITPOINTS_MAX]	= 1000;
	attribute[ATR_HITPOINTS] 		= 1000;
	Npc_SetTalentSkill (self, NPC_TALENT_ERZHACKEN, 0);
	Npc_SetTalentSkill (self, NPC_TALENT_HANDELN, 1);

	self.aivar[AIV_Damage] = 1000;

	/*CreateInvItems	(self, ItRw_Bow_L_01, 1);
	CreateInvItems	(self, ItRw_Arrow, 500);
	CreateInvItems	(self, ItRw_SchmetterArrow, 500);
	CreateInvItems	(self, ItRw_SprengstoffArrow, 500);
	CreateInvItems	(self, ItRw_IceArrow, 10);
	CreateInvItems	(self, ItSc_SumSkel, 10);*/

	//CreateInvItems	(self, ItKe_Lockpick, 1000);
	//CreateInvItems	(self, ItSc_Firebolt, 1000);

	// ------ visuals ------
	//B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", FACE_N_Player, BodyTex_N, NO_ARMOR);
	
	Mdl_SetVisual (self,"HUMANS.MDS");
	// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
	Mdl_SetVisualBody (self, "hum_body_naked0", 14,				0,			"Hum_Head_Fighter", 	224,	1, 			Erzrüstung);

	// ------ Kampf-Talente ------
	B_SetFightSkills 	(self, 10); 

	self.senses			=	SENSE_HEAR | SENSE_SEE;
	self.senses_range	=	PERC_DIST_ACTIVE_MAX;

	Npc_SetPercTime		(self, 1);

	Npc_PercEnable  	(self, PERC_ASSESSDAMAGE, B_AssessDamage_Hero);
};

instance Cheater (NPC_DEFAULT)
{
	// ------ SC ------
	name 		= "Cheatmeister";
	guild		= GIL_NONE;
	id			= 20000;
	voice		= 15;
	level		= 0;
	Npctype		= NPCTYPE_MAIN;
	
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
	
	Mdl_SetVisual (self,"HUMANS.MDS");
	// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
	Mdl_SetVisualBody (self, "hum_body_Naked0", 1,				0,			"Hum_Head_Pony", 	176,	0, 			NO_ARMOR);
	
	// ------ Kampf-Talente ------
	B_SetFightSkills 	(self, 10);

	daily_routine = Rtn_Start_20000; 
};

FUNC VOID Rtn_Start_20000 ()
{	
	TA_Stand_ArmsCrossed(08,00,23,00,"XXX");
    TA_Stand_ArmsCrossed(23,00,08,00,"XXX");
};

instance Fake_Hero (NPC_DEFAULT)
{
	// ------ SC ------
	name 		= "Ich";
	guild		= GIL_DMT;
	id			= 5000;
	voice		= 15;
	Npctype		= NPCTYPE_MAIN;
	level		= 100;
	
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
	//B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Player, BodyTex_N, NO_ARMOR);
	
	Mdl_SetVisual (self,"HUMANS.MDS");
	// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
	Mdl_SetVisualBody (self, "hum_body_Naked0", 1,				0,			"Hum_Head_Pony", 	FACE_N_Player,	0, 			ITAR_PAL_SKEL);
	
	// ------ Kampf-Talente ------
	Npc_SetTalentSkill	(self, NPC_TALENT_MAGE, 			6);
	Npc_SetTalentSkill	(self, NPC_TALENT_PICKLOCK, 		1); //hängt ab von DEX (auf Programmebene)
	Npc_SetTalentSkill	(self, NPC_TALENT_SNEAK, 			1);
	Npc_SetTalentSkill	(self, NPC_TALENT_ACROBAT, 			0);

	fight_tactic = FAI_HUMAN_MASTER;

	B_SetFightSkills 	(self, 100);

	CreateInvItems	(self, ItAt_SoulStone_Formwandler, 1);

	//EquipItem	(self, ItMw_Adanos_Stab_Kampfteil);

	daily_routine = Rtn_Start_5000;
};

FUNC VOID Rtn_Start_5000()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_VALLEY_PATH_135");
	TA_Stand_ArmsCrossed	(20,00,08,00,"ADW_VALLEY_PATH_135");
};