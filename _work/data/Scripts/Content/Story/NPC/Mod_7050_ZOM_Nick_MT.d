instance Mod_7050_ZOM_Nick_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Nick";
	guild 		= GIL_OUT;
	id 			= 7050;
	voice		= 0;
	flags       = 0;
	level	= 34;			
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	100; //+50 Waffe
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	125;
	protection	[PROT_EDGE]			=	125;
	protection	[PROT_POINT]		=	-1; 
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	125;
	protection	[PROT_MAGIC]		=	0;																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_ZOMBIE;	
	
	// ------ Equippte Waffen ------				

	// ------ Inventory ------
	
	// ------ visuals ------																			
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"NICKKOPF", 1,  		DEFAULT,	ITAR_Pir_Zombie);

	// ------ NSC-relevante Talente vergeben ------
	
	// ------ Kampf-Talente ------

	senses			= SENSE_SEE;
	
	senses_range	= 100;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7050;
};

FUNC VOID Rtn_Start_7050 ()
{
	TA_Stand_Zombie	(08,00,19,02,"WP_CIRCLE_01");
	TA_Stand_Zombie	(19,02,23,00,"WP_CIRCLE_01");
};

FUNC VOID Rtn_Tot_7050 ()
{
	TA_Stand_Zombie	(08,00,19,02,"TOT");
	TA_Stand_Zombie	(19,02,23,00,"TOT");
};