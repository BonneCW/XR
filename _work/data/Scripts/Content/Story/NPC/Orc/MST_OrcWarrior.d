//*****************************
//	Orc WARRIOR Prototype		
//*****************************

PROTOTYPE Mst_Default_OrcWarrior(C_Npc)			
{
	//----- Monster -----
	name							=	"Ork Krieger";
	guild							=	GIL_ORC;
	aivar[AIV_MM_REAL_ID]			= 	ID_ORCWARRIOR;
	voice							=	18;
	level							=	30;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	100; //+ca. 50-80 Waffe //MIN 100 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	150000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	20;
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 60;
	HitChance	[NPC_TALENT_2H]			= 60;
	HitChance	[NPC_TALENT_BOW]		= 60;
	HitChance	[NPC_TALENT_CROSSBOW]	= 60;
	
	//----- Damage Types ----	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	fight_tactic	=	FAI_ORC;

	//----- Senses & Ranges ----
	senses			= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	= PERC_DIST_ORC_ACTIVE_MAX;

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

PROTOTYPE Mst_Default_OrcScout(C_Npc)			
{
	//----- Monster -----
	name							=	"Ork Späher";
	guild							=	GIL_ORC;
	aivar[AIV_MM_REAL_ID]			= 	ID_ORCWARRIOR;
	voice							=	18;
	level							=	30;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //+ca. 50-80 Waffe //MIN 100 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	80000;
	protection	[PROT_EDGE]			=	80000;
	protection	[PROT_POINT]		=	80000;
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	20;
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 40;
	HitChance	[NPC_TALENT_2H]			= 40;
	HitChance	[NPC_TALENT_BOW]		= 40;
	HitChance	[NPC_TALENT_CROSSBOW]	= 40;
	
	//----- Damage Types ----	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	fight_tactic	=	FAI_ORC;

	//----- Senses & Ranges ----
	senses			= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	= PERC_DIST_ORC_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};


//**************
//	Visuals
//**************

func void B_SetVisuals_OrcWarrior()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyWarrior",	DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_OrcScout()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyScout",	DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_WaterOrc()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Waterork_Body",	DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	1,  	DEFAULT,	-1);
};

func void B_SetVisuals_OrcWeib()
{
	Mdl_SetVisual			(self,	"Orcfemale.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"orcfemale_Body_M04",	DEFAULT,	DEFAULT,	"",	0,  	DEFAULT,	-1);
};

func void B_SetVisuals_OrcWeib2()
{
	Mdl_SetVisual			(self,	"Orcfemale.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"orcfemale_armor_shaman",	DEFAULT,	DEFAULT,	"",	0,  	DEFAULT,	-1);
};

func void B_SetVisuals_OrcWeib3()
{
	Mdl_SetVisual			(self,	"Orcfemale.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"orcfemale_armor_Warrior",	DEFAULT,	DEFAULT,	"",	0,  	DEFAULT,	-1);
};

//******************
//	Orc Warrior Roam    														
//******************

INSTANCE OrcWarrior_Almanach (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	CreateInvItems	(self, ItWr_XardasAlmanach, 1);

	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcWarrior_Roam (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcWeib_Roam (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWeib();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcWeib2_Roam (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWeib2();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcWeib3_Roam (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWeib3();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcWarrior_Oschust_01 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcWarrior_CB (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	aivar[AIV_MM_REAL_ID]			= 	ID_ORCWARRIORCROSSBOW;

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	EquipItem (self, ItRw_Crossbow_Orc);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcFighter_Roam (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_Schmetteraxt);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcPeasantEatAndDrink (Mst_Default_OrcWarrior)
{
	//-------- general data --------
	guild			=	GIL_ORC;
	name			=	"Ork";

	level = 15;

	//-------- visuals --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------	

	//-------- ai --------
	start_aistate	= ZS_Orc_Eat;

	B_SetSchwierigkeit();

};

INSTANCE WaterOrc (Mst_Default_OrcWarrior)
{
	name	= "Wasserork";

	//-------- visual --------
	B_SetVisuals_WaterOrc();
	level							=	300;

	attribute	[ATR_STRENGTH]		=	300;
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;

	//----- Protections ----	
	protection	[PROT_BLUNT]		=	180000;
	protection	[PROT_EDGE]			=	180000;
	protection	[PROT_POINT]		=	180000;	
	protection	[PROT_FIRE]			=	90;
	protection	[PROT_FLY]			=	30;	
	protection	[PROT_MAGIC]		=	90;

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();

	CreateInvItems	(self, ItAt_WaterorcFur, 1);
};
//******************
//	Orc Warrior Rest    														
//******************

INSTANCE OrcWarrior_Rest (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcHunter_Rest (Mst_Default_OrcWarrior)
{
	name = "Ork Jäger";

	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};
//******************
//	Orc Warrior Sit    														
//******************

INSTANCE OrcWarrior_Sit (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};



//******************************************************************************************************************************************************************************************************
//	Story Orks   														
//******************************************************************************************************************************************************************************************************

// ------ Ork vor Stadt ------
INSTANCE OrcWarrior_Harad (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcScout();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

// ------ Ork auf Schiff ------
INSTANCE SchiffOrk (Mst_Default_OrcWarrior)
{
	name							=	"Ork Krieger";
	
	level							=	10;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	100; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	protection	[PROT_MAGIC]			=	50;
	
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcScout (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcScout();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcScout_Oschust_01 (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcScout();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcScout_Oschust_02 (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcScout();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcScout_Garond_01 (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcScout();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcScout_Garond_02 (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcScout();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcScout_Garond_03 (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcScout();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcScout_Garond_04 (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcScout();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcScout_Garond_05 (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcScout();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcScout_Garond_06 (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcScout();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcScout_Garond_07 (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcScout();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcScout_Garond_08 (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcScout();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcScout_Garond_09 (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcScout();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcScout_Garond_10 (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcScout();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcScout_Garond_11 (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcScout();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};
// ----- Lobarts Orks ------
INSTANCE OrcWarrior_Lobart1 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcWarrior_Lobart2 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcWarrior_Lobart3 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcWarrior_Lobart4 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcWarrior_Lobart5 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcWarrior_Lobart6 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrkTransform (Mst_Default_OrcWarrior)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	level = 0;

	attribute	[ATR_STRENGTH]		=	100; //+ca. 50-80 Waffe //MIN 100 wg Equip!!!
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	150000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	150000;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	20;
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 10;
	HitChance	[NPC_TALENT_2H]			= 10;
	
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);

	B_SetSchwierigkeit();
};

INSTANCE OrcWarrior_Banditenangriff (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	attribute	[ATR_STRENGTH]		=	100; //+ca. 50-80 Waffe //MIN 100 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	75000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	protection	[PROT_MAGIC]		=	10;

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};

INSTANCE OrcScout_Banditenangriff (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	100;
	attribute	[ATR_HITPOINTS]		=	100;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	45000;
	protection	[PROT_EDGE]			=	45000;
	protection	[PROT_POINT]		=	45000;
	protection	[PROT_FIRE]			=	45;
	protection	[PROT_FLY]			=	45;
	
	//-------- visual --------
	B_SetVisuals_OrcScout();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	B_SetSchwierigkeit();
};