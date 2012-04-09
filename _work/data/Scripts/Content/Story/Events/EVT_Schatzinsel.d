//****************************
// 	Das sind Erdbeben, sonst nichts.



var int EVT_ORKGRAB_01_OneTime;
var int PLATVORMBELOHNUNG;
var int FEUERSCHATZINSEL;
FUNC VOID ENTER_EVT_ORKTEMPEL_ERDBEBEN ()
{


if (EVT_ORKGRAB_01_OneTime == FALSE)
{
	Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
	Snd_Play 	("Ravens_Earthquake4" );


                 //****************************
                 // 	Das sind alles Abenteurer die sich am Grab versucht haben und von den Wächtern 
                 // getötet wurden.



        
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_01");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_02");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_03");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_04");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_05");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_06");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_07");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_08");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_09");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_010");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_011");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_012");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_013");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_014");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_015");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_016");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_017");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_018");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_019");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_020");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_021");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_022");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_023");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_024");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_025");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_026");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_027");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_028");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_029");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_030");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_031");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_032");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_033");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_034");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_035");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_036");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_037");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_038");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_039");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_040");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_041");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_042");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_043");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_044");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_045");

                 //****************************
                 // 	Spezielle Wächter des Haubttorschalters
                 //

                Wld_InsertNpc (DemonLord,"FP_ROAM_MONSTER_046");
                Wld_InsertNpc (DemonLord,"FP_ROAM_MONSTER_047");


                 //****************************
                 // 	Die Haubttorwächter
                 //

                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_FREISPAN_01");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_FREISPAN_02");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_FREISPAN_03");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_FREISPAN_04");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_FREISPAN_05");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_FREISPAN_06");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_FREISPAN_07");

                 //****************************
                 // 	Untote Arbeiter oder Sklaven
                 //


                Wld_InsertNpc (Zombie01,"FP_ROAM_MONSTER_048");
                Wld_InsertNpc (Zombie02,"FP_ROAM_MONSTER_049");
                Wld_InsertNpc (Zombie03,"FP_ROAM_MONSTER_050");
                Wld_InsertNpc (Zombie04,"FP_ROAM_MONSTER_051");


                 //****************************
                 // 	Untote Arbeiter oder Sklaven unten 
                 //


                Wld_InsertNpc (Zombie01,"FP_ROAM_MONSTER_052");
                Wld_InsertNpc (Zombie02,"FP_ROAM_MONSTER_053");
                Wld_InsertNpc (Zombie03,"FP_ROAM_MONSTER_054");
                Wld_InsertNpc (Zombie04,"FP_ROAM_MONSTER_055");
                Wld_InsertNpc (Zombie03,"FP_ROAM_MONSTER_056");
                Wld_InsertNpc (Zombie04,"FP_ROAM_MONSTER_057");


                 //****************************
                 // 	Grabwächter natürlich untote Orks
                 //

                 Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_058");
                 Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_059");
                 Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_060");

                 //****************************
                 // 	Gefangene der Grabwächter
                 //


                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_061");
                Wld_InsertNpc (Zombie04,"FP_ROAM_MONSTER_062");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_063");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_064");
                Wld_InsertNpc (Zombie02,"FP_ROAM_MONSTER_065");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_066");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_067");
                Wld_InsertNpc (Zombie03,"FP_ROAM_MONSTER_068");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_069");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_070");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_071");
                Wld_InsertNpc (Zombie01,"FP_ROAM_MONSTER_072");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_073");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_074");
                Wld_InsertNpc (Zombie04,"FP_ROAM_MONSTER_075");
                Wld_InsertNpc (Lesser_Skeleton,"FP_ROAM_MONSTER_076");
               

                 //****************************
                 // 	Grabwächter
                 //

                 Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_077");
                 Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_078");




                 //****************************
                 // 	Grabwächter beim Teleporter Sprung Rätsel. Ja ich weiß ist nicht schwer.
                 //


                 Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_079");
                 Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_080");
                 Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_081");
                 Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_082");
                 Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_083");

                 //****************************
                 // 	Grabwächter Haubtkammer
                 //

                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_084");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_085");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_086");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_087");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_088");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_089");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_090");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_091");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_092");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_093");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_094");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_095");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_096");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_097");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_098");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_099");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_0100");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_0101");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_0102");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_0103");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_0104");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_0105");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_0106");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_0107");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_0108");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_0109");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_0110");
                Wld_InsertNpc (UndeadOrcWarrior,"FP_ROAM_MONSTER_0111");

                 //****************************
                 // 	Der Grund für den ganzen schlamasel der Boss, der König, der mit der größten Axt.
                 //     Ein Untoter Orkkriger oder ein untoter Orkshamane, aufjedenfall tot, groß und böse.

                Wld_InsertNpc (UndeadOrcWarriorHorn,"FP_ROAM_MONSTER_DERBOSS");



