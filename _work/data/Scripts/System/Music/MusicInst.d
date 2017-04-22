	
//////////////////////////////////////
//	
// 	Music Sytem 
//	Instance-Definitions 
//	
//////////////////////////////////////

// music config instance

INSTANCE musicSysConfig		(C_MUSICSYS_CFG)
{
	volume 				= 1;   		// 0..1
	bitResolution		= 16;		// 8 / 16
	globalReverbEnabled = 1;
	sampleRate			= 44100;	// 11050 - 44100 prefered
	numChannels			= 32;		// 1 - 16
	reverbBufferSize	= 262144;
};



// ------------------------------------------------------------------------------------------------
// jingle instances
// ------------------------------------------------------------------------------------------------


INSTANCE jingleFoundItem(C_MUSICJINGLE_DEF) {	name	    = "E-Positive 2";	transSubType= TRANSITION_SUB_TYPE_BEAT;		};
INSTANCE jingleLevelGain(C_MUSICJINGLE_DEF) {	name	    = "E-Positive 1";	transSubType= TRANSITION_SUB_TYPE_MEASURE;	};
INSTANCE jingleKilledFoe(C_MUSICJINGLE_DEF) {	name	    = "E-Positive 2";	transSubType= TRANSITION_SUB_TYPE_BEAT;		};
INSTANCE jingleLearnTalent(C_MUSICJINGLE_DEF) {	name	    = "E-Positive 1";	transSubType= TRANSITION_SUB_TYPE_BEAT;		};


// ------------------------------------------------------------------------------------------------
// theme instances
// ------------------------------------------------------------------------------------------------

//////////////////////
// Prototypes
//////////////////////

PROTOTYPE C_MUSICTHEME_STANDARD		(C_MUSICTHEME)
{
	file				= "nw_dayfgt.sgt";
	transType			= TRANSITION_TYPE_BREAK;
	transSubType		= TRANSITION_SUB_TYPE_MEASURE;	
	ReverbMix			= -8;
	ReverbTime			= 9000;
	vol                 = 1;
    loop                = 1;
		
};

PROTOTYPE C_MUSICTHEME_THREAT		(C_MUSICTHEME)
{
	file				= "nw_daythr.sgt";
	transType			= TRANSITION_TYPE_FILL;
	transSubType		= TRANSITION_SUB_TYPE_MEASURE;	
	ReverbMix			= -8;
	ReverbTime			= 9000;
	vol                 = 1;
    loop                = 1;
};

PROTOTYPE C_MUSICTHEME_FIGHT		(C_MUSICTHEME)
{
	file				= "nw_daystd.sgt";
	transType			= TRANSITION_TYPE_FILL;
	transSubType		= TRANSITION_SUB_TYPE_MEASURE;	
	ReverbMix			= -12;
	ReverbTime			= 9000;
	vol                 = 1;
    loop                = 1;
};




//////////////////////
// System
//////////////////////

INSTANCE SYS_Menu			(C_MUSICTHEME_DEF)
{
	file				= "menutheme.sgt";
	transType			= TRANSITION_TYPE_NONE;
	transSubType		= TRANSITION_SUB_TYPE_BEAT;	
	ReverbMix			= -12;
	ReverbTime			= 8500;
};

INSTANCE SYS_Loading		(C_MUSICTHEME_DEF)
{
	file				= "menutheme.sgt";
	transType			= TRANSITION_TYPE_NONE;
	transSubType		= TRANSITION_SUB_TYPE_BEAT;	
	ReverbMix			= -12;
	ReverbTime			= 8500;
};


// ################################################################################################
// ################################################################################################
// ################################################################################################
// ###############                                                          #######################
// ###############           A D D O N W O R L D                            #######################
// ###############                                                          #######################
// ################################################################################################
// ################################################################################################
// ################################################################################################


// ################################################################################################
// ####### ADW - AddonWorld (default) #############################################################
// ################################################################################################

		INSTANCE ADW_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "adw_day_std.sgt";		};
		INSTANCE ADW_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "adw_day_fgt.sgt";		};



// ################################################################################################
// ####### AWC - AddonWorld Entrance Temple #######################################################
// ################################################################################################

		INSTANCE AWC_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "awc_day_std.sgt";		};
		INSTANCE AWC_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "adw_day_fgt.sgt";		};




