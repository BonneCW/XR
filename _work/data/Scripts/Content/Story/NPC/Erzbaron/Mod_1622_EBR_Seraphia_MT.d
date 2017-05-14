instance Mod_1622_EBR_Seraphia_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Seraphia";
	npctype		= 	npctype_main;
	guild 		=	GIL_OUT;
	level 		=   1;
	voice		= 0;
	id 			=	1622; 
	flags      	=   0; // wichtig, weil man sie nicht finishen kann!

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 20;
	attribute[ATR_DEXTERITY] 	= 20;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 40;
	attribute[ATR_HITPOINTS] 	= 40;

	//-------- visuals --------
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", 228, 31, NO_ARMOR);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds");

	fight_tactic	=	FAI_HUMAN_COWARD;		

		
	//-------- inventory --------                                    
	CreateInvItem (self, ItMiBrush);
	CreateInvItem (self, ItMiWedel);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1622;
};

FUNC VOID Rtn_start_1622 ()
{				
	TA_Sweep_FP		(00,01,08,30,"OCC_BARONS_GREATHALL_CENTER_LEFT");
	TA_Dance		(08,30,00,01,"OCC_BARONS_GREATHALL_BERATER");
};

FUNC VOID Rtn_AtGravo_1622 ()
{
	TA_Stand_Eating		(11,00,07,00,"OCR_OUTSIDE_HUT_4_INSERT");
	TA_Stand_Eating		(07,00,11,00,"OCR_OUTSIDE_HUT_4_INSERT");
};

FUNC VOID Rtn_Auftritt_1622 ()
{
	TA_Dance	(08,00,20,00,"OCR_AUDIENCE_03");
	TA_Dance	(20,00,08,00,"OCR_AUDIENCE_03");
};