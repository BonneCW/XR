//*********************
//	Zombie Prototype	
//*********************

PROTOTYPE Mst_Default_Zombie(C_Npc)			
{
	//----- Monster ----
	name							=	"Zombie";
	guild							=	GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID]			= 	ID_ZOMBIE;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	130;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	50000;
	protection	[PROT_EDGE]			=	50000;
	protection	[PROT_POINT]		=	50000;	
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	50;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	//----- Damage Type ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_ZOMBIE;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	CreateInvItems	(self, ItFoMuttonZombie, 1);

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//*************
//	Visuals
//*************

//-------------------------------------------------------------
// Zwei Hautfarben mit jeweils zwei Gesichtstexturen
//-------------------------------------------------------------
func void B_SetVisuals_Zombie01()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		DEFAULT,	-1);
};
func void B_SetVisuals_ZombieAkil()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 2,  		DEFAULT,	-1);
};
func void B_SetVisuals_ZombieRandolph()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 3,  		DEFAULT,	-1);
};
func void B_SetVisuals_ZombieEhnim()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 4,  		DEFAULT,	-1);
};
//-------------------------------------------------------------
func void B_SetVisuals_Zombie02()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 1,  		DEFAULT,	-1);
};
//-------------------------------------------------------------
func void B_SetVisuals_Zombie03()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 0,  		DEFAULT,	-1);
};
//-------------------------------------------------------------
func void B_SetVisuals_ZombieRitter()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 0,  		DEFAULT,	ItAr_Pal_Zombie);
};
//-------------------------------------------------------------
func void B_SetVisuals_Zombie04()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		DEFAULT,	-1);
};
//-------------------------------------------------------------
func void B_SetVisuals_ZombieOrchunter01()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		DEFAULT,	ITAR_Zombie_Orkjaeger);
};
//-------------------------------------------------------------
func void B_SetVisuals_ZombieOrchunter02()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 1,  		DEFAULT,	ITAR_Zombie_Orkjaeger);
};
//-------------------------------------------------------------
func void B_SetVisuals_ZombieOrchunter03()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 0,  		DEFAULT,	ITAR_Zombie_Orkjaeger);
};
//-------------------------------------------------------------
func void B_SetVisuals_ZombieOrchunter04()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		DEFAULT,	ITAR_Zombie_Orkjaeger);
};
//-------------------------------------------------------------
func void B_SetVisuals_ZombieTempler01()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		DEFAULT,	ITAR_Zombie_Templer);
};
//-------------------------------------------------------------
func void B_SetVisuals_ZombieTempler02()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 1,  		DEFAULT,	ITAR_Zombie_Templer);
};
//-------------------------------------------------------------
func void B_SetVisuals_ZombieTempler03()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 0,  		DEFAULT,	ITAR_Zombie_Templer);
};
//-------------------------------------------------------------
func void B_SetVisuals_ZombieTempler04()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		DEFAULT,	ITAR_Zombie_Templer);
};
//-------------------------------------------------------------
func void B_SetVisuals_ZombieWoman01()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"ZomWoman_Body",		0,			0,			"ZomWoman_Head", 0,  		DEFAULT,	-1);
};
//-------------------------------------------------------------
func void B_SetVisuals_ZombieWoman02()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"ZomWoman_Body",		1,			0,			"ZomWoman_Head", 1,  		DEFAULT,	-1);
};

//-------------------------------------------------------------
func void B_SetVisuals_ZombieKati()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"ZomWoman_Body",		0,			0,			"ZomWoman_Head", 0,  		DEFAULT,	-1);
};


//-------------------------------------------------------------
func void B_SetVisuals_Zombie_Pirat()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		DEFAULT,	ITAR_Pir_Zombie);
};

//-------------------------------------------------------------
func void B_SetVisuals_Schneegeist()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		DEFAULT,	ITAR_Pir_Zombie);
};

FUNC VOID B_SetVisual_Zom()
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		self.name = "Zombie - Frau";
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		self.name = "Zombie - Frau";
		B_SetVisuals_ZombieWoman02();
	};
};

//***********
//	Zombie01   
//***********