// ################################################################################################
// ####### ADT - AdanosTempel #####################################################################
// ################################################################################################

		INSTANCE ADT_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "adt_day_std.sgt";		};
		


// ################################################################################################
// ####### BDT - BanditenLager ####################################################################
// ################################################################################################

		INSTANCE BDT_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "bdt_day_std.sgt";		};
		INSTANCE BDT_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "adw_day_fgt.sgt";		};



// ################################################################################################
// ####### BIB - Canyon Bibliothek ################################################################
// ################################################################################################

		INSTANCE BIB_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "bib_day_std.sgt";		};
		INSTANCE BIB_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "adw_day_fgt.sgt";		};
		
		

// ################################################################################################
// ####### CAN - Canyon ###########################################################################
// ################################################################################################

		INSTANCE CAN_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "can_day_std.sgt";		};
		INSTANCE CAN_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "adw_day_fgt.sgt";		};




// ################################################################################################
// ####### CRY - Crystal Cave #####################################################################
// ################################################################################################

		INSTANCE CRY_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "awc_day_std.sgt";		};
		INSTANCE CRY_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "adw_day_fgt.sgt";		};



// ################################################################################################
// ####### GOL - GoldMine #########################################################################
// ################################################################################################

		INSTANCE GOL_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "bib_day_std.sgt";		};
		INSTANCE GOL_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "adw_day_fgt.sgt";		};



// ################################################################################################
// ####### GHO - Ghost Crypta #####################################################################
// ################################################################################################

		INSTANCE GHO_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "bib_day_std.sgt";		};
		INSTANCE GHO_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "adw_day_fgt.sgt";		};



// ################################################################################################
// ####### MI1 - Canyon Mine 1 ####################################################################
// ################################################################################################

		INSTANCE MI1_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "bib_day_std.sgt";		};


// ################################################################################################
// ####### MI2 - Canyon Mine 2 ####################################################################
// ################################################################################################

		INSTANCE MI2_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "bib_day_std.sgt";		};




// ################################################################################################
// ####### NWP - NewWorld Portal ##################################################################
// ################################################################################################

// WICHTIG: ALTES ORCHESTER BENUTZEN

		//INSTANCE NWP_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "pir_day_std.sgt";		};


// ################################################################################################
// ####### PO1 - AddonWorld Eingangsdungeon #######################################################
// ################################################################################################

		INSTANCE PO1_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "bib_day_std.sgt";		};
		INSTANCE PO1_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "adw_day_fgt.sgt";		};



// ################################################################################################
// ####### PIR - Canyon ###########################################################################
// ################################################################################################

		INSTANCE PIR_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "pir_day_std.sgt";		};
		INSTANCE PIR_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "adw_day_fgt.sgt";		};


// ################################################################################################
// ####### RAV - Raven ############################################################################
// ################################################################################################

		INSTANCE RAV_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "bdt_day_std.sgt";		};
		INSTANCE RAV_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "adw_day_fgt.sgt";		};


// ################################################################################################
// ####### SHO - Showdown #########################################################################
// ################################################################################################

		INSTANCE SHO_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "sho_day_std.sgt";		};
		INSTANCE SHO_Day_Fgt	(C_MUSICTHEME_STANDARD)		{	file			= "sho_day_fgt.sgt";		};


// ################################################################################################
// ####### SWP - Sumpf ############################################################################
// ################################################################################################

		INSTANCE SWP_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "swp_day_std.sgt";		};
		INSTANCE SWP_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "adw_day_fgt.sgt";		};


// ################################################################################################
// ####### STO - StonePlates ######################################################################
// ################################################################################################

		INSTANCE STO_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "sto_day_std.sgt";		};
		


// Neue XR Musikstücke

// ################################################################################################
// ####### KHT - Khorata ####################################################################
// ################################################################################################

		INSTANCE KHT_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "in_town_master.sgt";		};
		INSTANCE KHT_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "in_town_day.sgt";		};

// ################################################################################################
// ####### TUG - Tugettso ####################################################################
// ################################################################################################

		INSTANCE TUG_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "tugettso_master.sgt";		};
		INSTANCE TUG_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE TUG_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE TUG_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "night_master.sgt";		};
		INSTANCE TUG_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE TUG_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};

