var int ML_UTempel;      //Flag Magiclight im UTempel

// 
// Alles für den Lichttestraum
// 
//-------------------- Sargquest UTempel ---------------------
//****************************************************************
// Bit 1-5 von ML_UTempel = Wld_SendTrigger(UT_ML1 (bis) UT_ML5)
// Bit 6 Überlauf
// Bit 7 Flipp (alle waren an oder aus)
//****************************************************************

var int ft_light01;
var int ft_light02;
var int ft_light03;
var int ft_light04;
var int ft_light05;

//--------- Schalter links ------------ Lichter nach links drehen (5 Bit's rollen)

FUNC VOID EVENT_TS_UT_SL ()
{
	var int temp;
	temp = ft_light01;

	if (ft_light05 == TRUE)
	{
		Wld_SendTrigger("UT_ML1");

		ft_light01 = TRUE;

		Wld_SendUnTrigger("UT_ML5");

		ft_light05 = FALSE;
	}
	else
	{
		Wld_SendUnTrigger("UT_ML1");

		ft_light01 = FALSE;
	};
          
	if (ft_light04 == TRUE)
	{
		Wld_SendTrigger("UT_ML5");

		ft_light05 = TRUE;

		Wld_SendUnTrigger("UT_ML4");

		ft_light04 = FALSE;
	}
	else
	{
		Wld_SendUnTrigger("UT_ML5");

		ft_light05 = FALSE;
	};
	
	if (ft_light03 == TRUE)
	{
		Wld_SendTrigger("UT_ML4");

		ft_light04 = TRUE;

		Wld_SendUnTrigger("UT_ML3");

		ft_light03 = FALSE;
	}
	else
	{
		Wld_SendUnTrigger("UT_ML4");

		ft_light04 = FALSE;
	};
	
	
	if (ft_light02 == TRUE)
	{
		Wld_SendTrigger("UT_ML3");

		ft_light03 = TRUE;

		Wld_SendUnTrigger("UT_ML2");

		ft_light02 = FALSE;
	}
	else
	{
		Wld_SendUnTrigger("UT_ML3");

		ft_light03 = FALSE;
	};
	
	
	if (temp == TRUE)
	{
		Wld_SendTrigger("UT_ML2");

		ft_light02 = TRUE;
	}
	else
	{
		Wld_SendUnTrigger("UT_ML2");

		ft_light02 = FALSE;
	};
};                                                                


FUNC VOID EVENT_TS_UT_CHECK ()
{
	if (ft_light01 == TRUE)
	&& (ft_light02 == TRUE)
	&& (ft_light03 == TRUE)  
	&& (ft_light04 == TRUE)    
	&& (ft_light05 == TRUE)  
	&& (ML_UTempel == FALSE)
	{
		ML_UTempel = TRUE;
		Wld_SendTrigger("UT_SD");
		
 		Wld_InsertItem	(ItMi_OrnamentEffekt_BIGFARM_Addon	 ,"SCHALTERTESTOBJEKT");  
		Wld_SendTrigger("HELDENPFXSCHALTEERTEST");
		Snd_Play      ("MFX_SPAWN_CAST");	
	};
	
	// Wofür ist das???

	/*if (ML_UTempel == TRUE)
	{
		ML_UTempel = 2;
		Wld_SendUnTrigger("PILLAR1_UT");
		Wld_SendUnTrigger("PILLAR2_UT");
		Wld_SendUnTrigger("PILLAR3_UT");
		Wld_SendUnTrigger("PILLAR4_UT");
		Wld_SendUnTrigger("PILLAR5_UT");
	};*/
};


//--------- Schalter rechts ------------ Rolett
                                                                  
FUNC VOID EVENT_TS_UT_SR ()                                        
{                                                                 
	var int ML_Temp;
	ML_Temp = Hlp_Random(31);
	
	if (((ML_Temp & 1) == 1) && (ft_light01 == FALSE))
	{
		ft_light01 = TRUE;

		Wld_SendTrigger("UT_ML1");
	}
	else
	{
		if (((ML_Temp & 1) != 1) && (ft_light01 == TRUE))
		{
			ft_light01 = FALSE;

			Wld_SendUnTrigger("UT_ML1");
		};
	};
	
	if (((ML_Temp & 2) == 2) && (ft_light02 == FALSE))
	{
		ft_light02 = TRUE;

		Wld_SendTrigger("UT_ML2");
	}
	else
	{
		if (((ML_Temp & 2) != 2) && (ft_light02 == TRUE))
		{
			ft_light02 = FALSE;

			Wld_SendUnTrigger("UT_ML2");
		};
	};
	
	if (((ML_Temp & 4) == 4) && (ft_light03 == FALSE))
	{
		ft_light03 = TRUE;

		Wld_SendTrigger("UT_ML3");
	}
	else 
	{
		if (((ML_Temp & 4) != 4) && (ft_light03 == TRUE))
		{
			ft_light03 = FALSE;

			Wld_SendUnTrigger("UT_ML3");
		};
	};
	
	if (((ML_Temp & 8) == 8) && (ft_light04 == FALSE))
	{
		ft_light04 = TRUE;

		Wld_SendTrigger("UT_ML4");
	}
	else
	{
		if (((ML_Temp & 8) != 8) && (ft_light04 == TRUE))
		{	
			ft_light04 = FALSE;

			Wld_SendUnTrigger("UT_ML4");
		};
	};
	
	if (((ML_Temp & 16) == 16) && (ft_light05 == FALSE))
	{
		ft_light05 = TRUE;

		Wld_SendTrigger("UT_ML5");
	}
	else 
	{
		if (((ML_Temp & 16) != 16) && (ft_light05 == FALSE))
		{
			ft_light05 = TRUE;

			Wld_SendUnTrigger("UT_ML5");
		};
	};
	
	EVENT_TS_UT_CHECK ();
};                                                                 