INSTANCE Zombie_Tonak		(Mst_Default_Zombie)
{
	name = "Tonak";

	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Akil		(Mst_Default_Zombie)
{
	name = "Akil";

	B_SetVisuals_ZombieAkil();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Randolph		(Mst_Default_Zombie)
{
	name = "Randolph";

	B_SetVisuals_ZombieRandolph();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Kati		(Mst_Default_Zombie)
{
	name = "Kati";

	B_SetVisuals_ZombieKati();
	Npc_SetToFistMode(self);
};

INSTANCE ZombieRandom		(Mst_Default_Zombie)
{
	B_SetVisual_Zom();
	Npc_SetToFistMode(self);
};

INSTANCE ZombieRandom_Weg		(Mst_Default_Zombie)
{
	B_SetVisual_Zom();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Castlemine		(Mst_Default_Zombie)
{
	B_SetVisual_Zom();
	Npc_SetToFistMode(self);
};

INSTANCE ZombieRandom_Lib		(Mst_Default_Zombie)
{
	B_SetVisual_Zom();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Griselda_01		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		name = "Zombie - Frau";
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		name = "Zombie - Frau";
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Griselda_02		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		name = "Zombie - Frau";
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		name = "Zombie - Frau";
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Griselda_03		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		name = "Zombie - Frau";
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		name = "Zombie - Frau";
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Argez		(Mst_Default_Zombie)
{
	attribute	[ATR_HITPOINTS_MAX]	=	4000;
	attribute	[ATR_HITPOINTS]		=	4000;

	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Woman01		(Mst_Default_Zombie)
{
	name = "Zombie - Frau";

	B_SetVisuals_ZombieWoman01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Woman02		(Mst_Default_Zombie)
{
	name = "Zombie - Frau";

	B_SetVisuals_ZombieWoman02();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_AtSekobsHof_01		(Mst_Default_Zombie)
{
	B_SetVisuals_ZombieWoman01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_AtSekobsHof_02		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie02();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Ehnim		(Mst_Default_Zombie)
{
	name = "Ehnim";

	B_SetVisuals_ZombieEhnim();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Rupert		(Mst_Default_Zombie)
{
	name = "Rupert";

	B_SetVisuals_ZombieEhnim();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_SP_01		(Mst_Default_Zombie)
{
	name	= "ausgezehrter Seelenloser";

	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItWr_Daemonisch, 1);
	CreateInvItems	(self, ItWr_Daemonisch_SP_01, 1);
};

INSTANCE Zombie_SP_02		(Mst_Default_Zombie)
{
	name	= "ausgezehrter Seelenloser";

	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItWr_Daemonisch, 1);
	CreateInvItems	(self, ItWr_Daemonisch_SP_02, 1);
};

INSTANCE Zombie_SP_03		(Mst_Default_Zombie)
{
	name	= "ausgezehrter Seelenloser";

	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItWr_Daemonisch, 1);
	CreateInvItems	(self, ItWr_Daemonisch_SP_03, 1);
};

INSTANCE Zombie01		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Wasserleiche_Botschek_01		(Mst_Default_Zombie)
{
	name		=	"Wasserleiche";

	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		DEFAULT,	ITAR_Schaf);

	Npc_SetToFistMode(self);
};

INSTANCE Wasserleiche_Botschek_02		(Mst_Default_Zombie)
{
	name		=	"Wasserleiche";

	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		DEFAULT,	NO_ARMOR);

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Pirat		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie_Pirat();
	Npc_SetToFistMode(self);
};

INSTANCE Mod_1552_SKE_Skelett_DI		(Mst_Default_Zombie)
{
	start_aistate				= ZS_Stand_Zombie;

	flags = 2;

	CreateInvItems	(self, ItWr_BookFromSkeleton, 1);

	B_SetVisuals_Zombie_Pirat();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Paladin_01		(Mst_Default_Zombie)
{
	B_SetVisuals_ZombieRitter();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItRu_PalLight, 1);
};

INSTANCE Zombie_Paladin_02		(Mst_Default_Zombie)
{
	B_SetVisuals_ZombieRitter();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItSc_PalHolyBolt, 1);
};

INSTANCE Schneegeist		(Mst_Default_Zombie)
{
	name		= "Schneegeist";

	flags = NPC_FLAG_GHOST;

	B_SetVisuals_Schneegeist();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Eis_Schneegeister		(Mst_Default_Zombie)
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		DEFAULT,	ItAr_Xardas);

	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItMw_1h_Vlk_Dagger, 1);
	CreateInvItems	(self, ItPo_HexenBlood, 1);
	CreateInvItems	(self, ItMi_Zeitspalt_Addon, 1);
	CreateInvItems	(self, ItWr_Schneegeister, 1);
};
//************
//	Zombie02  
//************

INSTANCE Zombie02	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie02();
	Npc_SetToFistMode(self);
};


//*************
//	Zombie03   
//*************

INSTANCE Zombie03	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie03();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_01_01		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_01_02		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_01_03		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_01_04		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_01_05		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_01_06		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_01_07		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_01_08		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_01_09		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_01_10		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_01_11		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_01_12		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_02_01		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_02_02		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_02_03		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_02_04		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_02_05		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_02_06		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_02_07		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_02_08		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_02_09		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_02_10		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_02_11		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};

INSTANCE Zombie_DienerDesBoesen_02_12		(Mst_Default_Zombie)
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};

	Npc_SetToFistMode(self);
};