// ################################################################################################
// ####### HS - Hofstaat ####################################################################
// ################################################################################################

		INSTANCE HS_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "fortress_master.sgt";		};
		INSTANCE HS_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE HS_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE HS_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "fortress_master.sgt";		};
		INSTANCE HS_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE HS_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};

// ################################################################################################
// ####### BW - Bergwelt ####################################################################
// ################################################################################################

		INSTANCE BW_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "exploring_day_master.sgt";		};
		INSTANCE BW_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE BW_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE BW_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "night_master.sgt";		};
		INSTANCE BW_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE BW_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};

// ################################################################################################
// ####### PAT - Patherion ####################################################################
// ################################################################################################

		INSTANCE PAT_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "patherion_master.sgt";	vol                 = 10;	};
		INSTANCE PAT_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE PAT_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE PAT_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "patherion_master.sgt";		};
		INSTANCE PAT_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE PAT_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};

// ################################################################################################
// ####### XD - XeresDemo ####################################################################
// ################################################################################################

		INSTANCE XD_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "exploring_day_master.sgt";		};
		INSTANCE XD_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE XD_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE XD_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "night_master.sgt";		};
		INSTANCE XD_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE XD_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};

// ################################################################################################
// ####### BD - BeliarDungeon ####################################################################
// ################################################################################################

		INSTANCE BD_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "beliar_dungeon_master.sgt";		};
		INSTANCE BD_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_dungeon.sgt";		};
		INSTANCE BD_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_dungeon.sgt";		};
		INSTANCE BD_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "beliar_dungeon_master.sgt";		};
		INSTANCE BD_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_dungeon.sgt";		};
		INSTANCE BD_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_dungeon.sgt";		};

// ################################################################################################
// ####### XW - XERESWELT ####################################################################
// ################################################################################################

		INSTANCE XW_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "endlevel.sgt";		};
		INSTANCE XW_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE XW_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE XW_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "endlevel.sgt";		};
		INSTANCE XW_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE XW_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};

// ################################################################################################
// ####### FI - FliegendeInsel ####################################################################
// ################################################################################################

		INSTANCE FI_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "fliegende_insel_master.sgt";		};
		INSTANCE FI_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE FI_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE FI_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "fliegende_insel_master.sgt";		};
		INSTANCE FI_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE FI_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};

// ################################################################################################
// ####### SI - Schatzinsel ####################################################################
// ################################################################################################

		INSTANCE SI_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "schatzinsel_master.sgt";		};
		INSTANCE SI_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_schatzinsel_master.sgt";		};
		INSTANCE SI_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_schatzinsel_master.sgt";		};
		INSTANCE SI_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "schatzinsel_master.sgt";		};
		INSTANCE SI_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_schatzinsel_master.sgt";		};
		INSTANCE SI_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_schatzinsel_master.sgt";		};

// ################################################################################################
// ####### EX - Exploring (Ambient-Welten) ####################################################################
// ################################################################################################

		INSTANCE EX_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "exploring_day_master.sgt";		};
		INSTANCE EX_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE EX_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE EX_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "night_master.sgt";		};
		INSTANCE EX_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE EX_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};

// ################################################################################################
// ####### REL - Relendel ####################################################################
// ################################################################################################

		INSTANCE REL_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "relendel.sgt";		};
		INSTANCE REL_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE REL_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE REL_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "relendel.sgt";		};
		INSTANCE REL_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE REL_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};

// ################################################################################################
// ####### HAL - Halluwelt ####################################################################
// ################################################################################################

		INSTANCE HAL_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "sumpfistory.sgt";		};
		INSTANCE HAL_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "sumpfistory.sgt";		};

// ################################################################################################
// ####### BK - BeliarKloster ####################################################################
// ################################################################################################

		INSTANCE BK_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "beliarkloster.sgt";		};
		INSTANCE BK_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_dungeon.sgt";		};
		INSTANCE BK_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_dungeon.sgt";		};
		INSTANCE BK_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "beliarkloster.sgt";		};
		INSTANCE BK_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_dungeon.sgt";		};
		INSTANCE BK_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_dungeon.sgt";		};

// ################################################################################################
// ####### DR - Drachental ####################################################################
// ################################################################################################

		INSTANCE DR_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "drachental.sgt";		};
		INSTANCE DR_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE DR_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE DR_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "drachental.sgt";		};
		INSTANCE DR_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE DR_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};

