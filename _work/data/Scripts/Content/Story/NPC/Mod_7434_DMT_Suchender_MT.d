instance Mod_7434_DMT_Suchender_MT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Suchender";
	npctype		= 	npctype_main;
	guild 		=	GIL_DMT;
	level 		=	10;
	voice		= 0;
	id 			=	7434;
	flags = 2;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 30;
	attribute[ATR_DEXTERITY] 	= 15;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;
	
	B_SetAttributesToChapter (self, 2);
	attribute[ATR_STRENGTH] 	= 140;
	attribute[ATR_HITPOINTS_MAX]= 1500;
	attribute[ATR_HITPOINTS] 	= 1500;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_FatBald", 2,  1, ITAR_TARNUNG);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);

	B_SetFightSkillS	(self, 20);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7434;
};

FUNC VOID Rtn_start_7434 ()
{
	TA_Stand_WP (08,00,20,00,"MAGICTOWER_06");
	TA_Stand_WP (20,00,08,00,"MAGICTOWER_06");
};

func VOID Rtn_Tot_7434 ()
{
	TA_Stand_WP (08,00,20,00,"TOT");
	TA_Stand_WP (20,00,08,00,"TOT");
};

FUNC VOID Rtn_Turm_7434 ()
{
	TA_Stand_WP (08,00,20,00,"OW_FOGTOWER_TOP");
	TA_Stand_WP (20,00,08,00,"OW_FOGTOWER_TOP");
};
