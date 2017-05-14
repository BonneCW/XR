instance Mod_2015_PSINOV_Harlok_REL (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Harlok";
	Npctype 	=		Npctype_Main;
	guild 		=		GIL_OUT;
	level 		=		3;
	 	
	voice		= 0;
	id 			=		2015;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	10;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	7;
	attribute[ATR_MANA] 			=	7;
	attribute[ATR_HITPOINTS_MAX] 	=	76;
	attribute[ATR_HITPOINTS] 		=	76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Bald", 175,  1, NOV_ARMOR_L);

	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_PreStart_2015;
};

FUNC VOID Rtn_PreStart_2015 ()
{
	TA_Smoke_Joint 	(06,55,23,55,"REL_MOOR_150");
	TA_Smoke_Joint 	(23,55,06,55,"REL_MOOR_150");
};