// ################################################################################################
// ####### WS - Waldschlucht ####################################################################
// ################################################################################################

		INSTANCE WS_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "waldschlucht.sgt";		};
		INSTANCE WS_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE WS_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE WS_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "waldschlucht.sgt";		};
		INSTANCE WS_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE WS_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};

// ################################################################################################
// ####### MOOR - Moor ####################################################################
// ################################################################################################

		INSTANCE MOOR_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "moor.sgt";		};
		INSTANCE MOOR_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE MOOR_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE MOOR_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "moor.sgt";		};
		INSTANCE MOOR_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "action_exploring_master.sgt";		};
		INSTANCE MOOR_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "action_exploring_master.sgt";		};

// ################################################################################################
// ####### BKPNW - Bosskampf-Pass-NW ####################################################################
// ################################################################################################

		INSTANCE BKPNW_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "owp_daystd.sgt";		};
		INSTANCE BKPNW_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "bosskampf.sgt";		};
		INSTANCE BKPNW_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "bosskampf.sgt";		};
		INSTANCE BKPNW_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "owp_daystd.sgt";		};
		INSTANCE BKPNW_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "bosskampf.sgt";		};
		INSTANCE BKPNW_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "bosskampf.sgt";		};

// ################################################################################################
// ####### PDU - Piratendungeon ####################################################################
// ################################################################################################

		INSTANCE PDU_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "piratendungeon.sgt";		};
		INSTANCE PDU_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "ogy_day_fgt.sgt";		};
		INSTANCE PDU_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "ogy_day_fgt.sgt";		};
		INSTANCE PDU_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "piratendungeon.sgt";		};
		INSTANCE PDU_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "ogy_day_fgt.sgt";		};
		INSTANCE PDU_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "ogy_day_fgt.sgt";		};




// ################################################################################################
// ################################################################################################
// ################################################################################################
// ###############                                                          #######################
// ###############           L O C A T I O N S                              #######################
// ###############                                                          #######################
// ################################################################################################
// ################################################################################################
// ################################################################################################

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  DEFAULT   [DEF_]         XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE DEF_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "nw_daystd_A0.sgt";		};
INSTANCE DEF_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "nw_daythr.sgt";		};
INSTANCE DEF_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "nw_dayfgt.sgt";		};
												
INSTANCE DEF_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "nw_daystd_A0.sgt";		};
INSTANCE DEF_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "nw_daythr.sgt";		};
INSTANCE DEF_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "nw_dayfgt.sgt";		};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  DEFAULT_MINENTAL  [MIN_]    XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MIN_Day_Std	(C_MUSICTHEME_STANDARD)	{	file			= "ow_day_std.sgt";						};
INSTANCE MIN_Day_Thr	(C_MUSICTHEME_THREAT)	{	file			= "cam_day_thr.sgt";					};
INSTANCE MIN_Day_Fgt	(C_MUSICTHEME_FIGHT)	{	file			= "cam_day_fgt.sgt";					};
												
// ----------------------------------------------------

INSTANCE MIN_Ngt_Std	(C_MUSICTHEME_STANDARD)	{	file			= "cam_ngt_std.sgt";					};
INSTANCE MIN_Ngt_Thr	(C_MUSICTHEME_THREAT)	{	file			= "cam_ngt_std.sgt";					};
INSTANCE MIN_Ngt_Fgt	(C_MUSICTHEME_FIGHT)	{	file			= "cam_day_fgt.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  DEFAULT_OLDWORLD [OWD_]  XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE OWD_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "owd_daystd.sgt";		};
INSTANCE OWD_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "owd_daystd.sgt";		};
INSTANCE OWD_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "owp_dayfgt.sgt";		};
												
INSTANCE OWD_Ngt_Std	(C_MUSICTHEME_STANDARD)		{	file			= "owd_daystd.sgt";		};
INSTANCE OWD_Ngt_Thr	(C_MUSICTHEME_THREAT)		{	file			= "owd_daystd.sgt";		};
INSTANCE OWD_Ngt_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "owp_dayfgt.sgt";		};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  DEFAULT_DRAGONISLAND [INS_] XXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE INS_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "di_daystd.sgt";		};
INSTANCE INS_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "di_daystd.sgt";		};
INSTANCE INS_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "di_daystd.sgt";		};
												
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  BANDITENHÖHLE[BAN_]      XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE BAN_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "ban_daystd.sgt";		};
INSTANCE BAN_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "ban_dayfgt.sgt";		};


// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  FRIEDHOF  [FRI_]         XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE FRI_Day_Std	(C_MUSICTHEME_STANDARD)		{		file		= "fri_daystd.sgt";		};


// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  DRAGONLOCATION  [DLC_]   XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE DLC_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "dlc_daystd.sgt";		};
INSTANCE DLC_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "dlc_dayfgt.sgt";		};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  KASERNE   [KAS_]         XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE KAS_Day_Std	(C_MUSICTHEME_STANDARD)		{		file		= "kas_daystd.sgt";		};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  KHORINIS   [KHO_]        XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE KHO_Day_Std	(C_MUSICTHEME_STANDARD)		{		file		= "kh_daystd.sgt";		};
INSTANCE KHO_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "kh_dayfgt.sgt";		};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  LEUCHTTURM   [LEU_]      XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE LEU_Day_Std	(C_MUSICTHEME_STANDARD)		{		file		= "leu_daystd.sgt";		};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  LOBARDS HOF  [LOB_]      XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE LOB_Day_Std	(C_MUSICTHEME_STANDARD)		{		file		= "lob_daystd.sgt";		};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  MAYATEMPEL [MAY_]        XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MAY_Day_Std	(C_MUSICTHEME_STANDARD)		{	file		= "may_daystd.sgt";		};
INSTANCE May_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "may_dayfgt.sgt";		};


// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  KLOSTER OUT    [MOO_]    XXXXXXXXXXXX
// XXXXXXXX  KLOSTER_IN     [MOI_]    XXXXXXXXXXXX
// XXXXXXXX  KLOSTER_DUNGEON[MOD_]    XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE MOO_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "mo_daystd.sgt";		};
INSTANCE MOI_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "mi_daystd.sgt";		};

INSTANCE MOD_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "ban_daystd.sgt";		};
INSTANCE MOD_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "ban_dayfgt.sgt";		};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  OW_PATH  [OWP_]          XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE OWP_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "owp_daystd.sgt";		};
INSTANCE OWP_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "owp_dayfgt.sgt";		};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  PIER [PIE_]              XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE PIE_Day_Std	(C_MUSICTHEME_STANDARD)		{		file		= "pie_daystd.sgt";		};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  WOOD           [WOO_]    XXXXXXXXXXXX
// XXXXXXXX  LESTERTAL      [TAL_]    XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE TAL_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "woo_daystd.sgt";		};
INSTANCE TAL_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "woo_daythr.sgt";		};
INSTANCE TAL_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "woo_dayfgt.sgt";		};

INSTANCE WOO_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "woo_daystd.sgt";		};
INSTANCE WOO_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "woo_daythr.sgt";		};
INSTANCE WOO_Day_Fgt	(C_MUSICTHEME_FIGHT)		{	file			= "woo_dayfgt.sgt";		};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  XARDAS  [XAR_]           XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE XAR_Day_Std	(C_MUSICTHEME_STANDARD)		{	file			= "xt_daystd.sgt";		};
INSTANCE XAR_Day_Thr	(C_MUSICTHEME_THREAT)		{	file			= "xt_daystd.sgt";		};


												
//--------------------------------- OLD WORLD -----------------------------------------------------
//--------------------------------- OLD WORLD -----------------------------------------------------
//--------------------------------- OLD WORLD -----------------------------------------------------
//--------------------------------- OLD WORLD -----------------------------------------------------
//--------------------------------- OLD WORLD -----------------------------------------------------
//--------------------------------- OLD WORLD -----------------------------------------------------
//--------------------------------- OLD WORLD -----------------------------------------------------
//--------------------------------- OLD WORLD -----------------------------------------------------
//--------------------------------- OLD WORLD -----------------------------------------------------
//--------------------------------- OLD WORLD -----------------------------------------------------
//--------------------------------- OLD WORLD -----------------------------------------------------
//--------------------------------- OLD WORLD -----------------------------------------------------



// ################################################################################################
// ###############                                                          #######################
// ###############           C A M P S                                      #######################
// ###############                                                          #######################
// ################################################################################################

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  O L D C A M P  [OC_]     XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE OC_Day_Std		(C_MUSICTHEME_DEF)	{	file			= "oc_day_std.sgt";						
												transType		= TRANSITION_TYPE_BREAK;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};

