instance Mod_1622_EBR_Seraphia_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Seraphia";
	npctype		= 	npctype_main;
	guild 		=	GIL_OUT;
	level 		=   1;
	voice 		=	16;
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