EVT_ORKGRAB_01_OneTime = TRUE;
};	
};



/********************************************************************************/
/*************************Teleporter im Dungeon ****************************************/



func void TELEPORTERFUNKTION_NACHOBEN  () 
{ 
	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE ); 
	Snd_Play ("MFX_TELEPORT_CAST"); 
	Npc_ClearAIQueue (hero); 
	AI_Teleport        (self, "WP_DI_HOEHLE_01_OBEN_SKELETT");

	Mod_PirInsel_Teleport = TRUE;
};





func void TELEPORTERFUNKTION_SCHALTERUNDSPRUNG   () 
{ 
Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE ); 
    Snd_Play ("MFX_TELEPORT_CAST"); 
    Npc_ClearAIQueue (hero); 
AI_Teleport        (self, "TIEFESDUNGEN21"); 

};



func void TELEPORTERFUNKTION_SCHALTERUNDSPRUNG2  () 
{ 
Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero    , 0, 0, 0, FALSE ); 
    Snd_Play ("MFX_TELEPORT_CAST"); 
    Npc_ClearAIQueue (hero); 
AI_Teleport        (self, "TIEFESDUNGEN25"); 

PLATVORMBELOHNUNG = TRUE; 

};


/********************************************************************************/
/*************************Feuerstrafe im Dungeon ****************************************/




func void EVT_FEUERIMDUGEON_FUNC_S1 ()
{
	if(FEUERSCHATZINSEL == FALSE)
	{
		           Wld_SendTrigger ("FEUERIMDUGEONMOVER");
                           FEUERSCHATZINSEL = TRUE;  
                           B_GivePlayerXP (100);
      Wld_SendTrigger ("FEUERFALLE");
	};
};





func void EVT_PLATVORM_FUNC_S1 ()
{
	if(PLATVORMBELOHNUNG == FALSE)
	{
		          
                           PLATVORMBELOHNUNG = TRUE;  
                           B_GivePlayerXP (1000);
	};
};










/********************************************************************************/
/*************************Untoter Orkboss ****************************************/


PROTOTYPE Mst_Default_UndeadOrcWarriorHorn (C_Npc)			
{
	//----- Monster ----
	name							=	"Darmon Ur";
	guild							=	GIL_UNDEADORC;
	aivar[AIV_MM_REAL_ID]			= 	ID_UNDEADORCWARRIOR;
	level							=	100;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	100; //+100 Waffe //MIN 120!
	attribute	[ATR_DEXTERITY]		=	200; 
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	250000;
	protection	[PROT_EDGE]			=	250000;
	protection	[PROT_POINT]		=	250000;
	protection	[PROT_FIRE]			=	250;
	protection	[PROT_FLY]			=	250;
	protection	[PROT_MAGIC]		=	0;
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 80;
	HitChance	[NPC_TALENT_2H]			= 80;
	HitChance	[NPC_TALENT_BOW]		= 80;
	HitChance	[NPC_TALENT_CROSSBOW]	= 80;

	//----- Damage Types -----	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_ORC;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
		
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};


func void B_SetVisuals_UndeadOrcWarriorHorn()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"UOWHORN_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


INSTANCE UndeadOrcWarriorHorn (Mst_Default_UndeadOrcWarriorHorn)
{
	// ------ visuals ------
	B_SetVisuals_UndeadOrcWarriorHorn();
	
	// ------ Inventory ------
	EquipItem (self, KristallOrkAxt);
	
	//----- Daily Routine ----
       start_aistate				= ZS_MM_AllScheduler;
	effect							=	"SPELLFX_FIREARMOR";
	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

//          Mdl_SetModelScale(self, 1.1, 1.1, 1.1);
};


/********************************************************************************/
/**************************Für den Helden und die Orks **************************/
/**********************      Kristall Waffen*************************/
INSTANCE KristallOrkAxt (C_Item)
{	
	name 				=	"Kristall Orkaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_03;

	damageTotal			= 	Damage_Orkaxt_03;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_03;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   Condition_Orkaxt_03;
	visual 				= "Kristallaxt.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};





INSTANCE Kristallschwert (C_Item)
{	
	name 				=	"Avatier";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_AltHacker;

	damageTotal			= 	Damage_AltHacker;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_AltHacker;	
	
	on_equip			=	Equip_2H_02;
	on_unequip			=	UnEquip_2H_02;
	
	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_AltHacker;
	visual 				=	"Avatier.3ds";


	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_02;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};