//*************
//	Zombie04   	
//*************

INSTANCE Zombie04	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie04();
	Npc_SetToFistMode(self);
};

//********************************
//	Bloodwyn Zombie 	
//********************************
INSTANCE Zombie_Addon_Knecht	(Mst_Default_Zombie)
{
	
	name 			= "Ravens Knecht";
	
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		DEFAULT,	ITAR_Thorus_Addon);
	
	Npc_SetToFistMode(self);
};
//********************************
//	Bloodwyn Zombie 	
//********************************
INSTANCE Zombie_Addon_Bloodwyn	(Mst_Default_Zombie)
{
	
	name = "Erweckter Bloodwyn";
	level							=	25;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1600;
	attribute	[ATR_HITPOINTS]		=	1600;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
	
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		DEFAULT,	ITAR_Thorus_Addon);
	
	Npc_SetToFistMode(self);
};

//********************************
//	Paladin Zombies
//********************************
func void ZS_Pal_ZOMBIE ()
{
	self.senses			=	SENSE_SMELL ;
	self.senses_range	=	2000;	
	Npc_SetPercTime		(self, 1);	
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER	, 	B_Pal_ZOMBIE_RISE	); 

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};
		
func int ZS_Pal_ZOMBIE_Loop ()	
{
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
  	{
  		AI_PlayAni (self,"T_DOWN");
  		self.aivar[AIV_TAPOSITION] = ISINPOS;
  	};
	return LOOP_CONTINUE;
};

func void ZS_Pal_ZOMBIE_END()
{
	
};

func void B_Pal_ZOMBIE_RISE ()
{
	if (Npc_GetDistToNpc (self,hero) <= 1400)
	{
		AI_PlayAni (self,"T_RISE");
		
		
		AI_StartState 		(self, ZS_MM_Attack, 0, "");
		self.bodyStateInterruptableOverride 	= FALSE;
		self.start_aistate				= ZS_MM_AllScheduler;
		self.aivar[AIV_MM_RestStart] 	= OnlyRoutine;
	};
		
};



func void B_SetVisuals_Pal_Zombie01()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		DEFAULT,	ITAR_PAL_SKEL);
};

//-------------------------------------------------------------
func void B_SetVisuals_Pal_Zombie02()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 1,  		DEFAULT,	ITAR_PAL_SKEL);
};
//-------------------------------------------------------------
func void B_SetVisuals_Pal_Zombie03()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 0,  		DEFAULT,	ITAR_PAL_SKEL);
};
//-------------------------------------------------------------
func void B_SetVisuals_Pal_Zombie04()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		DEFAULT,	ITAR_PAL_SKEL);
};


