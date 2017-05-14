instance Mod_7543_DMT_Suchender_DT (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Suchender";
	npctype		= 	npctype_main;
	guild 		=	GIL_DMT;
	level 		=	10;
	voice		= 0;
	id 			=	7543;
		
	//-------- abilities --------	
	B_SetAttributesToChapter (self, 6);

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_FatBald", 2,  1, ITAR_TARNUNG);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	EquipItem	(self, ItMw_Runenschwert);
			
	//-------- inventory --------
	

	B_SetFightSkillS	(self, 100);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7543;
};

FUNC VOID Rtn_start_7543 ()
{
	TA_Stand_WP (08,00,20,00,"DT_039");
	TA_Stand_WP (20,00,08,00,"DT_039");
};