INSTANCE OC_Day_Thr		(C_MUSICTHEME_DEF)	{	file			= "oc_day_std.sgt";						
												transType		= TRANSITION_TYPE_BREAK;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};

INSTANCE OC_Day_Fgt		(C_MUSICTHEME_DEF)	{	file			= "oc_day_fgt.sgt";						
												transType		= TRANSITION_TYPE_FILL;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};

// ----------------------------------------------------

INSTANCE OC_Ngt_Std		(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_std.sgt";					};

INSTANCE OC_Ngt_Thr		(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_thr.sgt";					};

INSTANCE OC_Ngt_Fgt		(C_MUSICTHEME_DEF)	{	file			= "oc_day_fgt.sgt";						
												transType		= TRANSITION_TYPE_FILL;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};



// --- ARENA ----

INSTANCE ARE_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "foc_day_std.sgt";						};

INSTANCE ARE_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "foc_day_std.sgt";						};

INSTANCE ARE_Day_Fgt	(C_MUSICTHEME_DEF)	{	file			= "oc_day_fgt.sgt";						
												transType		= TRANSITION_TYPE_FILL;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};

// --- INEXTREMO ----


INSTANCE IE_Day_Std		(C_MUSICTHEME_DEF)	{	file			= "oc_day_std.sgt";   						};
INSTANCE IE_Ngt_Std		(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_std.sgt";   						};

INSTANCE IE_Day_Thr		(C_MUSICTHEME_DEF)	{	file			= "oc_day_std.sgt";   						};

INSTANCE IE_Day_Fgt		(C_MUSICTHEME_DEF)	{	file			= "oc_day_fgt.sgt";   						};
												

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  N E W C A M P  [NCO_/NCI_]   XXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

// Plateau davor

INSTANCE NCO_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "cam_day_std.sgt";	
												transType		= TRANSITION_TYPE_BREAK;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};
												
INSTANCE NCO_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "cam_day_thr.sgt";
												transType		= TRANSITION_TYPE_BREAK;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};

INSTANCE NCO_Day_Fgt	(C_MUSICTHEME_DEF)	{	file			= "cam_day_fgt.sgt";
												transType		= TRANSITION_TYPE_FILL;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};

                                                                
INSTANCE NCO_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_std.sgt";					};
INSTANCE NCO_Ngt_Thr	(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_std.sgt";					};
INSTANCE NCO_Ngt_Fgt	(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_std.sgt";					};

// Höhle

INSTANCE NCI_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "eislandschaft_master.sgt";
												transType		= TRANSITION_TYPE_BREAK;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};

INSTANCE NCI_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "action_eislandschaft_master.sgt";
												transType		= TRANSITION_TYPE_BREAK;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};

INSTANCE NCI_Day_Fgt	(C_MUSICTHEME_DEF)	{	file			= "action_eislandschaft_master.sgt";					
												transType		= TRANSITION_TYPE_FILL;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};
                                                                
INSTANCE NCI_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "eislandschaft_master.sgt";					};
INSTANCE NCI_Ngt_Thr	(C_MUSICTHEME_DEF)	{	file			= "action_eislandschaft_master.sgt";					};
INSTANCE NCI_Ngt_Fgt	(C_MUSICTHEME_DEF)	{	file			= "action_eislandschaft_master.sgt";					
												transType		= TRANSITION_TYPE_FILL;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};


// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  P S I C A M P  [PSI_]    XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE PSI_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "psi_day_std.sgt";
												transType		= TRANSITION_TYPE_BREAK;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};
												
INSTANCE PSI_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "psi_day_thr.sgt";	
												transType		= TRANSITION_TYPE_BREAK;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};
												
INSTANCE PSI_Day_Fgt	(C_MUSICTHEME_DEF)	{	file			= "psi_day_fgt.sgt";						
												transType		= TRANSITION_TYPE_FILL;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};
												
INSTANCE PSI_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "psi_ngt_std.sgt";					};
INSTANCE PSI_Ngt_Thr	(C_MUSICTHEME_DEF)	{	file			= "psi_ngt_std.sgt";					};
INSTANCE PSI_Ngt_Fgt	(C_MUSICTHEME_DEF)	{	file			= "psi_day_fgt.sgt";					};
												