INSTANCE Pal_Zombie01		(Mst_Default_Zombie)
{
	B_SetVisuals_Pal_Zombie01();
	Npc_SetToFistMode(self);
	
	start_aistate				= ZS_Pal_ZOMBIE;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE Pal_Zombie02		(Mst_Default_Zombie)
{
	B_SetVisuals_Pal_Zombie02();
	Npc_SetToFistMode(self);
	
	start_aistate				= ZS_Pal_ZOMBIE;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE Pal_Zombie03		(Mst_Default_Zombie)
{
	B_SetVisuals_Pal_Zombie03();
	Npc_SetToFistMode(self);
	
	start_aistate				= ZS_Pal_ZOMBIE;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE Pal_Zombie04		(Mst_Default_Zombie)
{
	B_SetVisuals_Pal_Zombie04();
	Npc_SetToFistMode(self);
	
	start_aistate				= ZS_Pal_ZOMBIE;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//MayaZobies
func void B_SetVisuals_Maya_Zombie01()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		DEFAULT,	ITAR_MayaZombie_Addon);
};

//-------------------------------------------------------------
func void B_SetVisuals_Maya_Zombie02()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 1,  		DEFAULT,	ITAR_MayaZombie_Addon);
};
//-------------------------------------------------------------
func void B_SetVisuals_Maya_Zombie03()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 0,  		DEFAULT,	ITAR_MayaZombie_Addon);
};
//-------------------------------------------------------------
func void B_SetVisuals_Maya_Zombie04()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		DEFAULT,	ITAR_MayaZombie_Addon);
};

INSTANCE MayaZombie01		(Mst_Default_Zombie)
{
	B_SetVisuals_Maya_Zombie01();
	Npc_SetToFistMode(self);
	
	start_aistate				= ZS_Pal_ZOMBIE;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE MayaZombie02		(Mst_Default_Zombie)
{
	B_SetVisuals_Maya_Zombie02();
	Npc_SetToFistMode(self);
};

INSTANCE MayaZombie03		(Mst_Default_Zombie)
{
	B_SetVisuals_Maya_Zombie03();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_Pal_ZOMBIE;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE MayaZombie04		(Mst_Default_Zombie)
{
	B_SetVisuals_Maya_Zombie04();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Burgherr		(Mst_Default_Zombie)
{
	name		=	"Burgherr";

	B_SetVisuals_Maya_Zombie04();
	Npc_SetToFistMode(self);
};
//*************
//	Einer der Totenwächter  	
//*************

INSTANCE MayaZombie04_Totenw	(Mst_Default_Zombie) 
{
	CreateInvItems	(self, ItWr_Bauplan_BeliarDolch, 1);
	CreateInvItems	(self, ItMi_Zeitspalt_Addon, 1);

	name = "Hüter des Herrenhauses";

	B_SetVisuals_Maya_Zombie04();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Moor	(Mst_Default_Zombie) 
{
	B_SetVisuals_Maya_Zombie04();
	Npc_SetToFistMode(self);
};



INSTANCE Zombie_Adanos_Pepe		(Mst_Default_Zombie)
{
	B_SetVisuals_Maya_Zombie04();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItSc_AuraBerserker, 1);
	CreateInvItems	(self, ItSc_AuraHeilung, 2);
	CreateInvItems	(self, ItWr_VerwitterteSteintafel, 1);
};

INSTANCE Zombie_Herek		(Mst_Default_Zombie)
{
	name		=	"verendeter Abenteurer";

	B_SetVisuals_Maya_Zombie04();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItMi_Gold, 12);
	CreateInvItems	(self, ItMi_OldCoin, 3);
	CreateInvItems	(self, ItFo_Booze, 1);
	CreateInvItems	(self, ItMi_Joint, 1);
	CreateInvItems	(self, ItMW_Addon_Keule_1h_01, 1);
};

//************************
//	SummonedZombie
//***********************

INSTANCE Summoned_Zombie		(Mst_Default_Zombie)
{
	name							= NAME_Addon_Summoned_Zombie;
	guild							= GIL_SUMMONEDZombie;
	aivar[AIV_MM_REAL_ID]			= ID_SUMMONEDZombie;
	level							= 0;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		= 200;
	attribute	[ATR_DEXTERITY]		= 200;

	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;

	B_SetVisuals_Maya_Zombie04();
	Npc_SetToFistMode(self);
};



INSTANCE Zombie_OGY_01		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_OGY_02		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie02();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_OGY_03		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie03();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_OGY_04		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie04();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_OGY_05		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_OGY_06		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie02();
	Npc_SetToFistMode(self);
};


INSTANCE Zombie_OGY_Orchunter_01		(Mst_Default_Zombie)
{
	B_SetVisuals_ZombieOrchunter01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_OGY_Orchunter_02		(Mst_Default_Zombie)
{
	B_SetVisuals_ZombieOrchunter02();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_OGY_Orchunter_03		(Mst_Default_Zombie)
{
	B_SetVisuals_ZombieOrchunter03();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_OGY_Templer_01		(Mst_Default_Zombie)
{
	B_SetVisuals_ZombieTempler01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_OGY_Templer_02		(Mst_Default_Zombie)
{
	B_SetVisuals_ZombieTempler02();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_OGY_Templer_03		(Mst_Default_Zombie)
{
	B_SetVisuals_ZombieTempler03();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_OGY_Templer_04		(Mst_Default_Zombie)
{
	B_SetVisuals_ZombieTempler04();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_OT		(Mst_Default_Zombie)
{
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	25000;
	protection	[PROT_EDGE]			=	50000;
	protection	[PROT_POINT]		=	50000;	
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	50;
	protection	[PROT_MAGIC]		=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

	var int Randi;
	Randi = Hlp_Random(8);

	Mdl_SetVisual			(self,	"Zombie.mds");

	if (Randi == 0)
	{
		Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		DEFAULT,	ItAr_Zombietempler);
	}
	else if (Randi == 1)
	{
		Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 1,  		DEFAULT,	ItAr_Zombietempler);
	}
	else if (Randi == 2)
	{
		Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 0,  		DEFAULT,	ItAr_Zombietempler);
	}
	else if (Randi == 3)
	{
		Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		DEFAULT,	ItAr_Zombietempler);
	}
	else if (Randi == 4)
	{
		Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		DEFAULT,	ItAr_Zombienovize);
	}
	else if (Randi == 5)
	{
		Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 1,  		DEFAULT,	ItAr_Zombienovize);
	}
	else if (Randi == 6)
	{
		Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 0,  		DEFAULT,	ItAr_Zombienovize);
	}
	else if (Randi == 7)
	{
		Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		DEFAULT,	ItAr_Zombienovize);
	};

	Npc_SetToFistMode(self);
};