//--------- Schalter mitte ------------

FUNC VOID EVENT_TS_UT_SM ()
{
	if (ft_light01 == TRUE)
	{
		ft_light01 = FALSE;

		Wld_SendUnTrigger("UT_ML1");
	}
	else
	{
		ft_light01 = TRUE;

		Wld_SendTrigger("UT_ML1");
	};
	
	if (ft_light03 == TRUE)
	{
		ft_light03 = FALSE;

		Wld_SendUnTrigger("UT_ML3");
	}
	else
	{
		ft_light03 = TRUE;

		Wld_SendTrigger("UT_ML3");
	};
	
	if (ft_light04 == TRUE)
	{
		ft_light04 = FALSE;

		Wld_SendUnTrigger("UT_ML4");
	}
	else
	{
		ft_light04 = TRUE;

		Wld_SendTrigger("UT_ML4");
	}; 

	EVENT_TS_UT_CHECK ();
};


//--------- Reset UTempelquest - bzw. Schalter Gate im UT ------------

FUNC VOID EVENT_TS_UT_GATE ()
{
	if (ft_light01 == TRUE)
	{
		ft_light01 = FALSE;

		Wld_SendUnTrigger("UT_ML1");
	};
	
	if (ft_light02 == TRUE)
	{
		ft_light02 = FALSE;

		Wld_SendUnTrigger("UT_ML2");
	};
	
	if (ft_light03 == TRUE)
	{
		ft_light03 = FALSE;

		Wld_SendUnTrigger("UT_ML3");
	};
	
	if (ft_light04 == TRUE)
	{
		ft_light04 = FALSE;

		Wld_SendUnTrigger("UT_ML4");
	};
	
	if (ft_light05 == TRUE)
	{
		ft_light05 = FALSE;

		Wld_SendUnTrigger("UT_ML5");
	};
	
	EVENT_TS_UT_CHECK ();
};

FUNC VOID EVT_FEUERTEST_TOR_01 ()
{
	if (Npc_HasItems(hero, ItMi_OrnamentEffekt_BIGFARM_Addon) == 2)
	{
		Wld_SendTrigger	("HALLE1_TOR2");
	};
};

FUNC VOID EVT_FEUERTEST_TOR_02 ()
{
	if (Npc_HasItems(hero, ItMi_OrnamentEffekt_BIGFARM_Addon) >= 3)
	{
		Wld_SendTrigger	("LANGEHALLE_GOLEMKAMPF");
	};
};

FUNC VOID EVT_FEUERTEST_TOR_03 ()
{
	if (Npc_HasItems(hero, ItMi_OrnamentEffekt_BIGFARM_Addon) >= 4)
	{
		Wld_SendTrigger	("ENDHALLE1");
	};
};






/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/

func void TELEPORTERFUNKTION_FLASCHEVERGESSEN  () 
{ 
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE ); 
	Snd_Play ("MFX_TELEPORT_CAST"); 
	Npc_ClearAIQueue (hero); 
	AI_Teleport        (self, "FLASCHEVERGESSENPUNKKT"); 
	Wld_SendTrigger( "ZUM4TEST" ); 
};

/******************************************************************************************/
INSTANCE ItPo_FEUERTEST_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaEssenz;	

	visual 			=	"ItPo_Mana_01.3ds";
	material 		=	MAT_GLAS;

	on_state[0]		=	UseItPo_FEUERTEST_01;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION";

	description		= 	"Trank der Feuertaufe";
	
	TEXT[1]			= 	NAME_Bonus_Mana;				
	COUNT[1]		= 	Mana_Essenz;

	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_ManaEssenz;

};

	FUNC VOID UseItPo_FEUERTEST_01()
	{
		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
		Snd_Play 	("Ravens_Earthquake4" );
		Wld_SendTrigger( "FEUERAUS" );
	};


//*************************
//	FireGolem Prototype	
//*************************

PROTOTYPE Mst_Default_NEWFireGolem(C_Npc)			
{
	//----- Monster ----
	name							=	"Feuergolem";
	guild							=	GIL_FIREGOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_FIREGOLEM;
	level							=	40;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	200;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	150000;
	protection	[PROT_POINT]		=	200000;	
	protection	[PROT_FIRE]			=	150;	
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	150;
	
	//----- Damage Types ----
	damagetype 						=	DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_STONEGOLEM;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//***************
//	Visuals
//***************

func void B_SetVisuals_NEWFireGolem()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	Mdl_ApplyOverlayMds 	(self,	"Golem_Firegolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"FEUERGOLEMNEU_Body",DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//***************
//	FireGolem   
//***************

INSTANCE DUNGEONFireGolem	(Mst_Default_NEWFireGolem)
{
	B_SetVisuals_NEWFireGolem();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItMi_OrnamentEffekt_BIGFARM_Addon, 1);
};