// ################################################################################################
// ###############                                                          #######################
// ###############           O U T S I D E W O R L D   + S P E C I A L      #######################
// ###############                                                          #######################
// ################################################################################################

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  O U T S I D E W O R L D  [OW_]   XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


// Obsolete! DEF_ will be used instead.

INSTANCE OW_Day_Std		(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};
INSTANCE OW_Day_Thr		(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};
INSTANCE OW_Day_Fgt		(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};
                                                                
INSTANCE OW_Ngt_Std		(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};
INSTANCE OW_Ngt_Thr		(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};
INSTANCE OW_Ngt_Fgt		(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  S T A R T P O I N T  [STA_]      XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE STA_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "ban_day_std.sgt";					};
                                                            
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
// XXXXXXXX  B E A C H   [BEA_]               XXXX             
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX          
                                                            
INSTANCE BEA_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};
INSTANCE BEA_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  B A N D I T S     [BAN_]         XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

//INSTANCE BAN_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "ban_day_std.sgt";					};
INSTANCE BAN_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  C A M P (klein)   [CAM_]         XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE CAM_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "cam_day_std.sgt";					};
INSTANCE CAM_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  C A S T E L L   [CAS_]           XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE CAS_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "cam_day_thr.sgt";						};
INSTANCE CAS_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_std.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  D E M O N - T O W E R   [DT_]    XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE DT_Day_Std		(C_MUSICTHEME_DEF)	{	file			= "cam_day_thr.sgt";						};
INSTANCE DT_Ngt_Std		(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_std.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  F R E E M I N E C A M P   [FC_]  XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE FC_Day_Std		(C_MUSICTHEME_DEF)	{	file			= "ban_day_std.sgt";					};
INSTANCE FC_Ngt_Std		(C_MUSICTHEME_DEF)	{	file			= "ban_day_std.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  F O C U S - P L A C E   [FOC_]   XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE FOC_day_Std	(C_MUSICTHEME_DEF)	{	file			= "FOC_day_std.sgt";					};
INSTANCE FOC_day_Thr	(C_MUSICTHEME_DEF)	{	file			= "FOC_day_std.sgt";					};
INSTANCE FOC_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "FOC_day_std.sgt";					};
INSTANCE FOC_Ngt_Thr	(C_MUSICTHEME_DEF)	{	file			= "FOC_day_std.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  O R C G R A V E Y A R D [OGR_]   XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// Eingang in der Oberwelt

INSTANCE OGR_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "foc_day_std.sgt";					};
INSTANCE OGR_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "foc_day_std.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  O R C L O C A T I O N 1 [OL1_]   XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// Burgruine an Felswand, mit Fokus

INSTANCE OL1_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "ban_day_std.sgt";					};
INSTANCE OL1_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_std.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  O L D M I N E - E N T R [OME_]   XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// Burgruine an Felswand, mit Fokus

INSTANCE OME_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "cam_day_thr.sgt";					};
INSTANCE OME_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_std.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  O R C C I T Y  [ORC_]    XXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE ORC_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "orc_day_std.sgt";						
												transType		= TRANSITION_TYPE_BREAK;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};
											
INSTANCE ORC_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "orc_day_std.sgt";						
												transType		= TRANSITION_TYPE_BREAK;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};

INSTANCE ORC_Day_Fgt	(C_MUSICTHEME_DEF)	{	file			= "oc_day_fgt.sgt";						
												transType		= TRANSITION_TYPE_FILL;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};

INSTANCE ORC_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "orc_day_std.sgt";					};
INSTANCE ORC_Ngt_Thr	(C_MUSICTHEME_DEF)	{	file			= "orc_day_std.sgt";					};
INSTANCE ORC_Ngt_Fgt	(C_MUSICTHEME_DEF)	{	file			= "oc_day_fgt.sgt";						};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  O R E B A R O N S  [OR_]   XXXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE OR_Day_Std		(C_MUSICTHEME_DEF)	{	file			= "ban_day_std.sgt";					};
INSTANCE OR_Day_Thr		(C_MUSICTHEME_DEF)	{	file			= "ban_day_std.sgt";					};
INSTANCE OR_Day_Fgt		(C_MUSICTHEME_DEF)	{	file			= "oc_day_fgt.sgt";						};

