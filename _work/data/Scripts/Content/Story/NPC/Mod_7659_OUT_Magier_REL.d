instance Mod_7659_OUT_Magier_REL (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Untoter Magier";
	npctype		= 	npctype_main;
	guild 		=	GIL_DMT;
	level 		=	10;
	voice		= 0;
	id 			=	7659;
	flags = 0;
		
	//-------- abilities --------
	B_SetAttributesToChapter (self, 6);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_FatBald", 2,  1, ITAR_BattleMage);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;		
			
	//-------- inventory --------

	B_SetFightSkillS	(self, 100);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7659;
};

FUNC VOID Rtn_start_7659 ()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"REL_MOOR_052");
	TA_Stand_ArmsCrossed	(20,00,08,00,"REL_MOOR_052");
};

FUNC VOID Rtn_StageTwo_7659 ()
{
	TA_RunToWP	(08,00,20,00,"REL_MOOR_053");
	TA_RunToWP	(20,00,08,00,"REL_MOOR_053");
};