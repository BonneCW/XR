instance HeroBot_FI (NPC_DEFAULT)
{
	// ------ SC ------
	name 		= "Helden-Bot";
	guild		= GIL_DMT;
	id			= 7233;
	voice		= 33;
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
	//B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Player, BodyTex_N, NO_ARMOR);
	
	Mdl_SetVisual (self,"HUMANS.MDS");
	// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
	Mdl_SetVisualBody (self, "hum_body_Naked0", 23,				0,			"Hum_Head_Pony", 	215,	0, 			NO_ARMOR);
	
	// ------ Kampf-Talente ------
	Npc_SetTalentSkill	(self, NPC_TALENT_MAGE, 			6);
	Npc_SetTalentSkill	(self, NPC_TALENT_PICKLOCK, 		1); //hängt ab von DEX (auf Programmebene)
	Npc_SetTalentSkill	(self, NPC_TALENT_SNEAK, 			1);
	Npc_SetTalentSkill	(self, NPC_TALENT_ACROBAT, 			0);

	fight_tactic = FAI_HUMAN_MASTER;

	B_SetFightSkills 	(self, 100);

	CreateInvItems	(self, ItAt_SoulStone, 1);

	EquipItem	(self, ItMw_Adanos_Stab_Kampfteil);

	daily_routine = Rtn_Start_7233;
};

FUNC VOID Rtn_Start_7233()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"FI_83");
	TA_Stand_ArmsCrossed	(20,00,08,00,"FI_83");
};

FUNC VOID Rtn_Abschied_7233()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"FI_84");
	TA_Stand_ArmsCrossed	(20,00,08,00,"FI_84");
};