INSTANCE OR_Ngt_Std		(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_std.sgt";					};
INSTANCE OR_Ngt_Thr		(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_std.sgt";					};
INSTANCE OR_Ngt_Fgt		(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_std.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  P I R A T E - D U N G E   [FC_]  XXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE PDN_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};
INSTANCE PDN_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_std.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  P I R A T E   B A Y   [PIR_]   XXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

//INSTANCE PIR_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "ban_day_std.sgt";					};
INSTANCE PIR_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  S T O N E H E N G E   [STO_]   XXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

//INSTANCE STO_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "foc_day_std.sgt";					};
INSTANCE STO_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "foc_day_std.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  T R O L L A R E A N A   [TA_]  XXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE TA_Day_Std		(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};
INSTANCE TA_Ngt_Std		(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_std.sgt";					};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  T O W E R D U N G E O N [TD_]  XXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE TD_Day_Std		(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};
INSTANCE TD_Ngt_Std		(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_std.sgt";						};

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXX  T E M P E L R U I N E  [TRU_]  XXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE TRU_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "ow_day_std.sgt";						};
INSTANCE TRU_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "cam_ngt_std.sgt";					};

// ################################################################################################
// ###############                                                          #######################
// ###############           D U N G E O N S                                #######################
// ###############                                                          #######################
// ################################################################################################

// TEMPEL

INSTANCE TPL_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "ogy_day_std.sgt";					};
INSTANCE TPL_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "ogy_day_std.sgt";					};
INSTANCE TPL_Day_Fgt	(C_MUSICTHEME_DEF)	{	file			= "ogy_day_fgt.sgt";					};
INSTANCE TPL_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "ogy_day_std.sgt";					};

INSTANCE KAT_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "ogy_day_std.sgt";					};
INSTANCE KAT_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "ogy_day_std.sgt";					};
INSTANCE KAT_Day_Fgt	(C_MUSICTHEME_DEF)	{	file			= "ogy_day_fgt.sgt";					};
INSTANCE KAT_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "ogy_day_std.sgt";					};

INSTANCE SLP_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "ogy_day_std.sgt";					};
INSTANCE SLP_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "ogy_day_std.sgt";					};
INSTANCE SLP_Day_Fgt	(C_MUSICTHEME_DEF)	{	file			= "ogy_day_fgt.sgt";					};
INSTANCE SLP_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "ogy_day_std.sgt";					};
		
// FREE MINE

INSTANCE FRM_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "olm_day_std.sgt";
												transType		= TRANSITION_TYPE_BREAK;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};

INSTANCE FRM_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "olm_day_thr.sgt";
												transType		= TRANSITION_TYPE_BREAK;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};
												
INSTANCE FRM_Day_Fgt	(C_MUSICTHEME_DEF)	{	file			= "olm_day_fgt.sgt";						
												transType		= TRANSITION_TYPE_FILL;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};

INSTANCE FRM_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "olm_day_std.sgt";
												transType		= TRANSITION_TYPE_BREAK;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};
												
// OLD MINE?

INSTANCE OLM_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "olm_day_std.sgt";
												transType		= TRANSITION_TYPE_BREAK;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};

INSTANCE OLM_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "olm_day_std.sgt";
												transType		= TRANSITION_TYPE_BREAK;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};
																								
INSTANCE OLM_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "olm_day_thr.sgt";
												transType		= TRANSITION_TYPE_BREAK;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};
												
INSTANCE OLM_Day_Fgt	(C_MUSICTHEME_DEF)	{	file			= "olm_day_fgt.sgt";						
												transType		= TRANSITION_TYPE_FILL;
												transSubType	= TRANSITION_SUB_TYPE_MEASURE;			};

// ORCGRAVEYARD		

INSTANCE OGY_Day_Std	(C_MUSICTHEME_DEF)	{	file			= "ogy_day_std.sgt";					};
INSTANCE OGY_Day_Thr	(C_MUSICTHEME_DEF)	{	file			= "ogy_day_std.sgt";					};
INSTANCE OGY_Day_Fgt	(C_MUSICTHEME_DEF)	{	file			= "ogy_day_fgt.sgt";					};

INSTANCE OGY_Ngt_Std	(C_MUSICTHEME_DEF)	{	file			= "ogy_day_std.sgt";					};