FUNC VOID B_SetVisuals_Zombie_Hel()
{
	var int Randi;
	Randi = Hlp_Random(6);

	if (Randi == 0)
	{
		B_SetVisuals_Zombie01();
	}
	else if (Randi == 1)
	{
		B_SetVisuals_Zombie02();
	}
	else if (Randi == 2)
	{
		B_SetVisuals_Zombie03();
	}
	else if (Randi == 3)
	{
		B_SetVisuals_Zombie04();
	}
	else if (Randi == 4)
	{
		B_SetVisuals_ZombieWoman01();
	}
	else
	{
		B_SetVisuals_ZombieWoman02();
	};
};

INSTANCE Zombie_Hel_01	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie_Hel();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Hel_02	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie_Hel();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Hel_03	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie_Hel();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Hel_04	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie_Hel();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Hel_05	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie_Hel();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Hel_06	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie_Hel();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Hel_07	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie_Hel();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Hel_08	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie_Hel();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Hel_09	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie_Hel();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie_Hel_10	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie_Hel();
	Npc_SetToFistMode(self);
};

INSTANCE Ghoul_Hel_01	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();

	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);

	Npc_SetToFistMode(self);
};

INSTANCE Ghoul_Hel_02	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();

	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);

	Npc_SetToFistMode(self);
};

INSTANCE Ghoul_Hel_03	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();

	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);

	Npc_SetToFistMode(self);
};

INSTANCE Ghoul_Hel_04	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();

	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);

	Npc_SetToFistMode(self);
};

INSTANCE Ghoul_Hel_05	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();

	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);

	Npc_SetToFistMode(self);
};

INSTANCE Ghoul_Hel_06	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();

	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);

	Npc_SetToFistMode(self);
};

INSTANCE Ghoul_Hel_07	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();

	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);

	Npc_SetToFistMode(self);
};

INSTANCE Ghoul_Hel_08	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();

	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);

	Npc_SetToFistMode(self);
};